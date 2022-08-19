;;; -*- Mode: LISP; Syntax: COMMON-LISP; Package: PREPARE-FM-PLUGIN-TOOLS; Base: 10 -*-

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

(in-package :prepare-pdf-plugin-tools)

;; Core support and plug-in handshaking
(defparameter *header-file-names*
  '("ASNumTypes"   ; Basic integer types.
    "CoreExpT"     ; Types, macros, structures, etc. required to use the Core HFT
    "ASExpT"       ; Types, macros, structures, etc. required to use the AcroSupport HFT
    "CorProcs"     ; Catalog of the "core" exported functions
                   ; (this table is handed off to the plug-in at initialization time)
    "CorCalls"
    "ASProcs"      ; Catalog of functions exported by AcroSupport
    "ASCalls"
    "PIVersn")     ; Contains handshaking versioning types and data
  "The list of involved Acrobat SDK header files in the right order.")

;; Base support
(defparameter *header-file-names-1*
  '("ASExtraExpT"  ; Types, macros, structures, etc. required to use the ASExtra HFT
    "ASExtraProcs" ; Catalog of functions exported by the ASExtra HFT
    "ASExtraCalls"

    "PDBasicExpT"  ; Types required to use the PDModel HFT (ONLY handles to exported types)
    "PDExpT"       ; Types, macros, structures, etc. required to use the PDModel HFT
    "AVExpT"       ; Types, macros, structures, etc. required to use the AcroView HFT
    "AVExpTObsolete1"
    "AVExpTObsolete2"
    "CosExpT"))    ; Types, macros, structures, etc. required to use the Cos HFT

;; Application UI
(defparameter *header-file-names-2*
  '("AVProcs"      ; Catalog of functions exported by AcroView
    "AVCalls"))

;; PDF manipulation
(defparameter *header-file-names-3*
  '("PDSExpT"      ; Types, macros, structures, etc. required to use the PDSEdit HFT
    "PDProcs"      ; Catalog of functions exported by the PDModel HFT
    "PDCalls"
    ))

;; PDF modification
(defparameter *header-file-names-4*
  '("PEExpT"))

;; For each element in this list, when CDR is NIL, the corresponding FLI type is
;; given by (intern (string-upcase part) :keyword)
(defparameter *fli-types*
  '(("void")
    ("unsigned")
    ("signed")
    ("char"       :byte)
    ("short")
    ("int")
    ("long")
    ("float")
    ("double")
    ("bool"       :boolean)          ; see AVProc.h, line 10546
    ("size_t"     :size-t)
    ("intptr_t"   :intptr)
    ("uintptr_t"  :uintptr)
    ("__CFString"        :cf-string) ; see ASExpT.h, line 2214 (macOS)
    ("__CFStringPlacebo" :cf-string) ; see ASExpT.h, line 2239 (Windows)
    ("__CFURL"           :cf-url)    ; see ASExpT.h, line 2227 (macOS)
    ("__CFURLPlacebo"    :cf-url)    ; see ASExpT.h, line 2243 (Windows)
    ("struct"))) ; this last one is to be handled by *typedefs*

(defparameter *typedefs-init*
  '(((:pointer (:struct :cf-string)) . (:pointer :void))
    ((:pointer (:struct :cf-url))    . (:pointer :void))
    )
  "An alist which maps C typedefs to the `real' types (initial version).")

(defvar *typedefs* nil
  "An alist which maps C typedefs to the `real' types.")

(defparameter *ignored-defines*
  '("boolean"))

;; NOTE: platform features should only appear in positive keywords.
(defparameter *positive-macros*
  '("HAS_MENUBAR"
    "HAS_FULL_SCREEN"
    "HAS_MENUS"
    "CAN_SELECT_GRAPHICS"
    #+:macosx "MAC_PLATFORM"
    #+:mswindows "WIN_PLATFORM"
    #+:mswindows "_WIN32"
    #+(and :mswindows :lispworks-64bit) "_WIN64"
    "PI_CORE_VERSION != 0"
    "ASUSE_OBSOLETE_TYPES"
    "USE_CPLUSPLUS_EXCEPTIONS_FOR_ASEXCEPTIONS"
    "NEW_PDFEDIT_HFTS"
    "NEW_PDSEDIT_HFTS"
    "PDMETADATA_HFT"
    #+lispworks-64bit "AS_ARCH_64BIT"
    #+(and :macosx :lispworks-64bit)
    "MAC_PLATFORM || (MAC_PLATFORM && !AS_ARCH_64BIT)"         ; only appears negatively
    "defined(ACRO_SDK_LEVEL) || (ACRO_SDK_LEVEL < 0x00060000)" ; only appears negatively
    "defined(ACRO_SDK_LEVEL) || (ACRO_SDK_LEVEL < 2)"          ; only appears negatively
    "(ACRO_SDK_LEVEL >= 0x00060000)"
    "PLUGIN")
  "C macros that are considered being defined as 1 in the SDK")

(defparameter *negative-macros*
  '("DEBUG"
    "TOOLKIT"
    "ACROBAT_LIBRARY"
    "THREAD_SAFE_PDFL"
    "READER"
    "USE_NAMED_IDLE_PROCS"
    "USE_NAMED_LATE_INIT_PROCS"
    "HAS_32BIT_ATOMS"
    "BAD_SELECTOR"
    "UNIX_PLATFORM"
    #+:macosx "WIN_PLATFORM"
    #+:mswindows "MAC_PLATFORM"
    #+:mswindows "MAC_PLATFORM || (MAC_PLATFORM && !AS_ARCH_64BIT)"
    "__cplusplus"
    "STATIC_HFT"
    #+(or :macosx :mswindows) "_WIN32"
    #+(or :macosx
          (and :mswindows (not :lispworks-64bit))) "_WIN64"
    "OS2_PLATFORM"
    "OS2_ENV"
    #-lispworks-64bit "AS_ARCH_64BIT"
    "0")
  "C macros that are considered being defined as 0 in the SDK")

(defvar *sdk-extern-location* nil
  "A pathname designator denoting where exactly Acrobat Pro SDK's
PluginSupport/Headers/API directory can be found.  You either set it here, or you'll get
a dialog asking for it.")

(defvar *fli-file*
  (merge-pathnames "../fli.lisp"
                   (load-time-value
                    (or #.*compile-file-pathname* *load-pathname*)))
  "The target file \(to become a part of the PDF-PLUGIN-TOOLS
system) which is generated by this library.")

(defvar *fli-file-1*
  (merge-pathnames "../fli-1.lisp"
                   (load-time-value
                    (or #.*compile-file-pathname* *load-pathname*))))

(defvar *fli-file-2*
  (merge-pathnames "../fli-2.lisp"
                   (load-time-value
                    (or #.*compile-file-pathname* *load-pathname*))))

(defvar *fli-file-3*
  (merge-pathnames "../fli-3.lisp"
                   (load-time-value
                    (or #.*compile-file-pathname* *load-pathname*))))

(defvar *fli-file-4*
  (merge-pathnames "../fli-4.lisp"
                   (load-time-value
                    (or #.*compile-file-pathname* *load-pathname*))))

(defvar *hft-counter* 0
  "This variable records the offset of each API functions in the corresponding HFT")

(defvar *line-number* 0
  "The current line number when processing SDK headers in single-line mode.")
