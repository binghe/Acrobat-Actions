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

;; 1. typedef signed char			ASInt8, *ASInt8P;
;; 2. typedef signed long long int		ASInt64;
(defparameter *typedef-regex1*
  (create-scanner "typedef\\s+(.*)(?<!\\s)\\s+(\\w+)(,\\s*\\*(\\w+))?\\s*;"))

;; typedef void *HFTEntry;
;; typedef const HFTDataRec *HFTData;
(defparameter *typedef-regex2*
  (create-scanner "typedef\\s+([\\w\\s]+)(?<!\\s)\\s+\\*(\\w+)\\s*;"))

;; typedef struct _t_ASExtension *ASExtension; (opaque pointer)
(defparameter *typedef-regex3*
  (create-scanner
    "typedef\\s+(const\\s+)?struct\\s+(\\w+)(?<!\\s)\\s+((\\w+),)?\\s*\\*(\\w+)\\s*;"))

(defun handle-typedef (line)
  (cond ((scan *typedef-regex3* line)
         (register-groups-bind (const-p opaque-type type-p type pointer-type)
             (*typedef-regex3* line)
           (declare (ignore const-p type-p type))
           (let ((name (mangle-name pointer-type))
                 (opaque-name (mangle-name opaque-type)))
             (format t "~%;; line ~D" *line-number*)
             (pprint `(fli:define-opaque-pointer ,name ,opaque-name)))))
        ((scan *typedef-regex1* line)
         (register-groups-bind (existing-type defined-type nil pointer-type)
             (*typedef-regex1* line)
           (let ((name (mangle-name defined-type))
                 (fli-type (make-fli-type existing-type)))
             ;; this permits using T and NIL in Lisp code
             (when (string= "ASBool" defined-type)
               (setq fli-type `(:boolean ,fli-type)))
             (format t "~%;; line ~D" *line-number*)
             (pprint `(fli:define-c-typedef ,name ,fli-type))
             (when pointer-type
               (pprint `(fli:define-c-typedef
                            ,(mangle-name pointer-type) (:pointer ,name)))))))
        ((scan *typedef-regex2* line)
         (register-groups-bind (existing-type pointer-type) (*typedef-regex2* line)
           (let ((name (mangle-name pointer-type))
                 (fli-type (make-fli-type existing-type)))
             (format t "~%;; line ~D" *line-number*)
             (pprint `(fli:define-c-typedef ,name (:pointer ,fli-type))))))
        (t
         nil)))

(defun write-function-definition (lisp-name result-type args)
  "Accepts values which suffice to create a foreign function
defintion and writes it to the output stream."
  ;; we use DEFINE-FMXCPT-FUNCTION as defined in FM-PLUGIN-TOOLS
  (pprint `(fli:define-foreign-funcallable ,lisp-name
               ,(loop for (type name nil) in args
                      collect `(,name ,type))
             :result-type ,result-type
             :calling-convention :cdecl
             :language :ansi-c)))

(defun handle-function (result-type c-name args)
  "Accepts one line of C code and checks if it's a function prototype.
If it is one, we write a corresponding function definition to the
output stream."
  (let ((lisp-name (mangle-name
                    (concatenate 'string c-name "SELPROTO"))))
    (write-function-definition lisp-name (make-fli-type result-type)
                               ;; args are separated by commas
                               (cond ((string= args "void") ; no args
                                      nil)
                                     (t
                                      (loop for arg in (split "\\s*,\\s*" args)
                                            collect (type-and-name arg t)))))))

(defun read-enum-value (string)
  "Reads the optional value part of a C enum and returns a
corresponding Lisp value - either a number or a LOGIOR
expression."
  ;; convert hex marker for Lisp reader
  (setq string (regex-replace-all "0x" string "#x"))
  ;; just read value as a number
  (read-from-string string))

;; #define ASMAXInt64			((ASInt64)0x7FFFFFFFFFFFFFFFLL)
(defparameter *define-regex1*
  (create-scanner "^#\\s*define\\s+(.*)(?<!\\s)\\s+\\(\\(\\w+\\)([x0-9A-F]+)L?L?\\)$"))

;; #  define kASMAXEnum8 ASMAXInt16
(defparameter *define-regex2*
  (create-scanner "^#\\s*define\\s+(\\w+)(?<!\\s)\\s+([A-Z][0-9A-Za-z_]+)$"))

;; #define ASPushExceptionFrame (ACROASSERT(gCoreVersion >=CoreHFT_VERSION_2), ...
(defparameter *define-regex3*
  (create-scanner
   "^#define (\\w+) \\(ACROASSERT\\((\\w+) >=([\\w_]+)\\), \\*\\(\\((\\w+)\\)\\((\\w+)\\[(\\w+)\\]\\)\\)\\)$"))

(defun handle-define (line)
  (cond ((scan *define-regex1* line)
         (register-groups-bind (name value-string) (*define-regex1* line)
           (let ((lisp-name (mangle-name name :constant t))
                 (value (read-enum-value value-string)))
             (format t "~%;; line ~D" *line-number*)
             (format t "~%(defconstant ~A #x~X)" lisp-name value))))
        ((scan *define-regex2* line)
         (register-groups-bind (name alias) (*define-regex2* line)
           (unless (member name *ignored-defines* :test 'equal)
             (format t "~%;; line ~D" *line-number*)
             (pprint `(fli:define-c-typedef ,(mangle-name name) ,(mangle-name alias))))))
        ((scan *define-regex3* line)
         (register-groups-bind (name vername version proto hft sel) (*define-regex3* line)
           (format t "~%;; line ~D" *line-number*)
           (let* ((lisp-name (mangle-name name))
                  (lisp-vername (mangle-name vername :global t))
                  (lisp-version (mangle-name version :constant t))
                  (lisp-proto (mangle-name proto))
                  (lisp-hft (mangle-name hft :global t))
                  (lisp-sel (mangle-name sel :constant t))
                  (hft-type (intern "HFT" :pdf-plugin-tools))
                  (args (intern "ARGS" :pdf-plugin-tools))
                  (temp (intern "TEMP" :pdf-plugin-tools)))
             (pprint `(defmacro ,lisp-name (&rest ,args)
                        (list 'if (list '>= ',lisp-vername ',lisp-version)
                              (list 'fli:with-coerced-pointer
                                    (list ',temp ':type '',hft-type) ',lisp-hft
                                    (list 'fli:incf-pointer ',temp ',lisp-sel)
                                    (nconc (list ',lisp-proto (list 'fli:dereference ',temp)) ,args))
                              (list 'error "Not implemented")))
                     ))))))

;; cf. *type-and-name-regex* (util.lisp)
(defparameter *type-and-names-regex*
  (create-scanner
   "(?m)^\\s*([^,*]*)(?<!\\s)(?:(\\s*\\*\\s+|\\s+\\*\\s*)|\\s+)([\\w\\s,]+)\\s*;(?:\\s*//.*)?\\s*?$"))

(defun handle-struct (struct-name body typedef-name pointer-name)
  "Handles the part between `struct {' and `}' - writes a
corresponding FLI:DEFINE-C-STRUCT definition."
  (declare (ignore struct-name))
  (let (slots)
    (do-register-groups (type pointerp names)
        (*type-and-names-regex* body)
      (loop for name in (split "\\s*,\\s*" names)
            do
         (push (list (cond (pointerp `(:pointer ,(make-fli-type type)))
                           (t                    (make-fli-type type)))
                     (mangle-name name)) slots)))
    (let ((lisp-name (mangle-name typedef-name)))
      (pprint `(fli:define-c-struct ,lisp-name
                 ,@(loop for (slot-type slot-name) in (nreverse slots)
                         collect `(,slot-name ,slot-type))))
      (when pointer-name
        (pprint `(fli:define-c-typedef ,(mangle-name pointer-name) (:pointer ,lisp-name))))
      )))

;; typedef ACCBPROTO1 void (ACCBPROTO2 *HFTServerDestroyProc)(HFTServer hftServer, void *rock);
(defparameter *prototype-regex*
  (create-scanner
   "(?m)^typedef\\s+ACCBPROTO1\\s+(\\w+)\\s+\\(ACCBPROTO2\\s+\\*(\\w+Proc)\\)\\s*\\(([\\w\\s\\*,]+)\\);$"))

(defun handle-prototype (file-string)
  (do-register-groups (return-type proc-name args) (*prototype-regex* file-string)
    (let ((parsed-args (cond ((string= args "void") ; no args
                              nil)
                             (t
                              (loop for arg in (split "\\s*,\\s*" args)
                                    collect (type-and-name arg t))))))
      (pprint `(fli:define-c-typedef ,(mangle-name proc-name)
                 (:pointer
                  (:function ,(loop for (type nil nil) in parsed-args
                                    collect type)
                   ,(make-fli-type return-type)
                   :calling-convention :cdecl)))))))

(defparameter *if-regex1*
  (create-scanner "^#\\s*ifdef\\s+(.*)"))

(defparameter *if-regex2*
  (create-scanner "^#\\s*if\\s+(!)?([\\w\\s\\|\\(\\)<!=_]+)(?<!\\s)\\s*$"))

;; This pattern only retrieves the function name
(defparameter *xproc-regex1*
  (create-scanner "(?m)^\\w*PROC\\([\\w\\s\\*]+,\\s+(\\w+),\\s+\\([\\w\\s\\*,]+\\)(,\\s*\\w+)?\\)"))

;; This pattern only retrieves the function type, name and arguments (ignoring stubs)
(defparameter *xproc-regex2*
  (create-scanner "(?m)^\\w*PROC\\(([\\w\\s\\*]+),\\s+(\\w+),\\s+\\(([\\w\\s\\*,]+)\\)(,\\s*\\w+)?\\)"))

(defvar *line-number*)

(defun parse-header-files ()
  "Loops through all C header files in *HEADER-FILE-NAMES*,
checks for enums, structs or function prototypes and writes the
corresponding C code to *STANDARD-OUTPUT*."
  (dolist (name *header-file-names*)
    (let ((header-file (make-pathname :name name :type "h"
                                      :defaults *sdk-extern-location*))
          (file-string (make-array '(0) :element-type 'simple-char
                                   :fill-pointer 0 :adjustable t))
          (*line-number* 0)
          (*hft-counter* 1))
      (format t "~%;; #include <~A.h>" name)
      (format *error-output* "Processing ~A...~%" name)
      (with-open-file (in header-file)
        (with-output-to-string (out file-string)
          (loop with contexts = '(:error)     ; the polarity of the current #if context
                with pos-contexts = '(:error) ; the current #if context when polarity is T
                with neg-contexts = '(:error) ; the current #if context when polarity is NIL
                for line = (read-line in nil nil)
                while line do ; this test fails only if input file ends
            (incf *line-number*)
            (cond ((scan "^#\\s*ifndef\\s+.*" line) ; usually only first line of a header
                   (push :enable contexts))
                  ;; ifdef ...
                  ((scan *if-regex1* line)
                   (register-groups-bind (context) (*if-regex1* line)
                     (setq context (regex-replace-all "\\s+" context " "))
                     (if (member context *negative-macros* :test 'equal)
                         (push :disable contexts)
                         (push :enable contexts))))
                  ;; if [!]...
                  ((scan *if-regex2* line)
                   (register-groups-bind (neg-p context) (*if-regex2* line)
                     (setq context (regex-replace-all "\\s+" context " "))
                     (if (or (member context *positive-macros* :test 'equal)
                             (member context *negative-macros* :test 'equal))
                         (cond (neg-p
                                (push context neg-contexts)
                                (push :negative contexts))
                               (t
                                (push context pos-contexts)
                                (push :positive contexts)))
                       ;; an irrelevant condition, we choose the first branch
                       (push :enable contexts))))
                  ((scan "^#\\s*if\\s+(.*)" line) ; the fallback case of #if
                   (push :enable contexts))
                  ;; turn over the context if we met #else
                  ((scan "^#\\s*else" line)
                   (let ((context (pop contexts)))
                     (ecase context
                       (:enable  (push :disable contexts))
                       (:disable (push :enable  contexts))
                       (:positive
                        (push (pop pos-contexts) neg-contexts)
                        (push :negative contexts))
                       (:negative
                        (push (pop neg-contexts) pos-contexts)
                        (push :positive contexts)))))
                  ;; pop the current context
                  ((scan "^#\\s*endif" line)
                   (let ((context (pop contexts)))
                     (ecase context
                       ((:enable :disable)
                        t)
                       (:positive
                        (pop pos-contexts))
                       (:negative
                        (pop neg-contexts)))))
                  (t
                   (cond ((not (null (intersection *negative-macros* pos-contexts :test 'equal)))
                          nil) ; ignore this line
                         ((not (null (intersection *positive-macros* neg-contexts :test 'equal)))
                          nil) ; ignore this line
                         ((member :disable contexts)
                          nil) ; ignore this line if :disable occurs once
                         (t
                          ;; single-line processing
                          (handle-typedef line)
                          (handle-define line)
                          ;; multi-line processing (preparation)
                          (format out "~A~%" line)))))
                ;; still inside the loop
                #+ignore
                (format *error-output* "L~D contexts: ~A, pos-contexts: ~A, neg-contexts: ~A~%"
                        line-number contexts pos-contexts neg-contexts)
                )))
      ;; typedef struct ...
      (do-register-groups (struct-name body typedef-name pointerp pointer-name)
          ("(?sm)^typedef struct ([\\w_]+)$\\s*\\{([^{}]+)\\}\\s*([\\w_]+)(,\\s\\*([\\w_]+))?;" file-string)
        (declare (ignore pointerp))
        (handle-struct struct-name body typedef-name pointer-name))
      ;; xPROC(...)
      (do-register-groups (name) (*xproc-regex1* file-string)
        (let ((full-name (concatenate 'string name "SEL")))
          (pprint `(defconstant ,(mangle-name full-name :constant t) ,*hft-counter*)))
        (incf *hft-counter*))
      ;; xPROC(...)
      (do-register-groups (type name args) (*xproc-regex2* file-string)
        (handle-function type name args))
      ;; prototypes
      (handle-prototype file-string)
      (terpri))))

(defun prepare ()
  "Creates the missing file `fli.lisp' for PDF-PLUGIN-TOOLS from
the C header files of Acrobat Pro."
  ;; find out where to look for headers
  (unless *sdk-extern-location* (set-sdk-extern-location))
  ;; redirect *STANDARD-OUTPUT* to `fli.lisp'
  (with-open-file (*standard-output* *fli-file*
                                     :direction :output
                                     :if-exists :supersede)
    ;; use correct package for output and refrain from writing
    ;; everything in uppercase
    (with-standard-io-syntax 
      (let ((*package* (find-package :pdf-plugin-tools))
            (*print-case* :downcase))
        (format t ";;; This file was generated automatically from Acrobat Pro's SDK headers.")
        (terpri)
        (print '(in-package :pdf-plugin-tools))
        (terpri)
        ;; let this function do all the work
        (parse-header-files))))
  :done)
