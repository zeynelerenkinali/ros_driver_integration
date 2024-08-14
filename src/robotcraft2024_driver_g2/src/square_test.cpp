#include <iostream>

#include "ros/ros.h"
#include "sensor_msgs/LaserScan.h"
#include "geometry_msgs/Twist.h"

// Global variables for sensor messages
sensor_msgs::LaserScan front_sensor_msg;
sensor_msgs::LaserScan right_sensor_msg;
sensor_msgs::LaserScan left_sensor_msg;

// Callback functions for sensor topics
void front_scan_callback(const sensor_msgs::LaserScan::ConstPtr& front_sensor) 
{
    front_sensor_msg = *front_sensor;
}

void right_scan_callback(const sensor_msgs::LaserScan::ConstPtr& right_sensor) 
{
    right_sensor_msg = *right_sensor;
}

void left_scan_callback(const sensor_msgs::LaserScan::ConstPtr& left_sensor) 
{
    left_sensor_msg = *left_sensor;
}

void collisionLineCheck();


int main(int argc, char** argv)
{   
    ros::init(argc, argv, "square_test");
    ros::NodeHandle nh;
    
    ros::Publisher cmd_vel_pub = nh.advertise<geometry_msgs::Twist>("/cmd_vel", 10);
    ros::Subscriber ir_front_sensor_sub = nh.subscribe("/ir_front_sensor", 10, front_scan_callback);
    ros::Subscriber ir_right_sensor_sub = nh.subscribe("/ir_right_sensor", 10, right_scan_callback);
    ros::Subscriber ir_left_sensor_sub = nh.subscribe("/ir_left_sensor", 10, left_scan_callback);


    geometry_msgs::Twist move_cmd;
    geometry_msgs::Twist stop_cmd;

    stop_cmd.linear.x = 0.0;
    stop_cmd.linear.z = 0.0;

    double linear_speed = 0.08; // 0.08 max speed m/s
    double angular_speed = M_PI / 4; // to turn 45 degrees per second
    float side_length = 0.5; //m
    double turn_angle = M_PI / 2; // 90 degrees

    ros::Rate loop_rate(10);
    int state = 0;
    ros::Time start_time = ros::Time::now();

    while(ros::ok())
    {
        collisionLineCheck();

        switch(state)
        {
            case 0: // Go forward for 0.5 m with 0.08 max speed
                move_cmd.linear.x = linear_speed;
                move_cmd.angular.z = 0.0;
                if ((ros::Time::now() - start_time).toSec() >= side_length / linear_speed)//  ros::Time::now() - start_time).toSec() >= side_length / linear_speed with the help of this line when we change the linear_speed time will be adjusted aoutomatiacally we won't need to do anything else here
                {
                    state = 1;
                    start_time = ros::Time::now();
                }
                break;

            case 1: // Stop
                move_cmd = stop_cmd;
                if ((ros::Time::now() - start_time).toSec() >= 1.0)
                {
                    state = 2;
                    start_time = ros::Time::now();
                }
                break;

            case 2: // Turn 90 degrees
                move_cmd.linear.x = 0.0;
                move_cmd.angular.z = angular_speed;
                if ((ros::Time::now() - start_time).toSec() >= turn_angle / angular_speed) 
                {
                    state = 3;
                    start_time = ros::Time::now();
                }
                break;

            case 3:// Stop
                move_cmd = stop_cmd;
                if ((ros::Time::now() - start_time).toSec() >= 1.0) {
                    state = 0;
                    start_time = ros::Time::now();
                }
                break;
        }
        cmd_vel_pub.publish(move_cmd);
        ros::spinOnce();
        loop_rate.sleep();
    }
}

void collisionLineCheck()
{
    // Check front sensor
    for (const auto& range : front_sensor_msg.ranges) 
    {
        if (range < 0.15) {
            ROS_WARN("Collision risk! The robot is %.2f meters from an obstacle on the front side", range);
            break;
        }
    }

    // Check right sensor
    for (const auto& range : right_sensor_msg.ranges) 
    {
        if (range < 0.15) {
            ROS_WARN("Collision risk! The robot is %.2f meters from an obstacle on the right side", range);
            break;
        }
    }

    // Check left sensor
    for (const auto& range : left_sensor_msg.ranges) 
    {
        if (range < 0.15) {
            ROS_WARN("Collision risk! The robot is %.2f meters from an obstacle on the left side", range);
            break;
        }
    }
}