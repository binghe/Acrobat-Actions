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
    "typedef\\s+(const\\s+)?struct\\s+(\\w+)(?<!\\s)\\s*((\\w+),)?\\s*\\*\\s*(\\w+)\\s*;"))

(defun handle-typedef (line)
  (cond ((scan *typedef-regex3* line)
         (register-groups-bind (const-p opaque-type type-p type pointer-type)
             (*typedef-regex3* line)
           (declare (ignore const-p type-p type))
           (let ((name (mangle-name pointer-type))
                 (opaque-name (mangle-name opaque-type)))
             (format t "~%;; line ~D" *line-number*)
             (pprint `(fli:define-opaque-pointer ,name ,opaque-name))
             ;; add `(:pointer (:struct ,opaque-name))` to *typedefs*
             (pushnew (cons `(:pointer (:struct ,opaque-name))
                            name)
                      *typedefs*
                      :key #'car))))
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
         (register-groups-bind (existing-type pointer-type)
             (*typedef-regex2* line)
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
             :calling-convention :cdecl)))

(defun handle-function (result-type c-name args)
  "Accepts one line of C code and checks if it's a function prototype.
If it is one, we write a corresponding function definition to the
output stream."
  (let ((lisp-name (mangle-name
                    (concatenate 'string c-name "-SELPROTO"))))
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
  (cond ((scan "^0x.*" string)
         ;; convert hex marker for Lisp reader
         (setq string (regex-replace-all "0x" string "#x"))
         (read-from-string string))
        (t
         (or (parse-integer string :junk-allowed t)
             (mangle-name string :constant t)))))

;; #define HANDSHAKE_VERSION		HANDSHAKE_V0200
(defparameter *define-regex0*
  (create-scanner "^#\\s*define\\s+([A-Z_]+)(?<!\\s)\\s+([\\w_]+)$"))

;; #define ASMAXInt64			((ASInt64)0x7FFFFFFFFFFFFFFFLL)
;; #define kMaxLanguageNameLen 27
(defparameter *define-regex1*
  (create-scanner (concatenate 'string
                               "^#\\s*define\\s+([A-Za-z0-9_]+)(?<!\\s)\\s+"
                               "(\\(\\(\\w+\\)(0x[0-9A-F]+|\\d+)L?L?\\)|\\d+)$")))

;; #  define kASMAXEnum8 ASMAXInt16
(defparameter *define-regex2*
  (create-scanner "^#\\s*define\\s+([A-Za-z0-9_]+)(?<!\\s)\\s+([A-Z][0-9A-Za-z_]+)$"))

;; #define ASPushExceptionFrame (ACROASSERT(gCoreVersion >=CoreHFT_VERSION_2), ...
(defparameter *define-regex3*
  (create-scanner
   (concatenate 'string
                "^\\s*#define (\\w+) "
                "\\(ACROASSERT\\((\\w+) >=([\\w_]+)\\),\\s*"
                "\\*\\(\\((\\w+)\\)\\((\\w+)\\[(\\w+)\\]\\)\\)\\)")))

;; #define ASCallbackCreate(x) (ACROASSERT(gCoreVersion >=CoreHFT_VERSION_2), ..
(defparameter *define-regex5*
  (create-scanner
   (concatenate 'string
                "^\\s*#define (\\w+)\\(\\w+\\) "
                "\\(ACROASSERT\\((\\w+) >=([\\w_]+)\\),\\s*"
                "\\*\\(\\((\\w+)\\)\\((\\w+)\\[(\\w+)\\]\\)\\)\\)")))

;; #define ASmalloc (ASSERT_AS_VER(0),*((ASmallocSELPROTO)(gAcroSupportHFT[ASmallocSEL])))
(defparameter *define-regex4*
  (create-scanner
   (concatenate 'string
                "^\\s*#define (\\w+) \\(ASSERT_AS_VER\\(([\\w_]+)\\),"
                "\\s*\\*\\(\\((\\w+)\\)\\((\\w+)\\[(\\w+)\\]\\)\\)\\)$")))

;; #define ASScriptToHostEncoding ASEXTRAROUTINE(ASExtraHFT_VERSION_5,ASScriptToHostEncoding)
(defparameter *define-regex6*
  (create-scanner "#define (\\w+) ASEXTRAROUTINE\\(([\\w_]+),([\\w_]+)\\)$"))

;; TODO: merge with *define-regex6*
(defparameter *define-regex7*
  (create-scanner "#define (\\w+) AVROUTINE\\(([\\w_]+),\\s*([\\w_]+)\\)$"))

(defun handle-define (line)
  (cond ((scan *define-regex0* line)
         nil)
        ((scan *define-regex1* line)
         (register-groups-bind (name value-string hex-p) (*define-regex1* line)
           (let ((lisp-name (mangle-name name :constant t))
                 (value (read-enum-value (or hex-p value-string))))
             (format t "~%;; line ~D" *line-number*)
             (pprint `(eval-when (:compile-toplevel :load-toplevel :execute)
                        (defconstant ,lisp-name ,value))))))
        ((scan *define-regex2* line)
         (register-groups-bind (name alias) (*define-regex2* line)
           (unless (member name *ignored-defines* :test 'equal)
             (format t "~%;; line ~D" *line-number*)
             (cond ((eql (elt name 0) #\k)
                    (pprint `(eval-when (:compile-toplevel :load-toplevel :execute)
                               (defconstant ,(mangle-name name :constant t)
                                 ,(mangle-name alias :constant t)))))
                   (t
                    (pprint `(fli:define-c-typedef ,(mangle-name name)
                               ,(mangle-name alias))))))))
        (t
         nil)))

(defun handle-define-2 (line)
  (cond ((scan *define-regex3* line)
         (register-groups-bind (name vername version proto hft sel) (*define-regex3* line)
           (format t "~%;; line ~D" *line-number*)
           (let* ((lisp-name (mangle-name name))
                  (lisp-vername (mangle-name vername :global t))
                  (lisp-version (mangle-name version :constant t))
                  (lisp-proto (mangle-name proto))
                  (lisp-hft (mangle-name hft :global t))
                  (lisp-sel (mangle-name sel :constant t))
                  (define-name (intern "DEFINE-ACROBAT-FUNCTION" :pdf-plugin-tools)))
             (pprint `(,define-name (,lisp-name ,name) ,lisp-vername ,lisp-version
                                    ,lisp-proto ,lisp-hft ,lisp-sel)))))
        ((scan *define-regex5* line)
         (register-groups-bind (name vername version proto hft sel) (*define-regex5* line)
           (format t "~%;; line ~D" *line-number*)
           (let* ((lisp-name (mangle-name name))
                  (lisp-vername (mangle-name vername :global t))
                  (lisp-version (mangle-name version :constant t))
                  (lisp-proto (mangle-name proto))
                  (lisp-hft (mangle-name hft :global t))
                  (lisp-sel (mangle-name sel :constant t))
                  (define-name (intern "DEFINE-ACROBAT-FUNCTION" :pdf-plugin-tools)))
             (pprint `(,define-name (,lisp-name ,name) ,lisp-vername ,lisp-version
                                    ,lisp-proto ,lisp-hft ,lisp-sel)))))
        ((scan *define-regex4* line)
         (register-groups-bind (name version proto hft sel) (*define-regex4* line)
           (format t "~%;; line ~D" *line-number*)
           (let* ((lisp-name (mangle-name name))
                  (lisp-vername (mangle-name "gAcroSupportVersion" :global t))
                  (lisp-version (or (parse-integer version :junk-allowed t)
                                    (mangle-name version :constant t)))
                  (lisp-proto (mangle-name proto))
                  (lisp-hft (mangle-name hft :global t))
                  (lisp-sel (mangle-name sel :constant t))
                  (define-name (intern "DEFINE-ACROBAT-FUNCTION" :pdf-plugin-tools)))
             (pprint `(,define-name (,lisp-name ,name) ,lisp-vername ,lisp-version
                                    ,lisp-proto ,lisp-hft ,lisp-sel)))))
        ((scan *define-regex6* line)
         (register-groups-bind (name version proto) (*define-regex6* line)
           (format t "~%;; line ~D" *line-number*)
           (let* ((lisp-name (mangle-name name))
                  (lisp-vername (mangle-name "gASExtraVersion" :global t))
                  (lisp-version (mangle-name version :constant t))
                  (lisp-proto (mangle-name (concatenate 'string proto "-SELPROTO")))
                  (lisp-hft (mangle-name "gASExtraHFT" :global t))
                  (lisp-sel (mangle-name (concatenate 'string proto "-SEL") :constant t))
                  (define-name (intern "DEFINE-ACROBAT-FUNCTION" :pdf-plugin-tools)))
             (pprint `(,define-name (,lisp-name ,name) ,lisp-vername ,lisp-version
                                    ,lisp-proto ,lisp-hft ,lisp-sel)))))
        ((scan *define-regex7* line)
         (register-groups-bind (name version proto) (*define-regex7* line)
           (format t "~%;; line ~D" *line-number*)
           (let* ((lisp-name (mangle-name name))
                  (lisp-vername (mangle-name "gAcroViewVersion" :global t))
                  (lisp-version (mangle-name version :constant t))
                  (lisp-proto (mangle-name (concatenate 'string proto "-SELPROTO")))
                  (lisp-hft (mangle-name "gAcroViewHFT" :global t))
                  (lisp-sel (mangle-name (concatenate 'string proto "-SEL") :constant t))
                  (define-name (intern "DEFINE-ACROBAT-FUNCTION" :pdf-plugin-tools)))
             (pprint `(,define-name (,lisp-name ,name) ,lisp-vername ,lisp-version
                                    ,lisp-proto ,lisp-hft ,lisp-sel)))))
        (t
         nil)))

(defparameter *handle-enum-regex*
  (create-scanner "(?m)^\\s*(\\w+)\\s*(?:=\\s*([^,/]*\\z|.*?)\\s*)?(?:,|(?:/.*)?$)"))

(defun handle-enum (body &optional type-name)
  "Handles the part between `enum {' and `}'.  Loops through all
lines, writes one DEFCONSTANT per item and the corresponding
EXPORT statement."
  (let ((counter 0))
    (do-register-groups (name value) (*handle-enum-regex* body)
      ;; use value if provided in enum, COUNTER otherwise
      (setq value (if value (read-enum-value value) counter))
      (let ((lisp-name (mangle-name name :constant t)))
        (pprint `(eval-when (:compile-toplevel :load-toplevel :execute)
                   (defconstant ,lisp-name ,value))))
      ;; increment counter or continue with successor of value
      (setq counter (1+ (if (numberp value) value counter))))
    (when type-name
      (pprint `(fli:define-c-typedef ,(mangle-name type-name) :int)))))

;; NOTE: the regex string /\*([^*]|[\r\n]|(\*+([^*/]|[\r\n])))*\*+/ for matching C
;; comments is learnt from (non-greedy matching doesn't work)
;; https://blog.ostermiller.org/finding-comments-in-source-code-using-regular-expressions/
;;
;; /* comment1 */ type [*]var1, [*]var2; // comment2
(defparameter *type-and-names-regex*
  (create-scanner
   (concatenate 'string
                "(?sm)\\s*"
                "(?:/\\*(?:[^*]|[\\r\\n]|(?:\\*+(?:[^*/]|[\\r\\n])))*\\*+/\\s*)*" ; C comments (multiple blocks)
                "(?://[^\\r\\n]*)?" ; C++ comments (optional)
                "([^/;,*]+)(?<!\\s)(?:(\\s*\\*\\s+|\\s+\\*\\s*)|\\s+)([\\w\\s,\\[\\]]+)\\s*;"
                "\\s*(?://[^\\r\\n]*)?" ; C++ comments (one block)
                )))

(defun handle-struct-body (class body typedef-name &optional
                           pointer-name? second-name? second-pointer-name?)
  "Handles the part between `struct {' and `}' - writes a
corresponding FLI:DEFINE-C-STRUCT definition."
  (let (slots)
    (do-register-groups (type pointerp names)
        (*type-and-names-regex* body)
      (let* ((parsed-names (split "\\s*,\\s*" names))
             (type-and-first-name
              (concatenate 'string type " " pointerp " " (first parsed-names))))
        (destructuring-bind (type l-name c-name) (type-and-name type-and-first-name)
          (declare (ignore c-name))
          (push (list type l-name) slots)
          (loop for name in (rest parsed-names)
                do (push (list type (mangle-name name)) slots)))))
    (when (scan "\\*" typedef-name) ; typedef-name is pointer name
      (setq pointer-name? (regex-replace-all "\\*(\\w+)" typedef-name "\\1"))
      (setq typedef-name (concatenate 'string "t-" pointer-name?)))
    (let ((lisp-name (mangle-name typedef-name)))
      (cond ((string= class "struct")
             (pprint `(fli:define-c-struct ,lisp-name
                        ,@(loop for (slot-type slot-name) in (nreverse slots)
                                collect `(,slot-name ,slot-type)))))
            (t
             (pprint `(fli:define-c-union ,lisp-name
                        ,@(loop for (slot-type slot-name) in (nreverse slots)
                                collect `(,slot-name ,slot-type))))))
      (when pointer-name?
        (pprint `(fli:define-c-typedef ,(mangle-name pointer-name?) (:pointer ,lisp-name))))
      (when second-name?
        (pprint `(fli:define-c-typedef ,(mangle-name second-name?) ,lisp-name)))
      (when second-pointer-name?
        (pprint `(fli:define-c-typedef ,(mangle-name second-pointer-name?)
                   (:pointer ,(mangle-name second-name?)))))
      )))

(defparameter *typedef-struct-regex*
  (create-scanner
   (concatenate 'string
                "(?sm)^\\s*typedef\\s+(struct|union)\\s*([\\w_]+)?\\s*\\{("
                ".*?"
                ")\\}\\s*([\\w\\*_]+)(?:,\\s*\\*([\\w_]+))?"
                "(?:,\\s*([\\w_]+))?(?:,\\s*\\*([\\w_]+))?;")))

(defun handle-struct (file-string)
  (do-register-groups (class struct-name? body typedef-name
                             pointer-name second-name second-pointer-name)
      (*typedef-struct-regex* file-string)
    (declare (ignore struct-name?))
    (handle-struct-body class body typedef-name pointer-name
                        second-name second-pointer-name)))

;; typedef ACCBPROTO1 void (ACCBPROTO2 *HFTServerDestroyProc)(HFTServer hftServer, void *rock);
;; typedef ACCBPROTO1 ASFilePos64 (ACCBPROTO2 *ASProcStmGetLength)(void *clientData);
(defparameter *prototype-regex*
  (create-scanner
   (concatenate 'string
                "(?m)^\\s*typedef\\s+(?:ACCBPROTO1\\s+)?([\\w*]+)\\s*"
                "\\((?:ACCBPROTO2\\s+)?\\*(\\w+)\\s*\\)\\s*\\(([\\w\\s\\*,]+)\\);$")))

(defun handle-prototype (file-string)
  (do-register-groups (return-type proc-name args)
      (*prototype-regex* file-string)
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
  (create-scanner "^#\\s*(el)?if\\s+(!)?([\\w\\s\\|\\(\\)<!=_&]+)(?<!\\s)\\s*$"))

;; This pattern only retrieves the function type, name and arguments (ignoring stubs)
;;
;; NPROC(ASBool, ASUUIDGenFromHash, (ASUUID *dst, ASUns8 hash[16]))
;; NPROC(ASBool,	ASFileHasOutstandingMReads,(ASFile fN))
;; NPROC(void, ASUCS_GetPasswordFromUnicode, (ASUTF16Val* inPassword, void** outPassword, ASBool useUTF))
(defparameter *xproc-regex2*
  (create-scanner
   "(?m)^\\s*\\w*PROC\\s*\\(([\\w\\s\\*]+),\\s+(\\w+),\\s*\\(([\\w\\s\\*,\\[\\]]+)\\)(,\\s*\\w+)?\\s*\\)"))

(defparameter *typedef-opaque-pointers*
  (create-scanner
   (concatenate 'string
                "(?sm)\\s*"
                "typedef\\s+struct\\s+(\\w+)(?<!\\s)\\s*"
                "\\*(\\w+),\\s*"
                "(?:/\\*(?:[^*]|[\\r\\n]|(?:\\*+(?:[^*/]|[\\r\\n])))*\\*+/\\s*)?" ; C comments (optional)
                "\\*(\\w+),\\s*"
                "\\*(\\w+),\\s*"
                "\\*(\\w+);"
                )))

(defun handle-opaque-pointers (file-string)
  (do-register-groups (tag-name type1 type2 type3 type4)
      (*typedef-opaque-pointers* file-string)
    (let ((name (mangle-name tag-name)))
      (pprint `(fli:define-opaque-pointer ,(mangle-name type1) ,name))
      (pprint `(fli:define-opaque-pointer ,(mangle-name type2) ,name))
      (pprint `(fli:define-opaque-pointer ,(mangle-name type3) ,name))
      (pprint `(fli:define-opaque-pointer ,(mangle-name type4) ,name)))))

(defparameter *typedef-enum-regex*
  (create-scanner "(?s)(?:typedef\\s+)?enum(?:\\s+\\w+)?\\s*\\{\\s*(.*?)\\s*,?\\s*\\}(?:\\s*(\\w+))?"))

(defun parse-header-files (header-file-names)
  "Loops through all C header files in *HEADER-FILE-NAMES*,
checks for enums, structs or function prototypes and writes the
corresponding C code to *STANDARD-OUTPUT*."
  (dolist (name header-file-names)
    (let ((header-file (make-pathname :name name :type "h"
                                      :defaults *sdk-extern-location*))
          (file-string (make-array '(0)
                                   :element-type 'simple-char
                                   :fill-pointer 0
                                   :adjustable t))
          (*line-number* 0)
          (*hft-counter* 1))
      (format t "~%;; #include <~A.h>" name)
      (format *error-output* "Processing ~A.h...~%" name)
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
                  ;; (el)if [!]...
                  ((scan *if-regex2* line)
                   (register-groups-bind (elif-p neg-p context) (*if-regex2* line)
                     (when elif-p ; #elif = #endif + #if (not #else + #if !!!)
                       (let ((context (pop contexts)))
                         (ecase context
                           ((:enable :disable)
                            t)
                           (:positive
                            (pop pos-contexts))
                           (:negative
                            (pop neg-contexts)))))
                     ;; the #if part
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
                  ((scan "^#\\s*(el)?if\\s+.*" line) ; the fallback case of #if
                   (register-groups-bind (elif-p)
                       ("^#\\s*(el)?if\\s+.*" line)
                     (when elif-p ; #elif = #else + #if
                       (let ((context (pop contexts)))
                         (ecase context
                           ((:enable :disable)
                            t)
                           (:positive
                            (pop pos-contexts))
                           (:negative
                            (pop neg-contexts)))))
                     ;; :enable by default for dont-care #if
                     (push :enable contexts)))
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
                        *line-number* contexts pos-contexts neg-contexts)
                )))
      ;; enum + typedef
      (do-register-groups (enum-body type-name)
          (*typedef-enum-regex* file-string)
        (handle-enum enum-body type-name))
      ;; special: opaque pointers
      (handle-opaque-pointers file-string)
      ;; prototypes
      (handle-prototype file-string)
      ;; typedef struct (or union) ...
      (handle-struct file-string)
      ;; define-acrobat-function
      (with-input-from-string (in file-string)
        (loop for line = (read-line in nil nil)
              while line do
          (handle-define-2 line)))
      ;; xPROC(...)
      (do-register-groups (nil name nil) (*xproc-regex2* file-string)
        (let ((full-name (concatenate 'string name "-SEL")))
          (pprint `(eval-when (:compile-toplevel :load-toplevel :execute)
                     (defconstant ,(mangle-name full-name :constant t) ,*hft-counter*))))
        (incf *hft-counter*))
      ;; xPROC(...)
      (setq *hft-counter* 1)
      (do-register-groups (type name args) (*xproc-regex2* file-string)
        (format t "~%;; sel = ~A" *hft-counter*)
        (handle-function type name args)
        (incf *hft-counter*))
      (terpri))))

(defun prepare (&optional (group 0))
  "Creates the missing file `fli.lisp' for PDF-PLUGIN-TOOLS from
the C header files of Acrobat Pro."
  ;; find out where to look for headers
  (unless *sdk-extern-location* (set-sdk-extern-location))
  (when (<= group 0)
    (setq *typedefs* (copy-list *typedefs-init*))
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
          (parse-header-files *header-file-names*)))))
  ;; another group
  (when (<= group 1)
    (with-open-file (*standard-output* *fli-file-1*
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
          (parse-header-files *header-file-names-1*)))))
  ;; another group
  (when (<= group 2)
    (with-open-file (*standard-output* *fli-file-2*
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
          (parse-header-files *header-file-names-2*)))))
  ;; another group
  (when (<= group 3)
    (with-open-file (*standard-output* *fli-file-3*
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
          (parse-header-files *header-file-names-3*)))))
  ;; another group
  (when (<= group 4)
    (with-open-file (*standard-output* *fli-file-4*
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
          (parse-header-files *header-file-names-4*)))))
  :done)
