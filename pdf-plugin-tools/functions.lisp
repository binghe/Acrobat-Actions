;;; -*- Mode: LISP; Syntax: COMMON-LISP; Package: PDF-PLUGIN-TOOLS; Base: 10 -*-

;;; Copyright (c) 2022, Chun Tian (binghe).  All rights reserved.

;;; Redistribution and use in source and binary forms, with or without
;;; modification, are permitted provided that the following conditions
;;; are met:

;;;   * Redistributions of source code must retain the above copyright
;;;     notice, this list of conditions and the following disclaimer.

;;;   * Redistributions in binary form must reproduce the above
;;;     copyright notice, this list of conditions and the following
;;;     disclaimer in the documentation and/or other materials
;;;     provided with the distribution.

;;; THIS SOFTWARE IS PROVIDED BY THE AUTHOR 'AS IS' AND ANY EXPRESSED
;;; OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
;;; WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
;;; ARE DISCLAIMED.  IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR ANY
;;; DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
;;; DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE
;;; GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
;;; INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
;;; WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING
;;; NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
;;; SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

(in-package :pdf-plugin-tools)

;; ExtensionName, used in plugin handshaking, must use the following syntax: Prefix_PluginName
(defvar *extension-name* nil
  "This variable will be filled after pi-handshake is called.")

(defun get-extension-name ()
  (unless *extension-name*
    (setq *extension-name* (format nil "~A_~A" *plugin-id* *plugin-name*)))
  (as-atom-from-string *extension-name*))

(defun as-callback-create-proto (function)
  (as-callback-create *extension-id* function))

(defmacro with-av-menubar-menu-by-name ((menu-item menu-name) &body body)
  (let ((menubar (gensym)))
    `(let* ((,menubar (av-app-get-menubar))
            (,menu-item (av-menubar-acquire-menu-by-name ,menubar ,menu-name)))
       (unwind-protect
           (progn ,@body)
         (av-menu-release ,menu-item)))))

(defun av-menu-item-set-execute-proc-proto (menu-item callback)
  (with-coerced-pointer (functor :pointer-type 'av-execute-proc)
      (as-callback-create-proto callback)
    (av-menu-item-set-execute-proc menu-item functor nil)))

(defun plugin-about-function ()
  (av-alert-note (format nil "About ~A" *product-name*)))

(defun plugin-help-function ()
  (av-alert-note (format nil "Help!")))

(defun plugin-load-patch-function ()
  "Load patches from disk (or network)"
  t)

(define-foreign-callable (plugin-about :encode :lisp
                                       :result-type :void
                                       :calling-convention :cdecl)
    ((client-data (:pointer :void)))
  (declare (ignore client-data))
  (plugin-log "[plugin-about] begin.~%")
  (prog1 (plugin-about-function)
    (plugin-log "[plugin-about] end.~%")))

(define-foreign-callable (plugin-help :encode :lisp
                                      :result-type :void
                                      :calling-convention :cdecl)
    ((client-data (:pointer :void)))
  (declare (ignore client-data))
  (plugin-log "[plugin-about] begin.~%")
  (prog1 (plugin-help-function)
    (plugin-log "[plugin-about] end.~%")))

(define-foreign-callable (plugin-load-patch :encode :lisp
                                            :result-type :void
                                            :calling-convention :cdecl)
    ((client-data (:pointer :void)))
  (declare (ignore client-data))
  (plugin-log "[plugin-load-patch] begin.~%")
  (prog1 (plugin-load-patch-function)
    (plugin-log "[plugin-load-patch] end.~%")))

(defun plugin-set-menu ()
  (plugin-log "[plugin-set-menu] begin.~%")
  ;; About
  (setq *about-menu-item*
        (av-menu-item-new (format nil "~A..." *product-name*)
                          (format nil "~A_about" *extension-name*)
                          nil ; submenu
                          t   ; long-menus-only
                          +no-shortcut+
                          0   ; flags
                          nil ; icon
                          *extension-id*))
  (plugin-log "[plugin-set-menu] *about-menu-item* = ~A~%" *about-menu-item*)
  (av-menu-item-set-execute-proc-proto *about-menu-item*
                                       (foreign-function-pointer 'plugin-about))
  (with-av-menubar-menu-by-name (about-menu +about-extensions+)
    (av-menu-add-menu-item about-menu *about-menu-item* +append-menu-item+))
  ;; Help
  (setq *help-menu-item*
        (av-menu-item-new (format nil "~A" *product-name*)
                          (format nil "~A_help" *extension-name*)
                          nil ; submenu
                          t   ; long-menus-only
                          +no-shortcut+
                          0   ; flags
                          nil ; icon
                          *extension-id*))
  (plugin-log "[plugin-set-menu] *help-menu-item* = ~A~%" *help-menu-item*)
  (av-menu-item-set-execute-proc-proto *help-menu-item*
                                       (foreign-function-pointer 'plugin-help))
  (with-av-menubar-menu-by-name (help-menu +using-extensions+)
    (av-menu-add-menu-item help-menu *help-menu-item* +append-menu-item+))
  (plugin-log "[plugin-set-menu] end.~%")
  t)

(defun plugin-unload-menu ()
  (plugin-log "[plugin-unload-menu] begin.~%")
  (when *about-menu-item*
    (av-menu-item-remove *about-menu-item*)
    (setq *about-menu-item* nil)
    (plugin-log "[plugin-unload-menu] *about-menu-item* unloaded.~%"))
  (plugin-log "[plugin-unload-menu] end.~%")
  t)

(defun plugin-set-commands ()
  (plugin-log "[plugin-set-commands] begin.~%")
  (plugin-log "[plugin-set-commands] end.~%")
  t)

(defun plugin-set-toolbar ()
  (plugin-log "[plugin-set-toolbar] begin.~%")
  (plugin-log "[plugin-set-toolbar] end.~%")
  t)
