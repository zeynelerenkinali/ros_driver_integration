
(cl:in-package :asdf)

(defsystem "robotcraft2024_driver_g2-srv"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "set_rgb" :depends-on ("_package_set_rgb"))
    (:file "_package_set_rgb" :depends-on ("_package"))
  ))