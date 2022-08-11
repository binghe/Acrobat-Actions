;;; This file was generated automatically from Acrobat Pro's SDK headers.

(in-package :pdf-plugin-tools) 

;; #include <ASExtraExpT.h>
;; line 39
(define-c-typedef as-uni-char as-utf16val)
;; line 41
(define-c-typedef as-country-code as-uns16)
;; line 43
(define-c-typedef as-language-code as-uns16)
;; line 91
(define-c-typedef as-text-filter-type as-enum16)
;; line 151
(define-c-typedef as-cab-value-type as-enum16)
;; line 298
(define-c-typedef as-cab-munge-action as-enum16)
;; line 362
(define-c-typedef as-report-type as-enum16)
(defconstant +k-as-text-filter-identity+ 0)
(defconstant +k-as-text-filter-line-endings+ 1)
(defconstant +k-as-text-filter-upper-case+ 2)
(defconstant +k-as-text-filter-lower-case+ 3)
(defconstant +k-as-text-filter-xxxdebug+ 4)
(defconstant +k-as-text-filter-upper-case-debug+ 5)
(defconstant +k-as-text-filter-lower-case-debug+ 6)
(defconstant +k-as-text-filter-remove-ampersands+ 7)
(defconstant +k-as-text-filter-normalize-full-width-as-ciivariants+ 8)
(defconstant +k-as-text-remove-line-endings+ 9)
(defconstant +k-as-text-filter-rsvd1+ 1000)
(defconstant +k-as-text-filter-unknown+ -1)
(defconstant +k-as-value-bool+ 0)
(defconstant +k-as-value-integer+ 1)
(defconstant +k-as-value-atom+ 2)
(defconstant +k-as-value-double+ 3)
(defconstant +k-as-value-string+ 4)
(defconstant +k-as-value-text+ 5)
(defconstant +k-as-value-binary+ 6)
(defconstant +k-as-value-pointer+ 7)
(defconstant +k-as-value-cabinet+ 8)
(defconstant +k-as-value-null+ 9)
(defconstant +k-as-value-uns+ 10)
(defconstant +k-as-value-int64+ 11)
(defconstant +k-as-value-uns64+ 12)
(defconstant +k-as-value-unknown+ -1)
(defconstant +k-as-munge-remove+ 0)
(defconstant +k-as-munge-remove-unknown+ 1)
(defconstant +k-as-munge-remove-defaults+ 2)
(defconstant +k-as-munge-remove-bad-values+ 3)
(defconstant +k-as-munge-copy+ 4)
(defconstant +k-as-munge-replace+ 5)
(defconstant +k-as-munge-copy-missing+ 6)
(defconstant +k-as-munge-remove-nulls+ 7)
(defconstant +k-as-report-note+ 0)
(defconstant +k-as-report-warning+ 1)
(defconstant +k-as-report-error+ 2)
(define-c-typedef as-cab-enum-proc
                  (:pointer
                   (:function
                    (as-cab
                     (:reference-pass :ef-mb-string)
                     as-cab-value-type
                     (:pointer :void))
                    as-bool
                    :calling-convention
                    :cdecl)))
(define-c-typedef as-const-cab-enum-proc
                  (:pointer
                   (:function
                    (as-const-cab
                     (:reference-pass :ef-mb-string)
                     as-cab-value-type
                     (:pointer :void))
                    as-bool
                    :calling-convention
                    :cdecl)))
(define-c-typedef as-cab-pointer-destroy-proc
                  (:pointer
                   (:function
                    ((:pointer :void))
                    :void
                    :calling-convention
                    :cdecl)))
(define-c-typedef as-report-proc
                  (:pointer
                   (:function
                    (as-report-type
                     as-int32
                     as-text
                     as-text
                     as-cab
                     (:pointer :void))
                    :void
                    :calling-convention
                    :cdecl)))
(define-c-typedef as-text-eval-proc
                  (:pointer
                   (:function
                    (as-cab)
                    as-text
                    :calling-convention
                    :cdecl)))
(define-c-struct as-cab-entry-rec
                 (key-name (:reference-pass :ef-mb-string))
                 (type as-cab-value-type)
                 (int-val as-int32)
                 (ptr-val (:pointer :void))
                 (double-val :double))
(define-c-struct as-status-monitor-procs-rec
                 (size as-size-t)
                 (prog-mon as-progress-monitor)
                 (prog-mon-client-data (:pointer :void))
                 (cancel-proc as-cancel-proc)
                 (cancel-proc-client-data (:pointer :void))
                 (report-proc as-report-proc)
                 (report-proc-client-data (:pointer :void)))
(define-c-typedef as-status-monitor-procs
                  (:pointer as-status-monitor-procs-rec))

;; #include <ASExtraProcs.h>
(defconstant +as-script-to-host-encoding-sel+ 1)
(defconstant +as-script-from-host-encoding-sel+ 2)
(defconstant +as-text-new-sel+ 3)
(defconstant +as-text-from-unicode-sel+ 4)
(defconstant +as-text-from-sized-unicode-sel+ 5)
(defconstant +as-text-from-encoded-sel+ 6)
(defconstant +as-text-from-sized-encoded-sel+ 7)
(defconstant +as-text-from-script-text-sel+ 8)
(defconstant +as-text-from-sized-script-text-sel+ 9)
(defconstant +as-text-from-pdtext-sel+ 10)
(defconstant +as-text-from-sized-pdtext-sel+ 11)
(defconstant +as-text-destroy-sel+ 12)
(defconstant +as-text-set-unicode-sel+ 13)
(defconstant +as-text-set-sized-unicode-sel+ 14)
(defconstant +as-text-set-encoded-sel+ 15)
(defconstant +as-text-set-sized-encoded-sel+ 16)
(defconstant +as-text-set-script-text-sel+ 17)
(defconstant +as-text-set-sized-script-text-sel+ 18)
(defconstant +as-text-set-pdtext-sel+ 19)
(defconstant +as-text-set-sized-pdtext-sel+ 20)
(defconstant +as-text-get-unicode-sel+ 21)
(defconstant +as-text-get-unicode-copy-sel+ 22)
(defconstant +as-text-get-encoded-sel+ 23)
(defconstant +as-text-get-encoded-copy-sel+ 24)
(defconstant +as-text-get-script-text-sel+ 25)
(defconstant +as-text-get-script-text-copy-sel+ 26)
(defconstant +as-text-get-pdtext-copy-sel+ 27)
(defconstant +as-text-get-best-encoding-sel+ 28)
(defconstant +as-text-get-best-script-sel+ 29)
(defconstant +as-text-get-country-sel+ 30)
(defconstant +as-text-set-country-sel+ 31)
(defconstant +as-text-get-language-sel+ 32)
(defconstant +as-text-set-language-sel+ 33)
(defconstant +as-text-cat-sel+ 34)
(defconstant +as-text-copy-sel+ 35)
(defconstant +as-text-dup-sel+ 36)
(defconstant +as-text-cmp-sel+ 37)
(defconstant +as-text-replace-sel+ 38)
(defconstant +as-text-replace-as-cii-sel+ 39)
(defconstant +as-cab-new-sel+ 40)
(defconstant +as-cab-from-entry-list-sel+ 41)
(defconstant +as-cab-destroy-sel+ 42)
(defconstant +as-cab-num-entries-sel+ 43)
(defconstant +as-cab-known-sel+ 44)
(defconstant +as-cab-get-type-sel+ 45)
(defconstant +as-cab-enum-sel+ 46)
(defconstant +as-cab-remove-sel+ 47)
(defconstant +as-cab-get-bool-sel+ 48)
(defconstant +as-cab-put-bool-sel+ 49)
(defconstant +as-cab-get-int-sel+ 50)
(defconstant +as-cab-put-int-sel+ 51)
(defconstant +as-cab-get-atom-sel+ 52)
(defconstant +as-cab-put-atom-sel+ 53)
(defconstant +as-cab-get-double-sel+ 54)
(defconstant +as-cab-put-double-sel+ 55)
(defconstant +as-cab-get-pointer-raw-sel+ 56)
(defconstant +as-cab-detach-pointer-raw-sel+ 57)
(defconstant +as-cab-put-pointer-raw-sel+ 58)
(defconstant +as-cab-get-pointer-destroy-proc-sel+ 59)
(defconstant +as-cab-get-pointer-type-sel+ 60)
(defconstant +as-cab-put-cab-sel+ 61)
(defconstant +as-cab-get-cab-sel+ 62)
(defconstant +as-cab-detach-cab-sel+ 63)
(defconstant +as-cab-get-string-sel+ 64)
(defconstant +as-cab-get-string-copy-sel+ 65)
(defconstant +as-cab-detach-string-sel+ 66)
(defconstant +as-cab-put-string-sel+ 67)
(defconstant +as-cab-get-text-sel+ 68)
(defconstant +as-cab-detach-text-sel+ 69)
(defconstant +as-cab-put-text-sel+ 70)
(defconstant +as-cab-get-binary-sel+ 71)
(defconstant +as-cab-get-binary-copy-sel+ 72)
(defconstant +as-cab-detach-binary-sel+ 73)
(defconstant +as-cab-put-binary-sel+ 74)
(defconstant +as-cab-put-null-sel+ 75)
(defconstant +as-cab-make-empty-sel+ 76)
(defconstant +as-cab-destroy-empties-sel+ 77)
(defconstant +as-cab-copy-sel+ 78)
(defconstant +as-cab-dup-sel+ 79)
(defconstant +as-cab-value-equal-sel+ 80)
(defconstant +as-cab-equal-sel+ 81)
(defconstant +as-cab-munge-sel+ 82)
(defconstant +as-cab-put-path-name-sel+ 83)
(defconstant +as-cab-get-path-name-copy-sel+ 84)
(defconstant +as-cab-detach-path-name-sel+ 85)
(defconstant +as-cab-write-to-stream-sel+ 86)
(defconstant +as-cab-read-from-stream-sel+ 87)
(defconstant +as-cab-rename-sel+ 88)
(defconstant +as-text-is-empty-sel+ 89)
(defconstant +as-text-normalize-end-of-line-sel+ 90)
(defconstant +as-text-from-int32-sel+ 91)
(defconstant +as-text-from-uns32-sel+ 92)
(defconstant +as-text-make-empty-sel+ 93)
(defconstant +as-text-replace-bad-chars-sel+ 94)
(defconstant +as-cab-get-uns-sel+ 95)
(defconstant +as-cab-put-uns-sel+ 96)
(defconstant +as-date-new-sel+ 97)
(defconstant +as-date-dup-sel+ 98)
(defconstant +as-date-clear-sel+ 99)
(defconstant +as-date-copy-sel+ 100)
(defconstant +as-date-destroy-sel+ 101)
(defconstant +as-time-span-new-sel+ 102)
(defconstant +as-time-span-dup-sel+ 103)
(defconstant +as-time-span-copy-sel+ 104)
(defconstant +as-time-span-destroy-sel+ 105)
(defconstant +as-date-set-to-current-utctime-sel+ 106)
(defconstant +as-date-set-to-current-local-time-sel+ 107)
(defconstant +as-date-set-local-time-offset-sel+ 108)
(defconstant +as-date-set-time-from-string-sel+ 109)
(defconstant +as-date-set-time-from-rec-sel+ 110)
(defconstant +as-date-subtract-calendar-time-span-sel+ 111)
(defconstant +as-date-add-calendar-time-span-sel+ 112)
(defconstant +as-date-subtract-time-span-sel+ 113)
(defconstant +as-date-add-time-span-sel+ 114)
(defconstant +as-date-calendar-diff-sel+ 115)
(defconstant +as-date-exact-diff-sel+ 116)
(defconstant +as-date-get-time-string-sel+ 117)
(defconstant +as-date-get-utctime-sel+ 118)
(defconstant +as-date-get-local-time-sel+ 119)
(defconstant +as-calendar-time-span-compare-sel+ 120)
(defconstant +as-time-span-compare-sel+ 121)
(defconstant +as-calendar-time-span-add-with-base-sel+ 122)
(defconstant +as-time-span-add-sel+ 123)
(defconstant +as-calendar-time-span-diff-sel+ 124)
(defconstant +as-time-span-diff-sel+ 125)
(defconstant +as-date-compare-sel+ 126)
(defconstant +as-time-span-set-from-as-int32-sel+ 127)
(defconstant +as-time-span-set-from-string-sel+ 128)
(defconstant +as-time-span-set-sel+ 129)
(defconstant +as-text-eval-sel+ 130)
(defconstant +as-file-sys-get-item-props-as-cab-sel+ 131)
(defconstant +as-file-sys-convert-cab-to-item-props-sel+ 132)
(defconstant +as-file-sys-convert-item-props-to-cab-sel+ 133)
(defconstant +as-file-sys-can-perform-op-on-item-sel+ 134)
(defconstant +as-file-sys-perform-op-on-item-sel+ 135)
(defconstant +as-is-valid-utf8-sel+ 136)
(defconstant +as-text-case-sensitive-cmp-sel+ 137)
(defconstant +as-const-cab-enum-sel+ 138)
(defconstant +as-text-filter-sel+ 139)
(defconstant +as-time-span-get-as-int32-sel+ 140)
(defconstant +as-cab-get-int64-sel+ 141)
(defconstant +as-cab-put-int64-sel+ 142)
(defconstant +as-cab-get-uns64-sel+ 143)
(defconstant +as-cab-put-uns64-sel+ 144)
(defconstant +as-text-make-empty-clear-sel+ 145)
;; sel = 1
(define-foreign-funcallable as-script-to-host-encoding-selproto
                            ((as-script as-script))
                            :result-type
                            as-host-encoding
                            :calling-convention
                            :cdecl)
;; sel = 2
(define-foreign-funcallable as-script-from-host-encoding-selproto
                            ((os-script as-host-encoding))
                            :result-type
                            as-script
                            :calling-convention
                            :cdecl)
;; sel = 3
(define-foreign-funcallable as-text-new-selproto
                            nil
                            :result-type
                            as-text
                            :calling-convention
                            :cdecl)
;; sel = 4
(define-foreign-funcallable as-text-from-unicode-selproto
                            ((ucs (:pointer as-utf16val))
                             (format as-unicode-format))
                            :result-type
                            as-text
                            :calling-convention
                            :cdecl)
;; sel = 5
(define-foreign-funcallable as-text-from-sized-unicode-selproto
                            ((ucs (:pointer as-utf16val))
                             (format as-unicode-format)
                             (len ast-array-size))
                            :result-type
                            as-text
                            :calling-convention
                            :cdecl)
;; sel = 6
(define-foreign-funcallable as-text-from-encoded-selproto
                            ((str (:reference-pass :ef-mb-string))
                             (encoding as-host-encoding))
                            :result-type
                            as-text
                            :calling-convention
                            :cdecl)
;; sel = 7
(define-foreign-funcallable as-text-from-sized-encoded-selproto
                            ((str (:reference-pass :ef-mb-string))
                             (len ast-array-size)
                             (encoding as-host-encoding))
                            :result-type
                            as-text
                            :calling-convention
                            :cdecl)
;; sel = 8
(define-foreign-funcallable as-text-from-script-text-selproto
                            ((str (:reference-pass :ef-mb-string))
                             (script as-script))
                            :result-type
                            as-text
                            :calling-convention
                            :cdecl)
;; sel = 9
(define-foreign-funcallable as-text-from-sized-script-text-selproto
                            ((str (:reference-pass :ef-mb-string))
                             (len ast-array-size)
                             (script as-script))
                            :result-type
                            as-text
                            :calling-convention
                            :cdecl)
;; sel = 10
(define-foreign-funcallable as-text-from-pdtext-selproto
                            ((str (:reference-pass :ef-mb-string)))
                            :result-type
                            as-text
                            :calling-convention
                            :cdecl)
;; sel = 11
(define-foreign-funcallable as-text-from-sized-pdtext-selproto
                            ((str (:reference-pass :ef-mb-string))
                             (length ast-array-size))
                            :result-type
                            as-text
                            :calling-convention
                            :cdecl)
