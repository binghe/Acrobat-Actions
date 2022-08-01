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

;; PIMain.c
(defvar *core-hft*)     ; HFT gCoreHFT = 0;
(defvar *core-version*) ; ASUns32 gCoreVersion = 0;

(define-foreign-callable ("PISetupSDK" :result-type as-bool
                                       :calling-convention :cdecl)
    ((handshake-version     as-uns32)
     (sdk-data              (:pointer :void)))
  "This routine is called by the host application to set up the plug-in's
SDK-provided functionality."
  (plugin-log "[PISetupSDK] begin.~%")
  (plugin-log "[PISetupSDK] end.~%")
  +false+
  )

(define-foreign-callable ("PIHandshake" :result-type as-bool
                                        :calling-convention :cdecl)
    ((handshake-version     as-uns32)
     (handshake-data        (:pointer :void)))
  "PIHandshake function provides the initial interface between your plug-in and
the application.
This function provides the callback functions to the application that allow it to
register the plug-in with the application environment."
  +false+
  )

;; NOTE: The result of FOREIGN-FUNCTION-POINTER is updated on image restart.
(defvar *pi-setup-sdk* (foreign-function-pointer "PISetupSDK"))
(defvar *pi-handshake* (foreign-function-pointer "PIHandshake"))

#+:macosx
(define-c-struct plugin-main-data
  (size       :size-t)
  (bundle     cf-bundle-ref)
  (app-bundle cf-bundle-ref))

#+:macosx #+:macosx
(defvar *plugin-bundle*)
(defvar *app-bundle*)

#+:macosx
(define-foreign-callable ("AcroPluginMain" :result-type as-bool
                                           :calling-convention :cdecl)
    ((app-handshake-version as-uns32)
     (handshake-version     as-uns32p)
     (setup-proc            (:pointer pi-setup-sdk-proc-type))
     (main-data             (:pointer plugin-main-data)))
  "AcroPluginMain is DLL entry function that Acrobat Pro first calls.  All other
foreign callables must be registered here, otherwise Acrobat Pro does not know
their names at all."
  (plugin-log "[AcroPluginMain] begin.~%")

  ;; 1. set *plugin-bundle* and *app-bundle*
  (let ((bundle     (foreign-slot-value main-data 'bundle))
        (app-bundle (foreign-slot-value main-data 'app-bundle)))
    (cf-retain bundle)
    (cf-retain app-bundle)
    (setq *plugin-bundle* bundle)
    (setq *app-bundle* app-bundle)
    (plugin-log "[AcroPluginMain] *plugin-bundle* = ~A~%" *plugin-bundle*)
    (plugin-log "[AcroPluginMain] *app-bundle* = ~A~%" *app-bundle*))

  ;; 2. appsHandshakeVersion tells us which version of the handshake struct the application has sent us.
  ;; HANDSHAKE_VERSION is the latest version that we, the plug-in, know about (see PIVersn.h)
  ;; Always use the earlier of the two structs to assure compatibility.
  ;; The version we want to use is returned to the application so it can adjust accordingly.
  (setf (dereference handshake-version)
        (the (unsigned-byte 32) (min app-handshake-version +handshake-version+)))

  ;; 3. Provide the routine for the host app to call to setup this plug-in
  (setf (dereference setup-proc) *pi-setup-sdk*)

  (plugin-log "[AcroPluginMain] end.~%")
  +true+)

;; END
