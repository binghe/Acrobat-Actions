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

;; NOTE: If the HFT version is higher than the viewer loading the client supports,
;; it displays an alert box with the message "There was an error while loading
;; the client <i><plug-in name></i>. The client is incompatible with this version
;; of the Viewer."

;; <PIRequir.h>
(defvar *pi-core-version* +core-hft-version-5+
  "Everybody needs the Core HFT, so don't omit this one.")

(defvar *pi-acrosupport-version* +as-calls-hft-version-8+
  "Most plug-ins will use calls from the AdobeSupport family.")

#|
(defvar *pi-cos-version* +cos-hft-version-6+
  "Many plug-ins will not need to access the low-level Cos functionality.")

(defvar *pi-pd-model-version* +pd-model-hft-version-6+
  "PDModel methods - the version of the PD level HFT.")

(defvar *pi-acroview-version* +acroview-hft-version-6+
  "AcroView methods - the version of the Acrobat viewer level HFT.")

(defvar *pi-as-extra-version* +as-extra-hft-version-6+
  "ASExtra methods")

(defvar *pi-macintosh-version* +macintosh-hft-version-2_2+
  "Macintosh specific methods (AppleEvents, AVRect conversions, etc.)
 - the version of the Mac OS-only methods HFT")

(defvar *pi-pdfedit-write-version* +pdfedit-write-hft-version-6+
  "PDFEdit Write methods")

(defvar *pi-pdfedit-read-version* +pdfedit-read-hft-version-6+
  "PDFEdit Read methods")

(defvar *pi-pd-system-font-version* +pd-sys-font-hft-version-4+
  "PDSysFont methods")

(defvar *pi-page-pde-content-version* +page-pde-content-hft-version-6+
  "PagePDEContent methods")

(defvar *pi-pdsedit-write-version* +pdswrite-version-6+)

(defvar *pi-pdsedit-read-version*  +pdsread-version-6+)

(defvar *pi-pdmetadata-version* +pdmetadata-hft-version-6+)

(defvar *pi-acrocolor-version +acro-color-hft-version-6+) ; not available in Reader

(defvar *pi-uitcore-version* +uit-core-hft-version-1+)

(defvar *pi-pdalternates-version* +pd-alternates-hft-version-13+)
|#

(defvar *hft-info*
  '(("Core" +pi-core-version+ *core-version* *g-core-hft* nil)
    ("Cos"  +pi-cos-version+  *cos-version*  *g-cos-hft*  *pi-cos-optional*)))

;; HFT_ERROR_NO_VERSION (0xFFFFFFFF)
(defconstant +hft-error-no-version+ #xFFFFFFFF)

;; GetRequestedHFT
(defmacro get-requested-hft (table required-ver resulting-ver result-hft)
  (let ((table-name (gensym))
        (result-ver +hft-error-no-version+))
    ))

;; NOTE: When ALLOCATION is :STATIC (default), memory allocated by
;; ALLOCATE-FOREIGN-OBJECT is in the C heap. Therefore pointer (and
;; any copy) cannot be used after SAVE_IMAGE or DELIVER.

(define-foreign-callable (pi-setup-sdk :result-type as-bool
                                       :calling-convention :cdecl)
    ((handshake-version as-uns32)
     (sdk-data          (:pointer :void)))
  "This routine is called by the host application to set up the plug-in's
SDK-provided functionality."
  (let ((success nil))
    (block pi-setup-sdk
      (plugin-log "[PISetupSDK] begin.~%")
      (when (= handshake-version +handshake-v0200+)
        (with-coerced-pointer (data :type 'pi-sdk-data-v0200) sdk-data
          (let ((version (foreign-slot-value data 'handshake-version)))
            (unless (= version +handshake-v0200+)
              (plugin-log "[PISetupSDK] Someone lied.~%")
              (return-from pi-setup-sdk nil))
            (setq *extension-id* (foreign-slot-value data 'extension-id))
            (plugin-log "[PISetupSDK] *extension-id* = ~A~%" *extension-id*)
            (let ((*g-core-hft* (foreign-slot-value data 'core-hft))
                  (*g-core-version* +core-hft-version-2+))
              (plugin-log "[PISetupSDK] *g-core-hft* (bootstrap) = ~A, #x~X~%"
                          *g-core-hft* *g-core-version*)
              (let* ((acro-support-atom (as-atom-from-string "AcroSupport"))
                     (acro-support-name (as-atom-get-string acro-support-atom)))
                (plugin-log "[PISetupSDK] acro-support = ~A (~A)~%"
                            acro-support-atom acro-support-name)
                (setq *g-acro-support-hft*
                      (as-extension-mgr-get-hft acro-support-atom +as-calls-hft-version-6+))
                (plugin-log "[PISetupSDK] *g-acro-support-hft* = ~A~%" *g-acro-support-hft*)
                (when *g-acro-support-hft*
                  (setq *g-acro-support-version* +as-calls-hft-version-6+)
                  (let ((version (hft-get-version *g-acro-support-hft*)))
                    (plugin-log "[PISetupSDK] *g-acro-support-hft* = ~A, #x~X~%"
                                *g-acro-support-hft* version)
                    )))
              (plugin-log "[PISetupSDK] end temporarily.~%")
              (return-from pi-setup-sdk success))))))
    ;; If we reach here, then we were passed a handshake version number we don't know about.
    ;; This shouldn't ever happen since our main() routine chose the version number.
    (plugin-log "[PISetupSDK] end badly.~%")
    success))

(define-foreign-callable (pi-handshake :result-type as-bool
                                       :calling-convention :cdecl)
    ((handshake-version as-uns32)
     (handshake-data    (:pointer :void)))
  "PIHandshake function provides the initial interface between your plug-in and
the application.  This function provides the callback functions to the
application that allow it to register the plug-in with the application
environment."
  (plugin-log "[PIHandshake] begin.~%")
  ;; (as-enum-extensions 1)
  (plugin-log "[PIHandshake] end.~%")
  #+ignore
  (with-open-file (stream "/tmp/fli-templates.lisp" :direction :output)
    (fli:print-collected-template-info :output-stream stream))
  t)

;; NOTE: The results of FOREIGN-FUNCTION-POINTER are updated on image restart.
(defvar *pi-setup-sdk* (foreign-function-pointer 'pi-setup-sdk))
(defvar *pi-handshake* (foreign-function-pointer 'pi-handshake))

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

  #+ignore
  (fli:start-collecting-template-info)

  ;; 1. set *plugin-bundle* and *app-bundle* (Mac only)
  #+:macosx
  (let ((bundle     (foreign-slot-value main-data 'bundle))
        (app-bundle (foreign-slot-value main-data 'app-bundle)))
    (setq *plugin-bundle* (cf-retain bundle)
          *app-bundle*    (cf-retain app-bundle))
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
