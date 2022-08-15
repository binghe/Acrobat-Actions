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

(defvar *pi-acro-support-version* +as-calls-hft-version-8+
  "Most plug-ins will use calls from the AdobeSupport family.")

(defvar *pi-cos-version* +cos-hft-version-6+
  "Many plug-ins will not need to access the low-level Cos functionality.")

(defvar *pi-pd-model-version* +pd-model-hft-version-6+
  "PDModel methods - the version of the PD level HFT.")

(defvar *pi-acro-view-version* +acro-view-hft-version-6+
  "AcroView methods - the version of the Acrobat viewer level HFT.")

(defvar *pi-as-extra-version* +as-extra-hft-version-6+
  "ASExtra methods")

#|
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

;; HFT_ERROR_NO_VERSION (0xFFFFFFFF)
(defconstant +hft-error-no-version+ #xFFFFFFFF)

(defmacro get-requested-hft (table-name required-ver resulting-ver result-hft)
  "[GetRequestedHFT] pass in name of hft and minimum required version.  
   returns hft and version of the returned hft (>= requiredVer) and true if successful
   on failure, both resultHFT and resultingVer return as NULL"
  (let ((table-atom (gensym))
        (the-hft    (gensym))
        (result-ver (gensym)))
    `(let ((,table-atom (as-atom-from-string ,table-name))
           (,result-ver +hft-error-no-version+))
       (cond ((>= *g-acro-support-version* +as-calls-hft-version-6+)
              (let ((,the-hft (as-extension-mgr-get-hft ,table-atom ,required-ver)))
                (when ,the-hft
                  (setq ,result-ver (hft-get-version ,the-hft))
                  (when (= ,result-ver +hft-error-no-version+)
                    (error "HFTGetVersion failed"))
                  (setq ,result-hft ,the-hft)
                  (setq ,resulting-ver ,result-ver)
                  t)))
             (t
              (error "Not implemented"))))))

(define-foreign-callable (plugin-export-hfts :encode :lisp
                                             :result-type as-bool
                                             :calling-convention :cdecl)
    ()
  "Create and register the HFT's. @return true to continue loading plug-in,
 false to cause plug-in loading to stop."
  (plugin-log "[PluginExportHFTs] begin.~%")
  (plugin-log "[PluginExportHFTs] end.~%")
  t)

(define-foreign-callable (plugin-import-replace-and-register
                          :encode :lisp
                          :result-type as-bool
                          :calling-convention :cdecl)
    ()
  "The application calls this function to allow it to
   <ul>
	<li> Import plug-in supplied HFTs.
	<li> Replace functions in the HFTs you're using (where allowed).
	<li> Register to receive notification events.
   </ul>

   @return true to continue loading plug-in, false to cause plug-in loading to stop."
  (plugin-log "[PluginImportReplaceAndRegister] begin.~%")
  (plugin-log "[PluginImportReplaceAndRegister] end.~%")
  t)

(define-foreign-callable (plugin-init :encode :lisp
                                      :result-type as-bool
                                      :calling-convention :cdecl)
    ()
  "The main initialization routine. @return true to continue loading the plug-in,
 false to cause plug-in loading to stop."
  (plugin-log "[PluginInit] begin.~%")
  (block plugin-init
    (unless (plugin-set-menu)
      (plugin-log "[PluginInit] end badly.~%")
      (return-from plugin-init nil))
    (unless (plugin-set-commands)
      (plugin-log "[PluginInit] end badly.~%")
      (return-from plugin-init nil))
    (unless (plugin-set-toolbar)
      (plugin-log "[PluginInit] end badly.~%")
      (return-from plugin-init nil))
    (plugin-log "[PluginInit] end.~%")
    t))

(define-foreign-callable (plugin-unload :encode :lisp
                                        :result-type as-bool
                                        :calling-convention :cdecl)
    ()
  "The unload routine.

Called when your plug-in is being unloaded when the application quits.
Use this routine to release any system resources you may have allocated.

Returning false will cause an alert to display that unloading failed.
@return true to indicate the plug-in unloaded."
  (plugin-log "[PluginUnload] begin.~%")
  (plugin-unload-menu)
  #+:macosx (cf-release *plugin-bundle*) ; cf-retain was called in [AcroPluginMain]
  #+:macosx (cf-release *app-bundle*)    ; same here
  (plugin-log "[PluginUnload] end.~%")
  t)

(define-foreign-callable (pi-handshake :encode :lisp
                                       :result-type as-bool
                                       :calling-convention :cdecl)
    ((handshake-version as-uns32)
     (handshake-data    (:pointer :void)))
  "PIHandshake function provides the initial interface between your plug-in and
the application.  This function provides the callback functions to the
application that allow it to register the plug-in with the application
environment."
  (plugin-log "[PIHandshake] begin.~%")
  (cond ((= handshake-version +handshake-v0200+)
         (with-coerced-pointer (hs-data :type 'pi-handshake-data-v0200)
             handshake-data
           (let ((extension-name (get-extension-name)))
             (plugin-log "[PIHandshake] extension name: ~A~%" (as-atom-get-string extension-name))
             (setf (foreign-slot-value hs-data 'extension-name) extension-name))
           (setf (foreign-slot-value hs-data 'export-hft-s-callback)
                 (as-callback-create-proto
                  (foreign-function-pointer 'plugin-export-hfts)))
           (setf (foreign-slot-value hs-data 'import-replace-and-register-callback)
                 (as-callback-create-proto
                  (foreign-function-pointer 'plugin-import-replace-and-register)))
           (setf (foreign-slot-value hs-data 'init-callback)
                 (as-callback-create-proto (foreign-function-pointer 'plugin-init)))
           (setf (foreign-slot-value hs-data 'unload-callback)
                 (as-callback-create-proto (foreign-function-pointer 'plugin-unload))))
         #+ignore
         (with-open-file (stream "/tmp/fli-templates.lisp" :direction :output)
           (fli:print-collected-template-info :output-stream stream))
         (plugin-log "[PIHandshake] end.~%")
         t)
        (t
         (plugin-log "[PIHandshake] end badly (wrong handshake version: ~A).~%"
                     handshake-version)
         nil)))

(eval-when (:compile-toplevel :load-toplevel :execute)
  (defparameter *hft-info*
    '(("Core"     *pi-core-version*      *g-core-version*      *g-core-hft*)
      ("ASExtra"  *pi-as-extra-version*  *g-as-extra-version*  *g-as-extra-hft*)
      ("AcroView" *pi-acro-view-version* *g-acro-view-version* *g-acro-view-hft*)
      ("PDModel"  *pi-pd-model-version*  *g-pd-model-version*  *g-pd-model-hft*)
      ("Cos"      *pi-cos-version*       *g-cos-version*       *g-cos-hft*))
    "A list of HFTs to be retrieved from the host application."))

;; This macro only expands into pi-setup-sdk
(defmacro get-requested-hfts ()
  `(progn
     ,@(loop for (name required-ver resulting-ver result-hft) in *hft-info* collect
         `(when (and-plusp ,required-ver)
            (setq success
                  (get-requested-hft ,name ,required-ver ,resulting-ver ,result-hft))
            (cond (success
                   (plugin-log "[PISetupSDK] ~A = ~A~%" (symbol-name ',result-hft) ,result-hft)
                   (plugin-log "[PISetupSDK] ~A = #x~X~%" (symbol-name ',resulting-ver) ,resulting-ver))
                  (t
                   (plugin-log "[PISetupSDK] failed when getting HFT ~A?!~%"
                               (symbol-name ',result-hft))
                   (return-from pi-setup-sdk nil)))))))

(define-foreign-callable (pi-setup-sdk :encode :lisp
                                       :result-type as-bool
                                       :calling-convention :cdecl)
    ((handshake-version as-uns32)
     (sdk-data          (:pointer :void)))
  "[PISetupSDK] This routine is called by the host application to set up the
 plug-in's SDK-provided functionality."
  (block pi-setup-sdk
    (let ((success nil))
      (plugin-log "[PISetupSDK] begin.~%")
      (when (= handshake-version +handshake-v0200+)
        (with-coerced-pointer (data :type 'pi-sdk-data-v0200) sdk-data
          (let ((version (foreign-slot-value data 'handshake-version)))
            (unless (= version +handshake-v0200+)
              (plugin-log "[PISetupSDK] Someone lied.~%")
              (return-from pi-setup-sdk nil))
            (setq *extension-id* (foreign-slot-value data 'extension-id))
            (plugin-log "[PISetupSDK] *extension-id* = ~A~%" *extension-id*)
            (setq *g-core-hft* (foreign-slot-value data 'core-hft)
                  *g-core-version* +core-hft-version-2+)
            (plugin-log "[PISetupSDK] *g-core-hft* = ~A~%" *g-core-hft*)
            (let* ((acro-support-atom (as-atom-from-string "AcroSupport"))
                   (acro-support-name (as-atom-get-string acro-support-atom)))
              (plugin-log "[PISetupSDK] acro-support = ~A (~A)~%"
                          acro-support-atom acro-support-name)
              (setq *g-acro-support-hft*
                    (as-extension-mgr-get-hft acro-support-atom +as-calls-hft-version-6+))
              (unless *g-acro-support-hft*
                (plugin-log "[PISetupSDK] cannot get initial *g-acro-support-hft*")
                (return-from pi-setup-sdk nil))
              (plugin-log "[PISetupSDK] *g-acro-support-hft* = ~A~%" *g-acro-support-hft*)
              (setq *g-acro-support-version*
                    (let ((*g-acro-support-version* +as-calls-hft-version-6+))
                      (hft-get-version *g-acro-support-hft*)))
              (plugin-log "[PISetupSDK] *g-acro-support-version* = #x~X~%"
                          *g-acro-support-version*)
              (setq success t))
            (get-requested-hfts)
            (setf (foreign-slot-value data 'handshake-callback)
                  (as-callback-create-proto (foreign-function-pointer 'pi-handshake)))
            (plugin-log "[PISetupSDK] end successfully.~%")
            (return-from pi-setup-sdk success)))))
    ;; If we reach here, then we were passed a handshake version number we don't know about.
    ;; This shouldn't ever happen since our main() routine chose the version number.
    (plugin-log "[PISetupSDK] end badly.~%")
    nil))

(define-foreign-callable (#+:mswindows "PlugInMain"
                          #-:mswindows "AcroPluginMain"
                          :result-type as-bool
                          :calling-convention
                          #+:mswindows :stdcall #-:mswindows :cdecl)
    ((app-handshake-version as-uns32)
     (handshake-version     as-uns32p)
     (setup-proc            (:pointer pi-setup-sdk-proc-type))
     #+:mswindows
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

  #+:mswindows
  (with-coerced-pointer (data-ptr :type 'v0200-data) windows-data
    (setq *g-hwnd*      (foreign-slot-value data-ptr 'hwnd))
    (setq *g-hinstance* (foreign-slot-value data-ptr 'hinstance))
    (plugin-log "[AcroPluginMain] *g-hwnd* = ~A~%" *g-hwnd*)
    (plugin-log "[AcroPluginMain] *g-hinstance* = ~A~%" *g-hinstance*))

  ;; 2. appsHandshakeVersion tells us which version of the handshake struct the application has sent us.
  ;; HANDSHAKE_VERSION is the latest version that we, the plug-in, know about (see PIVersn.h)
  ;; Always use the earlier of the two structs to assure compatibility.
  ;; The version we want to use is returned to the application so it can adjust accordingly.
  (let ((version (the (unsigned-byte 32)
                      (min app-handshake-version +handshake-version+))))
    (plugin-log "[AcroPluginMain] app-handshake-version = #x~X~%" app-handshake-version)
    (setf (dereference handshake-version) version)
    (plugin-log "[AcroPluginMain] handshake-version = #x~X~%" version))

  ;; 3. Provide the routine for the host app to call to setup this plug-in
  (setf (dereference setup-proc) (foreign-function-pointer 'pi-setup-sdk))

  ;; 4. return TRUE (otherwise Acrobat won't call "PISetupSDK")
  (plugin-log "[AcroPluginMain] end.~%")
  t)

;; END
