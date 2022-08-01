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

;; An HFTEntry may be cast to a pointer to a function whose prototype must
;; be provided by the HFT's description file. <CoreExpT.h>
(fli:define-c-typedef hft-entry (:pointer :void)) ; HFTEntry

;; An object that describes a set of exported functions.
;; It is an array of function pointers, where the first element is unused.
;;
;; @note An HFT object may be cast to an <code>(HFTEntry *)</code>; you may then
;; index directly into this object by a selector to obtain a pointer to
;; a function. <CoreExpT.h>
(fli:define-c-typedef hft (:pointer hft-entry)) ; HFT

;;; cardinal types <ASNumTypes.h>

;; 1-byte <code>unsigned char</code> value.
(fli:define-c-typedef as-uns8   (:unsigned :byte))
(fli:define-c-typedef as-uns8p  (:pointer as-uns8))

;; 2-byte unsigned short numeric value. 
(fli:define-c-typedef as-uns16  (:unsigned :short))
(fli:define-c-typedef as-uns16p (:pointer as-uns16))

;; 4-byte <code>unsigned long</code> numeric value. <ASNumTypes.h>
(fli:define-c-typedef as-uns32  (:unsigned :int))
(fli:define-c-typedef as-uns32p (:pointer as-uns32))

;; 8-byte <code>unsigned long</code> numeric value. <ASNumTypes.h>
(fli:define-c-typedef as-uns64  (:unsigned :long :long))

(fli:define-c-typedef as-bool   as-uns16)
(defconstant +true+  1)
(defconstant +false+ 0)

;; PIMain.c
(defvar *core-hft*)     ; HFT gCoreHFT = 0;
(defvar *core-version*) ; ASUns32 gCoreVersion = 0;

#+:macosx
(fli:define-c-struct t-plugin-main-data
  (size       :size-t)
  (bundle     cf-bundle-ref)
  (app-bundle cf-bundle-ref))

#+:macosx
(fli:define-c-typedef plugin-main-data (:pointer t-plugin-main-data))

#+:macosx
(defvar *app-bundle*)    ; CFBundleRef gAppBundle = NULL;

#+:macosx
(defvar *plugin-bundle*) ; CFBundleRef gPluginBundle = NULL;

;;; Prototypes for plug-in supplied functions. <PIVersn.h>

(fli:define-c-typedef pi-setup-sdk-proc-type ; PISetupSDKProcType
  (:function (as-uns32         #| handshakeVersion |#
              (:pointer :void) #| sdkData |#)
   as-bool :calling-convention :cdecl))

(fli:define-c-typedef pi-handshake-proc-type ; PIHandshakeProcType
  (:function (as-uns32         #| handshakeVersion |#
              (:pointer :void) #| handshakeData |#)
   as-bool :calling-convention :cdecl))

(fli:define-c-typedef pi-export-hfts-proc-type ; PIExportHFTsProcType
  (:function () as-bool :calling-convention :cdecl))

(fli:define-c-typedef pi-import-replace-and-register-proc-type
                      ; PIImportReplaceAndRegisterProcType
  (:function () as-bool :calling-convention :cdecl))

(fli:define-c-typedef pi-init-proc-type ; PIInitProcType
  (:function () as-bool :calling-convention :cdecl))

(fli:define-c-typedef pi-unload-proc-type ; PIUnloadProcType
  (:function () as-bool :calling-convention :cdecl))

(fli:define-foreign-callable ("PISetupSDK" :result-type as-bool
                                           :calling-convention :cdecl)
    ((handshake-version     as-uns32)
     (sdk-data              (:pointer :void)))
  "This routine is called by the host application to set up the plug-in's
SDK-provided functionality."
  )

(fli:define-foreign-callable ("PIHandshake" :result-type as-bool
                                            :calling-convention :cdecl)
    ((handshake-version     as-uns32)
     (handshake-data        (:pointer :void)))
  "PIHandshake function provides the initial interface between your plug-in and
the application.
This function provides the callback functions to the application that allow it to
register the plug-in with the application environment."
  +false+
  )

(defvar *pi-setup-sdk* (fli:foreign-function-pointer "PISetupSDK"))
(defvar *pi-handshake* (fli:foreign-function-pointer "PIHandshake"))

#+:macosx
(fli:define-foreign-callable ("AcroPluginMain" :result-type as-bool
                                               :calling-convention :cdecl)
    ((app-handshake-version as-uns32)
     (handshake-version     as-uns32p)
     (setup-proc            (:pointer pi-setup-sdk-proc-type))
     (main-data             plugin-main-data))
  ""
  +false+)
