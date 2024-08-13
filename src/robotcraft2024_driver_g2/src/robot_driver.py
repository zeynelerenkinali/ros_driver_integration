import rospy
from geometry_msgs.msg import Pose
from nav_msgs.msg import Odometry
from sensor_msgs.msg import Range
from std_msgs.msg import Float32
import tf

def pose_callback(pose_msg):

    odom_msg = Odometry()

    odom_msg.header.stamp = rospy.Time.now()
    odom_msg.header.frame_id = "odom"

    odom_msg.pose.pose = pose_msg

    odom_pub.publish(odom_msg)

    position = pose_msg.position
    orientation = pose_msg.orientation

    tf_broadcaster.sendTransform((position.x, position.y,position.z), (orientation.x, orientation.y, orientation.z, orientation.w), rospy.Time().now(), "base_link", "odom")

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

    rospy.Subscriber("/pose", Pose, pose_callback)

    tf_broadcaster = tf.TransformBroadcaster()

    odom_pub = rospy.Publisher("/odom", Odometry, queue_size=10)

    rospy.Subscriber("/front_distance", Float32, front_sensor_callback)
    rospy.Subscriber("/right_distance", Float32, right_sensor_callback)
    rospy.Subscriber("/left_distance", Float32, left_sensor_callback)

    front_sensor_pub = rospy.Publisher("/ir_front_sensor", Range, queue_size=10)
    right_sensor_pub = rospy.Publisher("/ir_right_sensor", Range, queue_size=10)
    left_sensor_pub = rospy.Publisher("/ir_left_sensor", Range, queue_size=10)

    rospy.spin


