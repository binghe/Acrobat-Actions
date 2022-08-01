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
(define-c-typedef hft-entry (:pointer :void)) ; HFTEntry

;; An object that describes a set of exported functions.
;; It is an array of function pointers, where the first element is unused.
;;
;; @note An HFT object may be cast to an <code>(HFTEntry *)</code>; you may then
;; index directly into this object by a selector to obtain a pointer to
;; a function. <CoreExpT.h>
(define-c-typedef hft (:pointer hft-entry)) ; HFT

;;; cardinal types <ASNumTypes.h>

;; 1-byte <code>unsigned char</code> value.
(define-c-typedef as-uns8   (:unsigned :byte))
(define-c-typedef as-uns8p  (:pointer as-uns8))

;; 2-byte unsigned short numeric value. 
(define-c-typedef as-uns16  (:unsigned :short))
(define-c-typedef as-uns16p (:pointer as-uns16))

;; 4-byte <code>unsigned long</code> numeric value. <ASNumTypes.h>
(define-c-typedef as-uns32  (:unsigned :int))
(define-c-typedef as-uns32p (:pointer as-uns32))

;; 8-byte <code>unsigned long</code> numeric value. <ASNumTypes.h>
(define-c-typedef as-uns64  (:unsigned :long :long))

(define-c-typedef as-bool   as-uns16)
(defconstant +true+  1)
(defconstant +false+ 0)

;;; Prototypes for plug-in supplied functions. <PIVersn.h>
(define-c-typedef pi-setup-sdk-proc-type ; PISetupSDKProcType
  (:pointer
   (:function (as-uns32         #| handshakeVersion |#
               (:pointer :void) #| sdkData |#)
    as-bool :calling-convention :cdecl)))

(define-c-typedef pi-handshake-proc-type ; PIHandshakeProcType
  (:pointer
   (:function (as-uns32         #| handshakeVersion |#
               (:pointer :void) #| handshakeData |#)
    as-bool :calling-convention :cdecl)))

(define-c-typedef pi-export-hfts-proc-type ; PIExportHFTsProcType
  (:pointer (:function () as-bool :calling-convention :cdecl)))

(define-c-typedef pi-import-replace-and-register-proc-type
                ; PIImportReplaceAndRegisterProcType
  (:pointer (:function () as-bool :calling-convention :cdecl)))

(define-c-typedef pi-init-proc-type ; PIInitProcType
  (:pointer (:function () as-bool :calling-convention :cdecl)))

(define-c-typedef pi-unload-proc-type ; PIUnloadProcType
  (:pointer (:function () as-bool :calling-convention :cdecl)))

(defconstant +handshake-v0200+   #.(ash 2 16)) ; ((ASUns32)((2L<<16) + 0))
(defconstant +handshake-version+ +handshake-v0200+)

