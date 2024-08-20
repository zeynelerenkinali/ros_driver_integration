; Auto-generated. Do not edit!


(cl:in-package robotcraft2024_driver_g2-srv)


;//! \htmlinclude set_rgb-request.msg.html

(cl:defclass <set_rgb-request> (roslisp-msg-protocol:ros-message)
  ((r
    :reader r
    :initarg :r
    :type cl:fixnum
    :initform 0)
   (g
    :reader g
    :initarg :g
    :type cl:fixnum
    :initform 0)
   (b
    :reader b
    :initarg :b
    :type cl:fixnum
    :initform 0))
)

(cl:defclass set_rgb-request (<set_rgb-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <set_rgb-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'set_rgb-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name robotcraft2024_driver_g2-srv:<set_rgb-request> is deprecated: use robotcraft2024_driver_g2-srv:set_rgb-request instead.")))

(cl:ensure-generic-function 'r-val :lambda-list '(m))
(cl:defmethod r-val ((m <set_rgb-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robotcraft2024_driver_g2-srv:r-val is deprecated.  Use robotcraft2024_driver_g2-srv:r instead.")
  (r m))

(cl:ensure-generic-function 'g-val :lambda-list '(m))
(cl:defmethod g-val ((m <set_rgb-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robotcraft2024_driver_g2-srv:g-val is deprecated.  Use robotcraft2024_driver_g2-srv:g instead.")
  (g m))

(cl:ensure-generic-function 'b-val :lambda-list '(m))
(cl:defmethod b-val ((m <set_rgb-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robotcraft2024_driver_g2-srv:b-val is deprecated.  Use robotcraft2024_driver_g2-srv:b instead.")
  (b m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <set_rgb-request>) ostream)
  "Serializes a message object of type '<set_rgb-request>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'r)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'g)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'b)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <set_rgb-request>) istream)
  "Deserializes a message object of type '<set_rgb-request>"
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'r)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'g)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'b)) (cl:read-byte istream))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<set_rgb-request>)))
  "Returns string type for a service object of type '<set_rgb-request>"
  "robotcraft2024_driver_g2/set_rgbRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'set_rgb-request)))
  "Returns string type for a service object of type 'set_rgb-request"
  "robotcraft2024_driver_g2/set_rgbRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<set_rgb-request>)))
  "Returns md5sum for a message object of type '<set_rgb-request>"
  "57a090aa7c99ddb5bfd28162e649c952")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'set_rgb-request)))
  "Returns md5sum for a message object of type 'set_rgb-request"
  "57a090aa7c99ddb5bfd28162e649c952")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<set_rgb-request>)))
  "Returns full string definition for message of type '<set_rgb-request>"
  (cl:format cl:nil "uint8 r~%uint8 g~%uint8 b~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'set_rgb-request)))
  "Returns full string definition for message of type 'set_rgb-request"
  (cl:format cl:nil "uint8 r~%uint8 g~%uint8 b~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <set_rgb-request>))
  (cl:+ 0
     1
     1
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <set_rgb-request>))
  "Converts a ROS message object to a list"
  (cl:list 'set_rgb-request
    (cl:cons ':r (r msg))
    (cl:cons ':g (g msg))
    (cl:cons ':b (b msg))
))
;//! \htmlinclude set_rgb-response.msg.html

(cl:defclass <set_rgb-response> (roslisp-msg-protocol:ros-message)
  ((success
    :reader success
    :initarg :success
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass set_rgb-response (<set_rgb-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <set_rgb-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'set_rgb-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name robotcraft2024_driver_g2-srv:<set_rgb-response> is deprecated: use robotcraft2024_driver_g2-srv:set_rgb-response instead.")))

(cl:ensure-generic-function 'success-val :lambda-list '(m))
(cl:defmethod success-val ((m <set_rgb-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robotcraft2024_driver_g2-srv:success-val is deprecated.  Use robotcraft2024_driver_g2-srv:success instead.")
  (success m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <set_rgb-response>) ostream)
  "Serializes a message object of type '<set_rgb-response>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'success) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <set_rgb-response>) istream)
  "Deserializes a message object of type '<set_rgb-response>"
    (cl:setf (cl:slot-value msg 'success) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<set_rgb-response>)))
  "Returns string type for a service object of type '<set_rgb-response>"
  "robotcraft2024_driver_g2/set_rgbResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'set_rgb-response)))
  "Returns string type for a service object of type 'set_rgb-response"
  "robotcraft2024_driver_g2/set_rgbResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<set_rgb-response>)))
  "Returns md5sum for a message object of type '<set_rgb-response>"
  "57a090aa7c99ddb5bfd28162e649c952")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'set_rgb-response)))
  "Returns md5sum for a message object of type 'set_rgb-response"
  "57a090aa7c99ddb5bfd28162e649c952")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<set_rgb-response>)))
  "Returns full string definition for message of type '<set_rgb-response>"
  (cl:format cl:nil "bool success~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'set_rgb-response)))
  "Returns full string definition for message of type 'set_rgb-response"
  (cl:format cl:nil "bool success~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <set_rgb-response>))
  (cl:+ 0
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <set_rgb-response>))
  "Converts a ROS message object to a list"
  (cl:list 'set_rgb-response
    (cl:cons ':success (success msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'set_rgb)))
  'set_rgb-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'set_rgb)))
  'set_rgb-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'set_rgb)))
  "Returns string type for a service object of type '<set_rgb>"
  "robotcraft2024_driver_g2/set_rgb")