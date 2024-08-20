;; Auto-generated. Do not edit!


(when (boundp 'robotcraft2024_driver_g2::set_rgb)
  (if (not (find-package "ROBOTCRAFT2024_DRIVER_G2"))
    (make-package "ROBOTCRAFT2024_DRIVER_G2"))
  (shadow 'set_rgb (find-package "ROBOTCRAFT2024_DRIVER_G2")))
(unless (find-package "ROBOTCRAFT2024_DRIVER_G2::SET_RGB")
  (make-package "ROBOTCRAFT2024_DRIVER_G2::SET_RGB"))
(unless (find-package "ROBOTCRAFT2024_DRIVER_G2::SET_RGBREQUEST")
  (make-package "ROBOTCRAFT2024_DRIVER_G2::SET_RGBREQUEST"))
(unless (find-package "ROBOTCRAFT2024_DRIVER_G2::SET_RGBRESPONSE")
  (make-package "ROBOTCRAFT2024_DRIVER_G2::SET_RGBRESPONSE"))

(in-package "ROS")





(defclass robotcraft2024_driver_g2::set_rgbRequest
  :super ros::object
  :slots (_r _g _b ))

(defmethod robotcraft2024_driver_g2::set_rgbRequest
  (:init
   (&key
    ((:r __r) 0)
    ((:g __g) 0)
    ((:b __b) 0)
    )
   (send-super :init)
   (setq _r (round __r))
   (setq _g (round __g))
   (setq _b (round __b))
   self)
  (:r
   (&optional __r)
   (if __r (setq _r __r)) _r)
  (:g
   (&optional __g)
   (if __g (setq _g __g)) _g)
  (:b
   (&optional __b)
   (if __b (setq _b __b)) _b)
  (:serialization-length
   ()
   (+
    ;; uint8 _r
    1
    ;; uint8 _g
    1
    ;; uint8 _b
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; uint8 _r
       (write-byte _r s)
     ;; uint8 _g
       (write-byte _g s)
     ;; uint8 _b
       (write-byte _b s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; uint8 _r
     (setq _r (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _g
     (setq _g (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _b
     (setq _b (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;;
   self)
  )

(defclass robotcraft2024_driver_g2::set_rgbResponse
  :super ros::object
  :slots (_success ))

(defmethod robotcraft2024_driver_g2::set_rgbResponse
  (:init
   (&key
    ((:success __success) nil)
    )
   (send-super :init)
   (setq _success __success)
   self)
  (:success
   (&optional (__success :null))
   (if (not (eq __success :null)) (setq _success __success)) _success)
  (:serialization-length
   ()
   (+
    ;; bool _success
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; bool _success
       (if _success (write-byte -1 s) (write-byte 0 s))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; bool _success
     (setq _success (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;;
   self)
  )

(defclass robotcraft2024_driver_g2::set_rgb
  :super ros::object
  :slots ())

(setf (get robotcraft2024_driver_g2::set_rgb :md5sum-) "57a090aa7c99ddb5bfd28162e649c952")
(setf (get robotcraft2024_driver_g2::set_rgb :datatype-) "robotcraft2024_driver_g2/set_rgb")
(setf (get robotcraft2024_driver_g2::set_rgb :request) robotcraft2024_driver_g2::set_rgbRequest)
(setf (get robotcraft2024_driver_g2::set_rgb :response) robotcraft2024_driver_g2::set_rgbResponse)

(defmethod robotcraft2024_driver_g2::set_rgbRequest
  (:response () (instance robotcraft2024_driver_g2::set_rgbResponse :init)))

(setf (get robotcraft2024_driver_g2::set_rgbRequest :md5sum-) "57a090aa7c99ddb5bfd28162e649c952")
(setf (get robotcraft2024_driver_g2::set_rgbRequest :datatype-) "robotcraft2024_driver_g2/set_rgbRequest")
(setf (get robotcraft2024_driver_g2::set_rgbRequest :definition-)
      "uint8 r
uint8 g
uint8 b
---
bool success
")

(setf (get robotcraft2024_driver_g2::set_rgbResponse :md5sum-) "57a090aa7c99ddb5bfd28162e649c952")
(setf (get robotcraft2024_driver_g2::set_rgbResponse :datatype-) "robotcraft2024_driver_g2/set_rgbResponse")
(setf (get robotcraft2024_driver_g2::set_rgbResponse :definition-)
      "uint8 r
uint8 g
uint8 b
---
bool success
")



(provide :robotcraft2024_driver_g2/set_rgb "57a090aa7c99ddb5bfd28162e649c952")