;; sel = 12
(define-foreign-funcallable as-text-destroy-selproto
                            ((str as-text))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 13
(define-foreign-funcallable as-text-set-unicode-selproto
                            ((str as-text)
                             (ucs-value (:pointer as-utf16val))
                             (format as-unicode-format))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 14
(define-foreign-funcallable as-text-set-sized-unicode-selproto
                            ((str as-text)
                             (ucs-value (:pointer as-utf16val))
                             (format as-unicode-format)
                             (len ast-array-size))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 15
(define-foreign-funcallable as-text-set-encoded-selproto
                            ((str as-text)
                             (text (:reference-pass :ef-mb-string))
                             (encoding as-host-encoding))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 16
(define-foreign-funcallable as-text-set-sized-encoded-selproto
                            ((str as-text)
                             (text (:reference-pass :ef-mb-string))
                             (len ast-array-size)
                             (encoding as-host-encoding))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 17
(define-foreign-funcallable as-text-set-script-text-selproto
                            ((str as-text)
                             (text (:reference-pass :ef-mb-string))
                             (script as-script))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 18
(define-foreign-funcallable as-text-set-sized-script-text-selproto
                            ((str as-text)
                             (text (:reference-pass :ef-mb-string))
                             (len ast-array-size)
                             (script as-script))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 19
(define-foreign-funcallable as-text-set-pdtext-selproto
                            ((str as-text)
                             (text (:reference-pass :ef-mb-string)))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 20
(define-foreign-funcallable as-text-set-sized-pdtext-selproto
                            ((str as-text)
                             (text (:reference-pass :ef-mb-string))
                             (length ast-array-size))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 21
(define-foreign-funcallable as-text-get-unicode-selproto
                            ((str as-const-text))
                            :result-type
                            (:pointer as-utf16val)
                            :calling-convention
                            :cdecl)
;; sel = 22
(define-foreign-funcallable as-text-get-unicode-copy-selproto
                            ((str as-const-text)
                             (format as-unicode-format))
                            :result-type
                            (:pointer as-utf16val)
                            :calling-convention
                            :cdecl)
;; sel = 23
(define-foreign-funcallable as-text-get-encoded-selproto
                            ((str as-const-text)
                             (encoding as-host-encoding))
                            :result-type
                            (:reference-pass :ef-mb-string)
                            :calling-convention
                            :cdecl)
;; sel = 24
(define-foreign-funcallable as-text-get-encoded-copy-selproto
                            ((str as-const-text)
                             (encoding as-host-encoding))
                            :result-type
                            (:reference-pass :ef-mb-string)
                            :calling-convention
                            :cdecl)
;; sel = 25
(define-foreign-funcallable as-text-get-script-text-selproto
                            ((str as-const-text) (script as-script))
                            :result-type
                            (:reference-pass :ef-mb-string)
                            :calling-convention
                            :cdecl)
;; sel = 26
(define-foreign-funcallable as-text-get-script-text-copy-selproto
                            ((str as-const-text) (script as-script))
                            :result-type
                            (:reference-pass :ef-mb-string)
                            :calling-convention
                            :cdecl)
;; sel = 27
(define-foreign-funcallable as-text-get-pdtext-copy-selproto
                            ((str as-const-text)
                             (len (:pointer ast-array-size)))
                            :result-type
                            (:reference-pass :ef-mb-string)
                            :calling-convention
                            :cdecl)
;; sel = 28
(define-foreign-funcallable as-text-get-best-encoding-selproto
                            ((str as-const-text)
                             (preferred-encoding as-host-encoding))
                            :result-type
                            as-host-encoding
                            :calling-convention
                            :cdecl)
;; sel = 29
(define-foreign-funcallable as-text-get-best-script-selproto
                            ((str as-const-text)
                             (preferred-script as-script))
                            :result-type
                            as-script
                            :calling-convention
                            :cdecl)
;; sel = 30
(define-foreign-funcallable as-text-get-country-selproto
                            ((text as-const-text))
                            :result-type
                            as-country-code
                            :calling-convention
                            :cdecl)
;; sel = 31
(define-foreign-funcallable as-text-set-country-selproto
                            ((text as-text) (country as-country-code))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 32
(define-foreign-funcallable as-text-get-language-selproto
                            ((text as-const-text))
                            :result-type
                            as-language-code
                            :calling-convention
                            :cdecl)
;; sel = 33
(define-foreign-funcallable as-text-set-language-selproto
                            ((text as-text)
                             (language as-language-code))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 34
(define-foreign-funcallable as-text-cat-selproto
                            ((to as-text) (from as-const-text))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 35
(define-foreign-funcallable as-text-copy-selproto
                            ((to as-text) (from as-const-text))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 36
(define-foreign-funcallable as-text-dup-selproto
                            ((str as-const-text))
                            :result-type
                            as-text
                            :calling-convention
                            :cdecl)
;; sel = 37
(define-foreign-funcallable as-text-cmp-selproto
                            ((str1 as-const-text) (str2 as-const-text))
                            :result-type
                            as-int32
                            :calling-convention
                            :cdecl)
;; sel = 38
(define-foreign-funcallable as-text-replace-selproto
                            ((src as-text)
                             (to-replace as-const-text)
                             (replacement as-const-text))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 39
(define-foreign-funcallable as-text-replace-as-cii-selproto
                            ((src as-text)
                             (to-replace
                              (:reference-pass :ef-mb-string))
                             (replacement as-const-text))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 40
(define-foreign-funcallable as-cab-new-selproto
                            nil
                            :result-type
                            as-cab
                            :calling-convention
                            :cdecl)
;; sel = 41
(define-foreign-funcallable as-cab-from-entry-list-selproto
                            ((entry-list (:pointer as-cab-entry-rec)))
                            :result-type
                            as-cab
                            :calling-convention
                            :cdecl)
;; sel = 42
(define-foreign-funcallable as-cab-destroy-selproto
                            ((the-cab as-cab))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 43
(define-foreign-funcallable as-cab-num-entries-selproto
                            ((the-cab as-const-cab))
                            :result-type
                            ast-array-size
                            :calling-convention
                            :cdecl)
;; sel = 44
(define-foreign-funcallable as-cab-known-selproto
                            ((the-cab as-const-cab)
                             (the-key (:reference-pass :ef-mb-string)))
                            :result-type
                            as-bool
                            :calling-convention
                            :cdecl)
;; sel = 45
(define-foreign-funcallable as-cab-get-type-selproto
                            ((the-cab as-const-cab)
                             (the-key (:reference-pass :ef-mb-string)))
                            :result-type
                            as-cab-value-type
                            :calling-convention
                            :cdecl)
;; sel = 46
(define-foreign-funcallable as-cab-enum-selproto
                            ((the-cab as-cab)
                             (enum-proc as-cab-enum-proc)
                             (client-data (:pointer :void)))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 47
(define-foreign-funcallable as-cab-remove-selproto
                            ((the-cab as-cab)
                             (the-key (:reference-pass :ef-mb-string)))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 48
(define-foreign-funcallable as-cab-get-bool-selproto
                            ((the-cab as-const-cab)
                             (the-key (:reference-pass :ef-mb-string))
                             (def-value as-bool))
                            :result-type
                            as-bool
                            :calling-convention
                            :cdecl)
;; sel = 49
(define-foreign-funcallable as-cab-put-bool-selproto
                            ((the-cab as-cab)
                             (the-key (:reference-pass :ef-mb-string))
                             (the-bool as-bool))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 50
(define-foreign-funcallable as-cab-get-int-selproto
                            ((the-cab as-const-cab)
                             (the-key (:reference-pass :ef-mb-string))
                             (def-value as-int32))
                            :result-type
                            as-int32
                            :calling-convention
                            :cdecl)
;; sel = 51
(define-foreign-funcallable as-cab-put-int-selproto
                            ((the-cab as-cab)
                             (the-key (:reference-pass :ef-mb-string))
                             (the-int as-int32))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 52
(define-foreign-funcallable as-cab-get-atom-selproto
                            ((the-cab as-const-cab)
                             (the-key (:reference-pass :ef-mb-string))
                             (def-value as-atom))
                            :result-type
                            as-atom
                            :calling-convention
                            :cdecl)
;; sel = 53
(define-foreign-funcallable as-cab-put-atom-selproto
                            ((the-cab as-cab)
                             (the-key (:reference-pass :ef-mb-string))
                             (atom-value as-atom))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 54
(define-foreign-funcallable as-cab-get-double-selproto
                            ((the-cab as-const-cab)
                             (the-key (:reference-pass :ef-mb-string))
                             (def-value :double))
                            :result-type
                            :double
                            :calling-convention
                            :cdecl)
;; sel = 55
(define-foreign-funcallable as-cab-put-double-selproto
                            ((the-cab as-cab)
                             (the-key (:reference-pass :ef-mb-string))
                             (float-value :double))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 56
(define-foreign-funcallable as-cab-get-pointer-raw-selproto
                            ((the-cab as-const-cab)
                             (the-key (:reference-pass :ef-mb-string))
                             (expected-type
                              (:reference-pass :ef-mb-string)))
                            :result-type
                            (:pointer :void)
                            :calling-convention
                            :cdecl)
;; sel = 57
(define-foreign-funcallable as-cab-detach-pointer-raw-selproto
                            ((the-cab as-cab)
                             (the-key (:reference-pass :ef-mb-string))
                             (expected-type
                              (:reference-pass :ef-mb-string))
                             (no-refs (:pointer as-bool)))
                            :result-type
                            (:pointer :void)
                            :calling-convention
                            :cdecl)
;; sel = 58
(define-foreign-funcallable as-cab-put-pointer-raw-selproto
                            ((the-cab as-cab)
                             (the-key (:reference-pass :ef-mb-string))
                             (the-type (:reference-pass :ef-mb-string))
                             (the-ptr (:pointer :void))
                             (destroy as-cab-pointer-destroy-proc))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 59
(define-foreign-funcallable as-cab-get-pointer-destroy-proc-selproto
                            ((the-cab as-const-cab)
                             (the-key (:reference-pass :ef-mb-string)))
                            :result-type
                            as-cab-pointer-destroy-proc
                            :calling-convention
                            :cdecl)
;; sel = 60
(define-foreign-funcallable as-cab-get-pointer-type-selproto
                            ((the-cab as-const-cab)
                             (the-key (:reference-pass :ef-mb-string)))
                            :result-type
                            (:reference-pass :ef-mb-string)
                            :calling-convention
                            :cdecl)
;; sel = 61
(define-foreign-funcallable as-cab-put-cab-selproto
                            ((the-cab as-cab)
                             (key-name (:reference-pass :ef-mb-string))
                             (put-cab as-cab))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 62
(define-foreign-funcallable as-cab-get-cab-selproto
                            ((the-cab as-const-cab)
                             (the-key (:reference-pass :ef-mb-string)))
                            :result-type
                            as-cab
                            :calling-convention
                            :cdecl)
;; sel = 63
(define-foreign-funcallable as-cab-detach-cab-selproto
                            ((the-cab as-cab)
                             (the-key (:reference-pass :ef-mb-string)))
                            :result-type
                            as-cab
                            :calling-convention
                            :cdecl)
;; sel = 64
(define-foreign-funcallable as-cab-get-string-selproto
                            ((the-cab as-const-cab)
                             (the-key (:reference-pass :ef-mb-string)))
                            :result-type
                            (:reference-pass :ef-mb-string)
                            :calling-convention
                            :cdecl)
;; sel = 65
(define-foreign-funcallable as-cab-get-string-copy-selproto
                            ((the-cab as-const-cab)
                             (the-key (:reference-pass :ef-mb-string)))
                            :result-type
                            (:reference-pass :ef-mb-string)
                            :calling-convention
                            :cdecl)
;; sel = 66
(define-foreign-funcallable as-cab-detach-string-selproto
                            ((the-cab as-cab)
                             (the-key (:reference-pass :ef-mb-string)))
                            :result-type
                            (:reference-pass :ef-mb-string)
                            :calling-convention
                            :cdecl)
;; sel = 67
(define-foreign-funcallable as-cab-put-string-selproto
                            ((the-cab as-cab)
                             (the-key (:reference-pass :ef-mb-string))
                             (the-str (:reference-pass :ef-mb-string)))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 68
(define-foreign-funcallable as-cab-get-text-selproto
                            ((the-cab as-const-cab)
                             (the-key (:reference-pass :ef-mb-string)))
                            :result-type
                            as-text
                            :calling-convention
                            :cdecl)
;; sel = 69
(define-foreign-funcallable as-cab-detach-text-selproto
                            ((the-cab as-cab)
                             (the-key (:reference-pass :ef-mb-string)))
                            :result-type
                            as-text
                            :calling-convention
                            :cdecl)
;; sel = 70
(define-foreign-funcallable as-cab-put-text-selproto
                            ((the-cab as-cab)
                             (the-key (:reference-pass :ef-mb-string))
                             (the-text as-text))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 71
(define-foreign-funcallable as-cab-get-binary-selproto
                            ((the-cab as-const-cab)
                             (the-key (:reference-pass :ef-mb-string))
                             (num-bytes (:pointer ast-array-size)))
                            :result-type
                            (:pointer :void)
                            :calling-convention
                            :cdecl)
;; sel = 72
(define-foreign-funcallable as-cab-get-binary-copy-selproto
                            ((the-cab as-const-cab)
                             (the-key (:reference-pass :ef-mb-string))
                             (num-bytes (:pointer ast-array-size)))
                            :result-type
                            (:pointer :void)
                            :calling-convention
                            :cdecl)
;; sel = 73
(define-foreign-funcallable as-cab-detach-binary-selproto
                            ((the-cab as-cab)
                             (the-key (:reference-pass :ef-mb-string))
                             (num-bytes (:pointer ast-array-size)))
                            :result-type
                            (:pointer :void)
                            :calling-convention
                            :cdecl)
;; sel = 74
(define-foreign-funcallable as-cab-put-binary-selproto
                            ((the-cab as-cab)
                             (the-key (:reference-pass :ef-mb-string))
                             (the-blob (:pointer :void))
                             (blob-size ast-array-size))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 75
(define-foreign-funcallable as-cab-put-null-selproto
                            ((the-cab as-cab)
                             (the-key (:reference-pass :ef-mb-string)))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 76
(define-foreign-funcallable as-cab-make-empty-selproto
                            ((the-cab as-cab))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 77
(define-foreign-funcallable as-cab-destroy-empties-selproto
                            ((the-cab as-cab) (recurse as-bool))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 78
(define-foreign-funcallable as-cab-copy-selproto
                            ((src-cab as-const-cab) (dst-cab as-cab))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 79
(define-foreign-funcallable as-cab-dup-selproto
                            ((src-cab as-const-cab))
                            :result-type
                            as-cab
                            :calling-convention
                            :cdecl)
;; sel = 80
(define-foreign-funcallable as-cab-value-equal-selproto
                            ((cab1 as-const-cab)
                             (key-name1
                              (:reference-pass :ef-mb-string))
                             (cab2 as-const-cab)
                             (key-name2
                              (:reference-pass :ef-mb-string)))
                            :result-type
                            as-bool
                            :calling-convention
                            :cdecl)
;; sel = 81
(define-foreign-funcallable as-cab-equal-selproto
                            ((cab1 as-const-cab) (cab2 as-const-cab))
                            :result-type
                            as-bool
                            :calling-convention
                            :cdecl)
;; sel = 82
(define-foreign-funcallable as-cab-munge-selproto
                            ((the-cab as-cab)
                             (key-cab as-const-cab)
                             (action as-cab-munge-action))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 83
(define-foreign-funcallable as-cab-put-path-name-selproto
                            ((the-cab as-cab)
                             (key-name (:reference-pass :ef-mb-string))
                             (file-sys as-file-sys)
                             (path-name as-path-name))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 84
(define-foreign-funcallable as-cab-get-path-name-copy-selproto
                            ((the-cab as-const-cab)
                             (key-name (:reference-pass :ef-mb-string))
                             (file-sys (:pointer as-file-sys))
                             (path-name (:pointer as-path-name)))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 85
(define-foreign-funcallable as-cab-detach-path-name-selproto
                            ((the-cab as-cab)
                             (key-name (:reference-pass :ef-mb-string))
                             (file-sys (:pointer as-file-sys))
                             (path-name (:pointer as-path-name)))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 86
(define-foreign-funcallable as-cab-write-to-stream-selproto
                            ((the-cab as-const-cab) (the-stm as-stm))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 87
(define-foreign-funcallable as-cab-read-from-stream-selproto
                            ((stm as-stm))
                            :result-type
                            as-cab
                            :calling-convention
                            :cdecl)
;; sel = 88
(define-foreign-funcallable as-cab-rename-selproto
                            ((the-cab as-cab)
                             (old-key-name
                              (:reference-pass :ef-mb-string))
                             (new-key-name
                              (:reference-pass :ef-mb-string)))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 89
(define-foreign-funcallable as-text-is-empty-selproto
                            ((str as-const-text))
                            :result-type
                            as-bool
                            :calling-convention
                            :cdecl)
;; sel = 90
(define-foreign-funcallable as-text-normalize-end-of-line-selproto
                            ((text as-text))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 91
(define-foreign-funcallable as-text-from-int32-selproto
                            ((num as-int32))
                            :result-type
                            as-text
                            :calling-convention
                            :cdecl)
;; sel = 92
(define-foreign-funcallable as-text-from-uns32-selproto
                            ((num as-uns32))
                            :result-type
                            as-text
                            :calling-convention
                            :cdecl)
;; sel = 93
(define-foreign-funcallable as-text-make-empty-selproto
                            ((str as-text))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 94
(define-foreign-funcallable as-text-replace-bad-chars-selproto
                            ((str as-text)
                             (psz-bad-char-list
                              (:reference-pass :ef-mb-string))
                             (replace-char :byte))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 95
(define-foreign-funcallable as-cab-get-uns-selproto
                            ((the-cab as-const-cab)
                             (the-key (:reference-pass :ef-mb-string))
                             (def-value as-uns32))
                            :result-type
                            as-uns32
                            :calling-convention
                            :cdecl)
;; sel = 96
(define-foreign-funcallable as-cab-put-uns-selproto
                            ((the-cab as-cab)
                             (the-key (:reference-pass :ef-mb-string))
                             (the-uns as-uns32))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 97
(define-foreign-funcallable as-date-new-selproto
                            nil
                            :result-type
                            as-date
                            :calling-convention
                            :cdecl)
;; sel = 98
(define-foreign-funcallable as-date-dup-selproto
                            ((date as-date))
                            :result-type
                            as-date
                            :calling-convention
                            :cdecl)
;; sel = 99
(define-foreign-funcallable as-date-clear-selproto
                            ((ret-val as-date))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 100
(define-foreign-funcallable as-date-copy-selproto
                            ((original as-date) (copy as-date))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 101
(define-foreign-funcallable as-date-destroy-selproto
                            ((date as-date))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 102
(define-foreign-funcallable as-time-span-new-selproto
                            nil
                            :result-type
                            as-time-span
                            :calling-convention
                            :cdecl)
;; sel = 103
(define-foreign-funcallable as-time-span-dup-selproto
                            ((time-span as-time-span))
                            :result-type
                            as-time-span
                            :calling-convention
                            :cdecl)
;; sel = 104
(define-foreign-funcallable as-time-span-copy-selproto
                            ((original as-time-span)
                             (copy as-time-span))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 105
(define-foreign-funcallable as-time-span-destroy-selproto
                            ((time-span as-time-span))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 106
(define-foreign-funcallable as-date-set-to-current-utctime-selproto
                            ((ret-val as-date))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 107
(define-foreign-funcallable as-date-set-to-current-local-time-selproto
                            ((date as-date))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 108
(define-foreign-funcallable as-date-set-local-time-offset-selproto
                            ((date as-date))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 109
(define-foreign-funcallable as-date-set-time-from-string-selproto
                            ((date as-date)
                             (time-string
                              (:reference-pass :ef-mb-string))
                             (format as-date-time-format))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 110
(define-foreign-funcallable as-date-set-time-from-rec-selproto
                            ((date as-date)
                             (time-rec (:pointer as-time-rec)))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 111
(define-foreign-funcallable as-date-subtract-calendar-time-span-selproto
                            ((date as-date)
                             (time-span as-calendar-time-span))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 112
(define-foreign-funcallable as-date-add-calendar-time-span-selproto
                            ((date as-date)
                             (time-span as-calendar-time-span))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 113
(define-foreign-funcallable as-date-subtract-time-span-selproto
                            ((date as-date) (time-span as-time-span))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 114
(define-foreign-funcallable as-date-add-time-span-selproto
                            ((date as-date) (time-span as-time-span))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 115
(define-foreign-funcallable as-date-calendar-diff-selproto
                            ((date1 as-date)
                             (date2 as-date)
                             (result as-calendar-time-span))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 116
(define-foreign-funcallable as-date-exact-diff-selproto
                            ((date1 as-date)
                             (date2 as-date)
                             (result as-time-span))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 117
(define-foreign-funcallable as-date-get-time-string-selproto
                            ((date as-date)
                             (format as-date-time-format))
                            :result-type
                            (:reference-pass :ef-mb-string)
                            :calling-convention
                            :cdecl)
;; sel = 118
(define-foreign-funcallable as-date-get-utctime-selproto
                            ((date as-date))
                            :result-type
                            as-time-rec
                            :calling-convention
                            :cdecl)
;; sel = 119
(define-foreign-funcallable as-date-get-local-time-selproto
                            ((date as-date))
                            :result-type
                            as-time-rec
                            :calling-convention
                            :cdecl)
;; sel = 120
(define-foreign-funcallable as-calendar-time-span-compare-selproto
                            ((time-span1 as-calendar-time-span)
                             (time-span2 as-calendar-time-span)
                             (base-date as-date))
                            :result-type
                            as-int32
                            :calling-convention
                            :cdecl)
;; sel = 121
(define-foreign-funcallable as-time-span-compare-selproto
                            ((time-span1 as-time-span)
                             (time-span2 as-time-span))
                            :result-type
                            as-int32
                            :calling-convention
                            :cdecl)
;; sel = 122
(define-foreign-funcallable as-calendar-time-span-add-with-base-selproto
                            ((time-span1 as-calendar-time-span)
                             (time-span2 as-calendar-time-span)
                             (base-date as-date)
                             (result as-calendar-time-span))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 123
(define-foreign-funcallable as-time-span-add-selproto
                            ((time-span1 as-time-span)
                             (time-span2 as-time-span)
                             (result as-time-span))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 124
(define-foreign-funcallable as-calendar-time-span-diff-selproto
                            ((time-span1 as-calendar-time-span)
                             (time-span2 as-calendar-time-span)
                             (base-date as-date)
                             (result as-calendar-time-span))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 125
(define-foreign-funcallable as-time-span-diff-selproto
                            ((time-span1 as-time-span)
                             (time-span2 as-time-span)
                             (result as-time-span))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 126
(define-foreign-funcallable as-date-compare-selproto
                            ((date1 as-date) (date2 as-date))
                            :result-type
                            as-int32
                            :calling-convention
                            :cdecl)
;; sel = 127
(define-foreign-funcallable as-time-span-set-from-as-int32-selproto
                            ((time-span as-time-span)
                             (num-seconds as-int32))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 128
(define-foreign-funcallable as-time-span-set-from-string-selproto
                            ((time-span as-time-span)
                             (num-seconds-string
                              (:reference-pass :ef-mb-string)))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 129
(define-foreign-funcallable as-time-span-set-selproto
                            ((time-span as-time-span)
                             (high-bits as-int32)
                             (low-bits as-uns32))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 130
(define-foreign-funcallable as-text-eval-selproto
                            ((the-text as-text) (params as-cab))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 131
(define-foreign-funcallable as-file-sys-get-item-props-as-cab-selproto
                            ((file-sys as-file-sys)
                             (path-name as-path-name)
                             (the-cab as-cab))
                            :result-type
                            as-int32
                            :calling-convention
                            :cdecl)
;; sel = 132
(define-foreign-funcallable as-file-sys-convert-cab-to-item-props-selproto
                            ((props as-file-sys-item-props)
                             (the-cab as-cab))
                            :result-type
                            as-int32
                            :calling-convention
                            :cdecl)
;; sel = 133
(define-foreign-funcallable as-file-sys-convert-item-props-to-cab-selproto
                            ((the-cab as-cab)
                             (props
                              (:pointer as-file-sys-item-props-rec)))
                            :result-type
                            as-int32
                            :calling-convention
                            :cdecl)
;; sel = 134
(define-foreign-funcallable as-file-sys-can-perform-op-on-item-selproto
                            ((file-sys as-file-sys)
                             (path-name as-path-name)
                             (op (:reference-pass :ef-mb-string)))
                            :result-type
                            as-int32
                            :calling-convention
                            :cdecl)
;; sel = 135
(define-foreign-funcallable as-file-sys-perform-op-on-item-selproto
                            ((file-sys as-file-sys)
                             (path-name as-path-name)
                             (op (:reference-pass :ef-mb-string))
                             (params as-cab))
                            :result-type
                            as-int32
                            :calling-convention
                            :cdecl)
;; sel = 136
(define-foreign-funcallable as-is-valid-utf8-selproto
                            ((c-in (:pointer as-uns8))
                             (c-in-len as-count))
                            :result-type
                            as-bool
                            :calling-convention
                            :cdecl)
;; sel = 137
(define-foreign-funcallable as-text-case-sensitive-cmp-selproto
                            ((str1 as-const-text) (str2 as-const-text))
                            :result-type
                            as-int32
                            :calling-convention
                            :cdecl)
;; sel = 138
(define-foreign-funcallable as-const-cab-enum-selproto
                            ((the-cab as-const-cab)
                             (enum-proc as-const-cab-enum-proc)
                             (client-data (:pointer :void)))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 139
(define-foreign-funcallable as-text-filter-selproto
                            ((text as-text)
                             (filter as-text-filter-type))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 140
(define-foreign-funcallable as-time-span-get-as-int32-selproto
                            ((time-span as-time-span)
                             (out-overflow (:pointer as-bool)))
                            :result-type
                            as-int32
                            :calling-convention
                            :cdecl)
;; sel = 141
(define-foreign-funcallable as-cab-get-int64-selproto
                            ((the-cab as-const-cab)
                             (the-key (:reference-pass :ef-mb-string))
                             (def-value as-int64))
                            :result-type
                            as-int64
                            :calling-convention
                            :cdecl)
;; sel = 142
(define-foreign-funcallable as-cab-put-int64-selproto
                            ((the-cab as-cab)
                             (the-key (:reference-pass :ef-mb-string))
                             (the-int as-int64))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 143
(define-foreign-funcallable as-cab-get-uns64-selproto
                            ((the-cab as-const-cab)
                             (the-key (:reference-pass :ef-mb-string))
                             (def-value as-uns64))
                            :result-type
                            as-uns64
                            :calling-convention
                            :cdecl)
;; sel = 144
(define-foreign-funcallable as-cab-put-uns64-selproto
                            ((the-cab as-cab)
                             (the-key (:reference-pass :ef-mb-string))
                             (the-int as-uns64))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 145
(define-foreign-funcallable as-text-make-empty-clear-selproto
                            ((str as-text))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)

;; #include <ASExtraCalls.h>
;; line 101
(define-c-typedef as-extra-hft-version-9 as-extra-hft-latest-version)
;; line 160
(define-acrobat-function (as-script-to-host-encoding "ASScriptToHostEncoding")
                         *g-as-extra-version*
                         +as-extra-hft-version-5+
                         as-script-to-host-encoding-selproto
                         *g-as-extra-hft*
                         +as-script-to-host-encoding-sel+)
;; line 161
(define-acrobat-function (as-script-from-host-encoding "ASScriptFromHostEncoding")
                         *g-as-extra-version*
                         +as-extra-hft-version-5+
                         as-script-from-host-encoding-selproto
                         *g-as-extra-hft*
                         +as-script-from-host-encoding-sel+)
;; line 162
(define-acrobat-function (as-text-new "ASTextNew")
                         *g-as-extra-version*
                         +as-extra-hft-version-5+
                         as-text-new-selproto
                         *g-as-extra-hft*
                         +as-text-new-sel+)
;; line 163
(define-acrobat-function (as-text-from-unicode "ASTextFromUnicode")
                         *g-as-extra-version*
                         +as-extra-hft-version-5+
                         as-text-from-unicode-selproto
                         *g-as-extra-hft*
                         +as-text-from-unicode-sel+)
;; line 164
(define-acrobat-function (as-text-from-sized-unicode "ASTextFromSizedUnicode")
                         *g-as-extra-version*
                         +as-extra-hft-version-5+
                         as-text-from-sized-unicode-selproto
                         *g-as-extra-hft*
                         +as-text-from-sized-unicode-sel+)
;; line 165
(define-acrobat-function (as-text-from-encoded "ASTextFromEncoded")
                         *g-as-extra-version*
                         +as-extra-hft-version-5+
                         as-text-from-encoded-selproto
                         *g-as-extra-hft*
                         +as-text-from-encoded-sel+)
;; line 166
(define-acrobat-function (as-text-from-sized-encoded "ASTextFromSizedEncoded")
                         *g-as-extra-version*
                         +as-extra-hft-version-5+
                         as-text-from-sized-encoded-selproto
                         *g-as-extra-hft*
                         +as-text-from-sized-encoded-sel+)
;; line 167
(define-acrobat-function (as-text-from-script-text "ASTextFromScriptText")
                         *g-as-extra-version*
                         +as-extra-hft-version-5+
                         as-text-from-script-text-selproto
                         *g-as-extra-hft*
                         +as-text-from-script-text-sel+)
;; line 168
(define-acrobat-function (as-text-from-sized-script-text "ASTextFromSizedScriptText")
                         *g-as-extra-version*
                         +as-extra-hft-version-5+
                         as-text-from-sized-script-text-selproto
                         *g-as-extra-hft*
                         +as-text-from-sized-script-text-sel+)
;; line 169
(define-acrobat-function (as-text-from-pdtext "ASTextFromPDText")
                         *g-as-extra-version*
                         +as-extra-hft-version-5+
                         as-text-from-pdtext-selproto
                         *g-as-extra-hft*
                         +as-text-from-pdtext-sel+)
;; line 170
(define-acrobat-function (as-text-from-sized-pdtext "ASTextFromSizedPDText")
                         *g-as-extra-version*
                         +as-extra-hft-version-5+
                         as-text-from-sized-pdtext-selproto
                         *g-as-extra-hft*
                         +as-text-from-sized-pdtext-sel+)
;; line 171
(define-acrobat-function (as-text-destroy "ASTextDestroy")
                         *g-as-extra-version*
                         +as-extra-hft-version-5+
                         as-text-destroy-selproto
                         *g-as-extra-hft*
                         +as-text-destroy-sel+)
;; line 172
(define-acrobat-function (as-text-set-unicode "ASTextSetUnicode")
                         *g-as-extra-version*
                         +as-extra-hft-version-5+
                         as-text-set-unicode-selproto
                         *g-as-extra-hft*
                         +as-text-set-unicode-sel+)
;; line 173
(define-acrobat-function (as-text-set-sized-unicode "ASTextSetSizedUnicode")
                         *g-as-extra-version*
                         +as-extra-hft-version-5+
                         as-text-set-sized-unicode-selproto
                         *g-as-extra-hft*
                         +as-text-set-sized-unicode-sel+)
;; line 174
(define-acrobat-function (as-text-set-encoded "ASTextSetEncoded")
                         *g-as-extra-version*
                         +as-extra-hft-version-5+
                         as-text-set-encoded-selproto
                         *g-as-extra-hft*
                         +as-text-set-encoded-sel+)
;; line 175
(define-acrobat-function (as-text-set-sized-encoded "ASTextSetSizedEncoded")
                         *g-as-extra-version*
                         +as-extra-hft-version-5+
                         as-text-set-sized-encoded-selproto
                         *g-as-extra-hft*
                         +as-text-set-sized-encoded-sel+)
;; line 176
(define-acrobat-function (as-text-set-script-text "ASTextSetScriptText")
                         *g-as-extra-version*
                         +as-extra-hft-version-5+
                         as-text-set-script-text-selproto
                         *g-as-extra-hft*
                         +as-text-set-script-text-sel+)
;; line 177
(define-acrobat-function (as-text-set-sized-script-text "ASTextSetSizedScriptText")
                         *g-as-extra-version*
                         +as-extra-hft-version-5+
                         as-text-set-sized-script-text-selproto
                         *g-as-extra-hft*
                         +as-text-set-sized-script-text-sel+)
;; line 178
(define-acrobat-function (as-text-set-pdtext "ASTextSetPDText")
                         *g-as-extra-version*
                         +as-extra-hft-version-5+
                         as-text-set-pdtext-selproto
                         *g-as-extra-hft*
                         +as-text-set-pdtext-sel+)
;; line 179
(define-acrobat-function (as-text-set-sized-pdtext "ASTextSetSizedPDText")
                         *g-as-extra-version*
                         +as-extra-hft-version-5+
                         as-text-set-sized-pdtext-selproto
                         *g-as-extra-hft*
                         +as-text-set-sized-pdtext-sel+)
;; line 180
(define-acrobat-function (as-text-get-unicode "ASTextGetUnicode")
                         *g-as-extra-version*
                         +as-extra-hft-version-5+
                         as-text-get-unicode-selproto
                         *g-as-extra-hft*
                         +as-text-get-unicode-sel+)
;; line 181
(define-acrobat-function (as-text-get-unicode-copy "ASTextGetUnicodeCopy")
                         *g-as-extra-version*
                         +as-extra-hft-version-5+
                         as-text-get-unicode-copy-selproto
                         *g-as-extra-hft*
                         +as-text-get-unicode-copy-sel+)
;; line 182
(define-acrobat-function (as-text-get-encoded "ASTextGetEncoded")
                         *g-as-extra-version*
                         +as-extra-hft-version-5+
                         as-text-get-encoded-selproto
                         *g-as-extra-hft*
                         +as-text-get-encoded-sel+)
;; line 183
(define-acrobat-function (as-text-get-encoded-copy "ASTextGetEncodedCopy")
                         *g-as-extra-version*
                         +as-extra-hft-version-5+
                         as-text-get-encoded-copy-selproto
                         *g-as-extra-hft*
                         +as-text-get-encoded-copy-sel+)
;; line 184
(define-acrobat-function (as-text-get-script-text "ASTextGetScriptText")
                         *g-as-extra-version*
                         +as-extra-hft-version-5+
                         as-text-get-script-text-selproto
                         *g-as-extra-hft*
                         +as-text-get-script-text-sel+)
;; line 185
(define-acrobat-function (as-text-get-script-text-copy "ASTextGetScriptTextCopy")
                         *g-as-extra-version*
                         +as-extra-hft-version-5+
                         as-text-get-script-text-copy-selproto
                         *g-as-extra-hft*
                         +as-text-get-script-text-copy-sel+)
;; line 186
(define-acrobat-function (as-text-get-pdtext-copy "ASTextGetPDTextCopy")
                         *g-as-extra-version*
                         +as-extra-hft-version-5+
                         as-text-get-pdtext-copy-selproto
                         *g-as-extra-hft*
                         +as-text-get-pdtext-copy-sel+)
;; line 187
(define-acrobat-function (as-text-get-best-encoding "ASTextGetBestEncoding")
                         *g-as-extra-version*
                         +as-extra-hft-version-5+
                         as-text-get-best-encoding-selproto
                         *g-as-extra-hft*
                         +as-text-get-best-encoding-sel+)
;; line 188
(define-acrobat-function (as-text-get-best-script "ASTextGetBestScript")
                         *g-as-extra-version*
                         +as-extra-hft-version-5+
                         as-text-get-best-script-selproto
                         *g-as-extra-hft*
                         +as-text-get-best-script-sel+)
;; line 189
(define-acrobat-function (as-text-get-country "ASTextGetCountry")
                         *g-as-extra-version*
                         +as-extra-hft-version-5+
                         as-text-get-country-selproto
                         *g-as-extra-hft*
                         +as-text-get-country-sel+)
;; line 190
(define-acrobat-function (as-text-set-country "ASTextSetCountry")
                         *g-as-extra-version*
                         +as-extra-hft-version-5+
                         as-text-set-country-selproto
                         *g-as-extra-hft*
                         +as-text-set-country-sel+)
;; line 191
(define-acrobat-function (as-text-get-language "ASTextGetLanguage")
                         *g-as-extra-version*
                         +as-extra-hft-version-5+
                         as-text-get-language-selproto
                         *g-as-extra-hft*
                         +as-text-get-language-sel+)
;; line 192
(define-acrobat-function (as-text-set-language "ASTextSetLanguage")
                         *g-as-extra-version*
                         +as-extra-hft-version-5+
                         as-text-set-language-selproto
                         *g-as-extra-hft*
                         +as-text-set-language-sel+)
;; line 193
(define-acrobat-function (as-text-cat "ASTextCat")
                         *g-as-extra-version*
                         +as-extra-hft-version-5+
                         as-text-cat-selproto
                         *g-as-extra-hft*
                         +as-text-cat-sel+)
;; line 194
(define-acrobat-function (as-text-cat-many "ASTextCatMany")
                         *g-as-extra-version*
                         +as-extra-hft-version-5+
                         as-text-cat-many-selproto
                         *g-as-extra-hft*
                         +as-text-cat-many-sel+)
;; line 195
(define-acrobat-function (as-text-copy "ASTextCopy")
                         *g-as-extra-version*
                         +as-extra-hft-version-5+
                         as-text-copy-selproto
                         *g-as-extra-hft*
                         +as-text-copy-sel+)
;; line 196
(define-acrobat-function (as-text-dup "ASTextDup")
                         *g-as-extra-version*
                         +as-extra-hft-version-5+
                         as-text-dup-selproto
                         *g-as-extra-hft*
                         +as-text-dup-sel+)
;; line 197
(define-acrobat-function (as-text-cmp "ASTextCmp")
                         *g-as-extra-version*
                         +as-extra-hft-version-5+
                         as-text-cmp-selproto
                         *g-as-extra-hft*
                         +as-text-cmp-sel+)
;; line 198
(define-acrobat-function (as-text-replace "ASTextReplace")
                         *g-as-extra-version*
                         +as-extra-hft-version-5+
                         as-text-replace-selproto
                         *g-as-extra-hft*
                         +as-text-replace-sel+)
;; line 199
(define-acrobat-function (as-text-replace-as-cii "ASTextReplaceASCII")
                         *g-as-extra-version*
                         +as-extra-hft-version-5+
                         as-text-replace-as-cii-selproto
                         *g-as-extra-hft*
                         +as-text-replace-as-cii-sel+)
;; line 201
(define-acrobat-function (as-cab-new "ASCabNew")
                         *g-as-extra-version*
                         +as-extra-hft-version-5+
                         as-cab-new-selproto
                         *g-as-extra-hft*
                         +as-cab-new-sel+)
;; line 202
(define-acrobat-function (as-cab-from-entry-list "ASCabFromEntryList")
                         *g-as-extra-version*
                         +as-extra-hft-version-5+
                         as-cab-from-entry-list-selproto
                         *g-as-extra-hft*
                         +as-cab-from-entry-list-sel+)
;; line 203
(define-acrobat-function (as-cab-destroy "ASCabDestroy")
                         *g-as-extra-version*
                         +as-extra-hft-version-5+
                         as-cab-destroy-selproto
                         *g-as-extra-hft*
                         +as-cab-destroy-sel+)
;; line 204
(define-acrobat-function (as-cab-num-entries "ASCabNumEntries")
                         *g-as-extra-version*
                         +as-extra-hft-version-5+
                         as-cab-num-entries-selproto
                         *g-as-extra-hft*
                         +as-cab-num-entries-sel+)
;; line 205
(define-acrobat-function (as-cab-known "ASCabKnown")
                         *g-as-extra-version*
                         +as-extra-hft-version-5+
                         as-cab-known-selproto
                         *g-as-extra-hft*
                         +as-cab-known-sel+)
;; line 206
(define-acrobat-function (as-cab-get-type "ASCabGetType")
                         *g-as-extra-version*
                         +as-extra-hft-version-5+
                         as-cab-get-type-selproto
                         *g-as-extra-hft*
                         +as-cab-get-type-sel+)
;; line 207
(define-acrobat-function (as-cab-enum "ASCabEnum")
                         *g-as-extra-version*
                         +as-extra-hft-version-5+
                         as-cab-enum-selproto
                         *g-as-extra-hft*
                         +as-cab-enum-sel+)
;; line 208
(define-acrobat-function (as-cab-remove "ASCabRemove")
                         *g-as-extra-version*
                         +as-extra-hft-version-5+
                         as-cab-remove-selproto
                         *g-as-extra-hft*
                         +as-cab-remove-sel+)
;; line 209
(define-acrobat-function (as-cab-get-bool "ASCabGetBool")
                         *g-as-extra-version*
                         +as-extra-hft-version-5+
                         as-cab-get-bool-selproto
                         *g-as-extra-hft*
                         +as-cab-get-bool-sel+)
;; line 210
(define-acrobat-function (as-cab-put-bool "ASCabPutBool")
                         *g-as-extra-version*
                         +as-extra-hft-version-5+
                         as-cab-put-bool-selproto
                         *g-as-extra-hft*
                         +as-cab-put-bool-sel+)
;; line 211
(define-acrobat-function (as-cab-get-int "ASCabGetInt")
                         *g-as-extra-version*
                         +as-extra-hft-version-5+
                         as-cab-get-int-selproto
                         *g-as-extra-hft*
                         +as-cab-get-int-sel+)
;; line 212
(define-acrobat-function (as-cab-put-int "ASCabPutInt")
                         *g-as-extra-version*
                         +as-extra-hft-version-5+
                         as-cab-put-int-selproto
                         *g-as-extra-hft*
                         +as-cab-put-int-sel+)
;; line 213
(define-acrobat-function (as-cab-get-atom "ASCabGetAtom")
                         *g-as-extra-version*
                         +as-extra-hft-version-5+
                         as-cab-get-atom-selproto
                         *g-as-extra-hft*
                         +as-cab-get-atom-sel+)
;; line 214
(define-acrobat-function (as-cab-put-atom "ASCabPutAtom")
                         *g-as-extra-version*
                         +as-extra-hft-version-5+
                         as-cab-put-atom-selproto
                         *g-as-extra-hft*
                         +as-cab-put-atom-sel+)
;; line 215
(define-acrobat-function (as-cab-get-double "ASCabGetDouble")
                         *g-as-extra-version*
                         +as-extra-hft-version-5+
                         as-cab-get-double-selproto
                         *g-as-extra-hft*
                         +as-cab-get-double-sel+)
;; line 216
(define-acrobat-function (as-cab-put-double "ASCabPutDouble")
                         *g-as-extra-version*
                         +as-extra-hft-version-5+
                         as-cab-put-double-selproto
                         *g-as-extra-hft*
                         +as-cab-put-double-sel+)
;; line 217
(define-acrobat-function (as-cab-get-pointer-raw "ASCabGetPointerRaw")
                         *g-as-extra-version*
                         +as-extra-hft-version-5+
                         as-cab-get-pointer-raw-selproto
                         *g-as-extra-hft*
                         +as-cab-get-pointer-raw-sel+)
;; line 218
(define-acrobat-function (as-cab-detach-pointer-raw "ASCabDetachPointerRaw")
                         *g-as-extra-version*
                         +as-extra-hft-version-5+
                         as-cab-detach-pointer-raw-selproto
                         *g-as-extra-hft*
                         +as-cab-detach-pointer-raw-sel+)
;; line 219
(define-acrobat-function (as-cab-put-pointer-raw "ASCabPutPointerRaw")
                         *g-as-extra-version*
                         +as-extra-hft-version-5+
                         as-cab-put-pointer-raw-selproto
                         *g-as-extra-hft*
                         +as-cab-put-pointer-raw-sel+)
;; line 220
(define-acrobat-function (as-cab-get-pointer-destroy-proc "ASCabGetPointerDestroyProc")
                         *g-as-extra-version*
                         +as-extra-hft-version-5+
                         as-cab-get-pointer-destroy-proc-selproto
                         *g-as-extra-hft*
                         +as-cab-get-pointer-destroy-proc-sel+)
;; line 221
(define-acrobat-function (as-cab-get-pointer-type "ASCabGetPointerType")
                         *g-as-extra-version*
                         +as-extra-hft-version-5+
                         as-cab-get-pointer-type-selproto
                         *g-as-extra-hft*
                         +as-cab-get-pointer-type-sel+)
;; line 222
(define-acrobat-function (as-cab-put-cab "ASCabPutCab")
                         *g-as-extra-version*
                         +as-extra-hft-version-5+
                         as-cab-put-cab-selproto
                         *g-as-extra-hft*
                         +as-cab-put-cab-sel+)
;; line 223
(define-acrobat-function (as-cab-get-cab "ASCabGetCab")
                         *g-as-extra-version*
                         +as-extra-hft-version-5+
                         as-cab-get-cab-selproto
                         *g-as-extra-hft*
                         +as-cab-get-cab-sel+)
;; line 224
(define-acrobat-function (as-cab-detach-cab "ASCabDetachCab")
                         *g-as-extra-version*
                         +as-extra-hft-version-5+
                         as-cab-detach-cab-selproto
                         *g-as-extra-hft*
                         +as-cab-detach-cab-sel+)
;; line 225
(define-acrobat-function (as-cab-get-string "ASCabGetString")
                         *g-as-extra-version*
                         +as-extra-hft-version-5+
                         as-cab-get-string-selproto
                         *g-as-extra-hft*
                         +as-cab-get-string-sel+)
;; line 226
(define-acrobat-function (as-cab-get-string-copy "ASCabGetStringCopy")
                         *g-as-extra-version*
                         +as-extra-hft-version-5+
                         as-cab-get-string-copy-selproto
                         *g-as-extra-hft*
                         +as-cab-get-string-copy-sel+)
;; line 227
(define-acrobat-function (as-cab-detach-string "ASCabDetachString")
                         *g-as-extra-version*
                         +as-extra-hft-version-5+
                         as-cab-detach-string-selproto
                         *g-as-extra-hft*
                         +as-cab-detach-string-sel+)
;; line 228
(define-acrobat-function (as-cab-put-string "ASCabPutString")
                         *g-as-extra-version*
                         +as-extra-hft-version-5+
                         as-cab-put-string-selproto
                         *g-as-extra-hft*
                         +as-cab-put-string-sel+)
;; line 229
(define-acrobat-function (as-cab-get-text "ASCabGetText")
                         *g-as-extra-version*
                         +as-extra-hft-version-5+
                         as-cab-get-text-selproto
                         *g-as-extra-hft*
                         +as-cab-get-text-sel+)
;; line 230
(define-acrobat-function (as-cab-detach-text "ASCabDetachText")
                         *g-as-extra-version*
                         +as-extra-hft-version-5+
                         as-cab-detach-text-selproto
                         *g-as-extra-hft*
                         +as-cab-detach-text-sel+)
;; line 231
(define-acrobat-function (as-cab-put-text "ASCabPutText")
                         *g-as-extra-version*
                         +as-extra-hft-version-5+
                         as-cab-put-text-selproto
                         *g-as-extra-hft*
                         +as-cab-put-text-sel+)
;; line 232
(define-acrobat-function (as-cab-get-binary "ASCabGetBinary")
                         *g-as-extra-version*
                         +as-extra-hft-version-5+
                         as-cab-get-binary-selproto
                         *g-as-extra-hft*
                         +as-cab-get-binary-sel+)
;; line 233
(define-acrobat-function (as-cab-get-binary-copy "ASCabGetBinaryCopy")
                         *g-as-extra-version*
                         +as-extra-hft-version-5+
                         as-cab-get-binary-copy-selproto
                         *g-as-extra-hft*
                         +as-cab-get-binary-copy-sel+)
;; line 234
(define-acrobat-function (as-cab-detach-binary "ASCabDetachBinary")
                         *g-as-extra-version*
                         +as-extra-hft-version-5+
                         as-cab-detach-binary-selproto
                         *g-as-extra-hft*
                         +as-cab-detach-binary-sel+)
;; line 235
(define-acrobat-function (as-cab-put-binary "ASCabPutBinary")
                         *g-as-extra-version*
                         +as-extra-hft-version-5+
                         as-cab-put-binary-selproto
                         *g-as-extra-hft*
                         +as-cab-put-binary-sel+)
;; line 236
(define-acrobat-function (as-cab-put-null "ASCabPutNull")
                         *g-as-extra-version*
                         +as-extra-hft-version-5+
                         as-cab-put-null-selproto
                         *g-as-extra-hft*
                         +as-cab-put-null-sel+)
;; line 237
(define-acrobat-function (as-cab-make-empty "ASCabMakeEmpty")
                         *g-as-extra-version*
                         +as-extra-hft-version-5+
                         as-cab-make-empty-selproto
                         *g-as-extra-hft*
                         +as-cab-make-empty-sel+)
;; line 238
(define-acrobat-function (as-cab-destroy-empties "ASCabDestroyEmpties")
                         *g-as-extra-version*
                         +as-extra-hft-version-5+
                         as-cab-destroy-empties-selproto
                         *g-as-extra-hft*
                         +as-cab-destroy-empties-sel+)
;; line 239
(define-acrobat-function (as-cab-copy "ASCabCopy")
                         *g-as-extra-version*
                         +as-extra-hft-version-5+
                         as-cab-copy-selproto
                         *g-as-extra-hft*
                         +as-cab-copy-sel+)
;; line 240
(define-acrobat-function (as-cab-dup "ASCabDup")
                         *g-as-extra-version*
                         +as-extra-hft-version-5+
                         as-cab-dup-selproto
                         *g-as-extra-hft*
                         +as-cab-dup-sel+)
;; line 241
(define-acrobat-function (as-cab-value-equal "ASCabValueEqual")
                         *g-as-extra-version*
                         +as-extra-hft-version-5+
                         as-cab-value-equal-selproto
                         *g-as-extra-hft*
                         +as-cab-value-equal-sel+)
;; line 242
(define-acrobat-function (as-cab-equal "ASCabEqual")
                         *g-as-extra-version*
                         +as-extra-hft-version-5+
                         as-cab-equal-selproto
                         *g-as-extra-hft*
                         +as-cab-equal-sel+)
;; line 243
(define-acrobat-function (as-cab-munge "ASCabMunge")
                         *g-as-extra-version*
                         +as-extra-hft-version-5+
                         as-cab-munge-selproto
                         *g-as-extra-hft*
                         +as-cab-munge-sel+)
;; line 244
(define-acrobat-function (as-cab-put-path-name "ASCabPutPathName")
                         *g-as-extra-version*
                         +as-extra-hft-version-5+
                         as-cab-put-path-name-selproto
                         *g-as-extra-hft*
                         +as-cab-put-path-name-sel+)
;; line 245
(define-acrobat-function (as-cab-get-path-name-copy "ASCabGetPathNameCopy")
                         *g-as-extra-version*
                         +as-extra-hft-version-5+
                         as-cab-get-path-name-copy-selproto
                         *g-as-extra-hft*
                         +as-cab-get-path-name-copy-sel+)
;; line 246
(define-acrobat-function (as-cab-detach-path-name "ASCabDetachPathName")
                         *g-as-extra-version*
                         +as-extra-hft-version-5+
                         as-cab-detach-path-name-selproto
                         *g-as-extra-hft*
                         +as-cab-detach-path-name-sel+)
;; line 247
(define-acrobat-function (as-cab-write-to-stream "ASCabWriteToStream")
                         *g-as-extra-version*
                         +as-extra-hft-version-5+
                         as-cab-write-to-stream-selproto
                         *g-as-extra-hft*
                         +as-cab-write-to-stream-sel+)
;; line 248
(define-acrobat-function (as-cab-read-from-stream "ASCabReadFromStream")
                         *g-as-extra-version*
                         +as-extra-hft-version-5+
                         as-cab-read-from-stream-selproto
                         *g-as-extra-hft*
                         +as-cab-read-from-stream-sel+)
;; line 250
(define-acrobat-function (as-cab-rename "ASCabRename")
                         *g-as-extra-version*
                         +as-extra-hft-version-5+
                         as-cab-rename-selproto
                         *g-as-extra-hft*
                         +as-cab-rename-sel+)
;; line 251
(define-acrobat-function (as-text-is-empty "ASTextIsEmpty")
                         *g-as-extra-version*
                         +as-extra-hft-version-5+
                         as-text-is-empty-selproto
                         *g-as-extra-hft*
                         +as-text-is-empty-sel+)
;; line 252
(define-acrobat-function (as-text-normalize-end-of-line "ASTextNormalizeEndOfLine")
                         *g-as-extra-version*
                         +as-extra-hft-version-5+
                         as-text-normalize-end-of-line-selproto
                         *g-as-extra-hft*
                         +as-text-normalize-end-of-line-sel+)
;; line 254
(define-acrobat-function (as-text-from-int32 "ASTextFromInt32")
                         *g-as-extra-version*
                         +as-extra-hft-version-5+
                         as-text-from-int32-selproto
                         *g-as-extra-hft*
                         +as-text-from-int32-sel+)
;; line 255
(define-acrobat-function (as-text-from-uns32 "ASTextFromUns32")
                         *g-as-extra-version*
                         +as-extra-hft-version-5+
                         as-text-from-uns32-selproto
                         *g-as-extra-hft*
                         +as-text-from-uns32-sel+)
;; line 257
(define-acrobat-function (as-text-make-empty "ASTextMakeEmpty")
                         *g-as-extra-version*
                         +as-extra-hft-version-5+
                         as-text-make-empty-selproto
                         *g-as-extra-hft*
                         +as-text-make-empty-sel+)
;; line 261
(define-acrobat-function (as-text-replace-bad-chars "ASTextReplaceBadChars")
                         *g-as-extra-version*
                         +as-extra-hft-version-6+
                         as-text-replace-bad-chars-selproto
                         *g-as-extra-hft*
                         +as-text-replace-bad-chars-sel+)
;; line 262
(define-acrobat-function (as-cab-get-uns "ASCabGetUns")
                         *g-as-extra-version*
                         +as-extra-hft-version-6+
                         as-cab-get-uns-selproto
                         *g-as-extra-hft*
                         +as-cab-get-uns-sel+)
;; line 263
(define-acrobat-function (as-cab-put-uns "ASCabPutUns")
                         *g-as-extra-version*
                         +as-extra-hft-version-6+
                         as-cab-put-uns-selproto
                         *g-as-extra-hft*
                         +as-cab-put-uns-sel+)
;; line 266
(define-acrobat-function (as-date-new "ASDateNew")
                         *g-as-extra-version*
                         +as-extra-hft-version-6+
                         as-date-new-selproto
                         *g-as-extra-hft*
                         +as-date-new-sel+)
;; line 267
(define-acrobat-function (as-date-copy "ASDateCopy")
                         *g-as-extra-version*
                         +as-extra-hft-version-6+
                         as-date-copy-selproto
                         *g-as-extra-hft*
                         +as-date-copy-sel+)
;; line 268
(define-acrobat-function (as-date-dup "ASDateDup")
                         *g-as-extra-version*
                         +as-extra-hft-version-6+
                         as-date-dup-selproto
                         *g-as-extra-hft*
                         +as-date-dup-sel+)
;; line 269
(define-acrobat-function (as-date-clear "ASDateClear")
                         *g-as-extra-version*
                         +as-extra-hft-version-6+
                         as-date-clear-selproto
                         *g-as-extra-hft*
                         +as-date-clear-sel+)
;; line 270
(define-acrobat-function (as-date-destroy "ASDateDestroy")
                         *g-as-extra-version*
                         +as-extra-hft-version-6+
                         as-date-destroy-selproto
                         *g-as-extra-hft*
                         +as-date-destroy-sel+)
;; line 271
(define-acrobat-function (as-time-span-new "ASTimeSpanNew")
                         *g-as-extra-version*
                         +as-extra-hft-version-6+
                         as-time-span-new-selproto
                         *g-as-extra-hft*
                         +as-time-span-new-sel+)
;; line 272
(define-acrobat-function (as-time-span-copy "ASTimeSpanCopy")
                         *g-as-extra-version*
                         +as-extra-hft-version-6+
                         as-time-span-copy-selproto
                         *g-as-extra-hft*
                         +as-time-span-copy-sel+)
;; line 273
(define-acrobat-function (as-time-span-dup "ASTimeSpanDup")
                         *g-as-extra-version*
                         +as-extra-hft-version-6+
                         as-time-span-dup-selproto
                         *g-as-extra-hft*
                         +as-time-span-dup-sel+)
;; line 274
(define-acrobat-function (as-time-span-destroy "ASTimeSpanDestroy")
                         *g-as-extra-version*
                         +as-extra-hft-version-6+
                         as-time-span-destroy-selproto
                         *g-as-extra-hft*
                         +as-time-span-destroy-sel+)
;; line 275
(define-acrobat-function (as-date-set-to-current-utctime "ASDateSetToCurrentUTCTime")
                         *g-as-extra-version*
                         +as-extra-hft-version-6+
                         as-date-set-to-current-utctime-selproto
                         *g-as-extra-hft*
                         +as-date-set-to-current-utctime-sel+)
;; line 276
(define-acrobat-function (as-date-set-to-current-local-time "ASDateSetToCurrentLocalTime")
                         *g-as-extra-version*
                         +as-extra-hft-version-6+
                         as-date-set-to-current-local-time-selproto
                         *g-as-extra-hft*
                         +as-date-set-to-current-local-time-sel+)
;; line 277
(define-acrobat-function (as-date-set-local-time-offset "ASDateSetLocalTimeOffset")
                         *g-as-extra-version*
                         +as-extra-hft-version-6+
                         as-date-set-local-time-offset-selproto
                         *g-as-extra-hft*
                         +as-date-set-local-time-offset-sel+)
;; line 278
(define-acrobat-function (as-date-set-time-from-string "ASDateSetTimeFromString")
                         *g-as-extra-version*
                         +as-extra-hft-version-6+
                         as-date-set-time-from-string-selproto
                         *g-as-extra-hft*
                         +as-date-set-time-from-string-sel+)
;; line 279
(define-acrobat-function (as-date-set-time-from-rec "ASDateSetTimeFromRec")
                         *g-as-extra-version*
                         +as-extra-hft-version-6+
                         as-date-set-time-from-rec-selproto
                         *g-as-extra-hft*
                         +as-date-set-time-from-rec-sel+)
;; line 280
(define-acrobat-function (as-date-subtract-calendar-time-span "ASDateSubtractCalendarTimeSpan")
                         *g-as-extra-version*
                         +as-extra-hft-version-6+
                         as-date-subtract-calendar-time-span-selproto
                         *g-as-extra-hft*
                         +as-date-subtract-calendar-time-span-sel+)
;; line 281
(define-acrobat-function (as-date-add-calendar-time-span "ASDateAddCalendarTimeSpan")
                         *g-as-extra-version*
                         +as-extra-hft-version-6+
                         as-date-add-calendar-time-span-selproto
                         *g-as-extra-hft*
                         +as-date-add-calendar-time-span-sel+)
;; line 282
(define-acrobat-function (as-date-subtract-time-span "ASDateSubtractTimeSpan")
                         *g-as-extra-version*
                         +as-extra-hft-version-6+
                         as-date-subtract-time-span-selproto
                         *g-as-extra-hft*
                         +as-date-subtract-time-span-sel+)
;; line 283
(define-acrobat-function (as-date-add-time-span "ASDateAddTimeSpan")
                         *g-as-extra-version*
                         +as-extra-hft-version-6+
                         as-date-add-time-span-selproto
                         *g-as-extra-hft*
                         +as-date-add-time-span-sel+)
;; line 284
(define-acrobat-function (as-date-calendar-diff "ASDateCalendarDiff")
                         *g-as-extra-version*
                         +as-extra-hft-version-6+
                         as-date-calendar-diff-selproto
                         *g-as-extra-hft*
                         +as-date-calendar-diff-sel+)
;; line 285
(define-acrobat-function (as-date-exact-diff "ASDateExactDiff")
                         *g-as-extra-version*
                         +as-extra-hft-version-6+
                         as-date-exact-diff-selproto
                         *g-as-extra-hft*
                         +as-date-exact-diff-sel+)
;; line 286
(define-acrobat-function (as-date-get-time-string "ASDateGetTimeString")
                         *g-as-extra-version*
                         +as-extra-hft-version-6+
                         as-date-get-time-string-selproto
                         *g-as-extra-hft*
                         +as-date-get-time-string-sel+)
;; line 287
(define-acrobat-function (as-date-get-utctime "ASDateGetUTCTime")
                         *g-as-extra-version*
                         +as-extra-hft-version-6+
                         as-date-get-utctime-selproto
                         *g-as-extra-hft*
                         +as-date-get-utctime-sel+)
;; line 288
(define-acrobat-function (as-date-get-local-time-no-dst "ASDateGetLocalTimeNoDST")
                         *g-as-extra-version*
                         +as-extra-hft-version-6+
                         as-date-get-local-time-no-dst-selproto
                         *g-as-extra-hft*
                         +as-date-get-local-time-no-dst-sel+)
;; line 289
(define-acrobat-function (as-date-get-local-time "ASDateGetLocalTime")
                         *g-as-extra-version*
                         +as-extra-hft-version-6+
                         as-date-get-local-time-selproto
                         *g-as-extra-hft*
                         +as-date-get-local-time-sel+)
;; line 290
(define-acrobat-function (as-calendar-time-span-compare "ASCalendarTimeSpanCompare")
                         *g-as-extra-version*
                         +as-extra-hft-version-6+
                         as-calendar-time-span-compare-selproto
                         *g-as-extra-hft*
                         +as-calendar-time-span-compare-sel+)
;; line 291
(define-acrobat-function (as-time-span-compare "ASTimeSpanCompare")
                         *g-as-extra-version*
                         +as-extra-hft-version-6+
                         as-time-span-compare-selproto
                         *g-as-extra-hft*
                         +as-time-span-compare-sel+)
;; line 292
(define-acrobat-function (as-calendar-time-span-add-with-base "ASCalendarTimeSpanAddWithBase")
                         *g-as-extra-version*
                         +as-extra-hft-version-6+
                         as-calendar-time-span-add-with-base-selproto
                         *g-as-extra-hft*
                         +as-calendar-time-span-add-with-base-sel+)
;; line 293
(define-acrobat-function (as-time-span-add "ASTimeSpanAdd")
                         *g-as-extra-version*
                         +as-extra-hft-version-6+
                         as-time-span-add-selproto
                         *g-as-extra-hft*
                         +as-time-span-add-sel+)
;; line 294
(define-acrobat-function (as-calendar-time-span-diff "ASCalendarTimeSpanDiff")
                         *g-as-extra-version*
                         +as-extra-hft-version-6+
                         as-calendar-time-span-diff-selproto
                         *g-as-extra-hft*
                         +as-calendar-time-span-diff-sel+)
;; line 295
(define-acrobat-function (as-time-span-diff "ASTimeSpanDiff")
                         *g-as-extra-version*
                         +as-extra-hft-version-6+
                         as-time-span-diff-selproto
                         *g-as-extra-hft*
                         +as-time-span-diff-sel+)
;; line 296
(define-acrobat-function (as-date-compare "ASDateCompare")
                         *g-as-extra-version*
                         +as-extra-hft-version-6+
                         as-date-compare-selproto
                         *g-as-extra-hft*
                         +as-date-compare-sel+)
;; line 297
(define-acrobat-function (as-time-span-set-from-as-int32 "ASTimeSpanSetFromASInt32")
                         *g-as-extra-version*
                         +as-extra-hft-version-6+
                         as-time-span-set-from-as-int32-selproto
                         *g-as-extra-hft*
                         +as-time-span-set-from-as-int32-sel+)
;; line 298
(define-acrobat-function (as-time-span-set-from-string "ASTimeSpanSetFromString")
                         *g-as-extra-version*
                         +as-extra-hft-version-6+
                         as-time-span-set-from-string-selproto
                         *g-as-extra-hft*
                         +as-time-span-set-from-string-sel+)
;; line 299
(define-acrobat-function (as-time-span-set "ASTimeSpanSet")
                         *g-as-extra-version*
                         +as-extra-hft-version-6+
                         as-time-span-set-selproto
                         *g-as-extra-hft*
                         +as-time-span-set-sel+)
;; line 300
(define-acrobat-function (as-time-span-negate "ASTimeSpanNegate")
                         *g-as-extra-version*
                         +as-extra-hft-version-6+
                         as-time-span-negate-selproto
                         *g-as-extra-hft*
                         +as-time-span-negate-sel+)
;; line 303
(define-acrobat-function (as-text-eval "ASTextEval")
                         *g-as-extra-version*
                         +as-extra-hft-version-6+
                         as-text-eval-selproto
                         *g-as-extra-hft*
                         +as-text-eval-sel+)
;; line 304
(define-acrobat-function (as-file-sys-get-item-props-as-cab "ASFileSysGetItemPropsAsCab")
                         *g-as-extra-version*
                         +as-extra-hft-version-6+
                         as-file-sys-get-item-props-as-cab-selproto
                         *g-as-extra-hft*
                         +as-file-sys-get-item-props-as-cab-sel+)
;; line 305
(define-acrobat-function (as-file-sys-convert-cab-to-item-props "ASFileSysConvertCabToItemProps")
                         *g-as-extra-version*
                         +as-extra-hft-version-6+
                         as-file-sys-convert-cab-to-item-props-selproto
                         *g-as-extra-hft*
                         +as-file-sys-convert-cab-to-item-props-sel+)
;; line 306
(define-acrobat-function (as-file-sys-convert-item-props-to-cab "ASFileSysConvertItemPropsToCab")
                         *g-as-extra-version*
                         +as-extra-hft-version-6+
                         as-file-sys-convert-item-props-to-cab-selproto
                         *g-as-extra-hft*
                         +as-file-sys-convert-item-props-to-cab-sel+)
;; line 307
(define-acrobat-function (as-file-sys-can-perform-op-on-item "ASFileSysCanPerformOpOnItem")
                         *g-as-extra-version*
                         +as-extra-hft-version-6+
                         as-file-sys-can-perform-op-on-item-selproto
                         *g-as-extra-hft*
                         +as-file-sys-can-perform-op-on-item-sel+)
;; line 308
(define-acrobat-function (as-file-sys-perform-op-on-item "ASFileSysPerformOpOnItem")
                         *g-as-extra-version*
                         +as-extra-hft-version-6+
                         as-file-sys-perform-op-on-item-selproto
                         *g-as-extra-hft*
                         +as-file-sys-perform-op-on-item-sel+)
;; line 310
(define-acrobat-function (as-is-valid-utf8 "ASIsValidUTF8")
                         *g-as-extra-version*
                         +as-extra-hft-version-6+
                         as-is-valid-utf8-selproto
                         *g-as-extra-hft*
                         +as-is-valid-utf8-sel+)
;; line 311
(define-acrobat-function (as-text-case-sensitive-cmp "ASTextCaseSensitiveCmp")
                         *g-as-extra-version*
                         +as-extra-hft-version-6+
                         as-text-case-sensitive-cmp-selproto
                         *g-as-extra-hft*
                         +as-text-case-sensitive-cmp-sel+)
;; line 313
(define-acrobat-function (as-const-cab-enum "ASConstCabEnum")
                         *g-as-extra-version*
                         +as-extra-hft-version-6+
                         as-const-cab-enum-selproto
                         *g-as-extra-hft*
                         +as-const-cab-enum-sel+)
;; line 315
(define-acrobat-function (as-text-filter "ASTextFilter")
                         *g-as-extra-version*
                         +as-extra-hft-version-6+
                         as-text-filter-selproto
                         *g-as-extra-hft*
                         +as-text-filter-sel+)
;; line 317
(define-acrobat-function (as-time-span-get-as-int32 "ASTimeSpanGetASInt32")
                         *g-as-extra-version*
                         +as-extra-hft-version-6+
                         as-time-span-get-as-int32-selproto
                         *g-as-extra-hft*
                         +as-time-span-get-as-int32-sel+)
;; line 319
(define-acrobat-function (as-cab-get-int64 "ASCabGetInt64")
                         *g-as-extra-version*
                         +as-extra-hft-version-7+
                         as-cab-get-int64-selproto
                         *g-as-extra-hft*
                         +as-cab-get-int64-sel+)
;; line 320
(define-acrobat-function (as-cab-put-int64 "ASCabPutInt64")
                         *g-as-extra-version*
                         +as-extra-hft-version-7+
                         as-cab-put-int64-selproto
                         *g-as-extra-hft*
                         +as-cab-put-int64-sel+)
;; line 321
(define-acrobat-function (as-cab-get-uns64 "ASCabGetUns64")
                         *g-as-extra-version*
                         +as-extra-hft-version-7+
                         as-cab-get-uns64-selproto
                         *g-as-extra-hft*
                         +as-cab-get-uns64-sel+)
;; line 322
(define-acrobat-function (as-cab-put-uns64 "ASCabPutUns64")
                         *g-as-extra-version*
                         +as-extra-hft-version-7+
                         as-cab-put-uns64-selproto
                         *g-as-extra-hft*
                         +as-cab-put-uns64-sel+)
;; line 326
(define-acrobat-function (as-text-make-empty-clear "ASTextMakeEmptyClear")
                         *g-as-extra-version*
                         +as-extra-hft-version-9+
                         as-text-make-empty-clear-selproto
                         *g-as-extra-hft*
                         +as-text-make-empty-clear-sel+)
;; line 327
(define-acrobat-function (as-ucs-get-password-from-unicode "ASUCS_GetPasswordFromUnicode")
                         *g-as-extra-version*
                         +as-extra-hft-version-9+
                         as-ucs-get-password-from-unicode-selproto
                         *g-as-extra-hft*
                         +as-ucs-get-password-from-unicode-sel+)
(defconstant +as-extra-bad-selector+ 0)
(defconstant +as-extra-num-selectorsplus-one+ 1)

;; #include <PDBasicExpT.h>
;; line 57
(define-opaque-pointer pd-doc -t-pddoc)
;; line 77
(define-opaque-pointer pd-page -t-pdpage)
;; line 96
(define-opaque-pointer pd-font -t-pdf-ont)
;; line 103
(define-opaque-pointer pd-content -t-pdcontent)
;; line 113
(define-opaque-pointer pd-thumb -t-pdthumb)
;; line 120
(define-opaque-pointer pd-text-select -t-pdtext-select)
;; line 144
(define-opaque-pointer pd-res-tree -t-pdres-tree)

;; #include <PDExpT.h>
;; line 51
(define-c-typedef pd-page-number as-int32)
;; line 57
(define-c-typedef pd-small-flag-bits as-uns16)
;; line 62
(define-c-typedef pd-font-metric as-uns16)
;; line 67
(define-c-typedef pd-font-angle as-int16)
;; line 72
(define-c-typedef pd-font-offset as-int16)
;; line 77
(define-c-typedef pd-i-font-metric as-int16)
;; line 82
(define-c-typedef pd-image-scalar as-int32)
;; line 85
(define-c-typedef pd-doc-version as-int16)
;; line 93
(define-c-typedef pd-doc-flags as-int32)
;; line 96
(define-c-typedef pd-char-offset as-uns16)
;; line 101
(define-c-typedef pd-count as-int32)
;; line 124
(define-c-typedef pd-action opaque-64-bits)
;; line 126
(define-opaque-pointer pd-action-handler -t-pdaction-handler)
;; line 127
(define-opaque-pointer pd-action-clipboard-data
                       -t-pdaction-clipboard-data)
;; line 137
(define-c-typedef pd-action-handler-data (:pointer :void))
;; line 318
(define-c-typedef pd-annot opaque-64-bits)
;; line 340
(define-c-typedef pd-text-annot opaque-64-bits)
;; line 361
(define-c-typedef pd-link-annot opaque-64-bits)
;; line 527
(define-opaque-pointer pd-annot-handler -t-pdannot-handler)
;; line 537
(define-opaque-pointer pd-annot-clipboard-data
                       -t-pdannot-clipboard-data)
;; line 540
(define-c-typedef pd-annot-handler-clipboard-data (:pointer :void))
;; line 556
(define-c-typedef pd-annot-print-op as-enum16)
;; line 919
(define-c-typedef pd-color-space as-enum8)
;; line 953
(define-opaque-pointer pd-const-color-value -t-pdcolor-value-rec)
;; line 1015
(define-c-typedef pd-operation as-enum8)
;; line 1084
(define-c-typedef pd-bookmark opaque-64-bits)
;; line 1097
(define-c-typedef pd-bookmark-flags as-enum8)
;; line 1120
(define-c-typedef pd-file-spec opaque-64-bits)
;; line 1427
(define-c-typedef pd-perms as-uns32)
;; line 1496
(define-c-typedef pd-save-flags as-enum16)
;; line 1597
(define-c-typedef pd-save-flags2 as-flag-bits)
;; line 1801
(define-opaque-pointer pd-doc-save-params -t-pddoc-save-params)
;; line 1886
(define-opaque-pointer pd-doc-insert-pages-params
                       -t-pddoc-insert-pages-params)
;; line 1894
(define-opaque-pointer pd-doc-open-params -t-pddoc-open-params)
;; line 1972
(define-c-typedef pd-page-mode as-enum8)
;; line 2009
(define-c-typedef pd-layout-mode as-enum8)
;; line 2112
(define-opaque-pointer pd-find -t-pdf-ind)
;; line 2139
(define-c-typedef pd-find-flags as-enum8)
;; line 2241
(define-c-typedef pd-font-encoding as-enum8)
;; line 2243
(define-c-typedef pd-last-one-byte-encoding pd-last-known-encoding)
;; line 2244
(define-c-typedef pd-unicode-encoding pd-last-known-encoding)
;; line 2267
(define-c-typedef pd-char-set as-enum8)
;; line 2405
(define-c-typedef pd-rotate as-enum16)
;; line 2421
(define-opaque-pointer pd-xobject -t-pdxobject)
;; line 2424
(define-opaque-pointer pd-char-proc -t-pdchar-proc)
;; line 2449
(define-c-typedef pd-path-segment-op as-enum8)
;; line 2475
(define-c-typedef pd-path-paint-op as-enum8)
;; line 2658
(define-opaque-pointer pd-resource-enum-monitor
                       -t-pdresource-enum-monitor)
;; line 2796
(define-opaque-pointer pd-graphic-enum-monitor
                       -t-pdgraphic-enum-monitor)
;; line 2945
(define-opaque-pointer pd-path-enum-monitor -t-pdpath-enum-monitor)
;; line 3144
(define-c-typedef pd-thread opaque-64-bits)
;; line 3158
(define-c-typedef pd-bead opaque-64-bits)
;; line 3234
(define-opaque-pointer pd-thumb-creation-server
                       -t-pdthumb-creation-server)
;; line 3276
(define-c-typedef pd-view-destination opaque-64-bits)
;; line 3278
(define-c-typedef pd-structure-destination opaque-64-bits)
;; line 3301
(define-opaque-pointer pd-word-finder -t-pdword-finder)
;; line 3310
(define-opaque-pointer pd-word -t-pdword)
;; line 3317
(define-opaque-pointer pd-style -t-pdstyle)
;; line 3954
(define-c-typedef pd-trans opaque-64-bits)
;; line 4011
(define-c-typedef pd-perm-req-status as-int16)
;; line 4076
(define-c-typedef pd-perm-req-obj as-uns32)
;; line 4156
(define-c-typedef pd-perm-req-opr as-uns32)
;; line 5055
(define-c-typedef pd-crypt-filter-string-proc cos-crypt-string-proc)
;; line 5102
(define-opaque-pointer pd-crypt-filter-handler
                       -t-pdcrypt-filter-handler)
;; line 5198
(define-opaque-pointer pd-crypt-batch-handler -t-pdcrypt-batch-handler)
;; line 5430
(define-opaque-pointer pd-crypt-handler -t-pdcrypt-handler)
;; line 5450
(define-c-typedef pd-name-tree opaque-64-bits)
;; line 5465
(define-c-typedef pd-num-tree opaque-64-bits)
;; line 5485
(define-c-typedef pd-page-label opaque-64-bits)
;; line 5531
(define-c-typedef pd-print-what as-enum8)
;; line 5541
(define-opaque-pointer pd-ocg -t-pdocg)
;; line 5546
(define-opaque-pointer pd-ocmd -t-pdocmd)
;; line 5559
(define-opaque-pointer pd-occontext -t-pdoccontext)
;; line 5568
(define-opaque-pointer pd-occonfig -t-pdocconfig)
;; line 5584
(define-c-typedef pd-ocmdvis-policy as-uns8)
;; line 5599
(define-c-typedef pd-occontext-init-policy as-uns8)
;; line 5616
(define-c-typedef pd-occonfig-base-state as-uns8)
;; line 5656
(define-c-typedef pd-ocdraw-enum-type as-uns8)
;; line 5674
(define-c-typedef pd-occontext-change-type as-uns8)
;; line 5717
(define-c-typedef pd-doc-occhange-type as-uns8)
;; line 5758
(define-c-typedef pd-join-style as-enum8)
;; line 5767
(define-c-typedef pd-end-style as-enum8)
;; line 5775
(define-c-typedef pd-placement-types as-enum8)
;; line 6268
(define-c-typedef pd-page-area as-enum16)
;; line 6428
(define-c-typedef pd-doc-request-reason as-enum8)
;; line 6460
(define-opaque-pointer pd-efont -t-pdefont)
;; line 6468
(define-c-typedef pd-horiz-align as-enum8)
;; line 6475
(define-c-typedef pd-vert-align as-enum8)
;; line 6674
(define-c-typedef pd-page-draw-flags-pi as-uns32)
;; line 6902
(define-c-typedef pd-file-attachment opaque-64-bits)
;; line 6931
(define-c-typedef pd-collection opaque-64-bits)
;; line 6940
(define-c-typedef pd-navigator opaque-64-bits)
;; line 6951
(define-c-typedef pd-collection-view-type as-uns16)
;; line 6966
(define-c-typedef pd-collection-split-type as-uns16)
;; line 6996
(define-opaque-pointer pd-collection-schema cpdcollection-schema)
;; line 7019
(define-c-typedef pd-folder opaque-64-bits)
(defconstant +k-pdannot-print-standard+ 1)
(defconstant +k-pdannot-print-variable-data+ 2)
(defconstant +pd-device-gray+ 0)
(defconstant +pd-device-rgb+ 1)
(defconstant +pd-device-cmyk+ 2)
(defconstant +pd-op-insert-pages+ 0)
(defconstant +pd-op-delete-pages+ 1)
(defconstant +pd-op-replace-pages+ 2)
(defconstant +pd-op-move-pages+ 3)
(defconstant +pd-op-rotate-pages+ 4)
(defconstant +pd-op-crop-pages+ 5)
(defconstant +pd-op-add-resources+ 6)
(defconstant +pd-op-remove-resources+ 7)
(defconstant +pd-op-add-contents+ 8)
(defconstant +pd-op-remove-contents+ 9)
(defconstant +pd-op-set-media-box+ 10)
(defconstant +pd-op-set-bleed-box+ 11)
(defconstant +pd-op-set-trim-box+ 12)
(defconstant +pd-op-set-art-box+ 13)
(defconstant +pd-op-set-tab-order+ 14)
(defconstant +k-pdbookmark-font-normal+ 0)
(defconstant +k-pdbookmark-font-italic+ 1)
(defconstant +k-pdbookmark-font-bold+ 2)
(defconstant +k-pdbookmark-font-bold-italic+ 3)
(defconstant +pd-save-incremental+ 0)
(defconstant +pd-save-full+ 1)
(defconstant +pd-save-copy+ 2)
(defconstant +invalidated+ 3)
(defconstant +pd-save-linearized+ 4)
(defconstant +pd-save-with-psheader+ 8)
(defconstant +pd-save-binary-ok+ 16)
(defconstant +pd-save-collect-garbage+ 32)
(defconstant +pd-save-force-incremental+ 64)
(defconstant +pd-save-keep-mod-date+ 128)
(defconstant +pd-save-leave-open+ 256)
(defconstant +pd-save-reserved0x200+ 512)
(defconstant +pd-save-uncompressed+ 1)
(defconstant +pd-save-compressed+ 1)
(defconstant +pd-save-compress-structure-only+ 1)
(defconstant +pd-save-remove-as-ciifilters+ 1)
(defconstant +pd-save-add-flate+ 1)
(defconstant +pd-save-replace-lzw+ 1)
(defconstant +pd-save-optimize-xobjects+ 1)
(defconstant +pd-save-optimize-content-streams+ 1)
(defconstant +pd-save-optimize-fonts+ 1)
(defconstant +pd-save-optimize-marked-jbig2dictionaries+ 1)
(defconstant +pd-save-ensure7bit-as-cii+ 1)
(defconstant +pd-save-auto-save+ 1)
(defconstant +pd-save-override-collections+ 1)
(defconstant +pd-dont-care+ 0)
(defconstant +pd-use-none+ 1)
(defconstant +pd-use-thumbs+ 2)
(defconstant +pd-use-bookmarks+ 3)
(defconstant +pd-full-screen+ 4)
(defconstant +pd-contents+ 5)
(defconstant +pd-use-oc+ 6)
(defconstant +pd-use-attachments+ 7)
(defconstant +file+ 0)
(defconstant +preference+ 1)
(defconstant +pd-layout-dont-care+ 2)
(defconstant +pd-layout-single-page+ 3)
(defconstant +pd-layout-one-column+ 4)
(defconstant +pd-layout-two-column-left+ 5)
(defconstant +pd-layout-two-column-right+ 6)
(defconstant +pd-layout-two-page-left+ 7)
(defconstant +pd-layout-two-page-right+ 8)
(defconstant +pd-doc-needs-save+ 1)
(defconstant +pd-doc-requires-full-save+ 2)
(defconstant +pd-doc-is-modified+ 4)
(defconstant +pd-doc-delete-on-close+ 8)
(defconstant +pd-doc-was-repaired+ 16)
(defconstant +pd-doc-new-major-version+ 32)
(defconstant +pd-doc-new-minor-version+ 64)
(defconstant +pd-doc-old-version+ 128)
(defconstant +pd-doc-suppress-errors+ 256)
(defconstant +pd-doc-is-embedded+ 512)
(defconstant +pd-doc-is-linearized+ 1024)
(defconstant +pd-doc-is-optimized+ 2048)
(defconstant +pd-doc-is-pxdf+ 4096)
(defconstant +pd-doc-is-open+ 8192)
(defconstant +pd-insert-bookmarks+ 1)
(defconstant +pd-insert-all+ 4096)
(defconstant +pd-insert-threads+ 2)
(define-c-typedef pd-insert-flags :int)
(defconstant +pd-find-whole-words+ 1)
(defconstant +pd-find-case-sens+ 2)
(defconstant +pd-find-reverse+ 4)
(defconstant +pd-find-all-on-page+ 8)
(defconstant +pd-find-ignore-fh+ 256)
(defconstant +pd-find-ignore-diacritics+ 512)
(defconstant +pd-find-reset+ 2048)
(defconstant +pd-built-in-encoding+ -1)
(defconstant +pd-mac-roman-encoding+ 0)
(defconstant +pd-mac-expert-encoding+ 1)
(defconstant +pd-win-ansi-encoding+ 2)
(defconstant +pd-std-encoding+ 3)
(defconstant +pd-fdoc-encoding+ 4)
(defconstant +pd-last-known-encoding+ 5)
(defconstant +pd-unknown-char-set+ 0)
(defconstant +pd-standard-roman-char-set+ 1)
(defconstant +pd-adobe-expert-char-set+ 2)
(defconstant +pd-last-char-set+ 3)
(defconstant +pd-rotate0+ 0)
(defconstant +pd-rotate90+ 90)
(defconstant +pd-rotate180+ 180)
(defconstant +pd-rotate270+ 270)
(defconstant +pd-seg-move-to+ 0)
(defconstant +pd-seg-line-to+ 1)
(defconstant +pd-seg-curve-to+ 2)
(defconstant +pd-seg-vcurve-to+ 3)
(defconstant +pd-seg-ycurve-to+ 4)
(defconstant +pd-seg-rect+ 5)
(defconstant +pd-seg-close-path+ 6)
(defconstant +pd-path-no-paint+ 0)
(defconstant +pd-path-op-close+ 1)
(defconstant +pd-path-stroke+ 2)
(defconstant +pd-path-fill+ 4)
(defconstant +pd-path-eof-ill+ 8)
(defconstant +pd-path-clip+ 16)
(defconstant +pd-path-eoclip+ 32)
(defconstant +pd-perm-req-obj-doc+ 1)
(defconstant +pd-perm-req-obj-page+ 2)
(defconstant +pd-perm-req-obj-link+ 3)
(defconstant +pd-perm-req-obj-bookmark+ 4)
(defconstant +pd-perm-req-obj-thumbnail+ 5)
(defconstant +pd-perm-req-obj-annot+ 6)
(defconstant +pd-perm-req-obj-form+ 7)
(defconstant +pd-perm-req-obj-signature+ 8)
(defconstant +pd-perm-req-obj-ef+ 9)
(defconstant +pd-perm-req-obj-reader-annot+ 10)
(defconstant +pd-perm-req-obj-last+ 11)
(defconstant +pd-perm-req-opr-all+ 1)
(defconstant +pd-perm-req-opr-create+ 2)
(defconstant +pd-perm-req-opr-delete+ 3)
(defconstant +pd-perm-req-opr-modify+ 4)
(defconstant +pd-perm-req-opr-copy+ 5)
(defconstant +pd-perm-req-opr-accessible+ 6)
(defconstant +pd-perm-req-opr-select+ 7)
(defconstant +pd-perm-req-opr-open+ 8)
(defconstant +pd-perm-req-opr-secure+ 9)
(defconstant +pd-perm-req-opr-print-high+ 10)
(defconstant +pd-perm-req-opr-print-low+ 11)
(defconstant +pd-perm-req-opr-fill-in+ 12)
(defconstant +pd-perm-req-opr-rotate+ 13)
(defconstant +pd-perm-req-opr-crop+ 14)
(defconstant +pd-perm-req-opr-summarize+ 15)
(defconstant +pd-perm-req-opr-insert+ 16)
(defconstant +pd-perm-req-opr-replace+ 17)
(defconstant +pd-perm-req-opr-reorder+ 18)
(defconstant +pd-perm-req-opr-full-save+ 19)
(defconstant +pd-perm-req-opr-import+ 20)
(defconstant +pd-perm-req-opr-export+ 21)
(defconstant +pd-perm-req-opr-any+ 22)
(defconstant +pd-perm-req-opr-unknown-opr+ 23)
(defconstant +pd-perm-req-opr-submit-standalone+ 24)
(defconstant +pd-perm-req-opr-spawn-template+ 25)
(defconstant +pd-perm-req-opr-online+ 26)
(defconstant +pd-perm-req-opr-summary-view+ 27)
(defconstant +pd-perm-req-opr-barcode-plaintext+ 28)
(defconstant +pd-perm-req-opr-uisave+ 29)
(defconstant +pd-perm-req-opr-uiprint+ 30)
(defconstant +pd-perm-req-opr-uiemail+ 31)
(defconstant +pd-perm-req-opr-last+ 32)
(defconstant +k-gchttip-text+ 1)
(defconstant +k-gchtmini-text+ 2)
(defconstant +k-gchtlarge-text+ 3)
(define-c-typedef gchtext-type :int)
(defconstant +pd-print-what-document+ 0)
(defconstant +pd-print-what-document-and-comments+ 1)
(defconstant +pd-print-what-document-and-stamps+ 2)
(defconstant +pd-print-what-form-fields-only+ 3)
(defconstant +pd-print-what-count+ 4)
(defconstant +pd-print-what-min+ +pd-print-what-document+)
(defconstant +k-ocmdvisibility-all-on+ 0)
(defconstant +k-ocmdvisibility-any-on+ 1)
(defconstant +k-ocmdvisibility-any-off+ 2)
(defconstant +k-ocmdvisibility-all-off+ 3)
(defconstant +k-occinit-off+ 0)
(defconstant +k-occinit-on+ 1)
(defconstant +k-occinit-from-other-context+ 2)
(defconstant +k-occinit-from-config+ 3)
(defconstant +k-pdocbase-state-off+ 0)
(defconstant +k-pdocbase-state-on+ 1)
(defconstant +k-pdocbase-state-unchanged+ 2)
(defconstant +k-pdoc-visible-oc+ 0)
(defconstant +k-pdoc-all-oc+ 1)
(defconstant +k-pdoc-no-oc+ 2)
(defconstant +k-pdoc-last-draw-enum-type+ +k-pdoc-no-oc+)
(defconstant +k-pdocgstate+ 0)
(defconstant +k-pdoccontext-draw-enum-type+ 1)
(defconstant +k-pdoccontext-non-ocdrawing+ 2)
(defconstant +k-pdoccontext-intent+ 3)
(defconstant +k-pdoccontext-init+ 4)
(defconstant +k-pdoc-last-context-change-type+ +k-pdoccontext-init+)
(defconstant +k-pdocgcreate+ 0)
(defconstant +k-pdocgproperties+ 1)
(defconstant +k-pdocgreplace+ 2)
(defconstant +k-pdocgdestroy+ 3)
(defconstant +k-pdocmdattach+ 4)
(defconstant +k-pdocmdremove+ 5)
(defconstant +k-pdocconfig-create+ 6)
(defconstant +k-pdocconfig-change+ 7)
(defconstant +k-pdocconfig-destroy+ 8)
(defconstant +k-pddoc-remove-oc+ 9)
(defconstant +k-pdoc-last-doc-change-type+ +k-pddoc-remove-oc+)
(defconstant +k-pdjoin-miter+ 0)
(defconstant +k-pdjoin-round+ 1)
(defconstant +k-pdjoin-bevel+ 2)
(defconstant +k-pdend-miter+ 0)
(defconstant +k-pdend-overlap+ 1)
(defconstant +k-pdplacement-center+ 0)
(defconstant +k-pdplacement-choke+ 1)
(defconstant +k-pdplacement-neutral-density+ 2)
(defconstant +k-pdplacement-spread+ 3)
(defconstant +k-hsemit-font-no-fonts+ 0)
(defconstant +k-hsemit-font-embedded-fonts+ 1)
(defconstant +k-hsemit-font-all-fonts+ 2)
(defconstant +k-emit-plate+ 0)
(defconstant +k-dont-emit-plate+ 1)
(defconstant +k-convert-to-process+ 2)
(defconstant +k-convert-to-alt-space+ 3)
(defconstant +k-normal+ 0)
(defconstant +k-transparent+ 1)
(defconstant +k-opaque-ink+ 2)
(defconstant +k-opaque-ignore+ 3)
(defconstant +k-pddefault-mark-type+ 0)
(defconstant +k-pdin-design-j1mark-type+ 1)
(defconstant +k-pdin-design-j2mark-type+ 2)
(defconstant +k-pdillustrator-mark-type+ 3)
(defconstant +k-pdillustrator-j+ 4)
(defconstant +k-pdquark-xpress+ 5)
(defconstant +k-pdpage-area+ 0)
(defconstant +k-pdclip-area+ 1)
(defconstant +k-pdnum-areas+ 2)
(defconstant +k-pddoc-request-underway+ 0)
(defconstant +k-pddoc-request-complete+ 1)
(defconstant +k-pddoc-request-cancelled+ 2)
(defconstant +k-pddoc-request-error+ 3)
(defconstant +k-pdhoriz-left+ 0)
(defconstant +k-pdhoriz-center+ 1)
(defconstant +k-pdhoriz-right+ 2)
(defconstant +k-pdvert-top+ 0)
(defconstant +k-pdvert-center+ 1)
(defconstant +k-pdvert-bottom+ 2)
(defconstant +k-pdpage-do-lazy-erase-pi+ 1)
(defconstant +k-pdpage-ignore-isolated-and-knockout-transparency-group-pi+ 16)
(defconstant +k-pdpage-use-annot-faces-pi+ 64)
(defconstant +k-pdpage-is-printing-pi+ 128)
(defconstant +k-pdpage-display-over-print-preview-pi+ 256)
(defconstant +k-pdpage-use-trap-annots-pi+ 8192)
(defconstant +k-pdpage-directly-imposed-pi+ 16384)
(defconstant +k-pdpage-is-psprinting-pi+ 32768)
(defconstant +k-pdpage-emit-page-group-pi+ 65536)
(defconstant +k-pdpage-use-printer-mark-annots-pi+ 131072)
(defconstant +k-pdpage-pass-opito-agmport-pi+ 262144)
(defconstant +k-pdpage-pass-metadatato-agmport-pi+ 524288)
(defconstant +k-pdpage-pass-octo-agmport-pi+ 1048576)
(defconstant +k-pdpage-do-not-substitute-working-spaces-pi+ 8388608)
(defconstant +k-pdpage-swap-components-pi+ 16777216)
(defconstant +k-pdpage-suppress-raster-alpha-pi+ 33554432)
(defconstant +k-pdpage-working-spaces-only-for-change-pi+ 67108864)
(defconstant +k-pdpage-use-stamp-annots-only-pi+ 134217728)
(defconstant +k-collection-view-tile+ 4096)
(defconstant +k-collection-view-details+ 4097)
(defconstant +k-collection-view-custom+ 4098)
(defconstant +k-collection-split-default+ 8192)
(defconstant +k-collection-split-horizontal+ 8193)
(defconstant +k-collection-split-vertical+ 8194)
(defconstant +k-collection-split-none+ 8195)
(defconstant +k-collection-split-preview+ 8196)
(define-c-typedef pd-action-handler-get-type-proc
                  (:pointer
                   (:function
                    (pd-action-handler)
                    as-atom
                    :calling-convention
                    :cdecl)))
(define-c-typedef pd-action-handler-can-copy-proc
                  (:pointer
                   (:function
                    (pd-action-handler pd-action)
                    as-bool
                    :calling-convention
                    :cdecl)))
(define-c-typedef pd-action-handler-can-paste-proc
                  (:pointer
                   (:function
                    (pd-action-handler pd-doc pd-action-handler-data)
                    as-bool
                    :calling-convention
                    :cdecl)))
(define-c-typedef pd-action-handler-paste-proc
                  (:pointer
                   (:function
                    (pd-action-handler pd-doc pd-action-handler-data)
                    pd-action
                    :calling-convention
                    :cdecl)))
(define-c-typedef pd-action-handler-destroy-data-proc
                  (:pointer
                   (:function
                    (pd-action-handler pd-action-handler-data)
                    :void
                    :calling-convention
                    :cdecl)))
(define-c-typedef pd-action-handler-destroy-proc
                  (:pointer
                   (:function
                    (pd-action-handler)
                    :void
                    :calling-convention
                    :cdecl)))
(define-c-typedef pd-annot-handler-get-annot-info-proc
                  (:pointer
                   (:function
                    (pd-annot-handler pd-annot pd-page)
                    pd-annot-info
                    :calling-convention
                    :cdecl)))
(define-c-typedef pd-annot-handler-delete-annot-info-proc
                  (:pointer
                   (:function
                    (pd-annot-handler pd-annot-info)
                    :void
                    :calling-convention
                    :cdecl)))
(define-c-typedef pd-annot-handler-get-type-proc
                  (:pointer
                   (:function
                    (pd-annot-handler)
                    as-atom
                    :calling-convention
                    :cdecl)))
(define-c-typedef pd-doc-will-export-annot-proc
                  (:pointer
                   (:function
                    (pd-annot-handler pd-annot pd-annot)
                    as-bool
                    :calling-convention
                    :cdecl)))
(define-c-typedef pd-doc-will-import-annot-proc
                  (:pointer
                   (:function
                    (pd-annot-handler pd-doc pd-page pd-annot)
                    as-bool
                    :calling-convention
                    :cdecl)))
(define-c-typedef pd-annot-will-print-proc
                  (:pointer
                   (:function
                    (pd-annot-handler pd-annot)
                    as-bool
                    :calling-convention
                    :cdecl)))
(define-c-typedef pd-annot-handler-get-annot-info-flags-proc
                  (:pointer
                   (:function
                    (pd-annot-handler pd-annot)
                    as-flag-bits
                    :calling-convention
                    :cdecl)))
(define-c-typedef pd-annot-handler-can-copy-proc
                  (:pointer
                   (:function
                    (pd-annot-handler pd-page pd-annot)
                    as-bool
                    :calling-convention
                    :cdecl)))
(define-c-typedef pd-annot-handler-can-paste-proc
                  (:pointer
                   (:function
                    (pd-annot-handler
                     pd-page
                     (:pointer as-fixed-point)
                     pd-annot-handler-clipboard-data)
                    as-bool
                    :calling-convention
                    :cdecl)))
(define-c-typedef pd-annot-handler-paste-proc
                  (:pointer
                   (:function
                    (pd-annot-handler
                     pd-page
                     (:pointer as-fixed-point)
                     pd-annot-handler-clipboard-data)
                    pd-annot
                    :calling-convention
                    :cdecl)))
(define-c-typedef pd-annot-handler-destroy-data-proc
                  (:pointer
                   (:function
                    (pd-annot-handler pd-annot-handler-clipboard-data)
                    :void
                    :calling-convention
                    :cdecl)))
(define-c-typedef pd-annot-handler-destroy-proc
                  (:pointer
                   (:function
                    (pd-annot-handler)
                    :void
                    :calling-convention
                    :cdecl)))
(define-c-typedef pd-annot-handler-get-heel-point-proc
                  (:pointer
                   (:function
                    (pd-annot-handler
                     pd-annot
                     (:pointer as-fixed-point))
                    :void
                    :calling-convention
                    :cdecl)))
(define-c-typedef pd-annot-handler-get-print-appearance-proc
                  (:pointer
                   (:function
                    (pd-annot-handler
                     pd-annot
                     (:pointer as-fixed-rect)
                     pd-annot-print-op)
                    cos-obj
                    :calling-convention
                    :cdecl)))
(define-c-typedef pd-file-spec-new-from-as-path-proc
                  (:pointer
                   (:function
                    ((:pointer :void) pd-doc as-path-name as-path-name)
                    pd-file-spec
                    :calling-convention
                    :cdecl)))
(define-c-typedef pd-file-spec-acquire-as-path-proc
                  (:pointer
                   (:function
                    ((:pointer :void) pd-file-spec as-path-name)
                    as-path-name
                    :calling-convention
                    :cdecl)))
(define-c-typedef pd-launch-action-proc
                  (:pointer
                   (:function
                    ((:pointer :void) pd-doc pd-action)
                    as-bool
                    :calling-convention
                    :cdecl)))
(define-c-typedef pd-auth-proc
                  (:pointer
                   (:function
                    (pd-doc)
                    as-bool
                    :calling-convention
                    :cdecl)))
(define-c-typedef pd-auth-proc-ex
                  (:pointer
                   (:function
                    (pd-doc (:pointer :void))
                    as-bool
                    :calling-convention
                    :cdecl)))
(define-c-typedef pd-doc-pre-save-proc
                  (:pointer
                   (:function
                    (pd-doc pd-doc-pre-save-info (:pointer :void))
                    :void
                    :calling-convention
                    :cdecl)))
(define-c-typedef pd-doc-pre-write-proc
                  (:pointer
                   (:function
                    (pd-doc (:pointer :void))
                    :void
                    :calling-convention
                    :cdecl)))
(define-c-typedef pd-font-enum-proc
                  (:pointer
                   (:function
                    (pd-font (:pointer pd-font-flags) (:pointer :void))
                    as-bool
                    :calling-convention
                    :cdecl)))
(define-c-typedef pd-resource-enum-font-proc
                  (:pointer
                   (:function
                    (pd-font
                     (:reference-pass :ef-mb-string)
                     (:pointer :void))
                    as-bool
                    :calling-convention
                    :cdecl)))
(define-c-typedef pd-resource-enum-xobject-proc
                  (:pointer
                   (:function
                    (pd-xobject
                     (:reference-pass :ef-mb-string)
                     (:pointer :void))
                    as-bool
                    :calling-convention
                    :cdecl)))
(define-c-typedef pd-resource-enum-proc-set-proc
                  (:pointer
                   (:function
                    ((:reference-pass :ef-mb-string) (:pointer :void))
                    as-bool
                    :calling-convention
                    :cdecl)))
(define-c-typedef pd-resource-enum-color-space-proc
                  (:pointer
                   (:function
                    ((:reference-pass :ef-mb-string)
                     cos-obj
                     (:pointer :void))
                    as-bool
                    :calling-convention
                    :cdecl)))
(define-c-typedef pd-graphic-enum-text-proc
                  (:pointer
                   (:function
                    (pd-text (:pointer :void))
                    as-bool
                    :calling-convention
                    :cdecl)))
(define-c-typedef pd-graphic-enum-path-proc
                  (:pointer
                   (:function
                    (pd-path (:pointer :void))
                    as-bool
                    :calling-convention
                    :cdecl)))
(define-c-typedef pd-graphic-enum-image-proc
                  (:pointer
                   (:function
                    (pd-inline-image (:pointer :void))
                    as-bool
                    :calling-convention
                    :cdecl)))
(define-c-typedef pd-graphic-enum-xobject-ref-proc
                  (:pointer
                   (:function
                    ((:reference-pass :ef-mb-string)
                     (:pointer as-fixed-rect)
                     (:pointer :void))
                    as-bool
                    :calling-convention
                    :cdecl)))
(define-c-typedef pd-graphic-enum-save-proc
                  (:pointer
                   (:function
                    ((:pointer :void))
                    as-bool
                    :calling-convention
                    :cdecl)))
(define-c-typedef pd-graphic-enum-restore-proc
                  (:pointer
                   (:function
                    ((:pointer :void))
                    as-bool
                    :calling-convention
                    :cdecl)))
(define-c-typedef pd-graphic-enum-char-width-proc
                  (:pointer
                   (:function
                    (as-fixed-point (:pointer :void))
                    as-bool
                    :calling-convention
                    :cdecl)))
(define-c-typedef pd-graphic-enum-xobject-ref-matrix-proc
                  (:pointer
                   (:function
                    ((:pointer as-fixed-matrix) (:pointer :void))
                    as-bool
                    :calling-convention
                    :cdecl)))
(define-c-typedef pd-path-move-to-proc
                  (:pointer
                   (:function
                    ((:pointer as-fixed-point) (:pointer :void))
                    as-bool
                    :calling-convention
                    :cdecl)))
(define-c-typedef pd-path-line-to-proc
                  (:pointer
                   (:function
                    ((:pointer as-fixed-point) (:pointer :void))
                    as-bool
                    :calling-convention
                    :cdecl)))
(define-c-typedef pd-path-curve-to-proc
                  (:pointer
                   (:function
                    ((:pointer as-fixed-point)
                     (:pointer as-fixed-point)
                     (:pointer as-fixed-point)
                     (:pointer :void))
                    as-bool
                    :calling-convention
                    :cdecl)))
(define-c-typedef pd-path-vcurve-to-proc
                  (:pointer
                   (:function
                    ((:pointer as-fixed-point)
                     (:pointer as-fixed-point)
                     (:pointer :void))
                    as-bool
                    :calling-convention
                    :cdecl)))
(define-c-typedef pd-path-ycurve-to-proc
                  (:pointer
                   (:function
                    ((:pointer as-fixed-point)
                     (:pointer as-fixed-point)
                     (:pointer :void))
                    as-bool
                    :calling-convention
                    :cdecl)))
(define-c-typedef pd-path-rect-proc
                  (:pointer
                   (:function
                    ((:pointer as-fixed-point)
                     (:pointer as-fixed-point)
                     (:pointer :void))
                    as-bool
                    :calling-convention
                    :cdecl)))
(define-c-typedef pd-path-close-path-proc
                  (:pointer
                   (:function
                    ((:pointer :void))
                    as-bool
                    :calling-convention
                    :cdecl)))
(define-c-typedef pd-string-enum-proc
                  (:pointer
                   (:function
                    (pd-font
                     (:reference-pass :ef-mb-string)
                     as-int32
                     as-fixed
                     (:pointer :void))
                    as-bool
                    :calling-convention
                    :cdecl)))
(define-c-typedef pd-xobject-filter-enum-proc
                  (:pointer
                   (:function
                    ((:reference-pass :ef-mb-string)
                     cos-obj
                     (:pointer :void))
                    as-bool
                    :calling-convention
                    :cdecl)))
(define-c-typedef pd-char-proc-enum-proc
                  (:pointer
                   (:function
                    ((:reference-pass :ef-mb-string)
                     pd-char-proc
                     (:pointer :void))
                    as-bool
                    :calling-convention
                    :cdecl)))
(define-c-typedef pd-get-data-proc
                  (:pointer
                   (:function
                    ((:reference-pass :ef-mb-string)
                     as-uns32
                     (:pointer :void))
                    as-bool
                    :calling-convention
                    :cdecl)))
(define-c-typedef pd-text-select-enum-quad-proc
                  (:pointer
                   (:function
                    ((:pointer :void)
                     as-int32
                     (:pointer as-fixed-quad))
                    as-bool
                    :calling-convention
                    :cdecl)))
(define-c-typedef pd-text-select-enum-text-proc
                  (:pointer
                   (:function
                    ((:pointer :void)
                     pd-font
                     as-fixed
                     pd-color-value
                     (:reference-pass :ef-mb-string)
                     as-int32)
                    as-bool
                    :calling-convention
                    :cdecl)))
(define-c-typedef pd-text-select-enum-rtftext-proc
                  (:pointer
                   (:function
                    ((:pointer :void)
                     pd-font
                     as-fixed
                     pd-color-value
                     (:reference-pass :ef-mb-string)
                     as-uns32
                     as-int32)
                    as-bool
                    :calling-convention
                    :cdecl)))
(define-c-typedef pd-thumb-creation-notify-page-proc
                  (:pointer
                   (:function
                    (as-int32 (:pointer :void))
                    as-bool
                    :calling-convention
                    :cdecl)))
(define-c-typedef pd-thumb-creation-get-thumb-data-proc
                  (:pointer
                   (:function
                    (pd-page
                     as-fixed
                     as-int32
                     as-int32
                     (:pointer :void)
                     (:pointer :void))
                    as-bool
                    :calling-convention
                    :cdecl)))
(define-c-typedef pd-thumb-creation-draw-thumb-proc
                  (:pointer
                   (:function
                    (pd-thumb (:pointer :void))
                    :void
                    :calling-convention
                    :cdecl)))
(define-c-typedef pd-word-proc
                  (:pointer
                   (:function
                    (pd-word-finder pd-word as-int32 (:pointer :void))
                    as-bool
                    :calling-convention
                    :cdecl)))
(define-c-typedef pd-find-translate-string-proc
                  (:pointer
                   (:function
                    ((:reference-pass :ef-mb-string)
                     as-int32
                     pd-word
                     (:pointer :void))
                    as-bool
                    :calling-convention
                    :cdecl)))
(define-c-typedef pd-doc-enum-proc
                  (:pointer
                   (:function
                    (pd-doc (:pointer :void))
                    as-bool
                    :calling-convention
                    :cdecl)))
(define-c-typedef pd-word-finder-ctrl-proc
                  (:pointer
                   (:function
                    (as-uns32 (:pointer :void))
                    as-bool
                    :calling-convention
                    :cdecl)))
(define-c-typedef pd-page-stm-string-overflow-proc
                  (:pointer
                   (:function
                    ((:reference-pass :ef-mb-string)
                     as-size-t
                     (:pointer :void))
                    :void
                    :calling-convention
                    :cdecl)))
(define-c-typedef pd-page-stm-image-data-proc
                  (:pointer
                   (:function
                    ((:pointer as-uns8) as-size-t (:pointer :void))
                    as-bool
                    :calling-convention
                    :cdecl)))
(define-c-typedef pd-crypt-authorize-proc
                  (:pointer
                   (:function
                    (pd-doc (:pointer :void) pd-perms)
                    pd-perms
                    :calling-convention
                    :cdecl)))
(define-c-typedef pd-crypt-get-auth-data-proc
                  (:pointer
                   (:function
                    (pd-doc pd-perms (:pointer (:pointer :void)))
                    as-bool
                    :calling-convention
                    :cdecl)))
(define-c-typedef pd-crypt-validate-security-data-proc
                  (:pointer
                   (:function
                    (pd-doc (:pointer :void))
                    :void
                    :calling-convention
                    :cdecl)))
(define-c-typedef pd-crypt-update-security-data-proc
                  (:pointer
                   (:function
                    (pd-doc
                     (:pointer as-atom)
                     (:pointer (:pointer :void)))
                    as-bool
                    :calling-convention
                    :cdecl)))
(define-c-typedef pd-crypt-new-crypt-data-proc
                  (:pointer
                   (:function
                    (pd-doc
                     (:pointer (:pointer :char))
                     (:pointer as-int32))
                    :void
                    :calling-convention
                    :cdecl)))
(define-c-typedef pd-crypt-fill-encrypt-dict-proc
                  (:pointer
                   (:function
                    (pd-doc cos-obj)
                    :void
                    :calling-convention
                    :cdecl)))
(define-c-typedef pd-crypt-get-security-info-proc
                  (:pointer
                   (:function
                    (pd-doc (:pointer as-uns32))
                    :void
                    :calling-convention
                    :cdecl)))
(define-c-typedef pd-crypt-free-security-data-proc
                  (:pointer
                   (:function
                    (pd-doc (:pointer :void))
                    :void
                    :calling-convention
                    :cdecl)))
(define-c-typedef pd-crypt-free-auth-data-proc
                  (:pointer
                   (:function
                    (pd-doc (:pointer :void))
                    :void
                    :calling-convention
                    :cdecl)))
(define-c-typedef pd-crypt-free-crypt-data-proc
                  (:pointer
                   (:function
                    (pd-doc (:reference-pass :ef-mb-string))
                    :void
                    :calling-convention
                    :cdecl)))
(define-c-typedef pd-crypt-new-crypt-data-ex-proc
                  (:pointer
                   (:function
                    (pd-doc
                     (:pointer (:pointer :char))
                     (:pointer as-int32)
                     (:pointer as-int32))
                    :void
                    :calling-convention
                    :cdecl)))
(define-c-typedef pd-crypt-authorize-ex-proc
                  (:pointer
                   (:function
                    (pd-doc
                     pd-perm-req-obj
                     pd-perm-req-opr
                     (:pointer :void))
                    pd-perm-req-status
                    :calling-convention
                    :cdecl)))
(define-c-typedef pd-crypt-get-auth-data-ex-proc
                  (:pointer
                   (:function
                    (pd-doc
                     pd-perm-req-obj
                     pd-perm-req-opr
                     (:pointer (:pointer :void)))
                    as-bool
                    :calling-convention
                    :cdecl)))
(define-c-typedef pd-crypt-new-security-data-from-original-doc-proc
                  (:pointer
                   (:function
                    (pd-doc
                     cos-obj
                     pd-doc
                     cos-obj
                     (:pointer (:pointer :void)))
                    as-bool
                    :calling-convention
                    :cdecl)))
(define-c-typedef pd-crypt-display-security-data-proc
                  (:pointer
                   (:function
                    (pd-doc as-atom)
                    as-bool
                    :calling-convention
                    :cdecl)))
(define-c-typedef pd-crypt-can-parse-encrypt-dict-proc
                  (:pointer
                   (:function
                    (pd-doc cos-obj)
                    as-bool
                    :calling-convention
                    :cdecl)))
(define-c-typedef pd-crypt-encrypt-doc-metadata
                  (:pointer
                   (:function
                    (pd-doc)
                    as-bool
                    :calling-convention
                    :cdecl)))
(define-c-typedef pd-crypt-batch-show-dialog-proc
                  (:pointer
                   (:function
                    (as-cab)
                    as-bool
                    :calling-convention
                    :cdecl)))
(define-c-typedef pd-crypt-batch-param-desc-proc
                  (:pointer
                   (:function
                    (as-cab as-cab)
                    :void
                    :calling-convention
                    :cdecl)))
(define-c-typedef pd-crypt-batch-authorize-proc
                  (:pointer
                   (:function
                    (pd-doc
                     pd-perm-req-obj
                     pd-perm-req-opr
                     (:pointer :void))
                    pd-perm-req-status
                    :calling-convention
                    :cdecl)))
(define-c-typedef pd-crypt-batch-free-auth-data-proc
                  (:pointer
                   (:function
                    ((:pointer :void))
                    :void
                    :calling-convention
                    :cdecl)))
(define-c-typedef pd-crypt-batch-pre-sequence-proc
                  (:pointer
                   (:function
                    (as-cab)
                    as-bool
                    :calling-convention
                    :cdecl)))
(define-c-typedef pd-crypt-batch-post-sequence-proc
                  (:pointer
                   (:function
                    (as-cab)
                    :void
                    :calling-convention
                    :cdecl)))
(define-c-typedef pd-crypt-batch-update-security-data-proc
                  (:pointer
                   (:function
                    (pd-doc
                     as-cab
                     (:pointer as-atom)
                     (:pointer (:pointer :void)))
                    as-bool
                    :calling-convention
                    :cdecl)))
(define-c-typedef pd-crypt-filter-stream-proc
                  (:pointer
                   (:function
                    (cos-doc
                     as-atom
                     as-crypt-stm
                     as-bool
                     cos-obj
                     as-int32)
                    :void
                    :calling-convention
                    :cdecl)))
(define-c-typedef pd-crypt-filter-authorize-proc
                  (:pointer
                   (:function
                    (cos-doc as-atom cos-obj as-bool as-bool)
                    as-bool
                    :calling-convention
                    :cdecl)))
(define-c-typedef pd-crypt-filter-get-data-proc
                  (:pointer
                   (:function
                    (cos-doc
                     as-atom
                     (:pointer (:pointer :char))
                     as-bool
                     as-bool)
                    as-int32
                    :calling-convention
                    :cdecl)))
(define-c-typedef pd-occonfig-enum-proc
                  (:pointer
                   (:function
                    (pd-occonfig (:pointer :void))
                    as-bool
                    :calling-convention
                    :cdecl)))
(define-c-typedef pd-page-enum-inks-callback
                  (:pointer
                   (:function
                    (pd-page-ink (:pointer :void))
                    as-bool
                    :calling-convention
                    :cdecl)))
(define-c-typedef pd-doc-will-export-annot-callback
                  (:pointer
                   (:function
                    (pd-doc pd-page pd-annot cos-obj)
                    as-bool
                    :calling-convention
                    :cdecl)))
(define-c-typedef pd-doc-will-import-annot-callback
                  (:pointer
                   (:function
                    (pd-doc pd-page pd-annot)
                    as-bool
                    :calling-convention
                    :cdecl)))
(define-c-typedef pd-doc-request-pages-proc
                  (:pointer
                   (:function
                    (pd-doc
                     as-int32
                     as-int32
                     pd-doc-request-reason
                     (:pointer :void))
                    as-int32
                    :calling-convention
                    :cdecl)))
(define-c-typedef pd-doc-request-entire-file-proc
                  (:pointer
                   (:function
                    (pd-doc pd-doc-request-reason (:pointer :void))
                    as-int32
                    :calling-convention
                    :cdecl)))
(define-c-struct pd-action-handler-rec
                 (size as-size-t)
                 (user-data (:pointer :void))
                 (get-type pd-action-handler-get-type-proc)
                 (can-copy pd-action-handler-can-copy-proc)
                 (copy pd-action-handler-copy-proc)
                 (can-paste pd-action-handler-can-paste-proc)
                 (paste pd-action-handler-paste-proc)
                 (destroy-data pd-action-handler-destroy-data-proc)
                 (destroy pd-action-handler-destroy-proc))
(define-c-struct pd-annot-info-rec
                 (size as-size-t)
                 (n-operation-flags as-flag-bits)
                 (c-author (:pointer (:unsigned :byte)))
                 (c-contents (:pointer (:unsigned :byte)))
                 (c-date (:pointer (:unsigned :byte)))
                 (fx-layer as-fixed))
(define-c-typedef pd-annot-info (:pointer pd-annot-info-rec))
(define-c-struct pd-annot-handler-rec
                 (size as-size-t)
                 (user-data (:pointer :void))
                 (get-type pd-annot-handler-get-type-proc)
                 (get-annot-info pd-annot-handler-get-annot-info-proc)
                 (delete-annot-info
                  pd-annot-handler-delete-annot-info-proc)
                 (will-export-annot pd-doc-will-export-annot-proc)
                 (will-import-annot pd-doc-will-import-annot-proc)
                 (will-print-annot pd-annot-will-print-proc)
                 (get-annot-info-flags
                  pd-annot-handler-get-annot-info-flags-proc)
                 (can-copy pd-annot-handler-can-copy-proc)
                 (copy pd-annot-handler-copy-proc)
                 (can-paste pd-annot-handler-can-paste-proc)
                 (paste pd-annot-handler-paste-proc)
                 (destroy-data pd-annot-handler-destroy-data-proc)
                 (destroy pd-annot-handler-destroy-proc)
                 (get-heel-point pd-annot-handler-get-heel-point-proc)
                 (get-print-appearance
                  pd-annot-handler-get-print-appearance-proc))
(define-c-struct pd-color-value-rec (space pd-color-space))
(define-c-typedef pd-color-value (:pointer pd-color-value-rec))
(define-c-struct pd-link-annot-border
                 (h-corner-radius as-int32)
                 (v-corner-radius as-int32)
                 (width as-int32)
                 (dash-array-len as-int32))
(define-c-struct pd-file-spec-handler-rec
                 (size as-size-t)
                 (new-from-as-path pd-file-spec-new-from-as-path-proc)
                 (acquire-as-path pd-file-spec-acquire-as-path-proc)
                 (launch-action pd-launch-action-proc)
                 (file-sys as-file-sys))
(define-c-typedef pd-file-spec-handler
                  (:pointer pd-file-spec-handler-rec))
(define-c-struct pd-doc-pre-save-info-rec
                 (size as-size-t)
                 (callback-proc cos-obj-set-callback-flag-proc))
(define-c-typedef pd-doc-pre-save-info
                  (:pointer pd-doc-pre-save-info-rec))
(define-c-struct pd-doc-save-params-rec
                 (size as-size-t)
                 (save-flags pd-save-flags)
                 (new-path as-path-name)
                 (file-sys as-file-sys)
                 (mon as-progress-monitor)
                 (mon-client-data (:pointer :void))
                 (cancel-proc as-cancel-proc)
                 (cancel-proc-client-data (:pointer :void))
                 (pre-save-proc pd-doc-pre-save-proc)
                 (pre-save-proc-client-data (:pointer :void))
                 (offset-proc cos-obj-offset-proc)
                 (offset-proc-client-data (:pointer :void))
                 (major pd-doc-version)
                 (minor pd-doc-version)
                 (xmppacket-read-only as-bool)
                 (xmppacket-padding-bytes as-int32)
                 (pre-write-proc pd-doc-pre-write-proc)
                 (pre-write-proc-client-data (:pointer :void))
                 (save-flags2 pd-save-flags2)
                 (num-sub-files-to-compact as-uns32)
                 (offset-proc64 cos-obj-offset-proc64))
(define-c-struct pd-doc-insert-pages-params-rec
                 (size as-size-t)
                 (target-doc pd-doc)
                 (insert-after-this-page pd-page-number)
                 (src-doc pd-doc)
                 (src-from-page pd-page-number)
                 (src-to-page pd-page-number)
                 (insert-flags pd-small-flag-bits)
                 (error as-error-code))
(define-c-struct pd-doc-open-params-rec
                 (size as-size-t)
                 (file as-file)
                 (file-name as-path-name)
                 (file-sys as-file-sys)
                 (auth-proc-ex pd-auth-proc-ex)
                 (auth-proc-client-data (:pointer :void))
                 (do-repair as-bool)
                 (restrict-perms pd-perms))
(define-c-struct pd-font-flags (not-used as-int32) (flags as-uns32))
(define-c-struct pd-font-styles
                 (s-family-class-id as-uns8)
                 (s-family-subclass-id as-uns8)
                 (b-family-type as-uns8)
                 (b-serif-style as-uns8)
                 (b-weight as-uns8)
                 (b-proportion as-uns8))
(define-c-struct pd-font-metrics
                 (flags as-flag-bits)
                 (font-bbox as-fixed-rect)
                 (missing-width pd-i-font-metric)
                 (stem-v pd-i-font-metric)
                 (stem-h pd-i-font-metric)
                 (cap-height pd-i-font-metric)
                 (x-height pd-i-font-metric)
                 (ascent pd-i-font-metric)
                 (descent pd-i-font-metric)
                 (leading pd-i-font-metric)
                 (max-width pd-i-font-metric)
                 (avg-width pd-i-font-metric)
                 (italic-angle pd-font-angle)
                 (style pd-font-styles)
                 (base-line-adj pd-font-offset))
(define-c-typedef pd-font-metrics-p (:pointer pd-font-metrics))
(define-c-struct pd-graphic-state
                 (ctm as-fixed-matrix)
                 (fill-cspace as-atom)
                 (stroke-cspace as-atom)
                 (flatness as-fixed)
                 (line-cap as-int32)
                 (dash-phase as-fixed)
                 (dash-len ast-array-size)
                 (line-join as-int32)
                 (line-width as-fixed)
                 (miter-limit as-fixed))
(define-c-typedef pd-graphic-state-p (:pointer pd-graphic-state))
(define-c-struct pd-text-state
                 (font pd-font)
                 (char-spacing as-fixed)
                 (word-spacing as-fixed)
                 (horizontal-scale as-fixed)
                 (leading as-fixed)
                 (text-rise as-fixed)
                 (text-size as-fixed)
                 (render-mode as-int32)
                 (text-matrix as-fixed-matrix))
(define-c-typedef pd-text-state-p (:pointer pd-text-state))
(define-c-struct pd-image-attrs
                 (width pd-image-scalar)
                 (height pd-image-scalar)
                 (bits-per-component pd-count)
                 (image-mask as-bool)
                 (interpolate as-bool)
                 (have-decode as-bool)
                 (color-space-name as-atom)
                 (is-indexed as-bool)
                 (hi-val pd-count)
                 (color-space cos-obj)
                 (data-len ast-array-size)
                 (comps pd-count))
(define-c-typedef pd-image-attrs-p (:pointer pd-image-attrs))
(define-c-struct pd-resource-enum-monitor-rec
                 (size as-size-t)
                 (enum-font pd-resource-enum-font-proc)
                 (enum-xobject pd-resource-enum-xobject-proc)
                 (enum-proc-set pd-resource-enum-proc-set-proc)
                 (enum-color-space pd-resource-enum-color-space-proc))
(define-c-struct pd-graphic-enum-monitor-rec
                 (size as-size-t)
                 (enum-text pd-graphic-enum-text-proc)
                 (enum-path pd-graphic-enum-path-proc)
                 (enum-image pd-graphic-enum-image-proc)
                 (enum-xobject-ref pd-graphic-enum-xobject-ref-proc)
                 (enum-save pd-graphic-enum-save-proc)
                 (enum-restore pd-graphic-enum-restore-proc)
                 (enum-char-width pd-graphic-enum-char-width-proc)
                 (enum-cache-device pd-graphic-enum-cache-device-proc)
                 (enum-xobject-ref-matrix
                  pd-graphic-enum-xobject-ref-matrix-proc))
(define-c-struct pd-path-enum-monitor-rec
                 (size as-size-t)
                 (move-to pd-path-move-to-proc)
                 (line-to pd-path-line-to-proc)
                 (curve-to pd-path-curve-to-proc)
                 (vcurve-to pd-path-vcurve-to-proc)
                 (ycurve-to pd-path-ycurve-to-proc)
                 (rect pd-path-rect-proc)
                 (close-path pd-path-close-path-proc))
(define-c-struct hilite-entry
                 (offset pd-char-offset)
                 (length pd-char-offset))
(define-c-struct pd-text-select-range-rec
                 (start as-int32)
                 (end as-int32)
                 (ofs-start as-int32)
                 (ofs-end as-int32))
(define-c-typedef pd-text-select-range
                  (:pointer pd-text-select-range-rec))
(define-c-struct pd-thumb-creation-server-rec
                 (size as-size-t)
                 (notify-page pd-thumb-creation-notify-page-proc)
                 (get-thumb-data pd-thumb-creation-get-thumb-data-proc)
                 (draw-thumb pd-thumb-creation-draw-thumb-proc))
(define-c-struct pd-chromaticity (x as-fixed) (y as-fixed))
(define-c-struct pd-color-cal
                 (white-chrom pd-chromaticity)
                 (red-chrom pd-chromaticity)
                 (green-chrom pd-chromaticity)
                 (blue-chrom pd-chromaticity)
                 (red-gamma as-fixed)
                 (green-gamma as-fixed)
                 (blue-gamma as-fixed))
(define-c-typedef pd-color-cal-p (:pointer pd-color-cal))
(define-c-struct pd-page-stm-token-rec
                 (size as-size-t)
                 (type cos-type)
                 (flags as-uns32)
                 (i-val as-int32)
                 (s-val-len as-size-t))
(define-c-typedef pd-page-stm-token (:pointer pd-page-stm-token-rec))
(define-c-struct std-security-data-rec
                 (size as-size-t)
                 (new-user-pw as-bool)
                 (has-user-pw as-bool)
                 (user-pw std-password)
                 (new-owner-pw as-bool)
                 (has-owner-pw as-bool)
                 (owner-pw std-password)
                 (perms pd-perms)
                 (key-length int32)
                 (revision int32)
                 (encrypt-metadata as-bool)
                 (encrypt-method int32)
                 (encrypt-attachments-only as-bool)
                 (version int32))
(define-c-typedef std-security-data (:pointer std-security-data-rec))
(define-c-struct pd-crypt-filter-handler-rec
                 (size as-size-t)
                 (authorize pd-crypt-filter-authorize-proc)
                 (get-data pd-crypt-filter-get-data-proc)
                 (decrypt-stream pd-crypt-filter-stream-proc)
                 (encrypt-stream pd-crypt-filter-stream-proc)
                 (decrypt-string pd-crypt-filter-string-proc)
                 (encrypt-string pd-crypt-filter-string-proc)
                 (is-encryption-changed
                  pd-crypt-filter-is-encryption-changed-proc))
(define-c-struct pd-crypt-batch-handler-rec
                 (size as-size-t)
                 (batch-show-dialog pd-crypt-batch-show-dialog-proc)
                 (batch-param-desc pd-crypt-batch-param-desc-proc)
                 (batch-new-auth-data
                  pd-crypt-batch-new-auth-data-proc)
                 (batch-authorize pd-crypt-batch-authorize-proc)
                 (batch-free-auth-data
                  pd-crypt-batch-free-auth-data-proc)
                 (batch-update-security-data
                  pd-crypt-batch-update-security-data-proc)
                 (batch-pre-sequence pd-crypt-batch-pre-sequence-proc)
                 (batch-post-sequence
                  pd-crypt-batch-post-sequence-proc))
(define-c-struct pd-crypt-handler-rec
                 (size as-size-t)
                 (authorize pd-crypt-authorize-proc)
                 (new-auth-data pd-crypt-new-auth-data-proc)
                 (get-auth-data pd-crypt-get-auth-data-proc)
                 (new-security-data pd-crypt-new-security-data-proc)
                 (validate-security-data
                  pd-crypt-validate-security-data-proc)
                 (update-security-data
                  pd-crypt-update-security-data-proc)
                 (new-crypt-data pd-crypt-new-crypt-data-proc)
                 (fill-encrypt-dict pd-crypt-fill-encrypt-dict-proc)
                 (get-security-info pd-crypt-get-security-info-proc)
                 (free-security-data pd-crypt-free-security-data-proc)
                 (free-auth-data pd-crypt-free-auth-data-proc)
                 (free-crypt-data pd-crypt-free-crypt-data-proc)
                 (new-crypt-data-ex pd-crypt-new-crypt-data-ex-proc)
                 (authorize-ex pd-crypt-authorize-ex-proc)
                 (get-auth-data-ex pd-crypt-get-auth-data-ex-proc)
                 (display-security-data
                  pd-crypt-display-security-data-proc)
                 (get-reserved-data pd-crypt-reserved-proc)
                 (crypt-batch-handler pd-crypt-batch-handler)
                 (can-parse-encrypt-dict
                  pd-crypt-can-parse-encrypt-dict-proc)
                 (crypt-filter-handler pd-crypt-filter-handler)
                 (get-doc-perms pd-crypt-get-doc-perms-proc)
                 (encrypt-doc-metadata pd-crypt-encrypt-doc-metadata)
                 (new-security-data-from-org-doc
                  pd-crypt-new-security-data-from-original-doc-proc)
                 (get-info-text pd-crypt-get-info-text-proc)
                 (set-test-perms pd-crypt-reserved-proc2))
(define-c-struct pd-page-range
                 (start-page as-int32)
                 (end-page as-int32)
                 (page-spec as-int32))
(define-c-struct pd-trap-preset-rec
                 (no-trap as-bool)
                 (default-trap as-bool)
                 (trap-width :float)
                 (black-width :float)
                 (image-trap-width :float)
                 (trap-join-style as-uns32)
                 (trap-end-style as-uns32)
                 (step-limit as-uns32)
                 (black-color-limit as-uns32)
                 (black-density-limit :float)
                 (sliding-trap-limit as-uns32)
                 (trap-color-scaling as-uns32)
                 (trap-placement as-uns32)
                 (image-to-image-trapping as-bool)
                 (image-to-object-trapping as-bool)
                 (image-internal-trapping as-bool)
                 (imagemask-trapping as-bool)
                 (trap-style-name as-atom))
(define-c-typedef pd-trap-preset (:pointer pd-trap-preset-rec))
(define-c-struct pd-page-ink-rec
                 (size as-size-t)
                 (colorant-name as-atom)
                 (is-process-color as-bool)
                 (what-to-do as-uns8)
                 (r as-uns8)
                 (g as-uns8)
                 (b as-uns8)
                 (frequency :float)
                 (angle :float)
                 (ink-type as-uns8)
                 (trap-sequence as-int32)
                 (cyan :float)
                 (magenta :float)
                 (yellow :float)
                 (black :float)
                 (density :float)
                 (alias as-atom))
(define-c-typedef pd-page-ink (:pointer pd-page-ink-rec))
(define-c-struct pd-host-seps-plate-rec
                 (size as-size-t)
                 (colorant-name as-atom)
                 (what-to-do as-uns8)
                 (was-color-set as-uns32)
                 (eps-stm as-stm)
                 (file as-file)
                 (path as-path-name)
                 (frequency :float)
                 (angle :float)
                 (ink-type as-uns8)
                 (trap-sequence as-int32)
                 (density :float)
                 (alias as-atom))
(define-c-typedef pd-host-seps-plate (:pointer pd-host-seps-plate-rec))
(define-c-struct pd-host-seps-spec-rec
                 (size as-size-t)
                 (ps-level as-uns32)
                 (binary-ok as-bool)
                 (emit-annots as-bool)
                 (emit-halftones as-bool)
                 (emit-transfer-funcs as-bool)
                 (emit-separable-images-only as-bool)
                 (suppress-cjksubstitution as-bool)
                 (emit-font-option as-enum8)
                 (ttas-t42 as-bool)
                 (printer-has-far-east-fonts as-bool)
                 (transparency-level as-uns32)
                 (use-cmykworking-colorspace as-bool)
                 (convert-to-process-using-opp as-bool)
                 (num-plates as-uns32)
                 (plates (:pointer pd-host-seps-plate))
                 (oc-context pd-occontext)
                 (apply-ocgprint-overrides as-bool)
                 (negative as-bool)
                 (mirrorprint as-enum8)
                 (which-marks as-uns32)
                 (western as-bool)
                 (do-in-rip-trapping as-bool)
                 (marks-style as-int32)
                 (trap-type as-int32)
                 (custom-marks-path as-path-name))
(define-c-typedef pd-host-seps-spec (:pointer pd-host-seps-spec-rec))
(define-c-struct pd-doc-copy-params-rec
                 (size as-size-t)
                 (new-path as-path-name)
                 (file-sys as-file-sys)
                 (prog-mon as-progress-monitor)
                 (prog-mon-data (:pointer :void))
                 (cancel-proc as-cancel-proc)
                 (cancel-proc-data (:pointer :void))
                 (save-changes as-bool))
(define-c-typedef pd-doc-copy-params (:pointer pd-doc-copy-params-rec))
(define-c-struct pd-tile-rec
                 (overlap as-uns32)
                 (center as-bool)
                 (marksflags as-int32)
                 (paper-width as-int32)
                 (paper-height as-int32)
                 (doc-title (:reference-pass :ef-mb-string))
                 (doc-date (:reference-pass :ef-mb-string))
                 (doc-time (:reference-pass :ef-mb-string))
                 (col as-int32)
                 (row as-int32)
                 (num-cols as-int32)
                 (num-rows as-int32)
                 (x-offset as-int32)
                 (y-offset as-int32))
(define-c-typedef pd-tile (:pointer pd-tile-rec))
(define-c-struct pd-annot-array-rec
                 (annot-count ast-array-size)
                 (annots (:pointer pd-annot)))
(define-c-typedef pd-annot-array (:pointer pd-annot-array-rec))
(define-c-struct pd-draw-params-rec
                 (size as-uns32)
                 (window (:pointer :void))
                 (display-context (:pointer :void))
                 (matrix as-fixed-matrix)
                 (flags as-uns32)
                 (update-rect as-fixed-rect)
                 (cancel-proc cancel-proc)
                 (cancel-proc-client-data (:pointer :void))
                 (client-occontext pd-occontext))
(define-c-typedef pd-draw-params (:pointer pd-draw-params-rec))
(define-c-struct pd-graphic-enum-params-rec
                 (size as-uns32)
                 (client-occontext pd-occontext)
                 (used-occontext pd-occontext)
                 (mon pd-graphic-enum-monitor)
                 (mon-obj (:pointer :void)))
(define-c-typedef pd-graphic-enum-params
                  (:pointer pd-graphic-enum-params-rec))
(define-c-struct pd-doc-watermark-text-params-rec
                 (size as-size-t)
                 (src-text as-text)
                 (text-align pd-horiz-align)
                 (pde-font pd-efont)
                 (sys-font-name as-atom)
                 (font-size :float)
                 (color pd-color-value-rec))
(define-c-typedef pd-doc-watermark-text-params
                  (:pointer pd-doc-watermark-text-params-rec))
(define-c-struct pd-redact-params-rec
                 (size as-uns32)
                 (page-num as-int32)
                 (redact-quads (:pointer as-fixed-quad))
                 (num-quads as-uns32)
                 (color-val (:pointer pd-color-value-rec))
                 (overlay-text as-text)
                 (horiz-align pd-horiz-align))
(define-c-typedef pd-redact-params (:pointer pd-redact-params-rec))
(define-c-struct pd-apply-redaction-params-rec
                 (size as-uns32)
                 (redaction-annots (:pointer pd-annot))
                 (redaction-count as-uns32)
                 (keep-marks as-bool)
                 (status-procs as-status-monitor-procs)
                 (progress-text as-text)
                 (progress-duration as-int32))
(define-c-typedef pd-apply-redaction-params
                  (:pointer pd-apply-redaction-params-rec))
(define-c-struct pd-collection-schema-sort-pair-rec
                 (field-name as-atom)
                 (ascending as-bool))
(define-c-struct pd-collection-view-data-rec
                 (size as-size-t)
                 (view pd-collection-view-type)
                 (navigator pd-navigator)
                 (split pd-collection-split-type)
                 (split-pos as-int32))
(define-c-struct pd-collection-field-rec
                 (size as-size-t)
                 (field-name as-atom)
                 (index as-int32)
                 (subtype as-atom)
                 (field-text as-text)
                 (visible as-bool)
                 (can-edit as-bool))
(define-opaque-pointer pd-graphic -t-pdgraphic)
(define-opaque-pointer pd-text -t-pdgraphic)
(define-opaque-pointer pd-path -t-pdgraphic)
(define-opaque-pointer pd-inline-image -t-pdgraphic)

;; #include <AVExpT.h>
;; line 92
(define-c-typedef nselector as-int32)
;; line 150
(define-c-typedef av-prefs-type as-uns8)
;; line 195
(define-c-typedef av-pixel-offset as-int16)
;; line 206
(define-c-typedef av-array-size as-uns16)
;; line 217
(define-c-typedef av-flag-bits16 as-int16)
;; line 228
(define-c-typedef av-flag-bits32 as-uns32)
;; line 231
(define-c-typedef av-mouse-event-code as-int16)
;; line 241
(define-c-typedef av-key-code as-uns16)
;; line 244
(define-c-typedef av-priority as-int16)
;; line 247
(define-c-typedef av-version-num-part as-uns16)
;; line 250
(define-c-typedef av-buffer-size as-uns32)
;; line 253
(define-c-typedef av-drag-type-ex as-int16)
;; line 265
(define-c-typedef av-menu-index as-int32)
;; line 268
(define-c-typedef av-icon-type as-int32)
;; line 275
(define-c-typedef av-filter-index as-int16)
;; line 283
(define-c-typedef av-page-index as-int32)
;; line 286
(define-c-typedef av-cursor-id as-int32)
;; line 311
(define-c-typedef av-tarray-size as-int32)
;; line 318
(define-c-typedef av-tbuffer-size as-int32)
;; line 325
(define-c-typedef av-tsmall-array-size as-int16)
;; line 334
(define-c-typedef av-tflag-bits as-int32)
;; line 340
(define-c-typedef av-tflag-bits16 as-uns16)
;; line 348
(define-c-typedef av-tcount as-int16)
;; line 355
(define-c-typedef av-tversion-num-part as-int16)
;; line 358
(define-c-typedef av-sdk-dependent-integer as-int16)
;; line 368
(define-c-typedef av-dev-size av-sdk-dependent-integer)
;; line 374
(define-c-typedef av-dev-coord av-sdk-dependent-integer)
;; line 382
(define-c-typedef av-window-coord av-sdk-dependent-integer)
;; line 388
(define-c-typedef av-screen-coord av-sdk-dependent-integer)
;; line 407
(define-c-typedef av-icon-id (:reference-pass :ef-mb-string))
;; line 408
(define-c-typedef av-icon (:pointer :void))
;; line 425
(define-c-typedef av-icon-bundle-icon-ref (:pointer :void))
;; line 488
(define-c-typedef av-icon-color-format as-enum16)
;; line 525
(define-c-typedef av-icon-data-format as-enum16)
;; line 549
(define-opaque-pointer av-icon-bundle6 -t-avicon-bundle-rec6)
;; line 790
(define-opaque-pointer av-page-view -t-avpage-view)
;; line 853
(define-c-typedef av-zoom-type as-enum8)
;; line 890
(define-c-typedef av-page-view-control-id as-enum16)
;; line 986
(define-c-typedef av-mouse-event as-enum16)
;; line 1042
(define-opaque-pointer av-doc -t-avdoc)
;; line 1116
(define-c-typedef av-dev-rect av-rect)
;; line 1121
(define-c-typedef av-dev-rect-p av-rect-p)
;; line 1132
(define-c-typedef av-window-rect av-rect)
;; line 1143
(define-c-typedef av-screen-rect av-rect)
;; line 1280
(define-opaque-pointer av-menu -t-avmenu)
;; line 1347
(define-opaque-pointer av-menubar -t-avmenubar)
;; line 1392
(define-opaque-pointer av-menu-item -t-avmenu-item)
;; line 2467
(define-opaque-pointer av-window -t-avwindow)
;; line 2504
(define-c-typedef av-doc-open-flags as-uns32)
;; line 3059
(define-c-typedef av-annot-op as-enum16)
;; line 3152
(define-opaque-pointer av-annot-handler -t-avannot-handler)
;; line 3843
(define-c-typedef av-annot-acc-str-type as-enum8)
;; line 4208
(define-opaque-pointer av-cursor -t-avcursor)
;; line 4479
(define-opaque-pointer av-tool -t-avtool)
;; line 4656
(define-c-typedef av-tool-mouse-wheel-direction as-enum16)
;; line 4828
(define-opaque-pointer av-tool-bar -t-avtool-bar)
;; line 4883
(define-opaque-pointer av-tool-button -t-avtool-button)
;; line 4924
(define-c-typedef av-window-layer as-int32)
;; line 5412
(define-opaque-pointer av-graf-select -t-avgraf-select)
;; line 5454
(define-c-typedef av-alert-type as-enum16)
;; line 5575
(define-opaque-pointer av-action-handler -t-avaction-handler)
;; line 5580
(define-opaque-pointer av-action-handler-procs
                       -t-avaction-handler-procs)
;; line 5963
(define-c-typedef av-rect32 av-rect)
;; line 5980
(define-c-typedef av-rect32p av-rect-p)
;; line 6201
(define-c-typedef av-tile-mark as-enum16)
;; line 6248
(define-c-typedef av-page-size as-enum16)
;; line 6272
(define-c-typedef av-color-forcing as-enum16)
;; line 6289
(define-c-typedef av-use-value as-enum16)
;; line 6311
(define-c-typedef av-resource-policy as-enum16)
;; line 6324
(define-c-typedef av-n-up-page-order as-enum16)
;; line 6345
(define-c-typedef av-booklet-binding as-enum16)
;; line 6356
(define-c-typedef av-booklet-duplex-mode as-enum16)
;; line 6657
(define-c-typedef av-rasterize-flags as-uns32)
;; line 6767
(define-opaque-pointer av-doc-print-params -t-avdoc-print-params)
;; line 6781
(define-c-typedef av-print-duplex-type as-enum8)
;; line 7039
(define-opaque-pointer av-doc-print-seps-params
                       -t-avdoc-print-seps-params)
;; line 7052
(define-c-typedef av-print-trap-type as-enum8)
;; line 7151
(define-opaque-pointer av-trans-handler -t-avtrans-handler)
;; line 7772
(define-c-typedef av-open-save-dialog-flags as-uns32)
;; line 8315
(define-opaque-pointer av-conversion-client-data
                       -t-avconversion-client-data)
;; line 8337
(define-c-typedef av-conversion-flags as-uns32)
;; line 8387
(define-c-typedef av-conversion-status as-enum16)
;; line 8654
(define-opaque-pointer av-struct-node -t-avstruct-node)
;; line 8857
(define-opaque-pointer av-conversion-enum-proc-data
                       -t-avconversion-enum-proc-data)
;; line 9032
(define-c-typedef av-command-status as-enum16)
;; line 9057
(define-c-typedef av-command-uipolicy as-enum16)
;; line 9066
(define-opaque-pointer av-command -t-avcommand-rec)
;; line 9386
(define-c-typedef av-command-handler (:pointer av-command-handler-rec))
;; line 9447
(define-c-typedef av-drag-type as-enum8)
;; line 9482
(define-c-typedef av-rect-handle-type as-enum8)
;; line 9563
(define-c-typedef av-access-color-policy as-enum8)
;; line 9588
(define-c-typedef av-access-read-order as-enum8)
;; line 9613
(define-c-typedef av-tool-bar-dock-position as-enum8)
;; line 9631
(define-c-typedef av-tool-bar-layout as-enum8)
;; line 9717
(define-c-typedef av-full-screen-monitor as-enum8)
;; line 9775
(define-c-typedef av-info-panel-update-type as-enum8)
;; line 9787
(define-opaque-pointer av-batch-context -t-avbatch-context)
;; line 9801
(define-c-typedef av-app-uuid-type as-enum8)
;; line 9817
(define-c-typedef av-sys-icon-type as-enum8)
;; line 9842
(define-opaque-pointer av-simple-sel-obj -t-avsimple-sel-obj)
;; line 9872
(define-opaque-pointer av-status-item -t-avstatus-item)
;; line 9881
(define-opaque-pointer av-undo -t-avundo)
;; line 9890
(define-c-typedef av-undo-handler-data (:pointer :void))
;; line 10071
(define-c-typedef av-tool-button-label-priority as-enum16)
;; line 10111
(define-c-typedef av-how-to-topic-sort-key as-uns32)
;; line 10143
(define-c-typedef av-task-order-numbers as-enum16)
;; line 10168
(define-c-typedef av-tools-menu-order-numbers as-enum16)
;; line 10205
(define-c-typedef av-app-language-format as-enum16)
;; line 10216
(define-c-typedef av-app-language-selector as-enum16)
;; line 10248
(define-c-typedef av-bookmark-filter as-enum16)
;; line 10265
(define-c-typedef k-avparagraph-direction as-enum8)
;; line 10303
(define-c-typedef pd-fopt-downsampling-algo as-enum16)
;; line 10321
(define-c-typedef pd-fopt-compression-algo as-enum16)
;; line 10341
(define-c-typedef pd-fopt-compression-qlty as-enum16)
;; line 10430
(define-c-typedef pd-fopt-pdf-version as-enum16)
;; line 10443
(define-c-typedef pd-fopt-object-compression as-enum16)
;; line 10617
(define-c-typedef av-app-file-save-handle (:pointer :void))
;; line 10640
(define-opaque-pointer av-platform-window-ref -t-avplatform-window-ref)
;; line 10643
(define-opaque-pointer admwindow-ref -t-admwindow-ref)
;; line 10689
(define-c-typedef av-storage-error-code as-enum8)
;; line 10699
(define-c-typedef av-storage-icon-set as-enum8)
(defconstant +av-preferences+ 0)
(defconstant +avp-num-prefs+ 1)
(defconstant +points+ 0)
(defconstant +inches+ 1)
(defconstant +millimeters+ 2)
(defconstant +centimeters+ 3)
(defconstant +picas+ 4)
(defconstant +feet+ 5)
(defconstant +yards+ 6)
(defconstant +meters+ 7)
(defconstant +kilometers+ 8)
(defconstant +miles+ 9)
(defconstant +custom+ 10)
(define-c-typedef page-units-type :int)
(defconstant +k-avicon-color+ 0)
(defconstant +k-avicon-grayscale+ 1)
(defconstant +k-avicon-high-contrast+ 2)
(defconstant +k-avicon-mac-icon-ref16+ 0)
(defconstant +k-avicon-mac-icon-ref32+ 1)
(defconstant +k-avicon-mac-icon-ref128+ 2)
(defconstant +k-avicon-png+ 3)
(defconstant +k-avicon-layered+ 4)
(defconstant +av-zoom-no-vary+ 0)
(defconstant +av-zoom-fit-page+ 1)
(defconstant +av-zoom-fit-width+ 2)
(defconstant +av-zoom-fit-height+ 3)
(defconstant +av-zoom-fit-visible-width+ 4)
(defconstant +av-zoom-preferred+ 5)
(defconstant +av-zoom-reflow-width+ 6)
(defconstant +k-avpage-view-zoom-control+ 0)
(defconstant +k-avpage-view-page-flip-controls+ 1)
(defconstant +k-avpage-view-page-number-control+ 2)
(defconstant +k-avpage-view-page-size-control+ 3)
(defconstant +k-avpage-view-splitter-bar+ 4)
(defconstant +k-avpage-view-horizontal-scroll-bar+ 5)
(defconstant +k-avpage-view-vertical-scroll-bar+ 6)
(defconstant +k-avpage-view-gray-border+ 7)
(defconstant +k-avleft-button-down+ 1)
(defconstant +k-avleft-button-up+ 2)
(defconstant +k-avleft-button-click+ 3)
(defconstant +k-avleft-button-dbl-click+ 4)
(defconstant +k-avright-button-down+ 5)
(defconstant +k-avright-button-up+ 6)
(defconstant +k-avright-button-click+ 7)
(defconstant +k-avright-button-dbl-click+ 8)
(defconstant +k-avmouse-move+ 9)
(defconstant +k-avmouse-enter+ 10)
(defconstant +k-avmouse-leave+ 11)
(defconstant +k-do-not-force+ 0)
(defconstant +k-force-open-in-protected-view+ 1)
(defconstant +k-force-open-as-trusted+ 2)
(define-c-typedef av-doc-force-open-option :int)
(defconstant +k-avdoc-open-with-no-flags+ 0)
(defconstant +k-avdoc-open-in-new-window+ 1)
(defconstant +av-doc-server-unknown+ 0)
(defconstant +av-doc-server-default+ 1)
(defconstant +av-doc-server-internal+ +av-doc-server-default+)
(defconstant +av-doc-server-external+ 3)
(defconstant +av-doc-server-help+ 4)
(define-c-typedef av-doc-server-type :int)
(defconstant +k-avannot-accept-focus+ 0)
(defconstant +k-avannot-lost-focus+ 1)
(defconstant +k-avannot-default-action+ 2)
(defconstant +k-avannot-show-menu+ 3)
(defconstant +k-avannot-suspend-focus+ 4)
(defconstant +k-avannot-resume-focus+ 5)
(defconstant +k-avannot-do-page-has-opened+ 6)
(defconstant +k-avannot-do-page-has-closed+ 7)
(defconstant +k-avannot-do-page-is-in-view+ 8)
(defconstant +k-avannot-do-page-is-not-in-view+ 9)
(defconstant +k-avannot-add-new-reply+ 10)
(defconstant +k-avannot-get-state-model+ 11)
(defconstant +k-avannot-unknown+ 0)
(defconstant +k-avannot-click+ 1)
(defconstant +k-avannot-tab+ 2)
(define-c-typedef av-annot-op-reason :int)
(defconstant +k-avannot-acc-name+ 0)
(defconstant +k-avannot-acc-value+ 1)
(defconstant +k-avannot-acc-default-action+ 2)
(defconstant +k-avtab-order-first+ 0)
(defconstant +k-avtab-order-last+ 1)
(defconstant +k-avtab-order-next+ 2)
(defconstant +k-avtab-order-prev+ 3)
(define-c-typedef av-page-view-tab-order :int)
(defconstant +av-tool-mouse-wheel-up+ 0)
(defconstant +av-tool-mouse-wheel-down+ 1)
(defconstant +k-avalert-type-none+ 0)
(defconstant +k-avalert-type-ok+ 1)
(defconstant +k-avalert-type-ok-cancel+ 2)
(defconstant +k-avalert-type-yes-no+ 3)
(defconstant +k-avalert-type-yes-no-cancel+ 4)
(defconstant +k-avemit-file-ps+ 0)
(defconstant +k-avemit-file-epsno-prev+ 1)
(defconstant +k-avemit-file-epspreview+ 2)
(defconstant +k-avemit-font-no-fonts+ 0)
(defconstant +k-avemit-font-all-emb-type1+ 1)
(defconstant +k-avemit-font-all-type1+ 2)
(defconstant +k-avtile-mark-none+ 0)
(defconstant +k-avtile-mark-western+ 1)
(defconstant +k-avtile-mark-eastern+ 2)
(defconstant +k-avemit-font-embedded-fonts+ 1)
(defconstant +k-avemit-font-all-fonts+ 2)
(defconstant +k-avpage-size-uninitialized+ 0)
(defconstant +k-avpage-size-none+ 1)
(defconstant +k-avpage-size-fit-to-paper+ 2)
(defconstant +k-avpage-size-shrink-large-pages+ 3)
(defconstant +k-avpage-size-tile-large-pages+ 4)
(defconstant +k-avpage-size-tile-all-pages+ 5)
(defconstant +k-avpage-size-nup+ 6)
(defconstant +k-avpage-size-booklet+ 7)
(defconstant +k-avpage-size-custom+ 8)
(defconstant +k-avforce-color-none+ 0)
(defconstant +k-avforce-color-to-grayscale+ 1)
(defconstant +k-avforce-color-to-monochrome+ 2)
(defconstant +k-avuse-auto+ 0)
(defconstant +k-avuse+ 1)
(defconstant +k-avno-use+ 2)
(defconstant +k-avres-policy-send-at-start+ 0)
(defconstant +k-avres-policy-send-by-range+ 1)
(defconstant +k-avres-policy-send-per-page+ 2)
(defconstant +k-avn-up-page-order-horizontal+ 0)
(defconstant +k-avn-up-page-order-horizontal-rev+ 1)
(defconstant +k-avn-up-page-order-vertical+ 2)
(defconstant +k-avn-up-page-order-vertical-rev+ 3)
(defconstant +k-avbooklet-binding-left+ 0)
(defconstant +k-avbooklet-binding-right+ 1)
(defconstant +k-avbooklet-binding-left-tall+ 2)
(defconstant +k-avbooklet-binding-right-tall+ 3)
(defconstant +k-avbooklet-both-sides+ 0)
(defconstant +k-avbooklet-front-side-only+ 1)
(defconstant +k-avbooklet-back-side-only+ 2)
(defconstant +k-avdefault-mark-type+ 0)
(defconstant +k-avin-design-j1mark-type+ 1)
(defconstant +k-avin-design-j2mark-type+ 2)
(defconstant +k-avillustrator-mark-type+ 3)
(defconstant +k-avillustrator-j+ 4)
(defconstant +k-avquark-xpress+ 5)
(defconstant +k-last-mark-type+ 6)
(defconstant +k-avrasterize-no-flags+ 0)
(defconstant +k-avrasterize-all-text-to-outlines+ 1)
(defconstant +k-avrasterize-all-strokes-to-outlines+ 1)
(defconstant +k-avrasterize-allow-complex-clip-regions+ 1)
(defconstant +k-avrasterize-preserve-overprint+ 1)
(defconstant +k-avprint-duplex-dont-care+ 0)
(defconstant +k-avprint-duplex-simplex+ 1)
(defconstant +k-avprint-duplex-flip-long-edge+ 2)
(defconstant +k-avprint-duplex-flip-short-edge+ 3)
(defconstant +k-avprint-trap-none+ 1)
(defconstant +k-avprint-trap-on-host+ 2)
(defconstant +k-avprint-trap-in-rip+ 4)
(defconstant +k-avopen-save-allow-all-flag+ 1)
(defconstant +k-avopen-save-allow-multiple+ 1)
(defconstant +k-avopen-save-allow-foreign-file-systems+ 1)
(defconstant +k-avopen-save-allow-settings-button+ 1)
(defconstant +k-avopen-save-merge-together-passed-filters+ 1)
(defconstant +k-avbrowse-for-folder-no-new-folder-button+ 1)
(defconstant +k-avdo-not-allow-cloud-connections+ 1)
(defconstant +k-avallow-adcaccess+ 1)
(defconstant +k-avopen-show-conversion-service-usage-preference+ 1)
(defconstant +k-avscuser+ 0)
(defconstant +k-avscapp+ 1)
(defconstant +k-avsclocal+ 2)
(defconstant +k-avsclast+ 3)
(define-c-typedef av-special-category :int)
(defconstant +k-avsfroot+ 0)
(defconstant +k-avsfebooks+ 1)
(defconstant +preferences+ 2)
(defconstant +k-avsfpreferences+ 3)
(defconstant +k-avsfsequences+ 4)
(defconstant +k-avsfdocuments+ 5)
(defconstant +k-avsfjava-script+ 6)
(defconstant +k-avsfstamps+ 7)
(defconstant +k-avsfdictionaries+ 8)
(defconstant +k-avsfplug-ins+ 9)
(defconstant +k-avsfspplug-ins+ 10)
(defconstant +k-avsfhelp+ 11)
(defconstant +k-avsftemp+ 12)
(defconstant +k-avsfmessages+ 13)
(defconstant +k-avsfresource+ 14)
(defconstant +k-avsfupdate+ 15)
(defconstant +k-avsfhelp-locale+ 16)
(defconstant +k-avsfauthoring+ 17)
(defconstant +k-avsfsecurity+ 18)
(defconstant +k-avsflocal-root+ 19)
(defconstant +k-avsflocal-cache+ 20)
(defconstant +k-avsftasks+ 21)
(defconstant +k-avsflinguistics+ 22)
(defconstant +k-avsfmapping-tables+ 23)
(defconstant +k-avsfdoc-templates+ 24)
(defconstant +k-avsfdesktop+ 25)
(defconstant +k-avsfprint-support+ 26)
(defconstant +k-avsfgetting-started+ 27)
(defconstant +k-avsftouch-up-find+ 28)
(defconstant +k-avsforganizer-database+ 29)
(defconstant +k-avsfhosted-services-templates+ 30)
(defconstant +k-avsfswatchbooks+ 31)
(defconstant +k-avsfstamps-locale+ 32)
(defconstant +k-avsfnavigators+ 33)
(defconstant +k-avsfnavigators-localized+ 34)
(defconstant +k-avsfmultimedia-skins+ 35)
(defconstant +k-avsfdoc-settings+ 36)
(defconstant +k-avsfdoc-settings-combine-files+ 37)
(defconstant +k-avsfdoc-settings-redaction+ 38)
(defconstant +k-avsfapplication-resources+ 39)
(defconstant +k-avsffile-info+ 40)
(defconstant +k-avsfjob-options+ 41)
(defconstant +k-avsfswf+ 42)
(defconstant +k-avsfbuilt-in-plug-ins+ 43)
(defconstant +k-avsfidtemplates+ 44)
(defconstant +k-avsfservices+ 45)
(defconstant +k-avsfservices-rdr+ 46)
(defconstant +k-avsfservices-std+ 47)
(defconstant +k-avsfservices-pro+ 48)
(defconstant +k-avsfapplication-all-locales+ 49)
(defconstant +k-avsfuicustomization+ 50)
(defconstant +k-avsfapplication-current-locale+ 51)
(defconstant +k-avsfacro-app+ 52)
(defconstant +k-avsfrdr-app+ 53)
(defconstant +k-avsfuithemes+ 54)
(defconstant +k-avsfacc-reports+ 55)
(defconstant +k-avsfonixlib+ 56)
(defconstant +k-avsfoltemp+ 57)
(defconstant +k-avsflast+ 58)
(define-c-typedef av-special-folder :int)
(defconstant +k-avseokay+ 0)
(defconstant +k-avseinvalid-combination+ 1)
(defconstant +k-avsedoesnt-exist+ 2)
(defconstant +k-avsecouldnt-create+ 3)
(defconstant +k-avseerror+ 4)
(define-c-typedef av-special-error :int)
(defconstant +k-avconversion-no-flags+ 0)
(defconstant +k-avconversion-async-okay+ 1)
(defconstant +k-avconversion-pop-settings-dialog+ 1)
(defconstant +k-avconversion-interactive+ 1)
(defconstant +k-avconversion-dont-overwrite+ 1)
(defconstant +k-avconversion-failed+ 0)
(defconstant +k-avconversion-success+ 1)
(defconstant +k-avconversion-success-async+ 2)
(defconstant +k-avconversion-cancelled+ 3)
(defconstant +k-avconversion-busy+ 4)
(defconstant +k-avconversion-failure-network-required+ 5)
(defconstant +k-avconversion-failure-dcapiunsupported+ 6)
(defconstant +k-avconversion-failure-office-access-denied+ 7)
(defconstant +k-avconversion-not-trusted+ 8)
(defconstant +k-avilogin-name+ 0)
(defconstant +k-aviname+ 1)
(defconstant +k-avicorporation+ 2)
(defconstant +k-aviemail+ 3)
(defconstant +k-avidepartment+ 4)
(defconstant +k-avititle+ 5)
(defconstant +k-avifirst-name+ 6)
(defconstant +k-avilast-name+ 7)
(defconstant +k-avicorporation-abbr+ 8)
(defconstant +k-signed-in-once+ 9)
(defconstant +k-avilast+ 10)
(define-c-typedef av-identity :int)
(defconstant +k-avcommand-ready+ 0)
(defconstant +k-avcommand-working+ 1)
(defconstant +k-avcommand-done+ 2)
(defconstant +k-avcommand-canceled+ 3)
(defconstant +k-avcommand-in-error+ 4)
(defconstant +k-avcommand-canceled-for-multiple+ 5)
(defconstant +k-avcommand-not-executed+ 6)
(defconstant +k-avcommand-paused+ 7)
(defconstant +k-avcommand-uiinteractive+ 0)
(defconstant +k-avcommand-uisemi-interactive+ 1)
(defconstant +k-avcommand-uierrors-only+ 2)
(defconstant +k-avcommand-uisilent+ 3)
(defconstant +k-avdrag-rect+ 0)
(defconstant +k-avdrag-top-left+ 1)
(defconstant +k-avdrag-top-right+ 2)
(defconstant +k-avdrag-bottom-right+ 3)
(defconstant +k-avdrag-bottom-left+ 4)
(defconstant +k-avdrag-top-middle+ 5)
(defconstant +k-avdrag-right-middle+ 6)
(defconstant +k-avdrag-bottom-middle+ 7)
(defconstant +k-avdrag-left-middle+ 8)
(defconstant +k-avdrag-snap-to-top-left+ 9)
(defconstant +k-avdrag-snap-to-top+ 10)
(defconstant +k-avdrag-snap-to-top-right+ 11)
(defconstant +k-avdrag-snap-to-right+ 12)
(defconstant +k-avdrag-snap-to-bottom-right+ 13)
(defconstant +k-avdrag-snap-to-bottom+ 14)
(defconstant +k-avdrag-snap-to-bottom-left+ 15)
(defconstant +k-avdrag-snap-to-left+ 16)
(defconstant +k-avrect-handle-none+ 0)
(defconstant +k-avrect-handle-top-left+ 1)
(defconstant +k-avrect-handle-top-right+ 2)
(defconstant +k-avrect-handle-bottom-right+ 3)
(defconstant +k-avrect-handle-bottom-left+ 4)
(defconstant +k-avrect-handle-top-middle+ 5)
(defconstant +k-avrect-handle-right-middle+ 6)
(defconstant +k-avrect-handle-bottom-middle+ 7)
(defconstant +k-avrect-handle-left-middle+ 8)
(defconstant +k-avaccess-use-document-colors+ 0)
(defconstant +k-avaccess-use-system-colors+ 1)
(defconstant +k-avaccess-use-preference-colors+ 2)
(defconstant +k-avaccess-force-system-colors+ 3)
(defconstant +k-avaccess-use-hi-cont-green-black+ 4)
(defconstant +k-avaccess-use-hi-cont-yellow-black+ 5)
(defconstant +k-avaccess-use-hi-cont-white-black+ 6)
(defconstant +k-avaccess-use-hi-cont-black-white+ 7)
(defconstant +k-avaccess-inferred-read-order+ 0)
(defconstant +k-avaccess-tblrread-order+ 1)
(defconstant +k-avaccess-wordy-read-order+ 2)
(defconstant +k-avaccess-tagged-read-order+ 3)
(defconstant +k-avaccess-undefined-read-order+ 4)
(defconstant +k-avtool-bar-dock-top+ 0)
(defconstant +k-avtool-bar-dock-bottom+ 1)
(defconstant +k-avtool-bar-dock-left+ 2)
(defconstant +k-avtool-bar-dock-right+ 3)
(defconstant +k-avtool-bar-floating+ 4)
(defconstant +k-avtool-bar-horizontal+ 0)
(defconstant +k-avtool-bar-vertical+ 1)
(defconstant +k-avtool-bar-two-column+ 2)
(defconstant +k-avfull-screen-largest-intersection+ 0)
(defconstant +k-avfull-screen-most-colors+ 1)
(defconstant +k-avfull-screen-widest+ 2)
(defconstant +k-avfull-screen-tallest+ 3)
(defconstant +k-avfull-screen-largest+ 4)
(defconstant +k-avfull-screen-main+ 5)
(defconstant +k-avfull-screen-end-enum+ 6)
(defconstant +k-avinfo-panel-lock+ 0)
(defconstant +k-avinfo-panel-unlock+ 1)
(defconstant +k-avinfo-panel-rect+ 2)
(defconstant +k-avapp-user-uuid+ 0)
(defconstant +k-avapp-session-uuid+ 1)
(defconstant +k-avsys-small-icon+ 0)
(defconstant +k-avsys-large-icon+ 1)
(defconstant +k-avsys-huge-icon+ 2)
(defconstant +k-avbutton-priority-off-extra-low+ 100)
(defconstant +k-avbutton-priority-off-low+ 200)
(defconstant +k-avbutton-priority-off-normal+ 300)
(defconstant +k-avbutton-priority-off-high+ 400)
(defconstant +k-avbutton-priority-off-extra-high+ 500)
(defconstant +k-avbutton-priority-on-extra-low+ 600)
(defconstant +k-avbutton-priority-on-low+ 700)
(defconstant +k-avbutton-priority-on-normal+ 800)
(defconstant +k-avbutton-priority-on-high+ 900)
(defconstant +k-avbutton-priority-on-extra-high+ 1000)
(defconstant +k-avbutton-priority-always-on+ 1100)
(defconstant +k-acrobat-basics-sort-key+ 100)
(defconstant +k-avcreate-sort-key+ 200)
(defconstant +k-avcombine-sort-key+ 250)
(defconstant +k-avexport-sort-key+ 275)
(defconstant +k-avsecure-sort-key+ 300)
(defconstant +k-avsign-sort-key+ 400)
(defconstant +k-avform-sort-key+ 500)
(defconstant +k-avreview-and-comment-sort-key+ 600)
(defconstant +k-av3dsort-key+ 650)
(defconstant +k-avengineering-tools-sort-key+ 700)
(defconstant +k-avprint-production-sort-key+ 800)
(defconstant +k-avhow-to-sort-key+ +as-max-uns32+)
(defconstant +k-ave-book-task-order+ 100)
(defconstant +k-avnew-document-task-order+ 200)
(defconstant +k-avcombine-files-task-order+ 300)
(defconstant +k-avcollab-tasks-task-order+ 350)
(defconstant +k-avexport-task-order+ 400)
(defconstant +k-avmeeting-task-order+ 500)
(defconstant +k-avsecure-task-order+ 600)
(defconstant +k-avsign-task-order+ 700)
(defconstant +k-avform-task-order+ 800)
(defconstant +k-avmultimedia-task-order+ 850)
(defconstant +k-avreview-and-comment-task-order+ 900)
(defconstant +k-avsend-for-review-task-order+ 1000)
(defconstant +k-avpicture-tasks-task-order+ 1100)
(defconstant +k-avcommenting-menu-order+ 100)
(defconstant +k-avadv-commenting-menu-order+ 200)
(defconstant +k-avselection-menu-order+ 300)
(defconstant +k-avzoom-menu-order+ 400)
(defconstant +k-avnavigation-menu-order+ 500)
(defconstant +k-avadv-editing-menu-order+ 600)
(defconstant +k-avmeasuring-menu-order+ 700)
(defconstant +k-avrotate-view-menu-order+ 800)
(defconstant +k-avfind-menu-order+ 900)
(defconstant +k-avend-menu-order+ +k-as-max-enum16+)
(defconstant +k-avapp-language-rfc1766+ 0)
(defconstant +k-avapp-language-lcid+ 1)
(defconstant +k-avapp-language-iso4char+ 2)
(defconstant +k-avapp-language-rfc3066bis+ 3)
(defconstant +k-avapp-language-iso4variant+ 4)
(defconstant +k-avapp-language-efiprint+ 5)
(defconstant +k-avapp-language-max-selector+ 6)
(defconstant +k-avapp-language-app+ 0)
(defconstant +k-avapp-language-fallback+ 1)
(defconstant +k-avapp-language-langpack+ 2)
(defconstant +k-avbookmark-filter-selected+ 1)
(defconstant +k-avbookmark-filter-focus+ 2)
(defconstant +k-avparagraph-direction-left-to-right+ 0)
(defconstant +k-avparagraph-direction-right-to-left+ 1)
(defconstant +k-avparagraph-direction-same-as-document+ 2)
(defconstant +k-avparagraph-direction-end-enum+ 3)
(defconstant +k-pdf-opt-no-downsampling+ 0)
(defconstant +k-pdf-opt-average+ 1)
(defconstant +k-pdf-opt-subsampling+ 2)
(defconstant +k-pdf-opt-bicubic+ 3)
(defconstant +k-pdf-opt-no-recompression+ 0)
(defconstant +k-pdf-opt-jpeg2000+ 1)
(defconstant +k-pdf-opt-jpeg+ 2)
(defconstant +k-pdf-opt-flate+ 3)
(defconstant +k-pdf-opt-jbig2+ 4)
(defconstant +k-pdf-opt-ccitt3+ 5)
(defconstant +k-pdf-opt-ccitt4+ 6)
(defconstant +k-pdf-opt-run-length+ 7)
(defconstant +k-pdf-opt-minimum-qlty+ 0)
(defconstant +k-pdf-opt-low-qlty+ 1)
(defconstant +k-pdf-opt-medium-qlty+ 2)
(defconstant +k-pdf-opt-high-qlty+ 3)
(defconstant +k-pdf-opt-maximum-qlty+ 4)
(defconstant +k-pdf-opt-lossless+ 5)
(defconstant +k-pdf-opt-retain-version+ 0)
(defconstant +k-pdf-opt-acrobat4+ 1)
(defconstant +k-pdf-opt-acrobat5+ 2)
(defconstant +k-pdf-opt-acrobat6+ 3)
(defconstant +k-pdf-opt-acrobat7+ 4)
(defconstant +k-pdf-opt-acrobat8+ 5)
(defconstant +k-pdf-opt-acrobat9+ 6)
(defconstant +k-pdf-opt-acrobat10+ 7)
(defconstant +k-pdf-opt-untouched-compression+ 0)
(defconstant +k-pdf-opt-full-compression+ 1)
(defconstant +k-pdf-opt-partial-compression+ 2)
(defconstant +k-pdf-opt-remove-compression+ 3)
(defconstant +k-mac-cgcontext-type+ 0)
(define-c-typedef draw-context-type :int)
(defconstant +k-avstorage-success+ 0)
(defconstant +k-avstorage-bad-params+ 1)
(defconstant +k-avstorage-file-sys-nf+ 2)
(defconstant +k-avstorage-access-token-expired+ 3)
(defconstant +k-avstorage-other-failure+ 4)
(defconstant +k-avstorage-light-theme-icon+ 0)
(defconstant +k-avstorage-dark-theme-icon+ 1)
(defconstant +k-oauth2no-error+ 0)
(defconstant +k-oauth2authorization-url-not-reachable+ 1)
(defconstant +k-oauth2authorization-step-error+ 2)
(defconstant +k-oauth2access-token-url-not-reachable+ 3)
(defconstant +k-oauth2access-token-step-error+ 4)
(defconstant +k-oauth2required-parameter-missing+ 5)
(defconstant +k-oauth2bad-request-parameters+ 6)
(defconstant +k-oauth2user-closed-window+ 7)
(defconstant +k-oauth2network-failure+ 8)
(defconstant +k-oauth2general-error+ 9)
(define-c-typedef oauth2error-code :int)
(define-c-typedef av-icon-handler-measure-proc
                  (:pointer
                   (:function
                    (av-icon-bundle6
                     (:pointer as-int32)
                     (:pointer as-int32))
                    :void
                    :calling-convention
                    :cdecl)))
(define-c-typedef av-icon-handler-open-stm-proc
                  (:pointer
                   (:function
                    (av-icon-bundle6 av-icon-color-format)
                    as-stm
                    :calling-convention
                    :cdecl)))
(define-c-typedef av-icon-handler-get-flags-proc
                  (:pointer
                   (:function
                    (av-icon-bundle6)
                    av-flag-bits32
                    :calling-convention
                    :cdecl)))
(define-c-typedef av-icon-handler-release-proc
                  (:pointer
                   (:function
                    (av-icon-bundle6)
                    :void
                    :calling-convention
                    :cdecl)))
(define-c-typedef av-icon-handler-resize-proc
                  (:pointer
                   (:function
                    (av-icon-bundle6 as-int32 as-int32)
                    av-icon
                    :calling-convention
                    :cdecl)))
(define-c-typedef av-page-view-draw-proc
                  (:pointer
                   (:function
                    (av-page-view (:pointer av-dev-rect) nil)
                    :void
                    :calling-convention
                    :cdecl)))
(define-c-typedef av-page-view-click-proc
                  (:pointer
                   (:function
                    (av-page-view
                     av-dev-coord
                     av-dev-coord
                     av-flag-bits16
                     av-tcount
                     nil)
                    as-bool
                    :calling-convention
                    :cdecl)))
(define-c-typedef av-page-view-cursor-proc
                  (:pointer
                   (:function
                    (av-page-view
                     av-dev-coord
                     av-dev-coord
                     (:pointer :void))
                    as-bool
                    :calling-convention
                    :cdecl)))
(define-c-typedef av-page-view-key-down-proc
                  (:pointer
                   (:function
                    (av-page-view
                     av-key-code
                     av-flag-bits16
                     (:pointer :void))
                    as-bool
                    :calling-convention
                    :cdecl)))
(define-c-typedef av-text-copy-proc
                  (:pointer
                   (:function
                    (as-atom
                     (:pointer :void)
                     av-tbuffer-size
                     (:pointer :void))
                    :void
                    :calling-convention
                    :cdecl)))
(define-c-typedef av-menu-predicate
                  (:pointer
                   (:function
                    (av-menu (:pointer :void))
                    as-bool
                    :calling-convention
                    :cdecl)))
(define-c-typedef av-context-menu-addition-proc
                  (:pointer
                   (:function
                    (as-atom av-menu (:pointer :void) (:pointer :void))
                    :void
                    :calling-convention
                    :cdecl)))
(define-c-typedef av-execute-proc
                  (:pointer
                   (:function
                    ((:pointer :void))
                    :void
                    :calling-convention
                    :cdecl)))
(define-c-typedef av-compute-enabled-proc
                  (:pointer
                   (:function
                    ((:pointer :void))
                    as-bool
                    :calling-convention
                    :cdecl)))
(define-c-typedef av-compute-marked-proc
                  (:pointer
                   (:function
                    ((:pointer :void))
                    as-bool
                    :calling-convention
                    :cdecl)))
(define-c-typedef av-compute-visible-proc
                  (:pointer
                   (:function
                    ((:pointer :void))
                    as-bool
                    :calling-convention
                    :cdecl)))
(define-c-typedef av-menu-item-predicate
                  (:pointer
                   (:function
                    (av-menu-item (:pointer :void))
                    as-bool
                    :calling-convention
                    :cdecl)))
(define-c-typedef av-compute-tooltip-proc
                  (:pointer
                   (:function
                    ((:pointer :void) as-bool)
                    as-text
                    :calling-convention
                    :cdecl)))
(define-c-typedef av-notify-tooltip-proc
                  (:pointer
                   (:function
                    ((:pointer :void))
                    :void
                    :calling-convention
                    :cdecl)))
(define-c-typedef av-doc-enum-proc
                  (:pointer
                   (:function
                    (av-doc (:pointer :void))
                    as-bool
                    :calling-convention
                    :cdecl)))
(define-c-typedef av-selection-enum-proc
                  (:pointer
                   (:function
                    (av-doc (:pointer :void) (:pointer :void))
                    as-bool
                    :calling-convention
                    :cdecl)))
(define-c-typedef av-selection-page-range-enum-proc
                  (:pointer
                   (:function
                    (av-doc
                     (:pointer :void)
                     pd-page-number
                     pd-page-number)
                    as-bool
                    :calling-convention
                    :cdecl)))
(define-c-typedef av-doc-selection-get-type-proc
                  (:pointer
                   (:function
                    (nil)
                    as-atom
                    :calling-convention
                    :cdecl)))
(define-c-typedef av-doc-selection-getting-selection-proc
                  (:pointer
                   (:function
                    (av-doc (:pointer :void) as-bool)
                    :void
                    :calling-convention
                    :cdecl)))
(define-c-typedef av-doc-selection-added-to-selection-proc
                  (:pointer
                   (:function
                    (av-doc (:pointer :void) (:pointer :void) as-bool)
                    (:pointer :void)
                    :calling-convention
                    :cdecl)))
(define-c-typedef av-doc-selection-losing-selection-proc
                  (:pointer
                   (:function
                    (av-doc (:pointer :void) as-bool)
                    :void
                    :calling-convention
                    :cdecl)))
(define-c-typedef av-doc-selection-removed-from-selection-proc
                  (:pointer
                   (:function
                    (av-doc (:pointer :void) (:pointer :void) as-bool)
                    (:pointer :void)
                    :calling-convention
                    :cdecl)))
(define-c-typedef av-doc-selection-can-select-all-proc
                  (:pointer
                   (:function
                    (av-doc (:pointer :void))
                    as-bool
                    :calling-convention
                    :cdecl)))
(define-c-typedef av-doc-selection-select-all-proc
                  (:pointer
                   (:function
                    (av-doc (:pointer :void))
                    (:pointer :void)
                    :calling-convention
                    :cdecl)))
(define-c-typedef av-doc-selection-can-properties-proc
                  (:pointer
                   (:function
                    (av-doc (:pointer :void))
                    as-bool
                    :calling-convention
                    :cdecl)))
(define-c-typedef av-doc-selection-properties-proc
                  (:pointer
                   (:function
                    (av-doc (:pointer :void))
                    :void
                    :calling-convention
                    :cdecl)))
(define-c-typedef av-doc-selection-can-delete-proc
                  (:pointer
                   (:function
                    (av-doc (:pointer :void))
                    as-bool
                    :calling-convention
                    :cdecl)))
(define-c-typedef av-doc-selection-delete-proc
                  (:pointer
                   (:function
                    (av-doc (:pointer :void))
                    as-bool
                    :calling-convention
                    :cdecl)))
(define-c-typedef av-doc-selection-can-copy-proc
                  (:pointer
                   (:function
                    (av-doc (:pointer :void))
                    as-bool
                    :calling-convention
                    :cdecl)))
(define-c-typedef av-doc-selection-copy-proc
                  (:pointer
                   (:function
                    (av-doc (:pointer :void))
                    as-bool
                    :calling-convention
                    :cdecl)))
(define-c-typedef av-doc-selection-enum-selection-proc
                  (:pointer
                   (:function
                    (av-doc
                     (:pointer :void)
                     av-selection-enum-proc
                     (:pointer :void))
                    :void
                    :calling-convention
                    :cdecl)))
(define-c-typedef av-doc-selection-show-selection-proc
                  (:pointer
                   (:function
                    (av-doc (:pointer :void))
                    :void
                    :calling-convention
                    :cdecl)))
(define-c-typedef av-doc-selection-can-cut-proc
                  (:pointer
                   (:function
                    (av-doc (:pointer :void))
                    as-bool
                    :calling-convention
                    :cdecl)))
(define-c-typedef av-doc-selection-cut-proc
                  (:pointer
                   (:function
                    (av-doc (:pointer :void))
                    as-bool
                    :calling-convention
                    :cdecl)))
(define-c-typedef av-doc-selection-can-paste-proc
                  (:pointer
                   (:function
                    (av-doc)
                    as-bool
                    :calling-convention
                    :cdecl)))
(define-c-typedef av-doc-selection-paste-proc
                  (:pointer
                   (:function
                    (av-doc)
                    :void
                    :calling-convention
                    :cdecl)))
(define-c-typedef av-doc-selection-key-down-proc
                  (:pointer
                   (:function
                    (av-doc
                     (:pointer :void)
                     av-key-code
                     av-flag-bits16)
                    as-bool
                    :calling-convention
                    :cdecl)))
(define-c-typedef av-doc-selection-highlight-selection-proc
                  (:pointer
                   (:function
                    (av-doc (:pointer :void))
                    :void
                    :calling-convention
                    :cdecl)))
(define-c-typedef av-doc-selection-highlight-selection-ex-proc
                  (:pointer
                   (:function
                    (av-doc av-page-view (:pointer :void))
                    :void
                    :calling-convention
                    :cdecl)))
(define-c-typedef av-doc-selection-get-selection-type-proc
                  (:pointer
                   (:function
                    (av-doc (:pointer :void))
                    as-atom
                    :calling-convention
                    :cdecl)))
(define-c-typedef av-doc-selection-enum-page-ranges-proc
                  (:pointer
                   (:function
                    (av-doc
                     (:pointer :void)
                     av-selection-page-range-enum-proc
                     (:pointer :void))
                    :void
                    :calling-convention
                    :cdecl)))
(define-c-typedef av-doc-selection-get-avrect-proc
                  (:pointer
                   (:function
                    (av-doc
                     pd-page-number
                     (:pointer av-dev-rect)
                     (:pointer :void))
                    as-bool
                    :calling-convention
                    :cdecl)))
(define-c-typedef av-doc-selection-show-menu-proc
                  (:pointer
                   (:function
                    (av-doc (:pointer :void) av-dev-coord av-dev-coord)
                    as-bool
                    :calling-convention
                    :cdecl)))
(define-c-typedef av-doc-selection-acquire-quads-proc
                  (:pointer
                   (:function
                    (av-doc
                     (:pointer :void)
                     as-int32
                     (:pointer (:pointer as-fixed-quad)))
                    as-array-size
                    :calling-convention
                    :cdecl)))
(define-c-typedef av-doc-selection-can-paste-from-platform-proc
                  (:pointer
                   (:function
                    (av-doc)
                    as-bool
                    :calling-convention
                    :cdecl)))
(define-c-typedef av-doc-selection-paste-from-platform-proc
                  (:pointer
                   (:function
                    (av-doc)
                    :void
                    :calling-convention
                    :cdecl)))
(define-c-typedef av-doc-selection-unicode-key-down-proc
                  (:pointer
                   (:function
                    (av-doc
                     (:pointer :void)
                     as-count
                     (:pointer as-utf16val)
                     av-flag-bits16)
                    as-bool
                    :calling-convention
                    :cdecl)))
(define-c-typedef av-doc-perm-req-proc
                  (:pointer
                   (:function
                    (av-doc pd-perm-req-obj pd-perm-req-opr)
                    pd-perm-req-status
                    :calling-convention
                    :cdecl)))
(define-c-typedef cross-doc-link-proc
                  (:pointer
                   (:function
                    (as-path-name
                     as-file-sys
                     av-doc-view-def
                     av-doc
                     (:pointer :void))
                    av-doc
                    :calling-convention
                    :cdecl)))
(define-c-typedef av-set-message-proc
                  (:pointer
                   (:function
                    ((:reference-pass :ef-mb-string) (:pointer :void))
                    :void
                    :calling-convention
                    :cdecl)))
(define-c-typedef av-set-focus-proc
                  (:pointer
                   (:function
                    ((:pointer :void))
                    :void
                    :calling-convention
                    :cdecl)))
(define-c-typedef cross-doc-link-with-dest-proc
                  (:pointer
                   (:function
                    (as-path-name
                     as-file-sys
                     av-doc-view-def
                     av-dest-info
                     av-doc
                     (:pointer :void))
                    av-doc
                    :calling-convention
                    :cdecl)))
(define-c-typedef av-annot-handler-draw-ex-proc
                  (:pointer
                   (:function
                    (av-annot-handler
                     pd-annot
                     av-page-view
                     (:pointer av-dev-rect))
                    :void
                    :calling-convention
                    :cdecl)))
(define-c-typedef av-annot-handler-post-draw-proc
                  (:pointer
                   (:function
                    (av-annot-handler
                     pd-annot
                     av-page-view
                     (:pointer av-dev-rect))
                    :void
                    :calling-convention
                    :cdecl)))
(define-c-typedef av-annot-handler-do-click-proc
                  (:pointer
                   (:function
                    (av-annot-handler
                     pd-annot
                     av-page-view
                     av-dev-coord
                     av-dev-coord
                     av-flag-bits16
                     av-tcount)
                    as-bool
                    :calling-convention
                    :cdecl)))
(define-c-typedef av-annot-handler-adjust-cursor-proc
                  (:pointer
                   (:function
                    (av-annot-handler
                     pd-annot
                     av-page-view
                     av-dev-coord
                     av-dev-coord)
                    as-bool
                    :calling-convention
                    :cdecl)))
(define-c-typedef av-annot-handler-pt-in-annot-view-bbox-proc
                  (:pointer
                   (:function
                    (av-annot-handler
                     av-page-view
                     pd-annot
                     av-dev-coord
                     av-dev-coord)
                    as-bool
                    :calling-convention
                    :cdecl)))
(define-c-typedef av-annot-handler-enum-proc
                  (:pointer
                   (:function
                    (av-annot-handler (:pointer :void))
                    as-bool
                    :calling-convention
                    :cdecl)))
(define-c-typedef av-annot-handler-get-type-proc
                  (:pointer
                   (:function
                    (av-annot-handler)
                    as-atom
                    :calling-convention
                    :cdecl)))
(define-c-typedef av-annot-handler-notify-destroy-proc
                  (:pointer
                   (:function
                    (av-annot-handler)
                    :void
                    :calling-convention
                    :cdecl)))
(define-c-typedef av-annot-handler-do-properties-proc
                  (:pointer
                   (:function
                    (av-annot-handler pd-annot av-doc)
                    :void
                    :calling-convention
                    :cdecl)))
(define-c-typedef av-annot-handler-do-key-down-proc
                  (:pointer
                   (:function
                    (av-annot-handler
                     pd-annot
                     av-key-code
                     av-flag-bits16)
                    as-bool
                    :calling-convention
                    :cdecl)))
(define-c-typedef av-annot-handler-get-layer-proc
                  (:pointer
                   (:function
                    (av-annot-handler pd-annot)
                    as-fixed
                    :calling-convention
                    :cdecl)))
(define-c-typedef av-annot-handler-cursor-enter-proc
                  (:pointer
                   (:function
                    (av-annot-handler pd-annot av-page-view)
                    :void
                    :calling-convention
                    :cdecl)))
(define-c-typedef av-annot-handler-cursor-exit-proc
                  (:pointer
                   (:function
                    (av-annot-handler pd-annot av-page-view)
                    :void
                    :calling-convention
                    :cdecl)))
(define-c-typedef av-annot-handler-copy-proc
                  (:pointer
                   (:function
                    (av-annot-handler av-doc pd-annot av-doc)
                    pd-annot
                    :calling-convention
                    :cdecl)))
(define-c-typedef av-annot-handler-get-info-proc
                  (:pointer
                   (:function
                    (av-annot-handler)
                    av-annot-handler-info
                    :calling-convention
                    :cdecl)))
(define-c-typedef av-annot-handler-delete-info-proc
                  (:pointer
                   (:function
                    (av-annot-handler av-annot-handler-info)
                    :void
                    :calling-convention
                    :cdecl)))
(define-c-typedef av-annot-handler-can-perform-op-proc
                  (:pointer
                   (:function
                    (av-annot-handler
                     pd-annot
                     av-page-view
                     av-annot-op
                     av-annot-op-data)
                    as-bool
                    :calling-convention
                    :cdecl)))
(define-c-typedef av-annot-handler-perform-op-proc
                  (:pointer
                   (:function
                    (av-annot-handler
                     pd-annot
                     av-page-view
                     av-annot-op
                     av-annot-op-data)
                    as-bool
                    :calling-convention
                    :cdecl)))
(define-c-typedef av-annot-handler-do-key-down-ex-proc
                  (:pointer
                   (:function
                    (av-annot-handler
                     pd-annot
                     av-page-view
                     av-key-code
                     av-flag-bits16)
                    as-bool
                    :calling-convention
                    :cdecl)))
(define-c-typedef av-annot-handler-get-flags-proc
                  (:pointer
                   (:function
                    (av-annot-handler pd-annot)
                    av-flag-bits32
                    :calling-convention
                    :cdecl)))
(define-c-typedef av-annot-handler-get-appearance-proc
                  (:pointer
                   (:function
                    (av-annot-handler
                     pd-annot
                     (:pointer as-uns32)
                     av-page-view
                     (:pointer cos-obj))
                    as-bool
                    :calling-convention
                    :cdecl)))
(define-c-typedef av-annot-handler-appearance-drawing-proc
                  (:pointer
                   (:function
                    (av-annot-handler
                     pd-annot
                     av-page-view
                     (:pointer av-dev-rect)
                     (:pointer av-dev-rect))
                    :void
                    :calling-convention
                    :cdecl)))
(define-c-typedef av-annot-handler-do-properties-ex-proc
                  (:pointer
                   (:function
                    (av-annot-handler pd-annot av-page-view)
                    :void
                    :calling-convention
                    :cdecl)))
(define-c-typedef av-annot-handler-get-layer-ex-proc
                  (:pointer
                   (:function
                    (av-annot-handler pd-annot av-page-view)
                    as-fixed
                    :calling-convention
                    :cdecl)))
(define-c-typedef av-annot-handler-do-click-ex-proc
                  (:pointer
                   (:function
                    (av-annot-handler
                     pd-annot
                     av-page-view
                     av-click-params)
                    as-bool
                    :calling-convention
                    :cdecl)))
(define-c-typedef av-annot-handler-adjust-cursor-ex-proc
                  (:pointer
                   (:function
                    (av-annot-handler
                     pd-annot
                     av-page-view
                     av-adjust-cursor-params)
                    as-bool
                    :calling-convention
                    :cdecl)))
(define-c-typedef av-annot-handler-get-accessibility-string-proc
                  (:pointer
                   (:function
                    (av-annot-handler
                     pd-annot
                     pd-page-number
                     av-annot-acc-str-type
                     as-text)
                    as-bool
                    :calling-convention
                    :cdecl)))
(define-c-typedef av-annot-handler-get-aux-icon-count-proc
                  (:pointer
                   (:function
                    (av-annot-handler pd-annot av-page-view)
                    as-int32
                    :calling-convention
                    :cdecl)))
(define-c-typedef av-annot-handler-get-appearance-ex-proc
                  (:pointer
                   (:function
                    (av-annot-handler
                     pd-annot
                     (:pointer as-uns32)
                     av-page-view
                     (:pointer av-annot-appearance-data-rec))
                    as-bool
                    :calling-convention
                    :cdecl)))
(define-c-typedef av-idle-proc
                  (:pointer
                   (:function
                    ((:pointer :void))
                    :void
                    :calling-convention
                    :cdecl)))
(define-c-typedef adjust-cursor-proc-type
                  (:pointer
                   (:function
                    (av-tool av-page-view av-dev-coord av-dev-coord)
                    as-bool
                    :calling-convention
                    :cdecl)))
(define-c-typedef do-click-proc-type
                  (:pointer
                   (:function
                    (av-tool
                     av-page-view
                     av-dev-coord
                     av-dev-coord
                     av-flag-bits16
                     av-tcount)
                    as-bool
                    :calling-convention
                    :cdecl)))
(define-c-typedef activate-proc-type
                  (:pointer
                   (:function
                    (av-tool as-bool)
                    :void
                    :calling-convention
                    :cdecl)))
(define-c-typedef deactivate-proc-type
                  (:pointer
                   (:function
                    (av-tool)
                    :void
                    :calling-convention
                    :cdecl)))
(define-c-typedef do-key-down-proc-type
                  (:pointer
                   (:function
                    (av-tool av-key-code av-flag-bits16)
                    as-bool
                    :calling-convention
                    :cdecl)))
(define-c-typedef get-type-proc-type
                  (:pointer
                   (:function
                    (av-tool)
                    as-atom
                    :calling-convention
                    :cdecl)))
(define-c-typedef is-persistent-proc-type
                  (:pointer
                   (:function
                    (av-tool)
                    as-bool
                    :calling-convention
                    :cdecl)))
(define-c-typedef do-leave-proc-type
                  (:pointer
                   (:function
                    (av-tool av-page-view)
                    :void
                    :calling-convention
                    :cdecl)))
(define-c-typedef get-selection-server-proc-type
                  (:pointer
                   (:function
                    (av-tool av-doc)
                    av-doc-selection-server
                    :calling-convention
                    :cdecl)))
(define-c-typedef av-tool-destroy-proc
                  (:pointer
                   (:function
                    (av-tool)
                    :void
                    :calling-convention
                    :cdecl)))
(define-c-typedef av-tool-get-label-proc
                  (:pointer
                   (:function
                    (av-tool as-text)
                    :void
                    :calling-convention
                    :cdecl)))
(define-c-typedef av-tool-get-label-icon-proc
                  (:pointer
                   (:function
                    (av-tool)
                    av-icon
                    :calling-convention
                    :cdecl)))
(define-c-typedef av-tool-get-tool-tip-proc
                  (:pointer
                   (:function
                    (av-tool as-text)
                    :void
                    :calling-convention
                    :cdecl)))
(define-c-typedef handle-mouse-wheel-scroll-proc
                  (:pointer
                   (:function
                    (av-tool
                     av-page-view
                     av-tool-mouse-wheel-direction
                     av-tcount
                     av-flag-bits16)
                    as-bool
                    :calling-convention
                    :cdecl)))
(define-c-typedef av-tool-enum-proc
                  (:pointer
                   (:function
                    (av-tool (:pointer :void))
                    as-bool
                    :calling-convention
                    :cdecl)))
(define-c-typedef av-tool-button-enum-proc
                  (:pointer
                   (:function
                    (av-tool-button (:pointer :void))
                    as-bool
                    :calling-convention
                    :cdecl)))
(define-c-typedef av-window-mouse-down-proc
                  (:pointer
                   (:function
                    (av-window
                     av-window-coord
                     av-window-coord
                     (:pointer :void))
                    :void
                    :calling-convention
                    :cdecl)))
(define-c-typedef av-window-draw-proc
                  (:pointer
                   (:function
                    (av-window (:pointer av-window-rect))
                    :void
                    :calling-convention
                    :cdecl)))
(define-c-typedef av-window-will-be-resized-proc
                  (:pointer
                   (:function
                    (av-window (:pointer av-screen-rect))
                    as-bool
                    :calling-convention
                    :cdecl)))
(define-c-typedef av-window-adjust-cursor-proc
                  (:pointer
                   (:function
                    (av-window av-window-coord av-window-coord)
                    :void
                    :calling-convention
                    :cdecl)))
(define-c-typedef av-window-did-resize-proc
                  (:pointer
                   (:function
                    (av-window (:pointer av-screen-rect))
                    :void
                    :calling-convention
                    :cdecl)))
(define-c-typedef av-window-did-maximize-proc
                  (:pointer
                   (:function
                    (av-window)
                    :void
                    :calling-convention
                    :cdecl)))
(define-c-typedef av-window-did-collapse-proc
                  (:pointer
                   (:function
                    (av-window)
                    :void
                    :calling-convention
                    :cdecl)))
(define-c-typedef av-window-did-move-proc
                  (:pointer
                   (:function
                    (av-window (:pointer av-screen-rect))
                    :void
                    :calling-convention
                    :cdecl)))
(define-c-typedef av-window-will-close-proc
                  (:pointer
                   (:function
                    (av-window as-bool)
                    as-bool
                    :calling-convention
                    :cdecl)))
(define-c-typedef av-window-did-close-proc
                  (:pointer
                   (:function
                    (av-window)
                    :void
                    :calling-convention
                    :cdecl)))
(define-c-typedef av-window-did-activate-proc
                  (:pointer
                   (:function
                    (av-window)
                    :void
                    :calling-convention
                    :cdecl)))
(define-c-typedef av-window-did-become-key-proc
                  (:pointer
                   (:function
                    (av-window)
                    :void
                    :calling-convention
                    :cdecl)))
(define-c-typedef av-window-key-down-proc
                  (:pointer
                   (:function
                    (av-window :byte (:pointer :void))
                    :void
                    :calling-convention
                    :cdecl)))
(define-c-typedef av-window-will-resign-key-proc
                  (:pointer
                   (:function
                    (av-window)
                    :void
                    :calling-convention
                    :cdecl)))
(define-c-typedef av-window-will-deactivate-proc
                  (:pointer
                   (:function
                    (av-window)
                    :void
                    :calling-convention
                    :cdecl)))
(define-c-typedef av-window-perform-edit-op-proc
                  (:pointer
                   (:function
                    (av-window as-atom)
                    :void
                    :calling-convention
                    :cdecl)))
(define-c-typedef av-window-can-perform-edit-op-proc
                  (:pointer
                   (:function
                    (av-window as-atom)
                    as-bool
                    :calling-convention
                    :cdecl)))
(define-c-typedef av-window-destroy-platform-thing-proc
                  (:pointer
                   (:function
                    (av-window (:pointer :void))
                    :void
                    :calling-convention
                    :cdecl)))
(define-c-typedef av-action-enum-proc
                  (:pointer
                   (:function
                    (as-atom
                     (:reference-pass :ef-mb-string)
                     (:pointer :void))
                    as-bool
                    :calling-convention
                    :cdecl)))
(define-c-typedef av-action-perform-proc
                  (:pointer
                   (:function
                    ((:pointer :void) pd-action av-doc)
                    :void
                    :calling-convention
                    :cdecl)))
(define-c-typedef av-action-do-properties-proc
                  (:pointer
                   (:function
                    ((:pointer :void) pd-action av-doc)
                    :void
                    :calling-convention
                    :cdecl)))
(define-c-typedef av-action-fill-action-dict-proc
                  (:pointer
                   (:function
                    ((:pointer :void) cos-obj av-doc)
                    :void
                    :calling-convention
                    :cdecl)))
(define-c-typedef av-action-get-instructions-proc
                  (:pointer
                   (:function
                    ((:pointer :void)
                     pd-action
                     (:reference-pass :ef-mb-string)
                     av-tarray-size
                     av-doc)
                    av-tarray-size
                    :calling-convention
                    :cdecl)))
(define-c-typedef av-action-get-button-text-proc
                  (:pointer
                   (:function
                    ((:pointer :void)
                     pd-action
                     (:reference-pass :ef-mb-string)
                     av-tarray-size
                     av-doc)
                    av-tarray-size
                    :calling-convention
                    :cdecl)))
(define-c-typedef av-action-get-string-one-text-proc
                  (:pointer
                   (:function
                    ((:pointer :void)
                     pd-action
                     (:reference-pass :ef-mb-string)
                     av-tarray-size
                     av-doc)
                    av-tarray-size
                    :calling-convention
                    :cdecl)))
(define-c-typedef av-action-get-string-two-text-proc
                  (:pointer
                   (:function
                    ((:pointer :void)
                     pd-action
                     (:reference-pass :ef-mb-string)
                     av-tarray-size
                     av-doc)
                    av-tarray-size
                    :calling-convention
                    :cdecl)))
(define-c-typedef av-action-copy-proc
                  (:pointer
                   (:function
                    ((:pointer :void) av-doc pd-action av-doc)
                    pd-action
                    :calling-convention
                    :cdecl)))
(define-c-typedef av-action-get-details-proc
                  (:pointer
                   (:function
                    ((:pointer :void) av-doc pd-action as-cab)
                    :void
                    :calling-convention
                    :cdecl)))
(define-c-typedef av-action-perform-ex-proc
                  (:pointer
                   (:function
                    ((:pointer :void)
                     pd-action
                     av-doc
                     av-action-context)
                    :void
                    :calling-convention
                    :cdecl)))
(define-c-typedef av-action-do-properties-ex-proc
                  (:pointer
                   (:function
                    ((:pointer :void)
                     av-doc
                     (:pointer pd-action)
                     as-array-size)
                    as-bool
                    :calling-convention
                    :cdecl)))
(define-c-typedef av-aux-data-perform-proc
                  (:pointer
                   (:function
                    (as-atom
                     (:pointer :void)
                     av-tbuffer-size
                     av-doc
                     (:pointer :void))
                    as-bool
                    :calling-convention
                    :cdecl)))
(define-c-typedef av-trans-handler-get-type-proc
                  (:pointer
                   (:function
                    (av-trans-handler)
                    as-atom
                    :calling-convention
                    :cdecl)))
(define-c-typedef av-trans-handler-execute-proc
                  (:pointer
                   (:function
                    (av-trans-handler
                     pd-trans
                     av-transition-port
                     av-transition-port
                     as-fixed)
                    :void
                    :calling-convention
                    :cdecl)))
(define-c-typedef av-trans-handler-get-uiname-proc
                  (:pointer
                   (:function
                    (av-trans-handler
                     pd-trans
                     (:reference-pass :ef-mb-string)
                     as-int32)
                    as-int32
                    :calling-convention
                    :cdecl)))
(define-c-typedef av-trans-handler-get-item-uiname-proc
                  (:pointer
                   (:function
                    (av-trans-handler
                     as-int32
                     (:reference-pass :ef-mb-string)
                     as-int32)
                    as-int32
                    :calling-convention
                    :cdecl)))
(define-c-typedef av-trans-handler-get-item-direction-uiname-proc
                  (:pointer
                   (:function
                    (av-trans-handler as-int32 as-text)
                    :void
                    :calling-convention
                    :cdecl)))
(define-c-typedef av-trans-handler-get-bi-dir-enabled-proc
                  (:pointer
                   (:function nil as-bool :calling-convention :cdecl)))
(define-c-typedef av-trans-handler-get-smooth-action-enabled-proc
                  (:pointer
                   (:function nil as-bool :calling-convention :cdecl)))
(define-c-typedef av-trans-handler-get-item-name-proc
                  (:pointer
                   (:function
                    (av-trans-handler as-int32)
                    as-atom
                    :calling-convention
                    :cdecl)))
(define-c-typedef av-trans-handler-get-name-proc
                  (:pointer
                   (:function
                    (av-trans-handler pd-trans)
                    as-atom
                    :calling-convention
                    :cdecl)))
(define-c-typedef av-trans-handler-init-trans-dict-proc
                  (:pointer
                   (:function
                    (av-trans-handler cos-obj)
                    :void
                    :calling-convention
                    :cdecl)))
(define-c-typedef av-trans-handler-complete-trans-dict-proc
                  (:pointer
                   (:function
                    (av-trans-handler
                     (:reference-pass :ef-mb-string)
                     cos-obj)
                    :void
                    :calling-convention
                    :cdecl)))
(define-c-typedef av-trans-handler-do-properties-proc
                  (:pointer
                   (:function
                    (av-trans-handler
                     (:reference-pass :ef-mb-string)
                     pd-trans)
                    :void
                    :calling-convention
                    :cdecl)))
(define-c-typedef av-trans-handler-get-instructions-proc
                  (:pointer
                   (:function
                    (av-trans-handler
                     (:reference-pass :ef-mb-string)
                     as-int32)
                    as-int32
                    :calling-convention
                    :cdecl)))
(define-c-typedef av-trans-handler-get-button-text-proc
                  (:pointer
                   (:function
                    (av-trans-handler
                     (:reference-pass :ef-mb-string)
                     as-int32)
                    as-int32
                    :calling-convention
                    :cdecl)))
(define-c-typedef av-trans-handler-get-string-one-text-proc
                  (:pointer
                   (:function
                    (av-trans-handler
                     (:reference-pass :ef-mb-string)
                     as-int32)
                    as-int32
                    :calling-convention
                    :cdecl)))
(define-c-typedef av-trans-handler-get-string-two-text-proc
                  (:pointer
                   (:function
                    (av-trans-handler
                     (:reference-pass :ef-mb-string)
                     as-int32)
                    as-int32
                    :calling-convention
                    :cdecl)))
(define-c-typedef av-trans-handler-enum-proc
                  (:pointer
                   (:function
                    (av-trans-handler (:pointer :void))
                    as-bool
                    :calling-convention
                    :cdecl)))
(define-c-typedef av-open-save-dialog-settings-compute-enabled-proc
                  (:pointer
                   (:function
                    ((:pointer av-file-filter-rec) (:pointer :void))
                    as-bool
                    :calling-convention
                    :cdecl)))
(define-c-typedef av-open-save-dialog-settings-execute-proc
                  (:pointer
                   (:function
                    ((:pointer av-file-filter-rec) (:pointer :void))
                    :void
                    :calling-convention
                    :cdecl)))
(define-c-typedef av-conversion-default-settings-proc
                  (:pointer
                   (:function
                    ((:reference-pass :ef-mb-string)
                     av-conversion-client-data)
                    as-cab
                    :calling-convention
                    :cdecl)))
(define-c-typedef av-conversion-set-settings-proc
                  (:pointer
                   (:function
                    (as-cab av-conversion-client-data)
                    as-bool
                    :calling-convention
                    :cdecl)))
(define-c-typedef av-conversion-param-desc-proc
                  (:pointer
                   (:function
                    (as-cab as-cab av-conversion-client-data)
                    :void
                    :calling-convention
                    :cdecl)))
(define-c-typedef av-conversion-settings-dialog-proc
                  (:pointer
                   (:function
                    (as-cab av-conversion-client-data)
                    as-bool
                    :calling-convention
                    :cdecl)))
(define-c-typedef av-conversion-convert-to-pdf-proc
                  (:pointer
                   (:function
                    (as-cab
                     av-conversion-flags
                     as-path-name
                     as-file-sys
                     (:pointer pd-doc)
                     av-status-monitor-procs
                     av-conversion-client-data)
                    av-conversion-status
                    :calling-convention
                    :cdecl)))
(define-c-typedef av-conversion-convert-stream-to-pdf-proc
                  (:pointer
                   (:function
                    (as-cab
                     av-conversion-flags
                     as-stm
                     as-cab
                     (:pointer pd-doc)
                     av-status-monitor-procs
                     av-conversion-client-data)
                    av-conversion-status
                    :calling-convention
                    :cdecl)))
(define-c-typedef av-conversion-append-to-pdf-proc
                  (:pointer
                   (:function
                    (as-cab
                     av-conversion-flags
                     as-path-name
                     as-file-sys
                     pd-doc
                     av-status-monitor-procs
                     av-conversion-client-data)
                    av-conversion-status
                    :calling-convention
                    :cdecl)))
(define-c-typedef av-conversion-get-queue-status-proc
                  (:pointer
                   (:function
                    (av-conversion-client-data)
                    as-uns32
                    :calling-convention
                    :cdecl)))
(define-c-typedef av-conversion-convert-from-pdf-proc
                  (:pointer
                   (:function
                    (as-cab
                     av-conversion-flags
                     pd-doc
                     as-path-name
                     as-file-sys
                     av-status-monitor-procs
                     av-conversion-client-data)
                    av-conversion-status
                    :calling-convention
                    :cdecl)))
(define-c-typedef av-conversion-convert-stream-from-pdf-proc
                  (:pointer
                   (:function
                    (as-cab
                     av-conversion-flags
                     pd-doc
                     as-stm
                     as-cab
                     av-status-monitor-procs
                     av-conversion-client-data)
                    av-conversion-status
                    :calling-convention
                    :cdecl)))
(define-c-typedef av-conversion-convert-stream-from-struct-node-proc
                  (:pointer
                   (:function
                    (as-cab
                     av-conversion-flags
                     av-struct-node
                     as-stm
                     as-cab
                     av-status-monitor-procs
                     av-conversion-client-data)
                    av-conversion-status
                    :calling-convention
                    :cdecl)))
(define-c-typedef av-conversion-to-pdf-enum-proc
                  (:pointer
                   (:function
                    (av-conversion-to-pdf-handler
                     av-conversion-enum-proc-data)
                    as-bool
                    :calling-convention
                    :cdecl)))
(define-c-typedef av-conversion-from-pdf-enum-proc
                  (:pointer
                   (:function
                    (av-conversion-from-pdf-handler
                     av-conversion-enum-proc-data)
                    as-bool
                    :calling-convention
                    :cdecl)))
(define-c-typedef av-cmd-handler-init-proc
                  (:pointer
                   (:function
                    (as-atom)
                    as-bool
                    :calling-convention
                    :cdecl)))
(define-c-typedef av-cmd-handler-term-proc
                  (:pointer
                   (:function
                    (as-atom)
                    :void
                    :calling-convention
                    :cdecl)))
(define-c-typedef av-register-commands-proc
                  (:pointer
                   (:function
                    (as-atom)
                    :void
                    :calling-convention
                    :cdecl)))
(define-c-typedef av-command-created-proc
                  (:pointer
                   (:function
                    (av-command)
                    :void
                    :calling-convention
                    :cdecl)))
(define-c-typedef av-command-destroy-proc
                  (:pointer
                   (:function
                    (av-command)
                    :void
                    :calling-convention
                    :cdecl)))
(define-c-typedef av-command-set-proc
                  (:pointer
                   (:function
                    (av-command as-cab)
                    av-command-status
                    :calling-convention
                    :cdecl)))
(define-c-typedef av-command-get-proc
                  (:pointer
                   (:function
                    (av-command as-cab)
                    :void
                    :calling-convention
                    :cdecl)))
(define-c-typedef av-command-show-dialog-proc
                  (:pointer
                   (:function
                    (av-command)
                    av-command-status
                    :calling-convention
                    :cdecl)))
(define-c-typedef av-command-work-proc
                  (:pointer
                   (:function
                    (av-command)
                    av-command-status
                    :calling-convention
                    :cdecl)))
(define-c-typedef av-command-cancel-proc
                  (:pointer
                   (:function
                    (av-command)
                    av-command-status
                    :calling-convention
                    :cdecl)))
(define-c-typedef av-command-reset-proc
                  (:pointer
                   (:function
                    (av-command)
                    av-command-status
                    :calling-convention
                    :cdecl)))
(define-c-typedef av-command-preflight-sequence-proc
                  (:pointer
                   (:function
                    (av-command)
                    av-command-status
                    :calling-convention
                    :cdecl)))
(define-c-typedef av-command-preflight-file-proc
                  (:pointer
                   (:function
                    (av-command pd-doc)
                    av-command-status
                    :calling-convention
                    :cdecl)))
(define-c-typedef av-command-postflight-file-proc
                  (:pointer
                   (:function
                    (av-command pd-doc)
                    av-command-status
                    :calling-convention
                    :cdecl)))
(define-c-typedef av-command-postflight-sequence-proc
                  (:pointer
                   (:function
                    (av-command)
                    av-command-status
                    :calling-convention
                    :cdecl)))
(define-c-typedef av-simple-sel-hilite-proc
                  (:pointer
                   (:function
                    (av-simple-sel-obj av-doc)
                    :void
                    :calling-convention
                    :cdecl)))
(define-c-typedef av-simple-sel-de-hilite-proc
                  (:pointer
                   (:function
                    (av-simple-sel-obj av-doc)
                    :void
                    :calling-convention
                    :cdecl)))
(define-c-typedef av-simple-sel-data-destroy-proc
                  (:pointer
                   (:function
                    (av-simple-sel-obj)
                    :void
                    :calling-convention
                    :cdecl)))
(define-c-typedef av-undo-verify-proc
                  (:pointer
                   (:function
                    (av-undo)
                    as-bool
                    :calling-convention
                    :cdecl)))
(define-c-typedef av-undo-release-proc
                  (:pointer
                   (:function
                    (av-undo)
                    :void
                    :calling-convention
                    :cdecl)))
(define-c-typedef av-undo-execute-proc
                  (:pointer
                   (:function
                    (av-undo)
                    as-bool
                    :calling-convention
                    :cdecl)))
(define-c-typedef av-undo-get-title-proc
                  (:pointer
                   (:function
                    (av-undo as-text)
                    :void
                    :calling-convention
                    :cdecl)))
(define-c-typedef av-undo-begin-end-proc
                  (:pointer
                   (:function
                    (av-doc as-bool)
                    :void
                    :calling-convention
                    :cdecl)))
(define-c-typedef plugin-exec-proc
                  (:pointer
                   (:function (nil) :void :calling-convention :cdecl)))
(define-c-typedef av-custom-notification-proc
                  (:pointer
                   (:function
                    (av-notification-data (:pointer :void))
                    :void
                    :calling-convention
                    :cdecl)))
(define-c-struct av-icon-bundle-rec
                 (tag1 as-uns32)
                 (tag2 as-uns32)
                 (version as-int32)
                 (gray-icon av-icon-bundle-icon-ref)
                 (color-icon av-icon-bundle-icon-ref))
(define-c-typedef av-icon-bundle (:pointer av-icon-bundle-rec))
(define-c-struct av-icon-handler-rec
                 (size as-int32)
                 (client-data (:pointer :void))
                 (measure av-icon-handler-measure-proc)
                 (open-stm av-icon-handler-open-stm-proc)
                 (get-flags av-icon-handler-get-flags-proc)
                 (release av-icon-handler-release-proc)
                 (resize av-icon-handler-resize-proc))
(define-c-typedef av-icon-handler (:pointer av-icon-handler-rec))
(define-c-struct av-icon-data-rec
                 (data-stm as-stm)
                 (e-color-format av-icon-color-format))
(define-c-typedef av-icon-data (:pointer av-icon-data-rec))
(define-c-struct os2port-rec (h-wnd hwnd) (h-ps hps))
(define-c-typedef os2port (:pointer os2port-rec))
(define-c-struct av-rect
                 (left av-sdk-dependent-integer)
                 (top av-sdk-dependent-integer)
                 (right av-sdk-dependent-integer)
                 (bottom av-sdk-dependent-integer))
(define-c-typedef av-rect-p (:pointer av-rect))
(define-c-struct av-point (h as-int32) (v as-int32))
(define-c-struct av-doc-selection-server-rec
                 (size as-size-t)
                 (get-type av-doc-selection-get-type-proc)
                 (getting-selection
                  av-doc-selection-getting-selection-proc)
                 (added-to-selection
                  av-doc-selection-added-to-selection-proc)
                 (losing-selection
                  av-doc-selection-losing-selection-proc)
                 (removed-from-selection
                  av-doc-selection-removed-from-selection-proc)
                 (can-select-all av-doc-selection-can-select-all-proc)
                 (select-all av-doc-selection-select-all-proc)
                 (can-properties av-doc-selection-can-properties-proc)
                 (properties av-doc-selection-properties-proc)
                 (can-delete av-doc-selection-can-delete-proc)
                 (delete av-doc-selection-delete-proc)
                 (can-copy av-doc-selection-can-copy-proc)
                 (copy av-doc-selection-copy-proc)
                 (enum-selection av-doc-selection-enum-selection-proc)
                 (show-selection av-doc-selection-show-selection-proc)
                 (can-cut av-doc-selection-can-cut-proc)
                 (cut av-doc-selection-cut-proc)
                 (can-paste av-doc-selection-can-paste-proc)
                 (paste av-doc-selection-paste-proc)
                 (key-down av-doc-selection-key-down-proc)
                 (highlight-selection
                  av-doc-selection-highlight-selection-proc)
                 (get-selection-type
                  av-doc-selection-get-selection-type-proc)
                 (enum-page-ranges
                  av-doc-selection-enum-page-ranges-proc)
                 (old-get-avrect old-avdoc-selection-get-avrect-proc)
                 (old-show-menu old-avdoc-selection-show-menu-proc)
                 (get-avrect av-doc-selection-get-avrect-proc)
                 (show-menu av-doc-selection-show-menu-proc)
                 (highlight-selection-ex
                  av-doc-selection-highlight-selection-ex-proc)
                 (acquire-quads av-doc-selection-acquire-quads-proc)
                 (can-paste-from-platform
                  av-doc-selection-can-paste-from-platform-proc)
                 (paste-from-platform
                  av-doc-selection-paste-from-platform-proc)
                 (unicode-key-down
                  av-doc-selection-unicode-key-down-proc)
                 (type as-atom))
(define-c-typedef av-doc-selection-server
                  (:pointer av-doc-selection-server-rec))
(define-c-struct av-doc-view-def-rec
                 (size as-size-t)
                 (bring-to-front as-bool)
                 (use-page-view-info as-bool)
                 (page-view-layout-mode pd-layout-mode)
                 (page-view-page-num pd-page-number)
                 (page-view-zoom-type av-zoom-type)
                 (page-view-zoom as-fixed)
                 (page-view-x av-dev-coord)
                 (page-view-y av-dev-coord)
                 (page-view-start-thread as-bool)
                 (page-view-thread-index av-page-index)
                 (page-view-bead pd-bead)
                 (use-over-view-info as-bool)
                 (over-view-mode pd-page-mode)
                 (over-view-pos av-pixel-offset)
                 (over-view-x as-int32)
                 (over-view-y as-int32)
                 (use-window-info as-bool)
                 (window-frame av-screen-rect)
                 (window-maximized as-bool)
                 (unused2 (:reference-pass :ef-mb-string)))
(define-c-typedef av-doc-view-def (:pointer av-doc-view-def-rec))
(define-c-struct av-dest-info-rec
                 (size as-size-t)
                 (named-dest (:reference-pass :ef-mb-string))
                 (name-length av-tarray-size)
                 (page-num pd-page-number)
                 (fit-type as-atom)
                 (dest-rect as-fixed-rect)
                 (zoom as-fixed))
(define-c-typedef av-dest-info (:pointer av-dest-info-rec))
(define-c-struct av-doc-open-params-rec
                 (size as-size-t)
                 (use-frame as-bool)
                 (frame av-screen-rect)
                 (use-visible as-bool)
                 (visible as-bool)
                 (use-server-type as-bool)
                 (server-type (:reference-pass :ef-mb-string))
                 (server-creation-data (:pointer :void))
                 (use-source-doc as-bool)
                 (source-doc av-doc)
                 (use-read-only as-bool)
                 (read-only as-bool)
                 (use-view-type as-bool)
                 (view-type (:reference-pass :ef-mb-string))
                 (use-view-def as-bool)
                 (view-def av-doc-view-def)
                 (use-perm-req-proc as-bool)
                 (perm-req-proc av-doc-perm-req-proc)
                 (open-actions as-cab)
                 (suppress-dialogs as-bool)
                 (use-collection-pref as-bool)
                 (collection-pref as-bool)
                 (use-minimize as-bool)
                 (minimize as-bool)
                 (force-open-protected-view as-bool)
                 (force-open-option av-doc-force-open-option)
                 (open-flags av-doc-open-flags))
(define-c-typedef av-doc-open-params (:pointer av-doc-open-params-rec))
(define-c-struct external-doc-server-creation-data-rec
                 (size as-size-t)
                 (platform-window external-doc-window-data)
                 (acrobat-proc av-execute-proc)
                 (acrobat-proc-data (:pointer :void))
                 (cross-doc-link-proc cross-doc-link-proc)
                 (cross-doc-link-proc-data (:pointer :void))
                 (set-message av-set-message-proc)
                 (set-message-proc-data (:pointer :void))
                 (cross-doc-link-with-dest-proc
                  cross-doc-link-with-dest-proc)
                 (cross-doc-link-with-dest-data (:pointer :void))
                 (set-focus av-set-focus-proc)
                 (set-focus-proc-data (:pointer :void))
                 (set-focus-shifttab av-set-focus-proc)
                 (set-focus-shifttabproc-data (:pointer :void))
                 (set-focus-ctrltab av-set-focus-proc)
                 (set-focus-ctrltabproc-data (:pointer :void)))
(define-c-typedef external-doc-server-creation-data
                  (:pointer external-doc-server-creation-data-rec))
(define-c-struct av-annot-handler-info-rec
                 (size as-size-t)
                 (c-name (:pointer (:unsigned :byte)))
                 (v-bitmap (:pointer :void)))
(define-c-typedef av-annot-handler-info
                  (:pointer av-annot-handler-info-rec))
(define-c-struct av-annot-op-data-rec
                 (size as-size-t)
                 (x av-dev-coord)
                 (y av-dev-coord)
                 (client-data (:pointer :void))
                 (reason av-annot-op-reason)
                 (page-num as-int32))
(define-c-typedef av-annot-op-data (:pointer av-annot-op-data-rec))
(define-c-struct av-click-params-rec
                 (size as-size-t)
                 (x-hit av-dev-coord)
                 (y-hit av-dev-coord)
                 (flags av-flag-bits16)
                 (click-no av-tcount)
                 (tool-type as-atom))
(define-c-typedef av-click-params (:pointer av-click-params-rec))
(define-c-struct av-adjust-cursor-params-rec
                 (size as-size-t)
                 (x-hit av-dev-coord)
                 (y-hit av-dev-coord)
                 (tool-type as-atom))
(define-c-typedef av-adjust-cursor-params
                  (:pointer av-adjust-cursor-params-rec))
(define-c-struct av-annot-appearance-data-rec
                 (size as-size-t)
                 (appearance-object cos-obj)
                 (selected-shape-appearance-obj cos-obj))
(define-c-struct av-annot-handler-rec
                 (size as-size-t)
                 (flags av-flag-bits32)
                 (old-do-click old-avannot-handler-do-click-proc)
                 (old-adjust-cursor
                  old-avannot-handler-adjust-cursor-proc)
                 (old-pt-in-annot-view-bbox
                  old-avannot-handler-pt-in-annot-view-bbox-proc)
                 (old-get-annot-view-bbox
                  old-avannot-handler-get-annot-view-bbox-proc)
                 (notify-annot-removed-from-selection
                  av-annot-handler-notify-annot-removed-from-selection-proc)
                 (notify-annot-added-to-selection
                  av-annot-handler-notify-annot-added-to-selection-proc)
                 (draw av-annot-handler-draw-proc)
                 (new av-annot-handler-new-proc)
                 (get-type av-annot-handler-get-type-proc)
                 (notify-destroy av-annot-handler-notify-destroy-proc)
                 (do-properties av-annot-handler-do-properties-proc)
                 (do-key-down av-annot-handler-do-key-down-proc)
                 (get-layer av-annot-handler-get-layer-proc)
                 (cursor-enter av-annot-handler-cursor-enter-proc)
                 (cursor-exit av-annot-handler-cursor-exit-proc)
                 (copy av-annot-handler-copy-proc)
                 (old-do-right-click old-avannot-handler-do-click-proc)
                 (get-info av-annot-handler-get-info-proc)
                 (delete-info av-annot-handler-delete-info-proc)
                 (can-perform-op av-annot-handler-can-perform-op-proc)
                 (perform-op av-annot-handler-perform-op-proc)
                 (do-key-down-ex av-annot-handler-do-key-down-ex-proc)
                 (old-draw-ex old-avannot-handler-draw-ex-proc)
                 (get-flags av-annot-handler-get-flags-proc)
                 (do-click av-annot-handler-do-click-proc)
                 (adjust-cursor av-annot-handler-adjust-cursor-proc)
                 (pt-in-annot-view-bbox
                  av-annot-handler-pt-in-annot-view-bbox-proc)
                 (get-annot-view-bbox
                  av-annot-handler-get-annot-view-bbox-proc)
                 (do-right-click av-annot-handler-do-click-proc)
                 (draw-ex av-annot-handler-draw-ex-proc)
                 (get-appearance av-annot-handler-get-appearance-proc)
                 (begin-appearance-drawing
                  av-annot-handler-appearance-drawing-proc)
                 (finish-appearance-drawing
                  av-annot-handler-appearance-drawing-proc)
                 (cancel-appearance-drawing
                  av-annot-handler-appearance-drawing-proc)
                 (do-properties-ex
                  av-annot-handler-do-properties-ex-proc)
                 (get-layer-ex av-annot-handler-get-layer-ex-proc)
                 (do-click-ex av-annot-handler-do-click-ex-proc)
                 (do-right-click-ex av-annot-handler-do-click-ex-proc)
                 (adjust-cursor-ex
                  av-annot-handler-adjust-cursor-ex-proc)
                 (get-accessibility-string
                  av-annot-handler-get-accessibility-string-proc)
                 (get-annot-in-tab-order
                  av-annot-handler-get-annot-in-tab-order-proc)
                 (get-aux-icon-count
                  av-annot-handler-get-aux-icon-count-proc)
                 (get-aux-icons av-annot-handler-get-aux-icons-proc)
                 (get-appearance-ex
                  av-annot-handler-get-appearance-ex-proc)
                 (post-draw av-annot-handler-post-draw-proc))
(define-c-struct av-tool-rec
                 (size as-size-t)
                 (activate activate-proc-type)
                 (deactivate deactivate-proc-type)
                 (old-do-click old-do-click-proc-type)
                 (old-adjust-cursor old-adjust-cursor-proc-type)
                 (do-key-down do-key-down-proc-type)
                 (get-type get-type-proc-type)
                 (is-persistent is-persistent-proc-type)
                 (cursor-id av-cursor-id)
                 (compute-enabled av-compute-enabled-proc)
                 (compute-enabled-data (:pointer :void))
                 (old-do-right-click old-do-click-proc-type)
                 (do-leave do-leave-proc-type)
                 (get-selection-server get-selection-server-proc-type)
                 (do-click do-click-proc-type)
                 (adjust-cursor adjust-cursor-proc-type)
                 (do-right-click do-click-proc-type)
                 (client-data (:pointer :void))
                 (destroy av-tool-destroy-proc)
                 (old-get-label old-avtool-get-label-proc)
                 (get-label-icon av-tool-get-label-icon-proc)
                 (handle-mouse-wheel handle-mouse-wheel-scroll-proc)
                 (get-label av-tool-get-label-proc)
                 (get-tool-tip av-tool-get-tool-tip-proc))
(define-c-struct av-tool-bar-add-button-params-rec
                 (size as-size-t)
                 (neighbor-button av-tool-button)
                 (before as-bool)
                 (hidden-default as-bool))
(define-c-typedef av-tool-bar-add-button-params
                  (:pointer av-tool-bar-add-button-params-rec))
(define-c-struct av-window-handler-rec
                 (size as-size-t)
                 (mouse-down av-window-mouse-down-proc)
                 (will-close av-window-will-close-proc)
                 (did-close av-window-did-close-proc)
                 (did-activate av-window-did-activate-proc)
                 (did-become-key av-window-did-become-key-proc)
                 (key-down av-window-key-down-proc)
                 (will-resign-key av-window-will-resign-key-proc)
                 (will-deactivate av-window-will-deactivate-proc)
                 (draw av-window-draw-proc)
                 (will-be-resized av-window-will-be-resized-proc)
                 (perform-edit-op av-window-perform-edit-op-proc)
                 (can-perform-edit-op
                  av-window-can-perform-edit-op-proc)
                 (adjust-cursor av-window-adjust-cursor-proc)
                 (did-resize av-window-did-resize-proc)
                 (destroy-platform-thing
                  av-window-destroy-platform-thing-proc)
                 (did-maximize av-window-did-maximize-proc)
                 (did-collapse av-window-did-collapse-proc)
                 (did-move av-window-did-move-proc))
(define-c-typedef av-window-handler (:pointer av-window-handler-rec))
(define-c-struct av-alert-button-info (show as-bool) (title as-text))
(define-c-struct av-alert-check-box-info
                 (show as-bool)
                 (title as-text)
                 (value as-bool))
(define-c-struct av-alert-params-rec
                 (size as-size-t)
                 (parent-doc av-doc)
                 (window-title as-text)
                 (icon-type av-icon-type)
                 (message as-text)
                 (beep as-bool)
                 (button1 av-alert-button-info)
                 (button2 av-alert-button-info)
                 (button3 av-alert-button-info)
                 (checkbox av-alert-check-box-info)
                 (alert-type av-alert-type)
                 (parent-window av-window))
(define-c-typedef av-alert-params (:pointer av-alert-params-rec))
(define-c-struct av-action-context-rec
                 (size as-size-t)
                 (co cos-obj)
                 (asa-type as-atom)
                 (asa-key as-atom))
(define-c-typedef av-action-context (:pointer av-action-context-rec))
(define-c-struct av-action-handler-procs-rec
                 (size as-size-t)
                 (perform av-action-perform-proc)
                 (do-properties av-action-do-properties-proc)
                 (fill-action-dict av-action-fill-action-dict-proc)
                 (get-instructions av-action-get-instructions-proc)
                 (get-button-text av-action-get-button-text-proc)
                 (get-string-one-text
                  av-action-get-string-one-text-proc)
                 (get-string-two-text
                  av-action-get-string-two-text-proc)
                 (copy av-action-copy-proc)
                 (perform-ex av-action-perform-ex-proc)
                 (do-properties-ex av-action-do-properties-ex-proc)
                 (get-details av-action-get-details-proc))
(define-c-struct av-aux-data-handler-rec
                 (size as-size-t)
                 (old-perform-proc old-avaux-data-perform-proc)
                 (perform-proc av-aux-data-perform-proc))
(define-c-typedef av-aux-data-handler
                  (:pointer av-aux-data-handler-rec))
(define-c-struct as-platform-printer-spec-rec
                 (size as-size-t)
                 (h-res :short)
                 (v-res :short))
(define-c-typedef as-platform-printer-spec
                  (:pointer as-platform-printer-spec-rec))
(define-c-struct av-doc-print-tile-data-rec
                 (size as-size-t)
                 (overlap as-uns32)
                 (scale as-fixed)
                 (label as-bool)
                 (mark-type av-tile-mark))
(define-c-typedef av-doc-print-tile-data
                  (:pointer av-doc-print-tile-data-rec))
(define-c-struct av-doc-print-nup-data-rec
                 (size as-size-t)
                 (num-pages-per-sheet-h as-int32)
                 (num-pages-per-sheet-v as-int32)
                 (page-order av-n-up-page-order)
                 (page-border as-bool)
                 (auto-rotate as-bool)
                 (booklet-binding av-booklet-binding)
                 (booklet-duplex-mode av-booklet-duplex-mode)
                 (booklet-subset-from as-int32)
                 (booklet-subset-to as-int32))
(define-c-typedef av-doc-print-nup-data
                  (:pointer av-doc-print-nup-data-rec))
(define-c-struct av-doc-print-rasterize-data-rec
                 (size as-size-t)
                 (flags av-rasterize-flags)
                 (transparency as-int32)
                 (bitmap-resolution as-uns32)
                 (gradient-resolution as-uns32)
                 (print-as-image-resolution as-uns32))
(define-c-typedef av-doc-print-rasterize-data
                  (:pointer av-doc-print-rasterize-data-rec))
(define-c-struct av-doc-print-override-data-rec
                 (size as-size-t)
                 (color-override av-color-forcing)
                 (use-printer-crd av-use-value)
                 (use-t1conversion av-use-value))
(define-c-typedef av-doc-print-override-data
                  (:pointer av-doc-print-override-data-rec))
(define-c-struct av-doc-print-params-rec
                 (size as-size-t)
                 (interactive as-bool)
                 (cancel-dialog as-bool)
                 (first-page as-int32)
                 (last-page as-int32)
                 (ps-level as-int32)
                 (binary-ok as-bool)
                 (shrink-to-fit as-bool)
                 (file-sys-name as-atom)
                 (file-path-name as-path-name)
                 (printer-spec as-platform-printer-spec)
                 (embedded as-bool)
                 (embedded-rect av-rect)
                 (emit-to-printer as-bool)
                 (emit-to-file as-bool)
                 (do-color-separations as-bool)
                 (emit-file-option as-enum8)
                 (emit-font-option as-enum8)
                 (emit-flags as-uns32)
                 (ranges (:pointer pd-page-range))
                 (num-ranges av-tsmall-array-size)
                 (ttas-t42 as-bool)
                 (print-as-image as-bool)
                 (printer-has-far-east-fonts as-bool)
                 (reverse as-bool)
                 (page-spec as-int32)
                 (transparency-level as-int32)
                 (page-size av-page-size)
                 (tile-data av-doc-print-tile-data)
                 (raster-data av-doc-print-rasterize-data)
                 (override-data av-doc-print-override-data)
                 (select-rect (:pointer as-fixed-rect))
                 (oc-context pd-occontext)
                 (res-policy av-resource-policy)
                 (marks-flags as-uns32)
                 (n-up-data av-doc-print-nup-data)
                 (marks-style as-int32)
                 (print-dialog-was-cancelled as-bool)
                 (parent-window av-window)
                 (ppd-path (:reference-pass :ef-mb-string))
                 (custom-marks-file-name as-path-name)
                 (num-copies as-int32)
                 (duplex-type av-print-duplex-type)
                 (save-toner as-bool))
(define-c-struct av-doc-print-seps-params-rec
                 (size as-size-t)
                 (av-doc av-doc)
                 (first-page as-int32)
                 (last-page as-int32)
                 (file-sys-name as-atom)
                 (file-path-name as-path-name)
                 (emit-file-option as-enum8)
                 (emit-flags as-uns32)
                 (page-size av-page-size)
                 (raster-data av-doc-print-rasterize-data)
                 (override-data av-doc-print-override-data)
                 (seps-spec pd-host-seps-spec)
                 (in-rip as-bool)
                 (trap-type as-int32)
                 (printer-spec as-platform-printer-spec))
(define-c-struct av-transition-port-rec
                 (reserved (:pointer :void))
                 (rect32 av-rect32))
(define-c-typedef av-transition-port (:pointer av-transition-port-rec))
(define-c-struct av-trans-handler-rec
                 (size as-size-t)
                 (get-type av-trans-handler-get-type-proc)
                 (execute av-trans-handler-execute-proc)
                 (get-uiname av-trans-handler-get-uiname-proc)
                 (get-item-uiname
                  av-trans-handler-get-item-uiname-proc)
                 (init-trans-dict
                  av-trans-handler-init-trans-dict-proc)
                 (complete-trans-dict
                  av-trans-handler-complete-trans-dict-proc)
                 (do-properties av-trans-handler-do-properties-proc)
                 (get-instructions
                  av-trans-handler-get-instructions-proc)
                 (get-button-text
                  av-trans-handler-get-button-text-proc)
                 (get-string-one-text
                  av-trans-handler-get-string-one-text-proc)
                 (get-string-two-text
                  av-trans-handler-get-string-two-text-proc)
                 (get-name av-trans-handler-get-name-proc)
                 (get-item-name av-trans-handler-get-item-name-proc)
                 (disclude-from-random as-bool)
                 (disclude-from-ui as-bool)
                 (get-item-direction-uiname
                  av-trans-handler-get-item-direction-uiname-proc)
                 (get-bi-dir-enabled
                  av-trans-handler-get-bi-dir-enabled-proc)
                 (get-smooth-action-enabled
                  av-trans-handler-get-smooth-action-enabled-proc))
(define-c-struct av-doc-save-params-rec
                 (size as-size-t)
                 (use-save-dialog as-bool)
                 (dont-allow-conversions as-bool)
                 (filter-id (:reference-pass :ef-mb-string))
                 (use-defaults as-bool))
(define-c-typedef av-doc-save-params (:pointer av-doc-save-params-rec))
(define-c-struct av-status-monitor-procs-rec
                 (size as-size-t)
                 (prog-mon as-progress-monitor)
                 (prog-mon-client-data (:pointer :void))
                 (cancel-proc as-cancel-proc)
                 (cancel-proc-client-data (:pointer :void))
                 (report-proc as-report-proc)
                 (report-proc-client-data (:pointer :void)))
(define-c-typedef av-status-monitor-procs
                  (:pointer av-status-monitor-procs-rec))
(define-c-struct av-file-desc-rec
                 (mac-file-type as-uns32)
                 (mac-file-creator as-uns32))
(define-c-struct av-file-filter-rec
                 (filter-description as-text)
                 (file-descs (:pointer av-file-desc-rec))
                 (num-file-descs av-array-size))
(define-c-struct av-open-save-dialog-params-rec
                 (size as-size-t)
                 (flags av-open-save-dialog-flags)
                 (parent-window av-window)
                 (window-title as-text)
                 (action-button-title as-text)
                 (cancel-button-title as-text)
                 (initial-file-sys as-file-sys)
                 (initial-path-name as-path-name)
                 (initial-file-name as-text)
                 (num-file-filters av-array-size)
                 (settings-compute-enabled-proc
                  av-open-save-dialog-settings-compute-enabled-proc)
                 (settings-execute-proc
                  av-open-save-dialog-settings-execute-proc)
                 (settings-proc-data (:pointer :void))
                 (show-export-checkbox as-bool)
                 (file-options-rfs as-text)
                 (custom-input-data-size as-size-t)
                 (custom-input-data (:pointer :void))
                 (custom-output-data-size as-size-t)
                 (custom-output-data (:pointer :void)))
(define-c-typedef av-open-save-dialog-params
                  (:pointer av-open-save-dialog-params-rec))
(define-c-struct av-open-save-dialog-out-params-rec
                 (chosen-file-sys as-file-sys)
                 (chosen-path-name as-path-name)
                 (chosen-filter-index as-int16)
                 (launch-file as-bool))
(define-c-typedef av-open-save-dialog-out-params
                  (:pointer av-open-save-dialog-out-params-rec))
(define-c-struct av-conversion-to-pdf-handler-rec
                 (conv-filter av-file-filter-rec)
                 (size as-size-t)
                 (can-do-sync as-bool)
                 (priority av-priority)
                 (default-settings av-conversion-default-settings-proc)
                 (set-settings av-conversion-set-settings-proc)
                 (parameter-description av-conversion-param-desc-proc)
                 (settings-dialog av-conversion-settings-dialog-proc)
                 (convert av-conversion-convert-to-pdf-proc)
                 (append av-conversion-append-to-pdf-proc)
                 (get-queue-status av-conversion-get-queue-status-proc)
                 (client-data av-conversion-client-data)
                 (stream-mime-types
                  (:pointer av-conversion-mime-type-string))
                 (num-stream-mime-types av-array-size)
                 (convert-stream
                  av-conversion-convert-stream-to-pdf-proc)
                 (reserved av-conversion-client-data))
(define-c-typedef av-conversion-to-pdf-handler
                  (:pointer av-conversion-to-pdf-handler-rec))
(define-c-struct av-conversion-from-pdf-handler-rec
                 (conv-filter av-file-filter-rec)
                 (size as-size-t)
                 (can-do-sync as-bool)
                 (priority av-priority)
                 (default-settings av-conversion-default-settings-proc)
                 (parameter-description av-conversion-param-desc-proc)
                 (settings-dialog av-conversion-settings-dialog-proc)
                 (convert av-conversion-convert-from-pdf-proc)
                 (client-data av-conversion-client-data)
                 (stream-mime-types
                  (:pointer av-conversion-mime-type-string))
                 (num-stream-mime-types av-array-size)
                 (convert-stream
                  av-conversion-convert-stream-from-pdf-proc)
                 (convert-struct-node
                  av-conversion-convert-stream-from-struct-node-proc))
(define-c-typedef av-conversion-from-pdf-handler
                  (:pointer av-conversion-from-pdf-handler-rec))
(define-c-struct av-command-handler-rec
                 (size as-size-t)
                 (initialize av-cmd-handler-init-proc)
                 (terminate av-cmd-handler-term-proc)
                 (register-commands av-register-commands-proc)
                 (created av-command-created-proc)
                 (destroy av-command-destroy-proc)
                 (set-params av-command-set-proc)
                 (get-params av-command-get-proc)
                 (get-props av-command-get-proc)
                 (show-dialog av-command-show-dialog-proc)
                 (work av-command-work-proc)
                 (cancel av-command-cancel-proc)
                 (reset av-command-reset-proc)
                 (preflight-sequence
                  av-command-preflight-sequence-proc)
                 (preflight-file av-command-preflight-file-proc)
                 (postflight-file av-command-postflight-file-proc)
                 (postflight-sequence
                  av-command-postflight-sequence-proc)
                 (reserved (:pointer :void)))
(define-c-struct av-drag-rect-params-rec
                 (size as-size-t)
                 (page-view av-page-view)
                 (x-start as-int32)
                 (y-start as-int32)
                 (start-rect (:pointer as-fixed-rect))
                 (result-rect (:pointer as-fixed-rect))
                 (drag-type av-drag-type)
                 (extrema (:pointer av-dev-rect))
                 (cursor-array (:pointer av-cursor))
                 (n-cursors as-int32)
                 (draw-proc av-page-view-draw-proc)
                 (min-rect (:pointer av-dev-rect)))
(define-c-typedef av-drag-rect-params
                  (:pointer av-drag-rect-params-rec))
(define-c-struct av-tool-bar-position-rec
                 (size as-size-t)
                 (in-doc as-bool)
                 (dock-position av-tool-bar-dock-position)
                 (floating-window-name (:reference-pass :ef-mb-string))
                 (stack-num as-int32)
                 (offset as-int32)
                 (order as-int32)
                 (window-frame av-screen-rect)
                 (layout av-tool-bar-layout)
                 (hidden as-bool)
                 (window-hidden as-bool))
(define-c-typedef av-tool-bar-position
                  (:pointer av-tool-bar-position-rec))
(define-c-struct av-extension-info-rec
                 (asa-name as-atom)
                 (b-loaded as-bool)
                 (b-certified as-bool)
                 (n-major-version av-version-num-part)
                 (n-minor-version av-version-num-part)
                 (c-date (:reference-pass :ef-mb-string))
                 (asp-file as-path-name)
                 (c-description (:reference-pass :ef-mb-string))
                 (c-legal (:reference-pass :ef-mb-string))
                 (c-dependencies (:reference-pass :ef-mb-string)))
(define-c-typedef av-extension-info (:pointer av-extension-info-rec))
(define-c-struct av-simple-sel-procs-rec
                 (size as-size-t)
                 (type (:reference-pass :ef-mb-string))
                 (hilite-proc av-simple-sel-hilite-proc)
                 (de-hilite-proc av-simple-sel-de-hilite-proc)
                 (destroy-proc av-simple-sel-data-destroy-proc))
(define-c-typedef av-simple-sel-procs
                  (:pointer av-simple-sel-procs-rec))
(define-c-struct av-undo-handler-rec
                 (size as-size-t)
                 (type (:reference-pass :ef-mb-string))
                 (verify-undo av-undo-verify-proc)
                 (undo av-undo-execute-proc)
                 (verify-redo av-undo-verify-proc)
                 (redo av-undo-execute-proc)
                 (get-undo-title av-undo-get-title-proc)
                 (get-redo-title av-undo-get-title-proc)
                 (release av-undo-release-proc)
                 (begin-undo-redo av-undo-begin-end-proc)
                 (end-undo-redo av-undo-begin-end-proc))
(define-c-typedef av-undo-handler (:pointer av-undo-handler-rec))
(define-c-struct av-ink-value (ink-name as-atom) (value :float))
(define-c-struct av-app-language-params-rec
                 (size as-size-t)
                 (k-lang-format av-app-language-format)
                 (k-lang-selector av-app-language-selector)
                 (lang-id as-int32))
(define-c-typedef av-app-language-params
                  (:pointer av-app-language-params-rec))
(define-c-struct pd-fopt-image-options-rec
                 (size as-size-t)
                 (enm-downsampling-algo pd-fopt-downsampling-algo)
                 (ppi-downsample-to as-int32)
                 (ppi-downsample-above as-int32)
                 (enm-compression-algo pd-fopt-compression-algo)
                 (enm-compression-qlty pd-fopt-compression-qlty)
                 (n-tile-size as-int32))
(define-c-typedef pd-fopt-image-options
                  (:pointer pd-fopt-image-options-rec))
(define-c-struct pd-fopt-flatten-transparency-options-rec
                 (size as-size-t)
                 (pct-raster-vector-balance as-int32)
                 (ppi-line-art-and-text as-int32)
                 (ppi-gradient-and-mesh as-int32)
                 (b-convert-text as-bool)
                 (b-convert-strokes as-bool)
                 (b-clip-complex-regions as-bool)
                 (b-preserve-overprint as-bool))
(define-c-typedef pd-fopt-flatten-transparency-options
                  (:pointer pd-fopt-flatten-transparency-options-rec))
(define-c-struct pd-fopt-params-rec
                 (size as-size-t)
                 (as-path-dest as-path-name)
                 (file-sys as-file-sys)
                 (prog-mon progress-monitor)
                 (prog-mon-client-data (:pointer :void))
                 (enm-acrobat-version pd-fopt-pdf-version)
                 (image-options-color pd-fopt-image-options-rec)
                 (image-options-grayscale pd-fopt-image-options-rec)
                 (image-options-monochrome pd-fopt-image-options-rec)
                 (arr-pdf-onts-to-unembed (:pointer pd-font))
                 (c-pdf-onts-to-unembed as-int32)
                 (pdf-opt-flatten-transparency-options
                  pd-fopt-flatten-transparency-options)
                 (b-remove-form-actions as-bool)
                 (b-flatten-form-fields as-bool)
                 (b-remove-javascript-actions as-bool)
                 (b-remove-alternate-images as-bool)
                 (b-remove-thumbnails as-bool)
                 (b-remove-document-tags as-bool)
                 (b-smoothen-lines as-bool)
                 (b-merge-image-fragments as-bool)
                 (b-remove-print-settings as-bool)
                 (b-remove-srch-index as-bool)
                 (b-remove-bookmarks as-bool)
                 (b-remove-comments-and-widgets as-bool)
                 (b-remove-doc-info-and-metadata as-bool)
                 (b-remove-object-data as-bool)
                 (b-remove-file-attachments as-bool)
                 (b-remove-cross-refs as-bool)
                 (b-remove-private-data as-bool)
                 (b-flatten-visible-layers as-bool)
                 (enm-object-compression pd-fopt-object-compression)
                 (b-unencoded-to-flate as-bool)
                 (b-lzwto-flate as-bool)
                 (b-remove-invalid-bookmarks as-bool)
                 (b-remove-invalid-links as-bool)
                 (b-remove-unreferenced-named-dests as-bool)
                 (b-linearize as-bool)
                 (b-skip-irreducible-images as-bool)
                 (b-subset-embedded-fonts as-bool)
                 (b-optimize-content-stms as-bool))
(define-c-typedef pd-fopt-params (:pointer pd-fopt-params-rec))
(define-c-struct av-notification-data-rec
                 (size as-uns32)
                 (notification (:reference-pass :ef-mb-string)))
(define-c-typedef av-notification-data
                  (:pointer av-notification-data-rec))
(define-c-struct av-version-params-rec
                 (size as-size-t)
                 (major as-uns32)
                 (minor as-uns32)
                 (minor-minor as-uns32)
                 (minor-minor-minor as-uns32))
(define-c-typedef av-version-params (:pointer av-version-params-rec))
(define-c-struct av-extension-info-rec-ex
                 (size as-size-t)
                 (p-extension-info av-extension-info)
                 (p-version-params av-version-params))
(define-c-typedef av-extension-info-ex
                  (:pointer av-extension-info-rec-ex))

;; #include <AVExpTObsolete1.h>
;; line 23
(define-c-typedef av-fav-tool-flags av-tflag-bits)
;; line 50
(define-c-typedef av-l-coord as-int32)
;; line 51
(define-c-typedef av-l-drag-type as-int32)
;; line 112
(define-opaque-pointer old-avannot-handler -t-old-avannot-handler)
;; line 134
(define-opaque-pointer old-avtool -t-old-avtool)
;; line 137
(define-opaque-pointer av-tool -t-avtool)
;; line 147
(define-opaque-pointer old-avwindow-handler -t-old-avwindow-handler)
;; line 148
(define-opaque-pointer old-avwindow -t-old-avwindow)
;; line 186
(define-c-typedef av-aux-data-perform-proc old-avaux-data-perform-proc)
;; line 187
(define-c-typedef av-aux-data-handler-rec old-avaux-data-handler-rec)
;; line 188
(define-c-typedef av-aux-data-handler old-avaux-data-handler)
(defconstant +k-avfav-tools-flag-ok-internal+ 1)
(defconstant +k-avfav-tools-flag-ok-external+ 1)
(define-c-typedef old-avpage-view-draw-proc
                  (:pointer
                   (:function
                    (av-page-view (:pointer old-avrect) nil)
                    :void
                    :calling-convention
                    :cdecl)))
(define-c-typedef old-avpage-view-click-proc
                  (:pointer
                   (:function
                    (av-page-view
                     as-int16
                     as-int16
                     av-flag-bits16
                     av-tcount
                     nil)
                    as-bool
                    :calling-convention
                    :cdecl)))
(define-c-typedef old-avpage-view-cursor-proc
                  (:pointer
                   (:function
                    (av-page-view as-int16 as-int16 (:pointer :void))
                    as-bool
                    :calling-convention
                    :cdecl)))
(define-c-typedef old-avdoc-selection-get-avrect-proc
                  (:pointer
                   (:function
                    (av-doc
                     pd-page-number
                     (:pointer old-avrect)
                     (:pointer :void))
                    as-bool
                    :calling-convention
                    :cdecl)))
(define-c-typedef old-avdoc-selection-show-menu-proc
                  (:pointer
                   (:function
                    (av-doc (:pointer :void) as-int16 as-int16)
                    as-bool
                    :calling-convention
                    :cdecl)))
(define-c-typedef old-avannot-handler-do-click-proc
                  (:pointer
                   (:function
                    (old-avannot-handler
                     pd-annot
                     av-page-view
                     as-int16
                     as-int16
                     av-flag-bits16
                     av-tcount)
                    as-bool
                    :calling-convention
                    :cdecl)))
(define-c-typedef old-avannot-handler-adjust-cursor-proc
                  (:pointer
                   (:function
                    (old-avannot-handler
                     pd-annot
                     av-page-view
                     as-int16
                     as-int16)
                    as-bool
                    :calling-convention
                    :cdecl)))
(define-c-typedef old-avannot-handler-pt-in-annot-view-bbox-proc
                  (:pointer
                   (:function
                    (old-avannot-handler
                     av-page-view
                     pd-annot
                     as-int16
                     as-int16)
                    as-bool
                    :calling-convention
                    :cdecl)))
(define-c-typedef old-avannot-handler-draw-ex-proc
                  (:pointer
                   (:function
                    (old-avannot-handler
                     pd-annot
                     av-page-view
                     (:pointer old-avrect))
                    :void
                    :calling-convention
                    :cdecl)))
(define-c-typedef old-avtool-get-label-proc
                  (:pointer
                   (:function
                    (av-tool)
                    as-const-text
                    :calling-convention
                    :cdecl)))
(define-c-typedef old-adjust-cursor-proc-type
                  (:pointer
                   (:function
                    (old-avtool av-page-view as-int16 as-int16)
                    as-bool
                    :calling-convention
                    :cdecl)))
(define-c-typedef old-do-click-proc-type
                  (:pointer
                   (:function
                    (old-avtool
                     av-page-view
                     as-int16
                     as-int16
                     av-flag-bits16
                     av-tcount)
                    as-bool
                    :calling-convention
                    :cdecl)))
(define-c-typedef old-avwindow-mouse-down-proc
                  (:pointer
                   (:function
                    (old-avwindow as-int16 as-int16 (:pointer :void))
                    :void
                    :calling-convention
                    :cdecl)))
(define-c-typedef old-avwindow-draw-proc
                  (:pointer
                   (:function
                    (old-avwindow (:pointer old-avrect))
                    :void
                    :calling-convention
                    :cdecl)))
(define-c-typedef old-avwindow-will-be-resized-proc
                  (:pointer
                   (:function
                    (old-avwindow (:pointer old-avrect))
                    as-bool
                    :calling-convention
                    :cdecl)))
(define-c-typedef old-avwindow-adjust-cursor-proc
                  (:pointer
                   (:function
                    (old-avwindow as-int16 as-int16)
                    :void
                    :calling-convention
                    :cdecl)))
(define-c-typedef old-avwindow-did-resize-proc
                  (:pointer
                   (:function
                    (old-avwindow (:pointer old-avrect))
                    :void
                    :calling-convention
                    :cdecl)))
(define-c-typedef old-avaux-data-perform-proc
                  (:pointer
                   (:function
                    (as-atom (:pointer :void) av-tbuffer-size av-doc)
                    as-bool
                    :calling-convention
                    :cdecl)))
(define-c-struct old-avrect
                 (left as-int16)
                 (top as-int16)
                 (right as-int16)
                 (bottom as-int16))
(define-c-typedef old-avrect-p (:pointer old-avrect))
(define-c-struct old-quad
                 (tlh as-int16)
                 (tlv as-int16)
                 (trh as-int16)
                 (trv as-int16)
                 (blh as-int16)
                 (blv as-int16)
                 (brh as-int16)
                 (brv as-int16))
(define-c-struct old-avaux-data-handler-rec
                 (size as-size-t)
                 (perform-proc old-avaux-data-perform-proc))
(define-c-typedef old-avaux-data-handler
                  (:pointer old-avaux-data-handler-rec))

;; #include <AVExpTObsolete2.h>
(define-c-struct old-avopen-save-dialog-params-rec
                 (size as-size-t)
                 (flags av-open-save-dialog-flags)
                 (parent-window av-window)
                 (window-title as-text)
                 (action-button-title as-text)
                 (cancel-button-title as-text)
                 (initial-file-sys as-file-sys)
                 (initial-path-name as-path-name)
                 (initial-file-name (:reference-pass :ef-mb-string))
                 (num-file-filters av-array-size)
                 (settings-compute-enabled-proc
                  av-open-save-dialog-settings-compute-enabled-proc)
                 (settings-execute-proc
                  av-open-save-dialog-settings-execute-proc)
                 (settings-proc-data (:pointer :void)))
(define-c-typedef old-avopen-save-dialog-params
                  (:pointer old-avopen-save-dialog-params-rec))
(define-c-struct old-avdoc-selection-server-rec
                 (size as-size-t)
                 (get-type av-doc-selection-get-type-proc)
                 (getting-selection
                  av-doc-selection-getting-selection-proc)
                 (added-to-selection
                  av-doc-selection-added-to-selection-proc)
                 (losing-selection
                  av-doc-selection-losing-selection-proc)
                 (removed-from-selection
                  av-doc-selection-removed-from-selection-proc)
                 (can-select-all av-doc-selection-can-select-all-proc)
                 (select-all av-doc-selection-select-all-proc)
                 (can-properties av-doc-selection-can-properties-proc)
                 (properties av-doc-selection-properties-proc)
                 (can-delete av-doc-selection-can-delete-proc)
                 (delete av-doc-selection-delete-proc)
                 (can-copy av-doc-selection-can-copy-proc)
                 (copy av-doc-selection-copy-proc)
                 (enum-selection av-doc-selection-enum-selection-proc)
                 (show-selection av-doc-selection-show-selection-proc)
                 (can-cut av-doc-selection-can-cut-proc)
                 (cut av-doc-selection-cut-proc)
                 (can-paste av-doc-selection-can-paste-proc)
                 (paste av-doc-selection-paste-proc)
                 (key-down av-doc-selection-key-down-proc)
                 (highlight-selection
                  av-doc-selection-highlight-selection-proc)
                 (get-selection-type
                  av-doc-selection-get-selection-type-proc)
                 (enum-page-ranges
                  av-doc-selection-enum-page-ranges-proc)
                 (get-avrect old-avdoc-selection-get-avrect-proc)
                 (show-menu old-avdoc-selection-show-menu-proc))
(define-c-typedef old-avdoc-selection-server
                  (:pointer old-avdoc-selection-server-rec))
(define-c-struct old-avdoc-view-def-rec
                 (size as-size-t)
                 (bring-to-front as-bool)
                 (use-page-view-info as-bool)
                 (page-view-layout-mode pd-layout-mode)
                 (page-view-page-num pd-page-number)
                 (page-view-zoom-type av-zoom-type)
                 (page-view-zoom as-fixed)
                 (page-view-x as-int16)
                 (page-view-y as-int16)
                 (page-view-start-thread as-bool)
                 (page-view-thread-index av-page-index)
                 (page-view-bead pd-bead)
                 (use-over-view-info as-bool)
                 (over-view-mode pd-page-mode)
                 (over-view-pos av-pixel-offset)
                 (over-view-x as-int32)
                 (over-view-y as-int32)
                 (use-window-info as-bool)
                 (window-frame old-avrect)
                 (unused1 as-bool)
                 (unused2 (:reference-pass :ef-mb-string)))
(define-c-typedef old-avdoc-view-def (:pointer old-avdoc-view-def-rec))
(define-c-struct old-avdoc-open-params-rec
                 (size as-size-t)
                 (use-frame as-bool)
                 (frame old-avrect)
                 (use-visible as-bool)
                 (visible as-bool)
                 (use-server-type as-bool)
                 (server-type (:reference-pass :ef-mb-string))
                 (server-creation-data (:pointer :void))
                 (use-source-doc as-bool)
                 (source-doc av-doc)
                 (use-read-only as-bool)
                 (read-only as-bool)
                 (use-view-type as-bool)
                 (view-type (:reference-pass :ef-mb-string))
                 (use-view-def as-bool)
                 (view-def old-avdoc-view-def)
                 (use-perm-req-proc as-bool)
                 (perm-req-proc av-doc-perm-req-proc))
(define-c-typedef old-avdoc-open-params
                  (:pointer old-avdoc-open-params-rec))
(define-c-struct old-avtool-bar-position-rec
                 (size as-size-t)
                 (in-doc as-bool)
                 (dock-position av-tool-bar-dock-position)
                 (floating-window-name (:reference-pass :ef-mb-string))
                 (stack-num as-int32)
                 (offset as-int32)
                 (order as-int32)
                 (window-frame old-avrect)
                 (layout av-tool-bar-layout)
                 (hidden as-bool)
                 (window-hidden as-bool))
(define-c-typedef old-avtool-bar-position
                  (:pointer old-avtool-bar-position-rec))
(define-c-struct old-avannot-handler-rec
                 (size as-size-t)
                 (flags av-flag-bits32)
                 (do-click old-avannot-handler-do-click-proc)
                 (adjust-cursor old-avannot-handler-adjust-cursor-proc)
                 (pt-in-annot-view-bbox
                  old-avannot-handler-pt-in-annot-view-bbox-proc)
                 (get-annot-view-bbox
                  old-avannot-handler-get-annot-view-bbox-proc)
                 (notify-annot-removed-from-selection
                  av-annot-handler-notify-annot-removed-from-selection-proc)
                 (notify-annot-added-to-selection
                  av-annot-handler-notify-annot-added-to-selection-proc)
                 (draw av-annot-handler-draw-proc)
                 (new av-annot-handler-new-proc)
                 (get-type av-annot-handler-get-type-proc)
                 (notify-destroy av-annot-handler-notify-destroy-proc)
                 (do-properties av-annot-handler-do-properties-proc)
                 (do-key-down av-annot-handler-do-key-down-proc)
                 (get-layer av-annot-handler-get-layer-proc)
                 (cursor-enter av-annot-handler-cursor-enter-proc)
                 (cursor-exit av-annot-handler-cursor-exit-proc)
                 (copy av-annot-handler-copy-proc)
                 (do-right-click old-avannot-handler-do-click-proc)
                 (get-info av-annot-handler-get-info-proc)
                 (delete-info av-annot-handler-delete-info-proc)
                 (can-perform-op av-annot-handler-can-perform-op-proc)
                 (perform-op av-annot-handler-perform-op-proc)
                 (do-key-down-ex av-annot-handler-do-key-down-ex-proc)
                 (draw-ex old-avannot-handler-draw-ex-proc)
                 (get-flags av-annot-handler-get-flags-proc))
(define-c-struct old-avtool-rec
                 (size as-size-t)
                 (activate activate-proc-type)
                 (deactivate deactivate-proc-type)
                 (do-click old-do-click-proc-type)
                 (adjust-cursor old-adjust-cursor-proc-type)
                 (do-key-down do-key-down-proc-type)
                 (get-type get-type-proc-type)
                 (is-persistent is-persistent-proc-type)
                 (cursor-id av-cursor-id)
                 (compute-enabled av-compute-enabled-proc)
                 (compute-enabled-data (:pointer :void))
                 (do-right-click old-do-click-proc-type)
                 (do-leave do-leave-proc-type)
                 (get-selection-server get-selection-server-proc-type))
(define-c-struct old-avwindow-handler-rec
                 (size as-size-t)
                 (mouse-down old-avwindow-mouse-down-proc)
                 (will-close av-window-will-close-proc)
                 (did-close av-window-did-close-proc)
                 (did-activate av-window-did-activate-proc)
                 (did-become-key av-window-did-become-key-proc)
                 (key-down av-window-key-down-proc)
                 (will-resign-key av-window-will-resign-key-proc)
                 (will-deactivate av-window-will-deactivate-proc)
                 (draw old-avwindow-draw-proc)
                 (will-be-resized old-avwindow-will-be-resized-proc)
                 (perform-edit-op av-window-perform-edit-op-proc)
                 (can-perform-edit-op
                  av-window-can-perform-edit-op-proc)
                 (adjust-cursor old-avwindow-adjust-cursor-proc)
                 (did-resize old-avwindow-did-resize-proc)
                 (destroy-platform-thing
                  av-window-destroy-platform-thing-proc))

;; #include <CosExpT.h>
;; line 31
(define-c-typedef cos-crypt-version as-int32)
;; line 33
(define-c-typedef cos-generation as-uns16)
;; line 35
(define-c-typedef cos-id as-uns32)
;; line 37
(define-c-typedef cos-hash-code as-uns32)
;; line 39
(define-c-typedef cos-stream-start-and-code as-int32)
;; line 41
(define-c-typedef cos-byte-max as-int32)
;; line 46
(define-c-typedef cos-byte as-uns8)
;; line 79
(define-c-typedef cos-type as-int32)
;; line 83
(define-opaque-pointer cos-doc -t-cos-doc)
;; line 85
(define-c-typedef cos-obj opaque-64-bits)
;; line 86
(define-c-typedef cos-obj-collection opaque-64-bits)
;; line 157
(define-c-typedef cos-stream-open-mode as-enum8)
;; line 203
(define-c-typedef cos-doc-save-flags as-flag-bits)
(defconstant +cos-null+ 0)
(defconstant +cos-integer+ 1)
(defconstant +cos-fixed+ 2)
(defconstant +cos-real+ 2)
(defconstant +cos-boolean+ 3)
(defconstant +cos-name+ 4)
(defconstant +cos-string+ 5)
(defconstant +cos-dict+ 6)
(defconstant +cos-array+ 7)
(defconstant +cos-stream+ 8)
(defconstant +cos-open-raw+ 0)
(defconstant +cos-open-unfiltered+ 1)
(defconstant +cos-open-filtered+ 2)
(defconstant +cos-open-raw-ignore-fkey+ 3)
(defconstant +cos-open-unfiltered-ignore-fkey+ 4)
(defconstant +cos-open-filtered-ignore-fkey+ 5)
(defconstant +k-null-pdf-version+ 0)
(defconstant +k-min-pdf-version+ 65536)
(defconstant +k-adobe-acrobat4version+ 66304)
(defconstant +k-adobe-acrobat5version+ 66560)
(defconstant +k-adobe-acrobat6version+ 66816)
(defconstant +k-adobe-acrobat7version+ 67072)
(defconstant +k-adobe-acrobat8version+ 67328)
(defconstant +k-adobe-acrobat9version+ 67331)
(defconstant +k-adobe-acrobat9-1version+ 67333)
(defconstant +k-adobe-acrobat10version+ 67336)
(defconstant +k-adobe-acrobat11version+ 67339)
(defconstant +k-min-save-version+ +k-adobe-acrobat4version+)
(defconstant +k-min-xref-stream-version+ +k-adobe-acrobat6version+)
(defconstant +k-default-pdf-version+ +k-adobe-acrobat7version+)
(defconstant +k-last-adobe1xversion-without-ext+ 67328)
(defconstant +k-last-adobe1xversion-with-ext+ +k-adobe-acrobat11version+)
(defconstant +k-min-pdf-next-version+ 131072)
(defconstant +k-current-pdf-version+ 131072)
(define-c-typedef adobe-pdf-version :int)
(define-c-typedef cos-obj-enum-proc
                  (:pointer
                   (:function
                    (cos-obj cos-obj (:pointer :void))
                    as-bool
                    :calling-convention
                    :cdecl)))
(define-c-typedef cos-doc-enum-eof-s-proc
                  (:pointer
                   (:function
                    (cos-doc as-file-offset (:pointer :void))
                    as-bool
                    :calling-convention
                    :cdecl)))
(define-c-typedef cos-doc-enum-eof-s-proc64
                  (:pointer
                   (:function
                    (cos-doc as-file-offset64 (:pointer :void))
                    as-bool
                    :calling-convention
                    :cdecl)))
(define-c-typedef cos-obj-offset-proc
                  (:pointer
                   (:function
                    (cos-obj
                     as-file-pos
                     as-array-size
                     (:pointer :void))
                    :void
                    :calling-convention
                    :cdecl)))
(define-c-typedef cos-obj-offset-proc64
                  (:pointer
                   (:function
                    (cos-obj as-file-pos64 as-uns64 (:pointer :void))
                    :void
                    :calling-convention
                    :cdecl)))
(define-c-typedef cos-obj-set-callback-flag-proc
                  (:pointer
                   (:function
                    (cos-obj as-bool)
                    as-bool
                    :calling-convention
                    :cdecl)))
(define-c-typedef cos-crypt-string-proc
                  (:pointer
                   (:function
                    (cos-doc
                     as-atom
                     (:reference-pass :ef-mb-string)
                     (:reference-pass :ef-mb-string)
                     as-int32
                     as-int32
                     as-uns32
                     as-uns32)
                    as-int32
                    :calling-convention
                    :cdecl)))
(define-c-struct cos-doc-open-params-rec
                 (size as-size-t)
                 (open-flags as-flag-bits)
                 (file-sys as-file-sys)
                 (path-name as-path-name)
                 (header-string (:reference-pass :ef-mb-string)))
(define-c-typedef cos-doc-open-params
                  (:pointer cos-doc-open-params-rec))
(define-c-struct cos-doc-save-params-rec
                 (size as-size-t)
                 (header (:reference-pass :ef-mb-string))
                 (crypt-data (:reference-pass :ef-mb-string))
                 (crypt-data-len ast-array-size)
                 (mon as-progress-monitor)
                 (mon-client-data (:pointer :void))
                 (crypt-version cos-crypt-version))
(define-c-typedef cos-doc-save-params
                  (:pointer cos-doc-save-params-rec))
