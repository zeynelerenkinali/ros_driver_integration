#!/usr/bin/env python3
import rospy
from geometry_msgs.msg import Pose
from geometry_msgs.msg import Pose2D
from nav_msgs.msg import Odometry
from sensor_msgs.msg import Range
from std_msgs.msg import Float32
from tf.transformations import quaternion_from_euler
import tf

def pose_callback(pose_msg):
    # Convert Pose2D to Pose(3D representation for rviz and ROS)
    # Pose is a 3D representation, so z is set to 0.0, because robot moves in a flat plane.
    pose = Pose() 
    pose.position.x = pose_msg.x
    pose.position.y = pose_msg.y
    pose.position.z = 0.0
    
    # Convert theta to quaternion
    quat = quaternion_from_euler(0, 0, pose_msg.theta)
    pose.orientation.x = quat[0]
    pose.orientation.y = quat[1]
    pose.orientation.z = quat[2]
    pose.orientation.w = quat[3]

    odom_msg = Odometry()

    odom_msg.header.stamp = rospy.Time.now()
    odom_msg.header.frame_id = "odom"
    odom_msg.child_frame_id = "base_link"  # Add child_frame_id for the robot's base frame

    odom_msg.pose.pose = pose

    odom_pub.publish(odom_msg)

    tf_broadcaster.sendTransform((pose.position.x, pose.position.y, pose.position.z),
                                 (pose.orientation.x, pose.orientation.y, pose.orientation.z, pose.orientation.w),
                                 rospy.Time.now(),
                                 "base_link",
                                 "odom")

def front_sensor_callback(distance_msg):
    # Create a new Range message
    range_msg = Range()
    
    # Set the header
    range_msg.header.stamp = rospy.Time.now()
    range_msg.header.frame_id = "front_ir"
    
    # Set the range data
    range_msg.radiation_type = 1   #Range.INFRARED
    range_msg.field_of_view = 0.034906585  # Example value, adjust as needed
    range_msg.min_range = 0.1     # Example value, adjust as needed
    range_msg.max_range = 0.8      # Example value, adjust as needed
    range_msg.range = distance_msg.data
    
    # Publish the range message
    front_sensor_pub.publish(range_msg)

def right_sensor_callback(distance_msg):
    # Create a new Range message
    range_msg = Range()
    
    # Set the header
    range_msg.header.stamp = rospy.Time.now()
    range_msg.header.frame_id = "right_ir"
    
    # Set the range data
    range_msg.radiation_type = 1   #Range.INFRARED
    range_msg.field_of_view = 0.034906585  # Example value, adjust as needed
    range_msg.min_range = 0.1     # Example value, adjust as needed
    range_msg.max_range = 0.8      # Example value, adjust as needed
    range_msg.range = distance_msg.data
    
    # Publish the range message
    right_sensor_pub.publish(range_msg)

def left_sensor_callback(distance_msg):
    # Create a new Range message
    range_msg = Range()
    
    # Set the header
    range_msg.header.stamp = rospy.Time.now()
    range_msg.header.frame_id = "left_ir"
    
    # Set the range data
    range_msg.radiation_type = 1   #Range.INFRARED
    range_msg.field_of_view = 0.034906585  # Example value, adjust as needed
    range_msg.min_range = 0.1     # Example value, adjust as needed
    range_msg.max_range = 0.8      # Example value, adjust as needed
    range_msg.range = distance_msg.data
    
    # Publish the range message
    left_sensor_pub.publish(range_msg)

if __name__ == "__main__":
    rospy.init_node("pose_to_odom")

    rospy.Subscriber("/pose", Pose2D, pose_callback)

    tf_broadcaster = tf.TransformBroadcaster()

    odom_pub = rospy.Publisher("/odom", Odometry, queue_size=10)

    rospy.Subscriber("/front_distance", Float32, front_sensor_callback)
    rospy.Subscriber("/right_distance", Float32, right_sensor_callback)
    rospy.Subscriber("/left_distance", Float32, left_sensor_callback)

    front_sensor_pub = rospy.Publisher("/ir_front_sensor", Range, queue_size=10)
    right_sensor_pub = rospy.Publisher("/ir_right_sensor", Range, queue_size=10)
    left_sensor_pub = rospy.Publisher("/ir_left_sensor", Range, queue_size=10)

    rospy.spin()


