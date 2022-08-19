;;; -*- Mode: LISP; Syntax: COMMON-LISP; Package: PREPARE-FM-PLUGIN-TOOLS; Base: 10 -*-

;;; Copyright (c) 2022, Chun Tian.  All rights reserved.

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

(defun set-sdk-extern-location ()
  "If *SDK-EXTERN-LOCATION* is not set, ask the user to provide a value."
  (setq *sdk-extern-location*
        (or (capi:prompt-for-directory
              "Please select the directory \"API\" (under \"PluginSupport/Headers\"):"
              :ok-check (lambda (pathspec)
                          (and (string= (file-namestring pathspec) "API"))))
            (error "I can't continue if you don't select the directory \"API\"."))))

(defun make-fli-type1 (string)
  (if-let (map (assoc string *fli-types* :test 'equal))
      (or (second map)
          (intern (string-upcase string) :keyword))
    (mangle-name string)))

(defparameter *fli-type-regex*
  (create-scanner "^\\s*([^*]*)(?<!\\s)(?:(\\s*\\*|\\s+\\*)|)\\s*$"))

(defun make-fli-type (string)
  "Converts a string like \"unsigned short\" into a corresponding
list of keywords like (:UNSIGNED :SHORT).  Returns a symbol
instead of a list if the string contained only one word."
  (register-groups-bind (types pointerp) (*fli-type-regex* string)
    (setq types (regex-replace-all "([^\\w])(const|IN|OUT)([^\\w])" types "\\1 \\3")
          types (regex-replace-all "^(const|IN|OUT)([^\\w])" types "\\2")
          types (regex-replace-all "[^\\w](const|IN|OUT)$" types "\\1")
          types (regex-replace-all "^(\\s+)" types "")
          types (regex-replace-all "(\\s+)$" types ""))
    (let* ((keyword-list
            (loop for part in (split "\\s+" types)
                  collect (make-fli-type1 part)))
           (result-type
            (if (cdr keyword-list) keyword-list (car keyword-list)))
           (pointer-type
            (if pointerp `(:pointer ,result-type) result-type)))
      (cond ((equal pointer-type '(:pointer :byte)) ; char*
             '(:reference-pass :ef-mb-string))
            (t
             pointer-type)))))

(defun find-type (type &optional default)
  "Tries to find TYPE in the *TYPEDEFS* alist.  Returns DEFAULT
if nothing was found, or TYPE itself if DEFAULT is NIL."
  (or (cdr (assoc type *typedefs*)) default type))

(defparameter *mangle-name-regex1*
  (create-scanner "^(AST|PDS|PDE|PDF)([A-Z].*)$"))

(defun mangle-name1 (string)
  (cond ((scan *mangle-name-regex1* string)
         (register-groups-bind (head rest) (*mangle-name-regex1* string)
           (concatenate 'string head "-" (mangle-name1 rest))))
        (t
         (setq string (regex-replace-all "^(AC|AS|AV|CF|PD|PI)([A-Za-z])" string "\\1-\\2")
               string (regex-replace-all "([A-Za-z])(UTF|UUID|PDF|MAX|MIN|EOF|HFT|SDK)"
                                         string "\\1-\\2")
               string (regex-replace-all "(UTF|UUID|PDF|MAX|MIN|EOF|HFT|SDK)([A-Za-z])"
                                         string "\\1-\\2")
               string (regex-replace-all "([A-Za-z])(SEL)"
                                         string "\\1-\\2")
               string (regex-replace-all "([a-z])([A-Z])" string "\\1-\\2")
               string (regex-replace-all "-(AS|PI|AC)([A-Za-z])" string "-\\1-\\2")
               string (regex-replace-all "_" string "-")))))

(defun mangle-name (string &key constant global)
  "Converts the string STRING representing a C name to a suitable Lisp
symbol in the PDF-PLUGIN-TOOLS package.  Underline characters at the
beginning of a string are removed; other underline characters are
converted to hyphens; when there's a change from lowercase to
uppercase, a hyphen is inserted.  Finally, all characters are
converted to uppercase.

If CONSTANT is true, a plus sign is added to the beginning and end of
the Lisp symbol to denote a Lisp constant."
  (let ((new-string (mangle-name1 string)))
    (cond (constant
           (intern (concatenate 'string "+" (string-upcase new-string) "+")
                   :pdf-plugin-tools))
          (global
           (intern (concatenate 'string "*" (string-upcase new-string) "*")
                   :pdf-plugin-tools))
          (t
           (intern (string-upcase new-string) :pdf-plugin-tools)))))

;; void **cancelProcClientDataP
;; const char * const *addExt
;; CosObj funcDict, const float inVals[], float outVals[]
;; ASFixed  dashArray[PDAnnotMaxDashes]
;; void** outPassword
;; ASMDFile* f
(defparameter *type-and-name-regex*
  (create-scanner
   (concatenate 'string
                "^\\s*([^*]+)(?<!\\s)"
                "(?:(\\s*\\*(?:\\s*\\*)?\\s+|\\s+\\*(?:(?:\\s*const)?\\s*\\*)?\\s*)|\\s+)"
                "(\\w+)(\\[(\\w+)?\\])?\\s*$")))

(defun type-and-name (string &optional argp)
  "Divides pairs like \"int foo\" or \"void *bar\" \(note the
asterisk) into two values - the type and the \(Lisp-mangled)
name.  Returns as the third value the name as a string.  If ARGP
is true, the result is supposed to be used as a function
argument."
  (declare (ignore argp))
  (register-groups-bind (type pointerp name arrayp size-string)
      (*type-and-name-regex* string)
    (setq type (make-fli-type type))
    (let ((final-type
           (cond ((and pointerp (eq type :byte))
                  (cond ((scan "\\*[^*]*\\*" pointerp)
                         `(:pointer (:pointer :char)))
                        (t
                         '(:reference-pass :ef-mb-string))))
                 (pointerp
                  (cond ((scan "\\*\\*" pointerp)
                         `(:pointer (:pointer ,type)))
                        (t
                         `(:pointer ,type))))
                 (arrayp
                  (cond (size-string
                         (let ((size (parse-integer size-string :junk-allowed t)))
                           (cond (size ; literal number
                                  `(:c-array ,type ,size))
                                 (t    ; size is given by a constant defined by #define
                                  `(:c-array ,type
                                    ,(mangle-name size-string :constant t))))))
                        (t    `(:pointer ,type))))
                 (t
                  type))))
      ;; convert :struct types to their opaque pointer types
      (when-let (new-type (cdr (assoc final-type *typedefs* :test 'equal)))
        (setq final-type new-type))
      (list final-type (mangle-name name) name))))
