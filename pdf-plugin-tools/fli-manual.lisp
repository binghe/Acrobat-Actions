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

(define-c-typedef ac-restore-environ-proc restore-environ-proc)

(defconstant +handshake-v0200+ #.(ash 2 16))
(defconstant +handshake-version+ +handshake-v0200+)

(defconstant +core-hft-version-2+ #x00020000)
(defconstant +core-hft-version-4+ #x00040000)
(defconstant +core-hft-version-5+ #x00050000)

(defconstant +cos-hft-version-6+ #x00060000)
(defconstant +cos-hft-version-7+ #x00070000)
(defconstant +cos-hft-version-8+ #x00080000)

(defconstant +as-calls-hft-version-2+   #x00020000)
(defconstant +as-calls-hft-version-2-2+ #x00020002)
(defconstant +as-calls-hft-version-3+   #x00030000)
(defconstant +as-calls-hft-version-4+   #x00040000)
(defconstant +as-calls-hft-version-5+   #x00050000)
(defconstant +as-calls-hft-version-6+   #x00060000)
(defconstant +as-calls-hft-version-7+   #x00070000)
(defconstant +as-calls-hft-version-8+   #x00080000)
(defconstant +as-calls-hft-version-9+   #x00090000)
(defconstant +as-calls-hft-version-10+  #x000A0000)

;; Some code below are code from Gregory C. Wuller's "corefoundation"
;; https://github.com/ngwese/core-foundation.git
;; BEGIN
#+:macosx
(fli:define-c-typedef (cf-type-ref (:foreign-name "CFTypeRef"))
                       (:pointer (:const :void)))

#+:macosx
(fli:define-foreign-function (cf-retain-imp "CFRetain" :source)
                             ((cf1 cf-type-ref))
                             :result-type
                             cf-type-ref
                             :language
                             :ansi-c)

#+:macosx
(fli:define-foreign-function (cf-release-imp "CFRelease" :source)
                             ((cf cf-type-ref))
                             :result-type
                             :void
                             :language
                             :ansi-c)

#+:macosx
(fli:define-c-struct (__cf-bundle
                      (:foreign-name "__CFBundle")
                      (:forward-reference t)))

#+:macosx
(fli:define-c-typedef (cf-bundle-ref (:foreign-name "CFBundleRef"))
                      (:pointer (:struct __cf-bundle)))

#+:macosx
(defmacro def-cf-type-function (name)
  (let ((imp-name (find-symbol (concatenate 'string (symbol-name name) "-IMP"))))
    `(defun ,name (obj)
       (declare (inline))
       (fli:with-coerced-pointer (ref :pointer-type 'cf-type-ref) obj
	 (,imp-name ref)))))

#+:macosx
(def-cf-type-function cf-release)

#+:macosx
(def-cf-type-function cf-retain)
;; END

#+:macosx
(define-c-struct plugin-main-data
  (size       :size-t)
  (bundle     cf-bundle-ref)
  (app-bundle cf-bundle-ref))
