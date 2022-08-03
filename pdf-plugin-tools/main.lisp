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

;; HFTs <PIMain.c>
(defvar *core-hft*)
(defvar *core-version*)
(defvar *cos-hft*)
(defvar *cos-version*)

(defvar *hft-info*
  '(("Core" +pi-core-version+ *core-version* *core-hft* nil)
    ("Cos"  +pi-cos-version+  *cos-version*  *cos-hft*  *pi-cos-optional*)))

;; NOTE: When ALLOCATION is :STATIC (default), memory allocated by
;; ALLOCATE-FOREIGN-OBJECT is in the C heap. Therefore pointer (and
;; any copy) cannot be used after SAVE_IMAGE or DELIVER.

(defun initialize ()
  (loop for (name ver retvar hft optional) in *hft-info* do
     (setf (symbol-value hft)    (fli:allocate-foreign-object :type 'hft :fill 0))
     (setf (symbol-value retvar) (fli:allocate-foreign-object :type 'as-uns32 :fill 0))))

(defun finalize ()
  (loop for (name ver retvar hft optional) in *hft-info* do
     (free-foreign-object (symbol-value hft))
     (free-foreign-object (symbol-value retvar))))

(define-foreign-callable ("PISetupSDK" :result-type as-bool
                                       :calling-convention :cdecl)
    ((handshake-version     as-uns32)
     (sdk-data              (:pointer :void)))
  "This routine is called by the host application to set up the plug-in's
SDK-provided functionality."
  (block pi-setup-sdk
    (plugin-log "[PISetupSDK] begin.~%")
    (when (= handshake-version +handshake-v0200+)
      (let* ((data (copy-pointer sdk-data :type 'pi-sdk-data-v0200))
             (version (foreign-slot-value data 'handshake-version)))
        (unless (= version +handshake-v0200+)
          (plugin-log "[PISetupSDK] Someone lied.~%")
          (return-from pi-setup-sdk nil))
        (setq *extension-id* (foreign-slot-value data 'extension-id))
        (setq *core-hft*     (foreign-slot-value data 'core-hft))
        (setq *core-version* +core-hft-version-2+) ; lowest version that supports v0200 handshake
        (plugin-log "[PISetupSDK] *extension-id* = ~A~%" *extension-id*)
        (plugin-log "[PISetupSDK] *core-hft* (initial) = ~A~%" *core-hft*)
        )
      (plugin-log "[PISetupSDK] end successfully.~%")
      (return-from pi-setup-sdk nil)) ; TODO
    ;; If we reach here, then we were passed a handshake version number we don't know about.
    ;; This shouldn't ever happen since our main() routine chose the version number.
    (plugin-log "[PISetupSDK] end badly.~%")
    nil))

(define-foreign-callable ("PIHandshake" :result-type as-bool
                                        :calling-convention :cdecl)
    ((handshake-version     as-uns32)
     (handshake-data        (:pointer :void)))
  "PIHandshake function provides the initial interface between your plug-in and
the application.  This function provides the callback functions to the
application that allow it to register the plug-in with the application
environment."
  (plugin-log "[PIHandshake] begin.~%")
  
  (plugin-log "[PIHandshake] end.~%")
  nil
  )

;; NOTE: The result of FOREIGN-FUNCTION-POINTER is updated on image restart.
(defvar *pi-setup-sdk* (foreign-function-pointer "PISetupSDK"))
(defvar *pi-handshake* (foreign-function-pointer "PIHandshake"))

#+:macosx
(define-c-struct plugin-main-data
  (size       :size-t)
  (bundle     cf-bundle-ref)
  (app-bundle cf-bundle-ref))

;; TODO: not working for Windows
(define-foreign-callable ("AcroPluginMain" :result-type as-bool
                                           :calling-convention :cdecl)
    ((app-handshake-version as-uns32)
     (handshake-version     as-uns32p)
     (setup-proc            (:pointer pi-setup-sdk-proc-type))
     #+:win32
     (windows-data          (:pointer :void))
     #+:macosx
     (main-data             (:pointer plugin-main-data)))
  (plugin-log "[AcroPluginMain] begin.~%")

  ;; 1. set *plugin-bundle* and *app-bundle* (Mac only)
  #+:macosx
  (let ((bundle     (foreign-slot-value main-data 'bundle))
        (app-bundle (foreign-slot-value main-data 'app-bundle)))
    (cf-retain bundle)
    (cf-retain app-bundle)
    (setq *plugin-bundle* bundle *app-bundle* app-bundle)
    (plugin-log "[AcroPluginMain] *plugin-bundle* = ~A~%" *plugin-bundle*)
    (plugin-log "[AcroPluginMain] *app-bundle* = ~A~%" *app-bundle*))

  ;; 2. appsHandshakeVersion tells us which version of the handshake struct the application has sent us.
  ;; HANDSHAKE_VERSION is the latest version that we, the plug-in, know about (see PIVersn.h)
  ;; Always use the earlier of the two structs to assure compatibility.
  ;; The version we want to use is returned to the application so it can adjust accordingly.
  (let ((version (the (unsigned-byte 32)
                      (min app-handshake-version +handshake-version+))))
    (plugin-log "[AcroPluginMain] app-handshake-version = ~A~%" app-handshake-version)
    (setf (dereference handshake-version) version)
    (plugin-log "[AcroPluginMain] handshake-version = ~A~%" version))

  ;; 3. Provide the routine for the host app to call to setup this plug-in
  (setf (dereference setup-proc) *pi-setup-sdk*)
  (plugin-log "[AcroPluginMain] *pi-setup-sdk* = ~A~%" *pi-setup-sdk*)

  ;; 4. return TRUE (otherwise Acrobat won't call "PISetupSDK")
  (plugin-log "[AcroPluginMain] end.~%")
  t)

;; END
