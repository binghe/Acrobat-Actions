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

(defun parse-header-files ()
  "Loops through all C header files in *HEADER-FILE-NAMES*,
checks for enums, structs or function prototypes and writes the
corresponding C code to *STANDARD-OUTPUT*."
  (dolist (name *header-file-names*)
    (let ((header-file (make-pathname :name name :type "h"
                                      :defaults *sdk-extern-location*))
          (file-string (make-array '(0) :element-type 'simple-char
                                   :fill-pointer 0 :adjustable t)))
      (format t ";; #include <~A.h>~%" name)
      (format t "#|~%")
      (setq *function-counter* 1)
      (with-output-to-string (out file-string)
        (with-open-file (in header-file)
          ;; NOTE: there are several #if contexts to detect: #if DEBUG, or ACROBAT_LIBRARY.
          ;; when we met such a #if, we push it into POS-CONTEXTS as "DEBUG" or "ACROBAT_LIBRARY",
          ;; which means that the following lines must be ignored. And when we are in such a
          ;; context and meet "#else", the special-context is over and the next lines are
          ;; needed.  When meeting "#endif", we do nothing since contexts do not nest so far.
          ;; This should be enough for now.
          (loop with contexts = '(nil)     ; the polarity of the current #if (T or NIL)
                with pos-contexts = '(nil) ; the current if context when polarity is T
                with neg-contexts = '(nil) ; the current if context when polarity is NIL
                for line = (read-line in nil nil)
                while line do ; this fails only when input file ends
            (cond ((scan "#if\\s+(.*)" line)
                   (register-groups-bind (neg-p context) ("#if\\s+(!)?(.*)" line)
                     (cond (neg-p
                            (push context neg-contexts)
                            (push nil contexts))
                           (t
                            (push context pos-contexts)
                            (push t contexts)))))
                  ((scan "#else" line)
                   (cond ((pop contexts)
                          (push (pop pos-contexts) neg-contexts)
                          (push nil contexts))
                         (t
                          (push (pop neg-contexts) pos-contexts)
                          (push t contexts))))
                  ((scan "#endif" line)
                   (cond ((pop contexts)
                          (pop pos-contexts))
                         (t
                          (pop neg-contexts))))
                  ;; Here the tests must be exhaustive: for each contexts only one line is
                  ;; preserved.
                  ((or (member "DEBUG"           pos-contexts :test 'equal)
                       (member "ACROBAT_LIBRARY" pos-contexts :test 'equal))
                   nil) ; skip this line
                  (t
                   (format out "~A~%" line)))))) ; collect this line
      ;; now the file-string can be safely parsed in multiple lines
      (do-register-groups (body)
          ("(?m)^(\\w*PROC\\([\\w\\s\\*,]+\\([\\w\\s\\*,]+\\)(,\\s*\\w+)?\\))" file-string)
        (format t "~A: ~A~%" *function-counter* body)
        (incf *function-counter*))
      (format t "|#~%")
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
        (terpri) (terpri)
        ;; let this function do all the work
        (parse-header-files))))
  :done)
