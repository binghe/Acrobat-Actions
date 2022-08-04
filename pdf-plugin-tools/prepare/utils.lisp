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

(defun make-fli-type (string)
  "Converts a string like \"unsigned short\" into a corresponding
list of keywords like (:UNSIGNED :SHORT).  Returns a symbol
instead of a list if the string contained only one word."
  (let ((keyword-list
         (loop for part in (split "\\s+" string)
               collect (make-fli-type1 part))))
    (if (cdr keyword-list) keyword-list (car keyword-list))))

(defun mangle-name (string &optional constantp)
  "Converts the string STRING representing a C name to a suitable Lisp
symbol in the PDF-PLUGIN-TOOLS package.  Underline characters at the
beginning of a string are removed; other underline characters are
converted to hyphens; when there's a change from lowercase to
uppercase, a hyphen is inserted.  Finally, all characters are
converted to uppercase.

If CONSTANTP is true, a plus sign is added to the beginning and end of
the Lisp symbol to denote a Lisp constant."
  (setq string (regex-replace-all "([A-Za-z])(UTF|UUID|PDF|MAX|MIN)([A-Za-z])" string "\\1-\\2-\\3")
        ;; string (regex-replace-all "IntPtr" string "Intptr")
        string (regex-replace-all "([A-Za-z])([A-Z][a-z])" string "\\1-\\2")
        string (regex-replace-all "([A-Za-z])([A-Z][a-z])" string "\\1-\\2")
        string (regex-replace-all "([a-z])([A-Z])" string "\\1-\\2")
        string (regex-replace-all "_t$" string "")
        string (regex-replace-all "_" string "-"))
  (intern (format nil "~:[~;+~]~A~2:*~:[~;+~]"
                  constantp (string-upcase string))
          :pdf-plugin-tools))
