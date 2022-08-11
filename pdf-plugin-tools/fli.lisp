;;; This file was generated automatically from Acrobat Pro's SDK headers.

(in-package :pdf-plugin-tools) 

;; #include <ASNumTypes.h>
;; line 40
(define-c-typedef as-int8 (:signed :byte))
(define-c-typedef as-int8p (:pointer as-int8))
;; line 44
(define-c-typedef as-int16 (:short :int))
(define-c-typedef as-int16p (:pointer as-int16))
;; line 49
(define-c-typedef as-int32 :int)
(define-c-typedef as-int32p (:pointer as-int32))
;; line 54
(define-c-typedef as-int64 (:signed :long :long :int))
;; line 57
(defconstant +as-max-int8+ #x7F)
;; line 59
(defconstant +as-min-int8+ #x80)
;; line 61
(defconstant +as-max-int16+ #x7FFF)
;; line 63
(defconstant +as-min-int16+ #x8000)
;; line 65
(defconstant +as-max-int32+ #x7FFFFFFF)
;; line 67
(defconstant +as-min-int32+ #x80000000)
;; line 69
(defconstant +as-max-int64+ #x7FFFFFFFFFFFFFFF)
;; line 71
(defconstant +as-min-int64+ #x8000000000000000)
;; line 78
(define-c-typedef as-uns8 (:unsigned :byte))
(define-c-typedef as-uns8p (:pointer as-uns8))
;; line 82
(define-c-typedef as-uns16 (:unsigned :short :int))
(define-c-typedef as-uns16p (:pointer as-uns16))
;; line 87
(define-c-typedef as-uns32 (:unsigned :int))
(define-c-typedef as-uns32p (:pointer as-uns32))
;; line 92
(define-c-typedef as-uns64 (:unsigned :long :long :int))
;; line 95
(define-c-typedef as-int-or-ptr :intptr)
;; line 97
(define-c-typedef as-uns-or-ptr :uintptr)
;; line 100
(defconstant +as-max-uns8+ #xFF)
;; line 102
(defconstant +as-min-uns8+ #x0)
;; line 104
(defconstant +as-max-uns16+ #xFFFF)
;; line 106
(defconstant +as-min-uns16+ #x0)
;; line 108
(defconstant +as-max-uns32+ #xFFFFFFFF)
;; line 110
(defconstant +as-min-uns32+ #x0)
;; line 112
(defconstant +as-max-uns64+ #xFFFFFFFFFFFFFFFF)
;; line 114
(defconstant +as-min-uns64+ #x0)
;; line 118
(define-c-typedef as-bool (:boolean as-uns16))
;; line 147
(define-c-typedef as-size-t :size-t)
;; line 149
(define-c-typedef as-int-ptr-t :intptr)

;; #include <CoreExpT.h>
;; line 71
(define-c-typedef as-enum8 as-int8)
;; line 76
(define-c-typedef as-enum16 as-int16)
;; line 79
(defconstant +k-as-max-enum8+ +as-max-int8+)
;; line 81
(defconstant +k-as-max-enum16+ +as-max-int16+)
;; line 99
(define-c-typedef opaque-32-bits as-int32)
;; line 133
(define-c-typedef as-atom as-uns16)
;; line 134
(define-c-typedef as-atom-null as-max-uns16)
;; line 142
(define-c-typedef selector as-int32)
;; line 150
(define-c-typedef hft-entry (:pointer :void))
;; line 161
(define-c-typedef hft (:pointer hft-entry))
;; line 186
(define-opaque-pointer as-extension -t-asextension)
;; line 188
(define-c-typedef extension-id as-extension)
;; line 190
(define-c-typedef as-callback (:pointer :void))
;; line 208
(define-c-typedef int8 as-int8)
;; line 209
(define-c-typedef int8p as-int8p)
;; line 210
(define-c-typedef int16 as-int16)
;; line 211
(define-c-typedef int16p as-int16p)
;; line 212
(define-c-typedef int32 as-int32)
;; line 213
(define-c-typedef int32p as-int32p)
;; line 215
(define-c-typedef uns8 as-uns8)
;; line 216
(define-c-typedef uns8p as-uns8p)
;; line 217
(define-c-typedef uns16 as-uns16)
;; line 218
(define-c-typedef uns16p as-uns16p)
;; line 219
(define-c-typedef uns32 as-uns32)
;; line 220
(define-c-typedef uns32p as-uns32p)
;; line 222
(define-c-typedef max-int8 as-max-int8)
;; line 223
(define-c-typedef min-int8 as-min-int8)
;; line 224
(define-c-typedef max-int16 as-max-int16)
;; line 225
(define-c-typedef min-int16 as-min-int16)
;; line 226
(define-c-typedef max-int32 as-max-int32)
;; line 227
(define-c-typedef min-int32 as-min-int32)
;; line 240
(define-c-typedef os-size-t as-size-t)
(define-c-typedef restore-environ-proc
                  (:pointer
                   (:function
                    ((:pointer :void))
                    :void
                    :calling-convention
                    :cdecl)))
(define-c-typedef as-extension-enum-proc
                  (:pointer
                   (:function
                    (as-extension (:pointer :void))
                    as-bool
                    :calling-convention
                    :cdecl)))
(define-c-struct opaque-64-bits (a opaque-32-bits) (b opaque-32-bits))

;; #include <ASExpT.h>
;; line 70
(define-c-typedef as-file-mode as-uns16)
;; line 76
(define-c-typedef as-file-pos as-uns32)
;; line 82
(define-c-typedef as-file-offset as-int32)
;; line 83
(define-c-typedef as-file-offset64 as-int64)
;; line 86
(define-c-typedef as-file-pos64 as-uns64)
;; line 92
(define-c-typedef as-error-code as-int32)
;; line 98
(define-c-typedef as-byte-count as-uns32)
;; line 105
(define-c-typedef as-array-size as-uns32)
;; line 120
(define-c-typedef as-flag-bits as-uns32)
;; line 123
(define-c-typedef as-disk-space as-uns32)
;; line 126
(define-c-typedef as-disk-space64 as-uns64)
;; line 129
(define-c-typedef as-l-file-mode as-uns32)
;; line 132
(define-c-typedef as-mask-bits as-uns32)
;; line 135
(define-c-typedef as-duration as-int32)
;; line 143
(define-c-typedef as-version as-uns32)
;; line 146
(define-c-typedef as-small-buffer-size as-uns16)
;; line 156
(define-c-typedef as-count as-uns32)
;; line 159
(define-c-typedef as-byte as-uns8)
;; line 164
(define-c-typedef as-small-count as-int16)
;; line 176
(define-c-typedef ast-file-pos as-int32)
;; line 187
(define-c-typedef ast-array-size as-int32)
;; line 195
(define-c-typedef ast-version as-int32)
;; line 211
(define-c-typedef ast-count as-int32)
;; line 244
(define-c-typedef as-coord as-int32)
;; line 260
(define-c-typedef as-err-severity as-enum8)
;; line 274
(define-opaque-pointer as-stm -t-asstm-rec)
;; line 294
(define-opaque-pointer as-crypt-stm -t-ascrypt-stm-rec)
;; line 581
(define-c-typedef hft-data (:pointer hft-data-rec))
;; line 589
(define-opaque-pointer hft-server -t-hft-server)
;; line 640
(define-c-typedef as-fixed as-int32)
(define-c-typedef as-fixed-p (:pointer as-fixed))
;; line 648
(define-c-typedef as-fixed-pos-inf as-max-int32)
;; line 651
(define-c-typedef as-fixed-neg-inf as-min-int32)
;; line 806
(define-c-typedef int32to-fixed as-int32to-fixed)
;; line 807
(define-c-typedef fixed-round-to-int32 as-fixed-round-to-int32)
;; line 808
(define-c-typedef fixed-trunc-to-int32 as-fixed-trunc-to-int32)
;; line 809
(define-c-typedef int16to-fixed as-int16to-fixed)
;; line 810
(define-c-typedef fixed-round-to-int16 as-fixed-round-to-int16)
;; line 811
(define-c-typedef fixed-trunc-to-int16 as-fixed-trunc-to-int16)
;; line 1042
(define-c-typedef fixed-negative-infinity as-fixed-neg-inf)
;; line 1047
(define-c-typedef fixed-positive-infinity as-fixed-pos-inf)
;; line 1152
(define-c-typedef as-fract as-int32)
;; line 1155
(define-c-typedef as-real :float)
;; line 1188
(define-c-typedef as-double :double)
(define-c-typedef as-double-p (:pointer as-double))
;; line 1367
(define-opaque-pointer as-cab -t-ascabinet)
;; line 1368
(define-opaque-pointer as-const-cab -t-ascabinet)
;; line 1451
(define-opaque-pointer as-text -t-astext-rec)
;; line 1457
(define-opaque-pointer as-const-text -t-astext-rec)
;; line 1833
(define-opaque-pointer as-file-sys -t-asfile-sys-rec)
;; line 1846
(define-opaque-pointer as-path-name -t-aspath-name-rec)
;; line 1857
(define-opaque-pointer as-file -t-asfile)
;; line 1924
(define-c-typedef as-mdfile (:pointer :void))
;; line 1926
(define-c-typedef mdfile as-mdfile)
;; line 1935
(define-opaque-pointer as-iorequest -t-asiorequest-rec)
;; line 2074
(define-c-typedef as-file-sys-item-type as-enum16)
;; line 2167
(define-opaque-pointer as-folder-iterator -t-asfolder-iterator)
;; line 2176
(define-opaque-pointer as-platform-path -t-asplatform-path)
;; line 2181
(define-c-typedef cstring-ptr (:reference-pass :ef-mb-string))
;; line 2186
(define-c-typedef posixpath-ptr (:reference-pass :ef-mb-string))
;; line 2202
(define-opaque-pointer fsref-ptr fsref)
;; line 2218
(define-c-typedef fsref-with-cfstring-ref-rec-ptr
                  (:pointer fsref-with-cfstring-ref-rec))
;; line 2231
(define-c-typedef cfurlref-rec-ptr (:pointer cfurlref-rec))
;; line 3701
(define-c-typedef progress-monitor as-progress-monitor)
;; line 3702
(define-c-typedef progress-monitor-rec as-progress-monitor-rec)
;; line 3726
(define-c-typedef cancel-proc as-cancel-proc)
;; line 3861
(define-c-typedef as-unicode-format as-enum16)
;; line 3872
(define-c-typedef as-host-encoding as-int32)
;; line 3878
(define-c-typedef as-unicode-char as-uns32)
;; line 3879
(define-c-typedef as-utf32val as-uns32)
;; line 3891
(define-c-typedef as-utf16val as-uns16)
;; line 3896
(define-c-typedef as-utf8val as-uns8)
;; line 3973
(define-c-typedef as-script as-int32)
;; line 4033
(define-c-typedef as-date-time-format as-enum8)
;; line 4046
(define-opaque-pointer as-date -t-asdate-rec)
;; line 4075
(define-opaque-pointer as-time-span -t-astime-span-rec)
(defconstant +k-as-file-okay+ 0)
(defconstant +k-as-file-is-terminating+ 1)
(define-c-typedef as-file-status-flags :int)
(defconstant +k-as-file-sys-file+ 0)
(defconstant +k-as-file-sys-folder+ 1)
(defconstant +k-as-file-sys-unknown+ -1)
(defconstant +k-utf16big-endian+ 0)
(defconstant +k-utf16host-endian+ 1)
(defconstant +k-utf8+ 2)
(defconstant +k-utf32big-endian+ 3)
(defconstant +k-utf32host-endian+ 4)
(defconstant +k-as-roman-script+ 0)
(defconstant +k-as-japanese-script+ 1)
(defconstant +k-as-traditional-chinese-script+ 2)
(defconstant +k-as-korean-script+ 3)
(defconstant +k-as-arabic-script+ 4)
(defconstant +k-as-hebrew-script+ 5)
(defconstant +k-as-greek-script+ 6)
(defconstant +k-as-cyrillic-script+ 7)
(defconstant +k-as-right-left-script+ 8)
(defconstant +k-as-devanagari-script+ 9)
(defconstant +k-as-gurmukhi-script+ 10)
(defconstant +k-as-gujarati-script+ 11)
(defconstant +k-as-oriya-script+ 12)
(defconstant +k-as-bengali-script+ 13)
(defconstant +k-as-tamil-script+ 14)
(defconstant +k-as-telugu-script+ 15)
(defconstant +k-as-kannada-script+ 16)
(defconstant +k-as-malayalam-script+ 17)
(defconstant +k-as-sinhalese-script+ 18)
(defconstant +k-as-burmese-script+ 19)
(defconstant +k-as-khmer-script+ 20)
(defconstant +k-as-thai-script+ 21)
(defconstant +k-as-laotian-script+ 22)
(defconstant +k-as-georgian-script+ 23)
(defconstant +k-as-armenian-script+ 24)
(defconstant +k-as-simplified-chinese-script+ 25)
(defconstant +k-as-tibetan-script+ 26)
(defconstant +k-as-mongolian-script+ 27)
(defconstant +k-as-geez-script+ 28)
(defconstant +k-as-east-european-roman-script+ 29)
(defconstant +k-as-vietnamese-script+ 30)
(defconstant +k-as-extended-arabic-script+ 31)
(defconstant +k-as-eunicode-script+ 32)
(defconstant +k-as-dont-know-script+ -1)
(defconstant +k-as-time-none+ 0)
(defconstant +k-as-time-pdf+ 1)
(defconstant +k-as-time-universal+ 2)
(defconstant +k-as-time-universal-h+ 3)
(defconstant +k-as-time-utc-asn1+ 4)
(defconstant +k-as-time-generalized-asn1+ 5)
(define-c-typedef as-crypt-stm-fil-buf-proc
                  (:pointer
                   (:function
                    (as-crypt-stm)
                    as-int32
                    :calling-convention
                    :cdecl)))
(define-c-typedef as-crypt-stm-fls-buf-proc
                  (:pointer
                   (:function
                    (as-int32 as-crypt-stm)
                    as-int32
                    :calling-convention
                    :cdecl)))
(define-c-typedef as-crypt-stm-un-getc-proc
                  (:pointer
                   (:function
                    (as-int32 as-crypt-stm)
                    as-int32
                    :calling-convention
                    :cdecl)))
(define-c-typedef as-crypt-stm-fflush-proc
                  (:pointer
                   (:function
                    (as-crypt-stm)
                    as-int32
                    :calling-convention
                    :cdecl)))
(define-c-typedef as-crypt-stm-fclose-proc
                  (:pointer
                   (:function
                    (as-crypt-stm)
                    as-int32
                    :calling-convention
                    :cdecl)))
(define-c-typedef as-crypt-stm-freset-proc
                  (:pointer
                   (:function
                    (as-crypt-stm)
                    as-int32
                    :calling-convention
                    :cdecl)))
(define-c-typedef as-crypt-stm-fput-eof-proc
                  (:pointer
                   (:function
                    (as-crypt-stm)
                    as-int32
                    :calling-convention
                    :cdecl)))
(define-c-typedef as-stm-proc
                  (:pointer
                   (:function
                    ((:reference-pass :ef-mb-string)
                     ast-array-size
                     (:pointer :void))
                    ast-count
                    :calling-convention
                    :cdecl)))
(define-c-typedef as-proc-stm-destroy-proc
                  (:pointer
                   (:function
                    ((:pointer :void))
                    :void
                    :calling-convention
                    :cdecl)))
(define-c-typedef as-proc-stm-seek-proc
                  (:pointer
                   (:function
                    (as-file-pos64 (:pointer :void))
                    :void
                    :calling-convention
                    :cdecl)))
(define-c-typedef as-proc-stm-get-length
                  (:pointer
                   (:function
                    ((:pointer :void))
                    as-file-pos64
                    :calling-convention
                    :cdecl)))
(define-c-typedef hft-server-provide-hft-proc
                  (:pointer
                   (:function
                    (hft-server as-version (:pointer :void))
                    hft
                    :calling-convention
                    :cdecl)))
(define-c-typedef hft-server-destroy-proc
                  (:pointer
                   (:function
                    (hft-server (:pointer :void))
                    :void
                    :calling-convention
                    :cdecl)))
(define-c-typedef as-file-completion-proc
                  (:pointer
                   (:function
                    (as-file
                     (:reference-pass :ef-mb-string)
                     ast-file-pos
                     ast-array-size
                     ast-array-size
                     as-error-code
                     (:pointer :void))
                    :void
                    :calling-convention
                    :cdecl)))
(define-c-typedef as-iodone-proc
                  (:pointer
                   (:function
                    (as-iorequest)
                    :void
                    :calling-convention
                    :cdecl)))
(define-c-typedef as-file-sys-get-file-flags
                  (:pointer
                   (:function
                    (as-mdfile)
                    as-flag-bits
                    :calling-convention
                    :cdecl)))
(define-c-typedef as-file-sys-async-read-proc
                  (:pointer
                   (:function
                    (as-iorequest)
                    as-error-code
                    :calling-convention
                    :cdecl)))
(define-c-typedef as-file-sys-async-write-proc
                  (:pointer
                   (:function
                    (as-iorequest)
                    as-error-code
                    :calling-convention
                    :cdecl)))
(define-c-typedef as-file-sys-async-abort-proc
                  (:pointer
                   (:function
                    (as-mdfile)
                    :void
                    :calling-convention
                    :cdecl)))
(define-c-typedef as-file-sys-yield-proc
                  (:pointer
                   (:function
                    (as-mdfile)
                    as-error-code
                    :calling-convention
                    :cdecl)))
(define-c-typedef as-file-sys-mread-request-proc
                  (:pointer
                   (:function
                    (as-mdfile
                     as-file
                     (:pointer ast-file-pos)
                     ast-array-size)
                    as-error-code
                    :calling-convention
                    :cdecl)))
(define-c-typedef as-file-sys-clear-outstanding-mreads-proc
                  (:pointer
                   (:function
                    (as-mdfile)
                    :void
                    :calling-convention
                    :cdecl)))
(define-c-typedef as-file-sys-get-status-proc
                  (:pointer
                   (:function
                    (as-mdfile)
                    as-flag-bits
                    :calling-convention
                    :cdecl)))
(define-c-typedef as-file-sys-acquire-file-sys-path-proc
                  (:pointer
                   (:function
                    (as-path-name as-file-sys)
                    as-path-name
                    :calling-convention
                    :cdecl)))
(define-c-typedef as-file-sys-open-proc
                  (:pointer
                   (:function
                    (as-path-name as-file-mode (:pointer as-mdfile))
                    as-error-code
                    :calling-convention
                    :cdecl)))
(define-c-typedef as-file-sys-close-proc
                  (:pointer
                   (:function
                    (as-mdfile)
                    as-error-code
                    :calling-convention
                    :cdecl)))
(define-c-typedef as-file-sys-flush-proc
                  (:pointer
                   (:function
                    (as-mdfile)
                    as-error-code
                    :calling-convention
                    :cdecl)))
(define-c-typedef as-file-sys-set-pos-proc
                  (:pointer
                   (:function
                    (as-mdfile as-file-pos)
                    as-error-code
                    :calling-convention
                    :cdecl)))
(define-c-typedef as-file-sys-get-pos-proc
                  (:pointer
                   (:function
                    (as-mdfile (:pointer as-file-pos))
                    as-error-code
                    :calling-convention
                    :cdecl)))
(define-c-typedef as-file-sys-set-eof-proc
                  (:pointer
                   (:function
                    (as-mdfile as-file-pos)
                    as-error-code
                    :calling-convention
                    :cdecl)))
(define-c-typedef as-file-sys-get-eof-proc
                  (:pointer
                   (:function
                    (as-mdfile (:pointer as-file-pos))
                    as-error-code
                    :calling-convention
                    :cdecl)))
(define-c-typedef as-file-sys-read-proc
                  (:pointer
                   (:function
                    ((:pointer :void)
                     as-size-t
                     as-size-t
                     as-mdfile
                     (:pointer as-error-code))
                    as-size-t
                    :calling-convention
                    :cdecl)))
(define-c-typedef as-file-sys-write-proc
                  (:pointer
                   (:function
                    ((:pointer :void)
                     as-size-t
                     as-size-t
                     as-mdfile
                     (:pointer as-error-code))
                    as-size-t
                    :calling-convention
                    :cdecl)))
(define-c-typedef as-file-sys-remove-proc
                  (:pointer
                   (:function
                    (as-path-name)
                    as-error-code
                    :calling-convention
                    :cdecl)))
(define-c-typedef as-file-sys-rename-proc
                  (:pointer
                   (:function
                    ((:pointer as-mdfile) as-path-name as-path-name)
                    as-error-code
                    :calling-convention
                    :cdecl)))
(define-c-typedef as-file-sys-is-same-file-proc
                  (:pointer
                   (:function
                    (as-mdfile as-path-name as-path-name)
                    as-bool
                    :calling-convention
                    :cdecl)))
(define-c-typedef as-file-sys-get-name-proc
                  (:pointer
                   (:function
                    (as-path-name
                     (:reference-pass :ef-mb-string)
                     ast-array-size)
                    as-error-code
                    :calling-convention
                    :cdecl)))
(define-c-typedef as-file-sys-get-temp-path-name-proc
                  (:pointer
                   (:function
                    (as-path-name)
                    as-path-name
                    :calling-convention
                    :cdecl)))
(define-c-typedef as-file-sys-copy-path-name-proc
                  (:pointer
                   (:function
                    (as-path-name)
                    as-path-name
                    :calling-convention
                    :cdecl)))
(define-c-typedef as-file-sys-path-from-dipath-proc
                  (:pointer
                   (:function
                    ((:reference-pass :ef-mb-string) as-path-name)
                    as-path-name
                    :calling-convention
                    :cdecl)))
(define-c-typedef as-file-sys-dispose-path-name-proc
                  (:pointer
                   (:function
                    (as-path-name)
                    :void
                    :calling-convention
                    :cdecl)))
(define-c-typedef as-file-sys-get-file-sys-name-proc
                  (:pointer
                   (:function nil as-atom :calling-convention :cdecl)))
(define-c-typedef as-file-sys-get-storage-free-space-proc
                  (:pointer
                   (:function
                    (as-path-name)
                    as-disk-space
                    :calling-convention
                    :cdecl)))
(define-c-typedef as-file-sys-flush-volume-proc
                  (:pointer
                   (:function
                    (as-path-name)
                    as-error-code
                    :calling-convention
                    :cdecl)))
(define-c-typedef as-file-sys-create-path-name-proc
                  (:pointer
                   (:function
                    (as-atom (:pointer :void) (:pointer :void))
                    as-path-name
                    :calling-convention
                    :cdecl)))
(define-c-typedef as-file-sys-get-item-props-proc
                  (:pointer
                   (:function
                    (as-path-name as-file-sys-item-props)
                    as-error-code
                    :calling-convention
                    :cdecl)))
(define-c-typedef as-file-sys-first-folder-item-proc
                  (:pointer
                   (:function
                    (as-path-name
                     as-file-sys-item-props
                     (:pointer as-path-name))
                    as-folder-iterator
                    :calling-convention
                    :cdecl)))
(define-c-typedef as-file-sys-next-folder-item-proc
                  (:pointer
                   (:function
                    (as-folder-iterator
                     as-file-sys-item-props
                     (:pointer as-path-name))
                    as-bool
                    :calling-convention
                    :cdecl)))
(define-c-typedef as-file-sys-destroy-folder-iterator-proc
                  (:pointer
                   (:function
                    (as-folder-iterator)
                    :void
                    :calling-convention
                    :cdecl)))
(define-c-typedef as-file-sys-set-mode-proc
                  (:pointer
                   (:function
                    (as-mdfile as-l-file-mode as-mask-bits)
                    as-l-file-mode
                    :calling-convention
                    :cdecl)))
(define-c-typedef as-file-sys-get-parent-proc
                  (:pointer
                   (:function
                    (as-path-name)
                    as-path-name
                    :calling-convention
                    :cdecl)))
(define-c-typedef as-file-sys-create-folder-proc
                  (:pointer
                   (:function
                    (as-path-name)
                    as-error-code
                    :calling-convention
                    :cdecl)))
(define-c-typedef as-file-sys-remove-folder-proc
                  (:pointer
                   (:function
                    (as-path-name)
                    as-error-code
                    :calling-convention
                    :cdecl)))
(define-c-typedef as-file-sys-set-type-and-creator-proc
                  (:pointer
                   (:function
                    (as-path-name as-uns32 as-uns32)
                    :void
                    :calling-convention
                    :cdecl)))
(define-c-typedef as-file-sys-get-type-and-creator-proc
                  (:pointer
                   (:function
                    (as-path-name
                     (:pointer as-uns32)
                     (:pointer as-uns32))
                    :void
                    :calling-convention
                    :cdecl)))
(define-c-typedef as-file-sys-reopen-proc
                  (:pointer
                   (:function
                    (as-mdfile as-file-mode (:pointer as-error-code))
                    as-mdfile
                    :calling-convention
                    :cdecl)))
(define-c-typedef as-file-sys-hard-flush-proc
                  (:pointer
                   (:function
                    (as-mdfile)
                    as-error-code
                    :calling-convention
                    :cdecl)))
(define-c-typedef as-file-sys-get-item-props-as-cab-proc
                  (:pointer
                   (:function
                    (as-path-name as-cab)
                    as-int32
                    :calling-convention
                    :cdecl)))
(define-c-typedef as-file-sys-can-perform-op-on-item-proc
                  (:pointer
                   (:function
                    (as-path-name (:reference-pass :ef-mb-string))
                    as-int32
                    :calling-convention
                    :cdecl)))
(define-c-typedef as-file-sys-perform-op-on-item-proc
                  (:pointer
                   (:function
                    (as-path-name
                     (:reference-pass :ef-mb-string)
                     as-cab)
                    as-int32
                    :calling-convention
                    :cdecl)))
(define-c-typedef as-file-sys-acquire-platform-path-proc
                  (:pointer
                   (:function
                    (as-path-name as-atom (:pointer as-platform-path))
                    as-int32
                    :calling-convention
                    :cdecl)))
(define-c-typedef as-file-sys-release-platform-path-proc
                  (:pointer
                   (:function
                    (as-platform-path)
                    :void
                    :calling-convention
                    :cdecl)))
(define-c-typedef as-file-sys-get-name-as-as-text-proc
                  (:pointer
                   (:function
                    (as-path-name as-text)
                    as-error-code
                    :calling-convention
                    :cdecl)))
(define-c-typedef as-file-sys-display-as-text-from-path-proc
                  (:pointer
                   (:function
                    (as-path-name as-text)
                    as-error-code
                    :calling-convention
                    :cdecl)))
(define-c-typedef as-file-sys-can-set-eof-proc
                  (:pointer
                   (:function
                    (as-mdfile as-file-pos)
                    as-bool
                    :calling-convention
                    :cdecl)))
(define-c-typedef as-file-sys-dipath-from-path-ex-proc
                  (:pointer
                   (:function
                    (as-path-name as-path-name as-text)
                    as-error-code
                    :calling-convention
                    :cdecl)))
(define-c-typedef as-file-sys-path-from-dipath-ex-proc
                  (:pointer
                   (:function
                    (as-const-text as-path-name)
                    as-path-name
                    :calling-convention
                    :cdecl)))
(define-c-typedef as-file-sys-open64proc
                  (:pointer
                   (:function
                    (as-path-name as-file-mode (:pointer as-mdfile))
                    as-error-code
                    :calling-convention
                    :cdecl)))
(define-c-typedef as-file-sys-get-file-position-limit-proc
                  (:pointer
                   (:function
                    ((:pointer as-file-pos64))
                    as-error-code
                    :calling-convention
                    :cdecl)))
(define-c-typedef as-file-sys-set-pos64proc
                  (:pointer
                   (:function
                    (as-mdfile as-file-pos64)
                    as-error-code
                    :calling-convention
                    :cdecl)))
(define-c-typedef as-file-sys-get-pos64proc
                  (:pointer
                   (:function
                    (as-mdfile (:pointer as-file-pos64))
                    as-error-code
                    :calling-convention
                    :cdecl)))
(define-c-typedef as-file-sys-set-eof64proc
                  (:pointer
                   (:function
                    (as-mdfile as-file-pos64)
                    as-error-code
                    :calling-convention
                    :cdecl)))
(define-c-typedef as-file-sys-get-eof64proc
                  (:pointer
                   (:function
                    (as-mdfile (:pointer as-file-pos64))
                    as-error-code
                    :calling-convention
                    :cdecl)))
(define-c-typedef as-file-sys-get-name-for-display-proc
                  (:pointer
                   (:function
                    (as-path-name as-text)
                    as-error-code
                    :calling-convention
                    :cdecl)))
(define-c-typedef as-file-sys-get-storage-free-space64proc
                  (:pointer
                   (:function
                    (as-path-name)
                    as-disk-space64
                    :calling-convention
                    :cdecl)))
(define-c-typedef as-file-sys-is-in-use-proc
                  (:pointer
                   (:function
                    (as-path-name)
                    as-bool
                    :calling-convention
                    :cdecl)))
(define-c-typedef pmbegin-operation-proc
                  (:pointer
                   (:function
                    ((:pointer :void))
                    :void
                    :calling-convention
                    :cdecl)))
(define-c-typedef pmend-operation-proc
                  (:pointer
                   (:function
                    ((:pointer :void))
                    :void
                    :calling-convention
                    :cdecl)))
(define-c-typedef pmset-duration-proc
                  (:pointer
                   (:function
                    (as-duration (:pointer :void))
                    :void
                    :calling-convention
                    :cdecl)))
(define-c-typedef pmset-curr-value-proc
                  (:pointer
                   (:function
                    (as-duration (:pointer :void))
                    :void
                    :calling-convention
                    :cdecl)))
(define-c-typedef pmget-duration-proc
                  (:pointer
                   (:function
                    ((:pointer :void))
                    as-duration
                    :calling-convention
                    :cdecl)))
(define-c-typedef pmget-curr-value-proc
                  (:pointer
                   (:function
                    ((:pointer :void))
                    as-duration
                    :calling-convention
                    :cdecl)))
(define-c-typedef pmset-text-proc
                  (:pointer
                   (:function
                    (as-text (:pointer :void))
                    :void
                    :calling-convention
                    :cdecl)))
(define-c-typedef as-cancel-proc
                  (:pointer
                   (:function
                    ((:pointer :void))
                    as-bool
                    :calling-convention
                    :cdecl)))
(define-c-struct as-crypt-stm-procs
                 (empty-buff as-crypt-stm-fil-buf-proc)
                 (full-buff as-crypt-stm-fls-buf-proc)
                 (un-get-ch as-crypt-stm-un-getc-proc)
                 (flush-buff as-crypt-stm-fflush-proc)
                 (close as-crypt-stm-fclose-proc)
                 (reset as-crypt-stm-freset-proc)
                 (put-eof as-crypt-stm-fput-eof-proc))
(define-c-struct as-crypt-stm-rec
                 (count as-int32)
                 (current-pointer (:pointer :byte))
                 (base-pointer (:pointer :byte))
                 (mode-flag as-uns32)
                 (procs (:pointer as-crypt-stm-procs))
                 (base-stm as-stm)
                 (n-bytes-wanted as-int32)
                 (client-data (:pointer :void)))
(define-c-struct as-proc-stm-rd-ex-handler-rec
                 (size as-byte-count)
                 (read-proc as-stm-proc)
                 (destroy-proc as-proc-stm-destroy-proc)
                 (seek-proc as-proc-stm-seek-proc)
                 (get-length-proc as-proc-stm-get-length)
                 (buf-size as-byte-count))
(define-c-typedef as-proc-stm-rd-ex-handler
                  (:pointer as-proc-stm-rd-ex-handler-rec))
(define-c-struct hft-data-rec
                 (size as-uns32)
                 (num-selectors as-count)
                 (version as-version)
                 (hft-procs (:pointer :void)))
(define-c-struct as-fixed-matrix
                 (a as-fixed)
                 (b as-fixed)
                 (c as-fixed)
                 (d as-fixed)
                 (h as-fixed)
                 (v as-fixed))
(define-c-typedef as-fixed-matrix-p (:pointer as-fixed-matrix))
(define-c-struct as-fixed-point (h as-fixed) (v as-fixed))
(define-c-typedef as-fixed-point-p (:pointer as-fixed-point))
(define-c-struct as-fixed-rect
                 (left as-fixed)
                 (top as-fixed)
                 (right as-fixed)
                 (bottom as-fixed))
(define-c-typedef as-fixed-rect-p (:pointer as-fixed-rect))
(define-c-struct quad
                 (tlh as-coord)
                 (tlv as-coord)
                 (trh as-coord)
                 (trv as-coord)
                 (blh as-coord)
                 (blv as-coord)
                 (brh as-coord)
                 (brv as-coord))
(define-c-typedef quad-p (:pointer quad))
(define-c-struct as-fixed-quad
                 (tl as-fixed-point)
                 (tr as-fixed-point)
                 (bl as-fixed-point)
                 (br as-fixed-point))
(define-c-typedef as-fixed-quad-p (:pointer as-fixed-quad))
(define-c-struct as-real-point (h as-real) (v as-real))
(define-c-struct as-real-rect
                 (left as-real)
                 (top as-real)
                 (right as-real)
                 (bottom as-real))
(define-c-struct as-real-matrix
                 (a as-real)
                 (b as-real)
                 (c as-real)
                 (d as-real)
                 (tx as-real)
                 (ty as-real))
(define-c-struct as-double-matrix
                 (a as-double)
                 (b as-double)
                 (c as-double)
                 (d as-double)
                 (h as-double)
                 (v as-double))
(define-c-typedef as-double-matrix-p (:pointer as-double-matrix))
(define-c-struct as-double-point (h as-double) (v as-double))
(define-c-typedef as-double-point-p (:pointer as-double-point))
(define-c-struct as-double-rect
                 (left as-double)
                 (top as-double)
                 (right as-double)
                 (bottom as-double))
(define-c-typedef as-double-rect-p (:pointer as-double-rect))
(define-c-struct as-time-rec
                 (year as-int16)
                 (month as-int16)
                 (date as-int16)
                 (hour as-int16)
                 (minute as-int16)
                 (second as-int16)
                 (millisecond as-int16)
                 (day as-int16)
                 (gmt-offset as-int16))
(define-c-typedef as-time-rec-p (:pointer as-time-rec))
(define-c-struct as-iorequest-rec
                 (md-file as-mdfile)
                 (ptr (:pointer :void))
                 (offset ast-file-pos)
                 (count ast-array-size)
                 (total-bytes-completed ast-array-size)
                 (p-error as-error-code)
                 (client-data (:pointer :void))
                 (iodone-proc as-iodone-proc)
                 (iodone-proc-data (:pointer :void)))
(define-c-struct as-file-sys-item-props-rec
                 (size as-size-t)
                 (is-there as-bool)
                 (type as-file-sys-item-type)
                 (is-hidden as-bool)
                 (is-read-only as-bool)
                 (creation-date-known as-bool)
                 (creation-date as-time-rec)
                 (mod-date-known as-bool)
                 (mod-date as-time-rec)
                 (file-size as-byte-count)
                 (file-size-high as-byte-count)
                 (folder-size ast-count)
                 (creator-code as-uns32)
                 (type-code as-uns32))
(define-c-typedef as-file-sys-item-props
                  (:pointer as-file-sys-item-props-rec))
(define-c-struct fsref-with-cfstring-ref-rec
                 (ref fsref-ptr)
                 (str (:pointer :void)))
(define-c-struct cfurlref-rec)
(define-c-struct as-file-sys-rec
                 (size as-size-t)
                 (open as-file-sys-open-proc)
                 (close as-file-sys-close-proc)
                 (flush as-file-sys-flush-proc)
                 (setpos as-file-sys-set-pos-proc)
                 (getpos as-file-sys-get-pos-proc)
                 (seteof as-file-sys-set-eof-proc)
                 (geteof as-file-sys-get-eof-proc)
                 (read as-file-sys-read-proc)
                 (write as-file-sys-write-proc)
                 (remove as-file-sys-remove-proc)
                 (rename as-file-sys-rename-proc)
                 (is-same-file as-file-sys-is-same-file-proc)
                 (get-name as-file-sys-get-name-proc)
                 (get-temp-path-name
                  as-file-sys-get-temp-path-name-proc)
                 (copy-path-name as-file-sys-copy-path-name-proc)
                 (di-path-from-path as-file-sys-di-path-from-path-proc)
                 (path-from-dipath as-file-sys-path-from-dipath-proc)
                 (dispose-path-name as-file-sys-dispose-path-name-proc)
                 (get-file-sys-name as-file-sys-get-file-sys-name-proc)
                 (get-storage-free-space
                  as-file-sys-get-storage-free-space-proc)
                 (flush-volume as-file-sys-flush-volume-proc)
                 (get-file-flags as-file-sys-get-file-flags)
                 (read-async as-file-sys-async-read-proc)
                 (write-async as-file-sys-async-write-proc)
                 (abort-async as-file-sys-async-abort-proc)
                 (yield as-file-sys-yield-proc)
                 (mread-request as-file-sys-mread-request-proc)
                 (get-status as-file-sys-get-status-proc)
                 (create-path-name as-file-sys-create-path-name-proc)
                 (acquire-file-sys-path
                  as-file-sys-acquire-file-sys-path-proc)
                 (clear-outstanding-mreads
                  as-file-sys-clear-outstanding-mreads-proc)
                 (get-item-props as-file-sys-get-item-props-proc)
                 (first-folder-item as-file-sys-first-folder-item-proc)
                 (next-folder-item as-file-sys-next-folder-item-proc)
                 (destroy-folder-iterator
                  as-file-sys-destroy-folder-iterator-proc)
                 (set-file-mode as-file-sys-set-mode-proc)
                 (url-from-path as-file-sys-urlfrom-path-proc)
                 (get-parent as-file-sys-get-parent-proc)
                 (create-folder as-file-sys-create-folder-proc)
                 (remove-folder as-file-sys-remove-folder-proc)
                 (display-string-from-path
                  as-file-sys-display-string-from-path-proc)
                 (set-type-and-creator
                  as-file-sys-set-type-and-creator-proc)
                 (get-type-and-creator
                  as-file-sys-get-type-and-creator-proc)
                 (reopen as-file-sys-reopen-proc)
                 (hard-flush as-file-sys-hard-flush-proc)
                 (get-item-props-as-cab
                  as-file-sys-get-item-props-as-cab-proc)
                 (can-perform-op-on-item
                  as-file-sys-can-perform-op-on-item-proc)
                 (perform-op-on-item
                  as-file-sys-perform-op-on-item-proc)
                 (acquire-platform-path
                  as-file-sys-acquire-platform-path-proc)
                 (release-platform-path
                  as-file-sys-release-platform-path-proc)
                 (get-name-as-as-text
                  as-file-sys-get-name-as-as-text-proc)
                 (display-as-text-from-path
                  as-file-sys-display-as-text-from-path-proc)
                 (range-arrived as-file-sys-range-arrived-proc)
                 (can-set-eof as-file-sys-can-set-eof-proc)
                 (di-path-from-path-ex
                  as-file-sys-dipath-from-path-ex-proc)
                 (path-from-dipath-ex
                  as-file-sys-path-from-dipath-ex-proc)
                 (getfileposlimit
                  as-file-sys-get-file-position-limit-proc)
                 (open64 as-file-sys-open64proc)
                 (setpos64 as-file-sys-set-pos64proc)
                 (getpos64 as-file-sys-get-pos64proc)
                 (seteof64 as-file-sys-set-eof64proc)
                 (geteof64 as-file-sys-get-eof64proc)
                 (get-name-for-display
                  as-file-sys-get-name-for-display-proc)
                 (get-storage-free-space64
                  as-file-sys-get-storage-free-space64proc)
                 (is-in-use as-file-sys-is-in-use-proc))
(define-c-struct as-progress-monitor-rec
                 (size as-size-t)
                 (begin-operation pmbegin-operation-proc)
                 (end-operation pmend-operation-proc)
                 (set-duration pmset-duration-proc)
                 (set-curr-value pmset-curr-value-proc)
                 (get-duration pmget-duration-proc)
                 (get-curr-value pmget-curr-value-proc)
                 (set-text pmset-text-proc))
(define-c-typedef as-progress-monitor
                  (:pointer as-progress-monitor-rec))
(define-c-struct as-uuid
                 (time-low as-uns32)
                 (time-mid as-uns16)
                 (time-hi-and-version as-uns16)
                 (clock-seq-hi-and-reserved as-uns8)
                 (clock-seq-low as-uns8))
(define-c-struct as-calendar-time-span-rec
                 (year as-uns32)
                 (month as-uns32)
                 (day as-uns32)
                 (hour as-uns32)
                 (minute as-uns32)
                 (second as-uns32))
(define-c-typedef as-calendar-time-span
                  (:pointer as-calendar-time-span-rec))

;; #include <CorProcs.h>
(defconstant +as-raise-sel+ 1)
(defconstant +as-push-exception-frame-sel+ 2)
(defconstant +as-pop-exception-frame-sel+ 3)
(defconstant +as-get-exception-error-code-sel+ 4)
(defconstant +as-atom-from-string-sel+ 5)
(defconstant +as-atom-exists-for-string-sel+ 6)
(defconstant +as-atom-get-string-sel+ 7)
(defconstant +as-callback-create-sel+ 8)
(defconstant +as-callback-destroy-sel+ 9)
(defconstant +as-extension-mgr-get-hft-sel+ 10)
(defconstant +as-get-configuration-sel+ 11)
(defconstant +as-enum-extensions-sel+ 12)
(defconstant +as-extension-get-file-name-sel+ 13)
(defconstant +as-extension-get-registered-name-sel+ 14)
;; sel = 1
(define-foreign-funcallable as-raise-selproto
                            ((error as-error-code))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 2
(define-foreign-funcallable as-push-exception-frame-selproto
                            ((as-environ (:pointer :void))
                             (restore-func ac-restore-environ-proc))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 3
(define-foreign-funcallable as-pop-exception-frame-selproto
                            nil
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 4
(define-foreign-funcallable as-get-exception-error-code-selproto
                            nil
                            :result-type
                            as-error-code
                            :calling-convention
                            :cdecl)
;; sel = 5
(define-foreign-funcallable as-atom-from-string-selproto
                            ((name-str
                              (:reference-pass :ef-mb-string)))
                            :result-type
                            as-atom
                            :calling-convention
                            :cdecl)
;; sel = 6
(define-foreign-funcallable as-atom-exists-for-string-selproto
                            ((name-str (:reference-pass :ef-mb-string))
                             (atom (:pointer as-atom)))
                            :result-type
                            as-bool
                            :calling-convention
                            :cdecl)
;; sel = 7
(define-foreign-funcallable as-atom-get-string-selproto
                            ((atm as-atom))
                            :result-type
                            (:reference-pass :ef-mb-string)
                            :calling-convention
                            :cdecl)
;; sel = 8
(define-foreign-funcallable as-callback-create-selproto
                            ((extension-id as-extension)
                             (proc (:pointer :void)))
                            :result-type
                            as-callback
                            :calling-convention
                            :cdecl)
;; sel = 9
(define-foreign-funcallable as-callback-destroy-selproto
                            ((callback as-callback))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 10
(define-foreign-funcallable as-extension-mgr-get-hft-selproto
                            ((name as-atom) (version as-version))
                            :result-type
                            hft
                            :calling-convention
                            :cdecl)
;; sel = 11
(define-foreign-funcallable as-get-configuration-selproto
                            ((key as-atom))
                            :result-type
                            (:pointer :void)
                            :calling-convention
                            :cdecl)
;; sel = 12
(define-foreign-funcallable as-enum-extensions-selproto
                            ((proc as-extension-enum-proc)
                             (client-data (:pointer :void))
                             (only-living-extensions as-bool))
                            :result-type
                            as-extension
                            :calling-convention
                            :cdecl)
;; sel = 13
(define-foreign-funcallable as-extension-get-file-name-selproto
                            ((extension as-extension)
                             (buffer (:reference-pass :ef-mb-string))
                             (buf-size ast-array-size))
                            :result-type
                            ast-array-size
                            :calling-convention
                            :cdecl)
;; sel = 14
(define-foreign-funcallable as-extension-get-registered-name-selproto
                            ((extension as-extension))
                            :result-type
                            as-atom
                            :calling-convention
                            :cdecl)

;; #include <CorCalls.h>
;; line 329
(define-c-typedef ac-push-exception-frame as-push-exception-frame)
;; line 330
(define-c-typedef ac-pop-exception-frame as-pop-exception-frame)
;; line 331
(define-c-typedef ac-get-exception-error-code
                  as-get-exception-error-code)
;; line 420
(define-acrobat-function (as-raise-impl "ASRaiseImpl")
                         *g-core-version*
                         +core-hft-version-2+
                         as-raise-selproto
                         *g-core-hft*
                         +as-raise-sel+)
;; line 438
(define-acrobat-function (as-push-exception-frame "ASPushExceptionFrame")
                         *g-core-version*
                         +core-hft-version-2+
                         as-push-exception-frame-selproto
                         *g-core-hft*
                         +as-push-exception-frame-sel+)
;; line 445
(define-acrobat-function (as-pop-exception-frame "ASPopExceptionFrame")
                         *g-core-version*
                         +core-hft-version-2+
                         as-pop-exception-frame-selproto
                         *g-core-hft*
                         +as-pop-exception-frame-sel+)
;; line 452
(define-acrobat-function (as-get-exception-error-code "ASGetExceptionErrorCode")
                         *g-core-version*
                         +core-hft-version-2+
                         as-get-exception-error-code-selproto
                         *g-core-hft*
                         +as-get-exception-error-code-sel+)
;; line 461
(define-acrobat-function (as-atom-from-string "ASAtomFromString")
                         *g-core-version*
                         +core-hft-version-2+
                         as-atom-from-string-selproto
                         *g-core-hft*
                         +as-atom-from-string-sel+)
;; line 468
(define-acrobat-function (as-atom-exists-for-string "ASAtomExistsForString")
                         *g-core-version*
                         +core-hft-version-2+
                         as-atom-exists-for-string-selproto
                         *g-core-hft*
                         +as-atom-exists-for-string-sel+)
;; line 475
(define-acrobat-function (as-atom-get-string "ASAtomGetString")
                         *g-core-version*
                         +core-hft-version-2+
                         as-atom-get-string-selproto
                         *g-core-hft*
                         +as-atom-get-string-sel+)
;; line 484
(define-acrobat-function (as-callback-create "ASCallbackCreate")
                         *g-core-version*
                         +core-hft-version-2+
                         as-callback-create-selproto
                         *g-core-hft*
                         +as-callback-create-sel+)
;; line 510
(define-acrobat-function (as-callback-destroy "ASCallbackDestroy")
                         *g-core-version*
                         +core-hft-version-2+
                         as-callback-destroy-selproto
                         *g-core-hft*
                         +as-callback-destroy-sel+)
;; line 515
(define-acrobat-function (as-extension-mgr-get-hft "ASExtensionMgrGetHFT")
                         *g-core-version*
                         +core-hft-version-2+
                         as-extension-mgr-get-hft-selproto
                         *g-core-hft*
                         +as-extension-mgr-get-hft-sel+)
;; line 528
(define-acrobat-function (as-get-configuration "ASGetConfiguration")
                         *g-core-version*
                         +core-hft-version-2+
                         as-get-configuration-selproto
                         *g-core-hft*
                         +as-get-configuration-sel+)
;; line 534
(define-acrobat-function (as-enum-extensions "ASEnumExtensions")
                         *g-core-version*
                         +core-hft-version-4+
                         as-enum-extensions-selproto
                         *g-core-hft*
                         +as-enum-extensions-sel+)
(defconstant +core-bad-selector+ 0)
(defconstant +core-num-selectorsplus-one+ 1)

;; #include <ASProcs.h>
(defconstant +as-malloc-sel+ 1)
(defconstant +as-realloc-sel+ 2)
(defconstant +as-free-sel+ 3)
(defconstant +as-get-error-string-sel+ 4)
(defconstant +as-register-error-string-sel+ 5)
(defconstant +hft-server-new-sel+ 6)
(defconstant +hft-server-destroy-sel+ 7)
(defconstant +hft-new-sel+ 8)
(defconstant +hft-destroy-sel+ 9)
(defconstant +hft-replace-entry-sel+ 10)
(defconstant +hft-get-replaced-entry-sel+ 11)
(defconstant +as-fixed-mul-sel+ 12)
(defconstant +as-fixed-div-sel+ 13)
(defconstant +as-fixed-to-cstring-sel+ 14)
(defconstant +as-cstring-to-fixed-sel+ 15)
(defconstant +as-fixed-matrix-concat-sel+ 16)
(defconstant +as-fixed-matrix-invert-sel+ 17)
(defconstant +as-fixed-matrix-transform-sel+ 18)
(defconstant +as-fixed-matrix-transform-rect-sel+ 19)
(defconstant +as-path-from-platform-path-sel+ 20)
(defconstant +as-get-default-file-sys-sel+ 21)
(defconstant +as-file-sys-dipath-from-path-sel+ 22)
(defconstant +as-file-sys-path-from-dipath-sel+ 23)
(defconstant +as-file-sys-copy-path-sel+ 24)
(defconstant +as-file-sys-release-path-sel+ 25)
(defconstant +as-file-sys-open-file-sel+ 26)
(defconstant +as-file-sys-remove-file-sel+ 27)
(defconstant +as-file-reopen-sel+ 28)
(defconstant +as-file-close-sel+ 29)
(defconstant +as-file-set-pos-sel+ 30)
(defconstant +as-file-get-pos-sel+ 31)
(defconstant +as-file-set-eof-sel+ 32)
(defconstant +as-file-get-eof-sel+ 33)
(defconstant +as-file-read-sel+ 34)
(defconstant +as-file-write-sel+ 35)
(defconstant +as-file-flush-sel+ 36)
(defconstant +as-file-acquire-path-name-sel+ 37)
(defconstant +as-file-get-file-sys-sel+ 38)
(defconstant +as-debug-sel+ 39)
(defconstant +as-file-stm-rd-open-sel+ 40)
(defconstant +as-mem-stm-rd-open-sel+ 41)
(defconstant +as-proc-stm-rd-open-sel+ 42)
(defconstant +as-stm-read-sel+ 43)
(defconstant +as-stm-write-sel+ 44)
(defconstant +as-stm-close-sel+ 45)
(defconstant +as-file-unregister-file-sys-sel+ 46)
(defconstant +as-file-push-data-sel+ 47)
(defconstant +as-file-register-file-sys-sel+ 48)
(defconstant +as-file-get-file-sys-by-name-sel+ 49)
(defconstant +as-file-from-mdfile-sel+ 50)
(defconstant +as-file-get-mdfile-sel+ 51)
(defconstant +as-file-sys-create-path-name-sel+ 52)
(defconstant +as-file-sys-acquire-file-sys-path-sel+ 53)
(defconstant +as-file-set-mode-sel+ 54)
(defconstant +as-proc-stm-wr-open-sel+ 55)
(defconstant +as-file-stm-wr-open-sel+ 56)
(defconstant +hft-is-valid-sel+ 57)
(defconstant +as-file-sys-get-item-props-sel+ 58)
(defconstant +as-file-sys-first-folder-item-sel+ 59)
(defconstant +as-file-sys-next-folder-item-sel+ 60)
(defconstant +as-file-sys-destroy-folder-iterator-sel+ 61)
(defconstant +as-file-sys-acquire-parent-sel+ 62)
(defconstant +as-file-is-same-sel+ 63)
(defconstant +as-file-sys-get-name-from-path-sel+ 64)
(defconstant +as-file-sys-get-temp-path-name-sel+ 65)
(defconstant +as-file-sys-get-storage-free-space-sel+ 66)
(defconstant +as-file-sys-flush-volume-sel+ 67)
(defconstant +as-file-mread-request-sel+ 68)
(defconstant +as-file-clear-outstanding-mreads-sel+ 69)
(defconstant +as-file-sys-urlfrom-path-sel+ 70)
(defconstant +as-file-get-url-sel+ 71)
(defconstant +as-file-sys-create-folder-sel+ 72)
(defconstant +as-file-sys-remove-folder-sel+ 73)
(defconstant +as-file-get-open-mode-sel+ 74)
(defconstant +as-file-sys-display-string-from-path-sel+ 75)
(defconstant +as-get-secs-sel+ 76)
(defconstant +as-file-sys-set-type-and-creator-sel+ 77)
(defconstant +as-file-sys-get-type-and-creator-sel+ 78)
(defconstant +as-host-mblen-sel+ 79)
(defconstant +as-file-hard-flush-sel+ 80)
(defconstant +hft-replace-entry-ex-sel+ 81)
(defconstant +hft-unreplace-entry-sel+ 82)
(defconstant +as-proc-stm-rd-open-ex-sel+ 83)
(defconstant +as-uuid-gen-unique-sel+ 84)
(defconstant +as-uuid-gen-from-name-sel+ 85)
(defconstant +as-uuid-gen-from-hash-sel+ 86)
(defconstant +as-uuid-from-cstring-sel+ 87)
(defconstant +as-uuid-to-cstring-sel+ 88)
(defconstant +as-file-sys-get-platform-thing-sel+ 89)
(defconstant +as-file-sys-acquire-platform-path-sel+ 90)
(defconstant +as-file-sys-release-platform-path-sel+ 91)
(defconstant +as-platform-path-get-cstring-ptr-sel+ 92)
(defconstant +as-platform-path-get-fsref-ptr-sel+ 93)
(defconstant +as-platform-path-get-fsref-with-cfstring-ref-rec-ptr-sel+ 94)
(defconstant +as-platform-path-get-cfurlref-rec-ptr-sel+ 95)
(defconstant +as-platform-path-get-posixpath-ptr-sel+ 96)
(defconstant +as-file-sys-get-name-from-path-as-as-text-sel+ 97)
(defconstant +as-file-sys-display-as-text-from-path-sel+ 98)
(defconstant +as-stm-flush-sel+ 99)
(defconstant +as-file-has-outstanding-mreads-sel+ 100)
(defconstant +as-file-can-set-eof-sel+ 101)
(defconstant +hft-get-version-sel+ 102)
(defconstant +hft-new-ex-sel+ 103)
(defconstant +as-file-sys-dipath-from-path-ex-sel+ 104)
(defconstant +as-file-sys-path-from-dipath-ex-sel+ 105)
(defconstant +as-get-temp-file-sys-sel+ 106)
(defconstant +as-set-temp-file-sys-sel+ 107)
(defconstant +as-get-ram-file-sys-sel+ 108)
(defconstant +as-fixed-to-float-sel+ 109)
(defconstant +float-to-as-fixed-sel+ 110)
(defconstant +as-file-sys-open-file64-sel+ 111)
(defconstant +as-file-sys-get-file-pos-limit-sel+ 112)
(defconstant +as-file-set-pos64-sel+ 113)
(defconstant +as-file-get-pos64-sel+ 114)
(defconstant +as-file-set-eof64-sel+ 115)
(defconstant +as-file-get-eof64-sel+ 116)
(defconstant +as-ram-file-sys-set-limit-kb-sel+ 117)
(defconstant +as-file-sys-get-name-from-path-for-display-sel+ 118)
(defconstant +as-get-default-unicode-file-sys-sel+ 119)
(defconstant +as-get-error-string-as-text-sel+ 120)
(defconstant +as-register-error-string-as-text-sel+ 121)
(defconstant +as-get-default-file-sys-for-path-sel+ 122)
(defconstant +as-file-sys-is-local-sel+ 123)
(defconstant +as-file-sys-get-storage-free-space64-sel+ 124)
(defconstant +as-double-matrix-concat-sel+ 125)
(defconstant +as-double-matrix-invert-sel+ 126)
(defconstant +as-double-matrix-transform-sel+ 127)
(defconstant +as-double-matrix-transform-rect-sel+ 128)
(defconstant +as-file-open-with-virtual-eof-sel+ 129)
;; sel = 1
(define-foreign-funcallable as-malloc-selproto
                            ((n-bytes os-size-t))
                            :result-type
                            (:pointer :void)
                            :calling-convention
                            :cdecl)
;; sel = 2
(define-foreign-funcallable as-realloc-selproto
                            ((ptr (:pointer :void))
                             (new-nbytes os-size-t))
                            :result-type
                            (:pointer :void)
                            :calling-convention
                            :cdecl)
;; sel = 3
(define-foreign-funcallable as-free-selproto
                            ((ptr (:pointer :void)))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 4
(define-foreign-funcallable as-get-error-string-selproto
                            ((error-code as-error-code)
                             (buffer (:reference-pass :ef-mb-string))
                             (len-buffer ast-array-size))
                            :result-type
                            (:reference-pass :ef-mb-string)
                            :calling-convention
                            :cdecl)
;; sel = 5
(define-foreign-funcallable as-register-error-string-selproto
                            ((severity as-err-severity)
                             (error-string
                              (:reference-pass :ef-mb-string)))
                            :result-type
                            as-error-code
                            :calling-convention
                            :cdecl)
;; sel = 6
(define-foreign-funcallable hft-server-new-selproto
                            ((name (:reference-pass :ef-mb-string))
                             (server-proc hft-server-provide-hft-proc)
                             (destroy-proc hft-server-destroy-proc)
                             (client-data (:pointer :void)))
                            :result-type
                            hft-server
                            :calling-convention
                            :cdecl)
;; sel = 7
(define-foreign-funcallable hft-server-destroy-selproto
                            ((hft-server hft-server))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 8
(define-foreign-funcallable hft-new-selproto
                            ((hft-server hft-server)
                             (num-selectors ast-count))
                            :result-type
                            hft
                            :calling-convention
                            :cdecl)
;; sel = 9
(define-foreign-funcallable hft-destroy-selproto
                            ((hft hft))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 10
(define-foreign-funcallable hft-replace-entry-selproto
                            ((hft hft)
                             (sel selector)
                             (new-entry hft-entry)
                             (flags as-flag-bits))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 11
(define-foreign-funcallable hft-get-replaced-entry-selproto
                            ((hft hft)
                             (sel selector)
                             (old-entry hft-entry))
                            :result-type
                            hft-entry
                            :calling-convention
                            :cdecl)
;; sel = 12
(define-foreign-funcallable as-fixed-mul-selproto
                            ((a as-fixed) (b as-fixed))
                            :result-type
                            as-fixed
                            :calling-convention
                            :cdecl)
;; sel = 13
(define-foreign-funcallable as-fixed-div-selproto
                            ((a as-fixed) (b as-fixed))
                            :result-type
                            as-fixed
                            :calling-convention
                            :cdecl)
;; sel = 14
(define-foreign-funcallable as-fixed-to-cstring-selproto
                            ((f as-fixed)
                             (s (:reference-pass :ef-mb-string))
                             (max-length os-size-t)
                             (precision as-small-count))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 15
(define-foreign-funcallable as-cstring-to-fixed-selproto
                            ((s (:reference-pass :ef-mb-string)))
                            :result-type
                            as-fixed
                            :calling-convention
                            :cdecl)
;; sel = 16
(define-foreign-funcallable as-fixed-matrix-concat-selproto
                            ((result as-fixed-matrix-p)
                             (m1 (:pointer as-fixed-matrix))
                             (m2 (:pointer as-fixed-matrix)))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 17
(define-foreign-funcallable as-fixed-matrix-invert-selproto
                            ((result as-fixed-matrix-p)
                             (m as-fixed-matrix-p))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 18
(define-foreign-funcallable as-fixed-matrix-transform-selproto
                            ((result as-fixed-point-p)
                             (m as-fixed-matrix-p)
                             (p as-fixed-point-p))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 19
(define-foreign-funcallable as-fixed-matrix-transform-rect-selproto
                            ((result as-fixed-rect-p)
                             (m as-fixed-matrix-p)
                             (rect-in as-fixed-rect-p))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 20
(define-foreign-funcallable as-path-from-platform-path-selproto
                            ((platform-path (:pointer :void)))
                            :result-type
                            as-path-name
                            :calling-convention
                            :cdecl)
;; sel = 21
(define-foreign-funcallable as-get-default-file-sys-selproto
                            nil
                            :result-type
                            as-file-sys
                            :calling-convention
                            :cdecl)
;; sel = 22
(define-foreign-funcallable as-file-sys-dipath-from-path-selproto
                            ((file-sys as-file-sys)
                             (path as-path-name)
                             (relative-to-this-path as-path-name))
                            :result-type
                            (:reference-pass :ef-mb-string)
                            :calling-convention
                            :cdecl)
;; sel = 23
(define-foreign-funcallable as-file-sys-path-from-dipath-selproto
                            ((file-sys as-file-sys)
                             (di-path (:reference-pass :ef-mb-string))
                             (relative-to-this-path as-path-name))
                            :result-type
                            as-path-name
                            :calling-convention
                            :cdecl)
;; sel = 24
(define-foreign-funcallable as-file-sys-copy-path-selproto
                            ((file-sys as-file-sys)
                             (path-name as-path-name))
                            :result-type
                            as-path-name
                            :calling-convention
                            :cdecl)
;; sel = 25
(define-foreign-funcallable as-file-sys-release-path-selproto
                            ((file-sys as-file-sys)
                             (path-name as-path-name))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 26
(define-foreign-funcallable as-file-sys-open-file-selproto
                            ((file-sys as-file-sys)
                             (path-name as-path-name)
                             (mode as-file-mode)
                             (f-p (:pointer as-file)))
                            :result-type
                            as-error-code
                            :calling-convention
                            :cdecl)
;; sel = 27
(define-foreign-funcallable as-file-sys-remove-file-selproto
                            ((file-sys as-file-sys)
                             (path-name as-path-name))
                            :result-type
                            as-error-code
                            :calling-convention
                            :cdecl)
;; sel = 28
(define-foreign-funcallable as-file-reopen-selproto
                            ((a-file as-file) (mode as-file-mode))
                            :result-type
                            as-error-code
                            :calling-convention
                            :cdecl)
;; sel = 29
(define-foreign-funcallable as-file-close-selproto
                            ((a-file as-file))
                            :result-type
                            as-error-code
                            :calling-convention
                            :cdecl)
;; sel = 30
(define-foreign-funcallable as-file-set-pos-selproto
                            ((a-file as-file) (pos ast-file-pos))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 31
(define-foreign-funcallable as-file-get-pos-selproto
                            ((a-file as-file))
                            :result-type
                            ast-file-pos
                            :calling-convention
                            :cdecl)
;; sel = 32
(define-foreign-funcallable as-file-set-eof-selproto
                            ((a-file as-file)
                             (new-file-size ast-file-pos))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 33
(define-foreign-funcallable as-file-get-eof-selproto
                            ((a-file as-file))
                            :result-type
                            ast-file-pos
                            :calling-convention
                            :cdecl)
;; sel = 34
(define-foreign-funcallable as-file-read-selproto
                            ((a-file as-file)
                             (p (:reference-pass :ef-mb-string))
                             (count ast-array-size))
                            :result-type
                            ast-array-size
                            :calling-convention
                            :cdecl)
;; sel = 35
(define-foreign-funcallable as-file-write-selproto
                            ((a-file as-file)
                             (p (:reference-pass :ef-mb-string))
                             (count ast-array-size))
                            :result-type
                            ast-array-size
                            :calling-convention
                            :cdecl)
;; sel = 36
(define-foreign-funcallable as-file-flush-selproto
                            ((a-file as-file))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 37
(define-foreign-funcallable as-file-acquire-path-name-selproto
                            ((a-file as-file))
                            :result-type
                            as-path-name
                            :calling-convention
                            :cdecl)
;; sel = 38
(define-foreign-funcallable as-file-get-file-sys-selproto
                            ((a-file as-file))
                            :result-type
                            as-file-sys
                            :calling-convention
                            :cdecl)
;; sel = 39
(define-foreign-funcallable as-debug-selproto
                            ((op as-int32)
                             (parm (:pointer :void))
                             (parm-len ast-array-size)
                             (client-data (:pointer :void)))
                            :result-type
                            (:pointer :void)
                            :calling-convention
                            :cdecl)
;; sel = 40
(define-foreign-funcallable as-file-stm-rd-open-selproto
                            ((afile as-file)
                             (buf-size as-small-buffer-size))
                            :result-type
                            as-stm
                            :calling-convention
                            :cdecl)
;; sel = 41
(define-foreign-funcallable as-mem-stm-rd-open-selproto
                            ((data (:reference-pass :ef-mb-string))
                             (len as-array-size))
                            :result-type
                            as-stm
                            :calling-convention
                            :cdecl)
;; sel = 42
(define-foreign-funcallable as-proc-stm-rd-open-selproto
                            ((read-proc as-stm-proc)
                             (client-data (:pointer :void)))
                            :result-type
                            as-stm
                            :calling-convention
                            :cdecl)
;; sel = 43
(define-foreign-funcallable as-stm-read-selproto
                            ((ptr (:reference-pass :ef-mb-string))
                             (item-size ast-array-size)
                             (n-items ast-count)
                             (stm as-stm))
                            :result-type
                            ast-count
                            :calling-convention
                            :cdecl)
;; sel = 44
(define-foreign-funcallable as-stm-write-selproto
                            ((ptr (:reference-pass :ef-mb-string))
                             (item-size ast-array-size)
                             (n-items ast-count)
                             (stm as-stm))
                            :result-type
                            ast-count
                            :calling-convention
                            :cdecl)
;; sel = 45
(define-foreign-funcallable as-stm-close-selproto
                            ((stm as-stm))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 46
(define-foreign-funcallable as-file-unregister-file-sys-selproto
                            ((extension as-extension)
                             (file-sys as-file-sys))
                            :result-type
                            as-bool
                            :calling-convention
                            :cdecl)
;; sel = 47
(define-foreign-funcallable as-file-push-data-selproto
                            ((a-file as-file)
                             (p (:reference-pass :ef-mb-string))
                             (offset ast-file-pos)
                             (length ast-array-size))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 48
(define-foreign-funcallable as-file-register-file-sys-selproto
                            ((extension as-extension)
                             (file-sys as-file-sys))
                            :result-type
                            as-bool
                            :calling-convention
                            :cdecl)
;; sel = 49
(define-foreign-funcallable as-file-get-file-sys-by-name-selproto
                            ((name as-atom))
                            :result-type
                            as-file-sys
                            :calling-convention
                            :cdecl)
;; sel = 50
(define-foreign-funcallable as-file-from-mdfile-selproto
                            ((md-file as-mdfile)
                             (file-sys as-file-sys)
                             (pf-n (:pointer as-file)))
                            :result-type
                            as-bool
                            :calling-convention
                            :cdecl)
;; sel = 51
(define-foreign-funcallable as-file-get-mdfile-selproto
                            ((f-n as-file)
                             (p-file-id (:pointer as-mdfile))
                             (p-file-sys (:pointer as-file-sys)))
                            :result-type
                            as-bool
                            :calling-convention
                            :cdecl)
;; sel = 52
(define-foreign-funcallable as-file-sys-create-path-name-selproto
                            ((file-sys as-file-sys)
                             (path-spec-type as-atom)
                             (path-spec (:pointer :void))
                             (additional-data (:pointer :void)))
                            :result-type
                            as-path-name
                            :calling-convention
                            :cdecl)
;; sel = 53
(define-foreign-funcallable as-file-sys-acquire-file-sys-path-selproto
                            ((old-file-sys as-file-sys)
                             (old-path-name as-path-name)
                             (new-file-sys as-file-sys))
                            :result-type
                            as-path-name
                            :calling-convention
                            :cdecl)
;; sel = 54
(define-foreign-funcallable as-file-set-mode-selproto
                            ((f-n as-file)
                             (mode-value as-flag-bits)
                             (mode-mask as-flag-bits))
                            :result-type
                            as-flag-bits
                            :calling-convention
                            :cdecl)
;; sel = 55
(define-foreign-funcallable as-proc-stm-wr-open-selproto
                            ((write-proc as-stm-proc)
                             (destroy-proc as-proc-stm-destroy-proc)
                             (client-data (:pointer :void)))
                            :result-type
                            as-stm
                            :calling-convention
                            :cdecl)
;; sel = 56
(define-foreign-funcallable as-file-stm-wr-open-selproto
                            ((afile as-file)
                             (buf-size as-small-buffer-size))
                            :result-type
                            as-stm
                            :calling-convention
                            :cdecl)
;; sel = 57
(define-foreign-funcallable hft-is-valid-selproto
                            ((hft hft))
                            :result-type
                            as-bool
                            :calling-convention
                            :cdecl)
;; sel = 58
(define-foreign-funcallable as-file-sys-get-item-props-selproto
                            ((file-sys as-file-sys)
                             (path-name as-path-name)
                             (props as-file-sys-item-props))
                            :result-type
                            as-error-code
                            :calling-convention
                            :cdecl)
;; sel = 59
(define-foreign-funcallable as-file-sys-first-folder-item-selproto
                            ((file-sys as-file-sys)
                             (folder-path as-path-name)
                             (props as-file-sys-item-props)
                             (item-path (:pointer as-path-name)))
                            :result-type
                            as-folder-iterator
                            :calling-convention
                            :cdecl)
;; sel = 60
(define-foreign-funcallable as-file-sys-next-folder-item-selproto
                            ((file-sys as-file-sys)
                             (folder-iter as-folder-iterator)
                             (props as-file-sys-item-props)
                             (item-path (:pointer as-path-name)))
                            :result-type
                            as-bool
                            :calling-convention
                            :cdecl)
;; sel = 61
(define-foreign-funcallable as-file-sys-destroy-folder-iterator-selproto
                            ((file-sys as-file-sys)
                             (folder-iter as-folder-iterator))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 62
(define-foreign-funcallable as-file-sys-acquire-parent-selproto
                            ((file-sys as-file-sys)
                             (path-name as-path-name))
                            :result-type
                            as-path-name
                            :calling-convention
                            :cdecl)
;; sel = 63
(define-foreign-funcallable as-file-is-same-selproto
                            ((f-n as-file)
                             (path-name as-path-name)
                             (file-sys as-file-sys))
                            :result-type
                            as-bool
                            :calling-convention
                            :cdecl)
;; sel = 64
(define-foreign-funcallable as-file-sys-get-name-from-path-selproto
                            ((file-sys as-file-sys)
                             (path-name as-path-name)
                             (name (:reference-pass :ef-mb-string))
                             (max-length ast-array-size))
                            :result-type
                            as-error-code
                            :calling-convention
                            :cdecl)
;; sel = 65
(define-foreign-funcallable as-file-sys-get-temp-path-name-selproto
                            ((file-sys as-file-sys)
                             (sibling-path-name as-path-name))
                            :result-type
                            as-path-name
                            :calling-convention
                            :cdecl)
;; sel = 66
(define-foreign-funcallable as-file-sys-get-storage-free-space-selproto
                            ((file-sys as-file-sys)
                             (path-name as-path-name))
                            :result-type
                            as-disk-space
                            :calling-convention
                            :cdecl)
;; sel = 67
(define-foreign-funcallable as-file-sys-flush-volume-selproto
                            ((file-sys as-file-sys)
                             (path-name as-path-name))
                            :result-type
                            as-error-code
                            :calling-convention
                            :cdecl)
;; sel = 68
(define-foreign-funcallable as-file-mread-request-selproto
                            ((f-n as-file)
                             (block-pairs (:pointer as-int32))
                             (n-block-pairs ast-count))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 69
(define-foreign-funcallable as-file-clear-outstanding-mreads-selproto
                            ((f-n as-file))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 70
(define-foreign-funcallable as-file-sys-urlfrom-path-selproto
                            ((file-sys as-file-sys)
                             (path as-path-name))
                            :result-type
                            (:reference-pass :ef-mb-string)
                            :calling-convention
                            :cdecl)
;; sel = 71
(define-foreign-funcallable as-file-get-url-selproto
                            ((asf as-file))
                            :result-type
                            (:reference-pass :ef-mb-string)
                            :calling-convention
                            :cdecl)
;; sel = 72
(define-foreign-funcallable as-file-sys-create-folder-selproto
                            ((file-sys as-file-sys)
                             (path as-path-name)
                             (recurse as-bool))
                            :result-type
                            as-error-code
                            :calling-convention
                            :cdecl)
;; sel = 73
(define-foreign-funcallable as-file-sys-remove-folder-selproto
                            ((file-sys as-file-sys)
                             (path as-path-name))
                            :result-type
                            as-error-code
                            :calling-convention
                            :cdecl)
;; sel = 74
(define-foreign-funcallable as-file-get-open-mode-selproto
                            ((f-n as-file))
                            :result-type
                            as-file-mode
                            :calling-convention
                            :cdecl)
;; sel = 75
(define-foreign-funcallable as-file-sys-display-string-from-path-selproto
                            ((file-sys as-file-sys)
                             (path as-path-name))
                            :result-type
                            (:reference-pass :ef-mb-string)
                            :calling-convention
                            :cdecl)
;; sel = 76
(define-foreign-funcallable as-get-secs-selproto
                            nil
                            :result-type
                            as-count
                            :calling-convention
                            :cdecl)
;; sel = 77
(define-foreign-funcallable as-file-sys-set-type-and-creator-selproto
                            ((file-sys as-file-sys)
                             (path as-path-name)
                             (type as-uns32)
                             (creator as-uns32))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 78
(define-foreign-funcallable as-file-sys-get-type-and-creator-selproto
                            ((file-sys as-file-sys)
                             (path as-path-name)
                             (type (:pointer as-uns32))
                             (creator (:pointer as-uns32)))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 79
(define-foreign-funcallable as-host-mblen-selproto
                            ((encoding as-host-encoding)
                             (byte as-uns8))
                            :result-type
                            as-int32
                            :calling-convention
                            :cdecl)
;; sel = 80
(define-foreign-funcallable as-file-hard-flush-selproto
                            ((a-file as-file))
                            :result-type
                            as-error-code
                            :calling-convention
                            :cdecl)
;; sel = 81
(define-foreign-funcallable hft-replace-entry-ex-selproto
                            ((hft hft)
                             (sel selector)
                             (new-entry hft-entry)
                             (extension as-extension)
                             (flags as-flag-bits))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 82
(define-foreign-funcallable hft-unreplace-entry-selproto
                            ((hft hft)
                             (sel selector)
                             (old-entry hft-entry)
                             (extension as-extension))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 83
(define-foreign-funcallable as-proc-stm-rd-open-ex-selproto
                            ((handler as-proc-stm-rd-ex-handler)
                             (client-data (:pointer :void)))
                            :result-type
                            as-stm
                            :calling-convention
                            :cdecl)
;; sel = 84
(define-foreign-funcallable as-uuid-gen-unique-selproto
                            ((dst (:pointer as-uuid)))
                            :result-type
                            as-bool
                            :calling-convention
                            :cdecl)
;; sel = 85
(define-foreign-funcallable as-uuid-gen-from-name-selproto
                            ((dst (:pointer as-uuid))
                             (ns (:pointer as-uuid))
                             (name (:pointer :void))
                             (bytes as-byte-count))
                            :result-type
                            as-bool
                            :calling-convention
                            :cdecl)
;; sel = 86
(define-foreign-funcallable as-uuid-gen-from-hash-selproto
                            ((dst (:pointer as-uuid))
                             (hash (:c-array as-uns8 16)))
                            :result-type
                            as-bool
                            :calling-convention
                            :cdecl)
;; sel = 87
(define-foreign-funcallable as-uuid-from-cstring-selproto
                            ((dst (:pointer as-uuid))
                             (str (:reference-pass :ef-mb-string)))
                            :result-type
                            as-bool
                            :calling-convention
                            :cdecl)
;; sel = 88
(define-foreign-funcallable as-uuid-to-cstring-selproto
                            ((dst (:reference-pass :ef-mb-string))
                             (src (:pointer as-uuid)))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 89
(define-foreign-funcallable as-file-sys-get-platform-thing-selproto
                            ((file-sys as-file-sys)
                             (path as-path-name)
                             (thing as-atom))
                            :result-type
                            (:pointer :void)
                            :calling-convention
                            :cdecl)
;; sel = 90
(define-foreign-funcallable as-file-sys-acquire-platform-path-selproto
                            ((file-sys as-file-sys)
                             (path as-path-name)
                             (platform-path-type as-atom)
                             (platform-path
                              (:pointer as-platform-path)))
                            :result-type
                            as-int32
                            :calling-convention
                            :cdecl)
;; sel = 91
(define-foreign-funcallable as-file-sys-release-platform-path-selproto
                            ((file-sys as-file-sys)
                             (platform-path as-platform-path))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 92
(define-foreign-funcallable as-platform-path-get-cstring-ptr-selproto
                            ((path as-platform-path))
                            :result-type
                            cstring-ptr
                            :calling-convention
                            :cdecl)
;; sel = 93
(define-foreign-funcallable as-platform-path-get-fsref-ptr-selproto
                            ((path as-platform-path))
                            :result-type
                            fsref-ptr
                            :calling-convention
                            :cdecl)
;; sel = 94
(define-foreign-funcallable as-platform-path-get-fsref-with-cfstring-ref-rec-ptr-selproto
                            ((path as-platform-path))
                            :result-type
                            fsref-with-cfstring-ref-rec-ptr
                            :calling-convention
                            :cdecl)
;; sel = 95
(define-foreign-funcallable as-platform-path-get-cfurlref-rec-ptr-selproto
                            ((path as-platform-path))
                            :result-type
                            cfurlref-rec-ptr
                            :calling-convention
                            :cdecl)
;; sel = 96
(define-foreign-funcallable as-platform-path-get-posixpath-ptr-selproto
                            ((path as-platform-path))
                            :result-type
                            posixpath-ptr
                            :calling-convention
                            :cdecl)
;; sel = 97
(define-foreign-funcallable as-file-sys-get-name-from-path-as-as-text-selproto
                            ((file-sys as-file-sys)
                             (path-name as-path-name)
                             (name as-text))
                            :result-type
                            as-error-code
                            :calling-convention
                            :cdecl)
;; sel = 98
(define-foreign-funcallable as-file-sys-display-as-text-from-path-selproto
                            ((file-sys as-file-sys)
                             (path as-path-name)
                             (display-text as-text))
                            :result-type
                            as-error-code
                            :calling-convention
                            :cdecl)
;; sel = 99
(define-foreign-funcallable as-stm-flush-selproto
                            ((stm as-stm))
                            :result-type
                            ast-count
                            :calling-convention
                            :cdecl)
;; sel = 100
(define-foreign-funcallable as-file-has-outstanding-mreads-selproto
                            ((f-n as-file))
                            :result-type
                            as-bool
                            :calling-convention
                            :cdecl)
;; sel = 101
(define-foreign-funcallable as-file-can-set-eof-selproto
                            ((file as-file) (new-file-size as-int32))
                            :result-type
                            as-bool
                            :calling-convention
                            :cdecl)
;; sel = 102
(define-foreign-funcallable hft-get-version-selproto
                            ((hft hft))
                            :result-type
                            as-version
                            :calling-convention
                            :cdecl)
;; sel = 103
(define-foreign-funcallable hft-new-ex-selproto
                            ((hft-server hft-server) (data hft-data))
                            :result-type
                            hft
                            :calling-convention
                            :cdecl)
;; sel = 104
(define-foreign-funcallable as-file-sys-dipath-from-path-ex-selproto
                            ((file-sys as-file-sys)
                             (path as-path-name)
                             (relative-to-this-path as-path-name)
                             (di-path-text as-text))
                            :result-type
                            as-error-code
                            :calling-convention
                            :cdecl)
;; sel = 105
(define-foreign-funcallable as-file-sys-path-from-dipath-ex-selproto
                            ((file-sys as-file-sys)
                             (di-path-text as-const-text)
                             (relative-to-this-path as-path-name))
                            :result-type
                            as-path-name
                            :calling-convention
                            :cdecl)
;; sel = 106
(define-foreign-funcallable as-get-temp-file-sys-selproto
                            nil
                            :result-type
                            as-file-sys
                            :calling-convention
                            :cdecl)
;; sel = 107
(define-foreign-funcallable as-set-temp-file-sys-selproto
                            ((file-sys as-file-sys))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 108
(define-foreign-funcallable as-get-ram-file-sys-selproto
                            nil
                            :result-type
                            as-file-sys
                            :calling-convention
                            :cdecl)
;; sel = 109
(define-foreign-funcallable as-fixed-to-float-selproto
                            ((in-as-fixed as-fixed))
                            :result-type
                            :float
                            :calling-convention
                            :cdecl)
;; sel = 110
(define-foreign-funcallable float-to-as-fixed-selproto
                            ((in-float :double))
                            :result-type
                            as-fixed
                            :calling-convention
                            :cdecl)
;; sel = 111
(define-foreign-funcallable as-file-sys-open-file64-selproto
                            ((file-sys as-file-sys)
                             (path-name as-path-name)
                             (mode as-file-mode)
                             (f-p (:pointer as-file)))
                            :result-type
                            as-error-code
                            :calling-convention
                            :cdecl)
;; sel = 112
(define-foreign-funcallable as-file-sys-get-file-pos-limit-selproto
                            ((file-sys as-file-sys))
                            :result-type
                            as-file-pos64
                            :calling-convention
                            :cdecl)
;; sel = 113
(define-foreign-funcallable as-file-set-pos64-selproto
                            ((a-file as-file) (pos as-file-pos64))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 114
(define-foreign-funcallable as-file-get-pos64-selproto
                            ((a-file as-file))
                            :result-type
                            as-file-pos64
                            :calling-convention
                            :cdecl)
;; sel = 115
(define-foreign-funcallable as-file-set-eof64-selproto
                            ((a-file as-file)
                             (new-file-size as-file-pos64))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 116
(define-foreign-funcallable as-file-get-eof64-selproto
                            ((a-file as-file))
                            :result-type
                            as-file-pos64
                            :calling-convention
                            :cdecl)
;; sel = 117
(define-foreign-funcallable as-ram-file-sys-set-limit-kb-selproto
                            ((limit as-int32))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 118
(define-foreign-funcallable as-file-sys-get-name-from-path-for-display-selproto
                            ((file-sys as-file-sys)
                             (path-name as-path-name)
                             (name-for-display as-text))
                            :result-type
                            as-error-code
                            :calling-convention
                            :cdecl)
;; sel = 119
(define-foreign-funcallable as-get-default-unicode-file-sys-selproto
                            nil
                            :result-type
                            as-file-sys
                            :calling-convention
                            :cdecl)
;; sel = 120
(define-foreign-funcallable as-get-error-string-as-text-selproto
                            ((error-code as-error-code)
                             (error-string as-text))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 121
(define-foreign-funcallable as-register-error-string-as-text-selproto
                            ((severity as-err-severity)
                             (error-string as-text))
                            :result-type
                            as-error-code
                            :calling-convention
                            :cdecl)
;; sel = 122
(define-foreign-funcallable as-get-default-file-sys-for-path-selproto
                            ((path-spec-type as-atom)
                             (path-spec (:pointer :void)))
                            :result-type
                            as-file-sys
                            :calling-convention
                            :cdecl)
;; sel = 123
(define-foreign-funcallable as-file-sys-is-local-selproto
                            ((file-sys as-file-sys))
                            :result-type
                            as-bool
                            :calling-convention
                            :cdecl)
;; sel = 124
(define-foreign-funcallable as-file-sys-get-storage-free-space64-selproto
                            ((file-sys as-file-sys)
                             (path-name as-path-name))
                            :result-type
                            as-disk-space64
                            :calling-convention
                            :cdecl)
;; sel = 125
(define-foreign-funcallable as-double-matrix-concat-selproto
                            ((result (:pointer as-double-matrix))
                             (m1 (:pointer as-double-matrix))
                             (m2 (:pointer as-double-matrix)))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 126
(define-foreign-funcallable as-double-matrix-invert-selproto
                            ((result (:pointer as-double-matrix))
                             (m (:pointer as-double-matrix)))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 127
(define-foreign-funcallable as-double-matrix-transform-selproto
                            ((result (:pointer as-double-point))
                             (m (:pointer as-double-matrix))
                             (p (:pointer as-double-point)))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 128
(define-foreign-funcallable as-double-matrix-transform-rect-selproto
                            ((result (:pointer as-double-rect))
                             (m (:pointer as-double-matrix))
                             (rect-in (:pointer as-double-rect)))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 129
(define-foreign-funcallable as-file-open-with-virtual-eof-selproto
                            ((f-n as-file)
                             (virtual-eof as-file-pos64)
                             (new-file (:pointer as-file)))
                            :result-type
                            as-int32
                            :calling-convention
                            :cdecl)

;; #include <ASCalls.h>
;; line 104
(define-c-typedef as-calls-hft-version-10 as-calls-hft-latest-version)
;; line 181
(define-acrobat-function (as-malloc "ASmalloc")
                         *g-acro-support-version*
                         0
                         as-malloc-selproto
                         *g-acro-support-hft*
                         +as-malloc-sel+)
;; line 184
(define-acrobat-function (as-realloc "ASrealloc")
                         *g-acro-support-version*
                         0
                         as-realloc-selproto
                         *g-acro-support-hft*
                         +as-realloc-sel+)
;; line 187
(define-acrobat-function (as-free "ASfree")
                         *g-acro-support-version*
                         0
                         as-free-selproto
                         *g-acro-support-hft*
                         +as-free-sel+)
;; line 191
(define-acrobat-function (as-get-error-string "ASGetErrorString")
                         *g-acro-support-version*
                         0
                         as-get-error-string-selproto
                         *g-acro-support-hft*
                         +as-get-error-string-sel+)
;; line 194
(define-acrobat-function (as-register-error-string "ASRegisterErrorString")
                         *g-acro-support-version*
                         0
                         as-register-error-string-selproto
                         *g-acro-support-hft*
                         +as-register-error-string-sel+)
;; line 198
(define-acrobat-function (hft-server-new "HFTServerNew")
                         *g-acro-support-version*
                         0
                         hft-server-new-selproto
                         *g-acro-support-hft*
                         +hft-server-new-sel+)
;; line 208
(define-acrobat-function (hft-destroy "HFTDestroy")
                         *g-acro-support-version*
                         0
                         hft-destroy-selproto
                         *g-acro-support-hft*
                         +hft-destroy-sel+)
;; line 217
(define-acrobat-function (hft-replace-entry "HFTReplaceEntry")
                         *g-acro-support-version*
                         0
                         hft-replace-entry-selproto
                         *g-acro-support-hft*
                         +hft-replace-entry-sel+)
;; line 227
(define-acrobat-function (as-fixed-mul "ASFixedMul")
                         *g-acro-support-version*
                         0
                         as-fixed-mul-selproto
                         *g-acro-support-hft*
                         +as-fixed-mul-sel+)
;; line 230
(define-acrobat-function (as-fixed-div "ASFixedDiv")
                         *g-acro-support-version*
                         0
                         as-fixed-div-selproto
                         *g-acro-support-hft*
                         +as-fixed-div-sel+)
;; line 233
(define-acrobat-function (as-fixed-to-cstring "ASFixedToCString")
                         *g-acro-support-version*
                         0
                         as-fixed-to-cstring-selproto
                         *g-acro-support-hft*
                         +as-fixed-to-cstring-sel+)
;; line 236
(define-acrobat-function (as-cstring-to-fixed "ASCStringToFixed")
                         *g-acro-support-version*
                         0
                         as-cstring-to-fixed-selproto
                         *g-acro-support-hft*
                         +as-cstring-to-fixed-sel+)
;; line 240
(define-acrobat-function (as-fixed-matrix-concat "ASFixedMatrixConcat")
                         *g-acro-support-version*
                         0
                         as-fixed-matrix-concat-selproto
                         *g-acro-support-hft*
                         +as-fixed-matrix-concat-sel+)
;; line 243
(define-acrobat-function (as-fixed-matrix-invert "ASFixedMatrixInvert")
                         *g-acro-support-version*
                         0
                         as-fixed-matrix-invert-selproto
                         *g-acro-support-hft*
                         +as-fixed-matrix-invert-sel+)
;; line 246
(define-acrobat-function (as-fixed-matrix-transform "ASFixedMatrixTransform")
                         *g-acro-support-version*
                         0
                         as-fixed-matrix-transform-selproto
                         *g-acro-support-hft*
                         +as-fixed-matrix-transform-sel+)
;; line 249
(define-acrobat-function (as-fixed-matrix-transform-rect "ASFixedMatrixTransformRect")
                         *g-acro-support-version*
                         0
                         as-fixed-matrix-transform-rect-selproto
                         *g-acro-support-hft*
                         +as-fixed-matrix-transform-rect-sel+)
;; line 253
(define-acrobat-function (as-path-from-platform-path "ASPathFromPlatformPath")
                         *g-acro-support-version*
                         0
                         as-path-from-platform-path-selproto
                         *g-acro-support-hft*
                         +as-path-from-platform-path-sel+)
;; line 257
(define-acrobat-function (as-get-default-file-sys "ASGetDefaultFileSys")
                         *g-acro-support-version*
                         0
                         as-get-default-file-sys-selproto
                         *g-acro-support-hft*
                         +as-get-default-file-sys-sel+)
;; line 269
(define-acrobat-function (as-ram-file-sys-set-limit-kb "ASRamFileSysSetLimitKB")
                         *g-acro-support-version*
                         +as-calls-hft-version-7+
                         as-ram-file-sys-set-limit-kb-selproto
                         *g-acro-support-hft*
                         +as-ram-file-sys-set-limit-kb-sel+)
;; line 272
(define-acrobat-function (as-file-sys-dipath-from-path "ASFileSysDIPathFromPath")
                         *g-acro-support-version*
                         0
                         as-file-sys-dipath-from-path-selproto
                         *g-acro-support-hft*
                         +as-file-sys-dipath-from-path-sel+)
;; line 275
(define-acrobat-function (as-file-sys-path-from-dipath "ASFileSysPathFromDIPath")
                         *g-acro-support-version*
                         0
                         as-file-sys-path-from-dipath-selproto
                         *g-acro-support-hft*
                         +as-file-sys-path-from-dipath-sel+)
;; line 278
(define-acrobat-function (as-file-sys-copy-path "ASFileSysCopyPath")
                         *g-acro-support-version*
                         0
                         as-file-sys-copy-path-selproto
                         *g-acro-support-hft*
                         +as-file-sys-copy-path-sel+)
;; line 281
(define-acrobat-function (as-file-sys-release-path "ASFileSysReleasePath")
                         *g-acro-support-version*
                         0
                         as-file-sys-release-path-selproto
                         *g-acro-support-hft*
                         +as-file-sys-release-path-sel+)
;; line 284
(define-acrobat-function (as-file-sys-open-file "ASFileSysOpenFile")
                         *g-acro-support-version*
                         0
                         as-file-sys-open-file-selproto
                         *g-acro-support-hft*
                         +as-file-sys-open-file-sel+)
;; line 287
(define-acrobat-function (as-file-sys-remove-file "ASFileSysRemoveFile")
                         *g-acro-support-version*
                         0
                         as-file-sys-remove-file-selproto
                         *g-acro-support-hft*
                         +as-file-sys-remove-file-sel+)
;; line 290
(define-acrobat-function (as-file-reopen "ASFileReopen")
                         *g-acro-support-version*
                         0
                         as-file-reopen-selproto
                         *g-acro-support-hft*
                         +as-file-reopen-sel+)
;; line 293
(define-acrobat-function (as-file-close "ASFileClose")
                         *g-acro-support-version*
                         0
                         as-file-close-selproto
                         *g-acro-support-hft*
                         +as-file-close-sel+)
;; line 296
(define-acrobat-function (as-file-set-pos "ASFileSetPos")
                         *g-acro-support-version*
                         0
                         as-file-set-pos-selproto
                         *g-acro-support-hft*
                         +as-file-set-pos-sel+)
;; line 299
(define-acrobat-function (as-file-get-pos "ASFileGetPos")
                         *g-acro-support-version*
                         0
                         as-file-get-pos-selproto
                         *g-acro-support-hft*
                         +as-file-get-pos-sel+)
;; line 302
(define-acrobat-function (as-file-set-eof "ASFileSetEOF")
                         *g-acro-support-version*
                         0
                         as-file-set-eof-selproto
                         *g-acro-support-hft*
                         +as-file-set-eof-sel+)
;; line 305
(define-acrobat-function (as-file-get-eof "ASFileGetEOF")
                         *g-acro-support-version*
                         0
                         as-file-get-eof-selproto
                         *g-acro-support-hft*
                         +as-file-get-eof-sel+)
;; line 308
(define-acrobat-function (as-file-read "ASFileRead")
                         *g-acro-support-version*
                         0
                         as-file-read-selproto
                         *g-acro-support-hft*
                         +as-file-read-sel+)
;; line 311
(define-acrobat-function (as-file-write "ASFileWrite")
                         *g-acro-support-version*
                         0
                         as-file-write-selproto
                         *g-acro-support-hft*
                         +as-file-write-sel+)
;; line 314
(define-acrobat-function (as-file-flush "ASFileFlush")
                         *g-acro-support-version*
                         0
                         as-file-flush-selproto
                         *g-acro-support-hft*
                         +as-file-flush-sel+)
;; line 317
(define-acrobat-function (as-file-acquire-path-name "ASFileAcquirePathName")
                         *g-acro-support-version*
                         0
                         as-file-acquire-path-name-selproto
                         *g-acro-support-hft*
                         +as-file-acquire-path-name-sel+)
;; line 320
(define-acrobat-function (as-file-get-file-sys "ASFileGetFileSys")
                         *g-acro-support-version*
                         0
                         as-file-get-file-sys-selproto
                         *g-acro-support-hft*
                         +as-file-get-file-sys-sel+)
;; line 323
(define-acrobat-function (as-file-stm-rd-open "ASFileStmRdOpen")
                         *g-acro-support-version*
                         0
                         as-file-stm-rd-open-selproto
                         *g-acro-support-hft*
                         +as-file-stm-rd-open-sel+)
;; line 326
(define-acrobat-function (as-mem-stm-rd-open "ASMemStmRdOpen")
                         *g-acro-support-version*
                         0
                         as-mem-stm-rd-open-selproto
                         *g-acro-support-hft*
                         +as-mem-stm-rd-open-sel+)
;; line 329
(define-acrobat-function (as-proc-stm-rd-open "ASProcStmRdOpen")
                         *g-acro-support-version*
                         0
                         as-proc-stm-rd-open-selproto
                         *g-acro-support-hft*
                         +as-proc-stm-rd-open-sel+)
;; line 332
(define-acrobat-function (as-stm-read "ASStmRead")
                         *g-acro-support-version*
                         0
                         as-stm-read-selproto
                         *g-acro-support-hft*
                         +as-stm-read-sel+)
;; line 335
(define-acrobat-function (as-stm-write "ASStmWrite")
                         *g-acro-support-version*
                         0
                         as-stm-write-selproto
                         *g-acro-support-hft*
                         +as-stm-write-sel+)
;; line 343
(define-acrobat-function (as-file-unregister-file-sys "ASFileUnregisterFileSys")
                         *g-acro-support-version*
                         +as-calls-hft-version-2-2+
                         as-file-unregister-file-sys-selproto
                         *g-acro-support-hft*
                         +as-file-unregister-file-sys-sel+)
;; line 346
(define-acrobat-function (as-file-push-data "ASFilePushData")
                         *g-acro-support-version*
                         +as-calls-hft-version-2-2+
                         as-file-push-data-selproto
                         *g-acro-support-hft*
                         +as-file-push-data-sel+)
;; line 349
(define-acrobat-function (as-file-register-file-sys "ASFileRegisterFileSys")
                         *g-acro-support-version*
                         +as-calls-hft-version-2-2+
                         as-file-register-file-sys-selproto
                         *g-acro-support-hft*
                         +as-file-register-file-sys-sel+)
;; line 352
(define-acrobat-function (as-file-get-file-sys-by-name "ASFileGetFileSysByName")
                         *g-acro-support-version*
                         +as-calls-hft-version-2-2+
                         as-file-get-file-sys-by-name-selproto
                         *g-acro-support-hft*
                         +as-file-get-file-sys-by-name-sel+)
;; line 355
(define-acrobat-function (as-file-from-mdfile "ASFileFromMDFile")
                         *g-acro-support-version*
                         +as-calls-hft-version-2-2+
                         as-file-from-mdfile-selproto
                         *g-acro-support-hft*
                         +as-file-from-mdfile-sel+)
;; line 358
(define-acrobat-function (as-file-get-mdfile "ASFileGetMDFile")
                         *g-acro-support-version*
                         +as-calls-hft-version-2-2+
                         as-file-get-mdfile-selproto
                         *g-acro-support-hft*
                         +as-file-get-mdfile-sel+)
;; line 361
(define-acrobat-function (as-file-sys-create-path-name "ASFileSysCreatePathName")
                         *g-acro-support-version*
                         +as-calls-hft-version-2-2+
                         as-file-sys-create-path-name-selproto
                         *g-acro-support-hft*
                         +as-file-sys-create-path-name-sel+)
;; line 364
(define-acrobat-function (as-file-sys-acquire-file-sys-path "ASFileSysAcquireFileSysPath")
                         *g-acro-support-version*
                         +as-calls-hft-version-2-2+
                         as-file-sys-acquire-file-sys-path-selproto
                         *g-acro-support-hft*
                         +as-file-sys-acquire-file-sys-path-sel+)
;; line 367
(define-acrobat-function (as-file-set-mode "ASFileSetMode")
                         *g-acro-support-version*
                         +as-calls-hft-version-2-2+
                         as-file-set-mode-selproto
                         *g-acro-support-hft*
                         +as-file-set-mode-sel+)
;; line 374
(define-acrobat-function (as-file-stm-wr-open "ASFileStmWrOpen")
                         *g-acro-support-version*
                         +as-calls-hft-version-4+
                         as-file-stm-wr-open-selproto
                         *g-acro-support-hft*
                         +as-file-stm-wr-open-sel+)
;; line 377
(define-acrobat-function (as-proc-stm-wr-open "ASProcStmWrOpen")
                         *g-acro-support-version*
                         +as-calls-hft-version-4+
                         as-proc-stm-wr-open-selproto
                         *g-acro-support-hft*
                         +as-proc-stm-wr-open-sel+)
;; line 380
(define-acrobat-function (hft-is-valid "HFTIsValid")
                         *g-acro-support-version*
                         +as-calls-hft-version-4+
                         hft-is-valid-selproto
                         *g-acro-support-hft*
                         +hft-is-valid-sel+)
;; line 430
(define-acrobat-function (as-file-hard-flush "ASFileHardFlush")
                         *g-acro-support-version*
                         +as-calls-hft-version-5+
                         as-file-hard-flush-selproto
                         *g-acro-support-hft*
                         +as-file-hard-flush-sel+)
;; line 432
(define-acrobat-function (hft-replace-entry-ex "HFTReplaceEntryEx")
                         *g-acro-support-version*
                         +as-calls-hft-version-5+
                         hft-replace-entry-ex-selproto
                         *g-acro-support-hft*
                         +hft-replace-entry-ex-sel+)
;; line 434
(define-acrobat-function (hft-unreplace-entry "HFTUnreplaceEntry")
                         *g-acro-support-version*
                         +as-calls-hft-version-5+
                         hft-unreplace-entry-selproto
                         *g-acro-support-hft*
                         +hft-unreplace-entry-sel+)
;; line 440
(define-acrobat-function (as-proc-stm-rd-open-ex "ASProcStmRdOpenEx")
                         *g-acro-support-version*
                         +as-calls-hft-version-6+
                         as-proc-stm-rd-open-ex-selproto
                         *g-acro-support-hft*
                         +as-proc-stm-rd-open-ex-sel+)
;; line 441
(define-acrobat-function (as-uuid-gen-unique "ASUUIDGenUnique")
                         *g-acro-support-version*
                         +as-calls-hft-version-6+
                         as-uuid-gen-unique-selproto
                         *g-acro-support-hft*
                         +as-uuid-gen-unique-sel+)
;; line 442
(define-acrobat-function (as-uuid-gen-from-name "ASUUIDGenFromName")
                         *g-acro-support-version*
                         +as-calls-hft-version-6+
                         as-uuid-gen-from-name-selproto
                         *g-acro-support-hft*
                         +as-uuid-gen-from-name-sel+)
;; line 443
(define-acrobat-function (as-uuid-gen-from-hash "ASUUIDGenFromHash")
                         *g-acro-support-version*
                         +as-calls-hft-version-6+
                         as-uuid-gen-from-hash-selproto
                         *g-acro-support-hft*
                         +as-uuid-gen-from-hash-sel+)
;; line 444
(define-acrobat-function (as-uuid-from-cstring "ASUUIDFromCString")
                         *g-acro-support-version*
                         +as-calls-hft-version-6+
                         as-uuid-from-cstring-selproto
                         *g-acro-support-hft*
                         +as-uuid-from-cstring-sel+)
;; line 445
(define-acrobat-function (as-uuid-to-cstring "ASUUIDToCString")
                         *g-acro-support-version*
                         +as-calls-hft-version-6+
                         as-uuid-to-cstring-selproto
                         *g-acro-support-hft*
                         +as-uuid-to-cstring-sel+)
;; line 446
(define-acrobat-function (as-file-sys-get-platform-thing "ASFileSysGetPlatformThing")
                         *g-acro-support-version*
                         +as-calls-hft-version-6+
                         as-file-sys-get-platform-thing-selproto
                         *g-acro-support-hft*
                         +as-file-sys-get-platform-thing-sel+)
;; line 447
(define-acrobat-function (as-file-sys-acquire-platform-path "ASFileSysAcquirePlatformPath")
                         *g-acro-support-version*
                         +as-calls-hft-version-6+
                         as-file-sys-acquire-platform-path-selproto
                         *g-acro-support-hft*
                         +as-file-sys-acquire-platform-path-sel+)
;; line 448
(define-acrobat-function (as-file-sys-release-platform-path "ASFileSysReleasePlatformPath")
                         *g-acro-support-version*
                         +as-calls-hft-version-6+
                         as-file-sys-release-platform-path-selproto
                         *g-acro-support-hft*
                         +as-file-sys-release-platform-path-sel+)
;; line 449
(define-acrobat-function (as-platform-path-get-cstring-ptr "ASPlatformPathGetCstringPtr")
                         *g-acro-support-version*
                         +as-calls-hft-version-6+
                         as-platform-path-get-cstring-ptr-selproto
                         *g-acro-support-hft*
                         +as-platform-path-get-cstring-ptr-sel+)
;; line 453
(define-acrobat-function (as-platform-path-get-fsref-ptr "ASPlatformPathGetFSRefPtr")
                         *g-acro-support-version*
                         +as-calls-hft-version-6+
                         as-platform-path-get-fsref-ptr-selproto
                         *g-acro-support-hft*
                         +as-platform-path-get-fsref-ptr-sel+)
;; line 454
(define-acrobat-function (as-platform-path-get-fsref-with-cfstring-ref-rec-ptr "ASPlatformPathGetFSRefWithCFStringRefRecPtr")
                         *g-acro-support-version*
                         +as-calls-hft-version-6+
                         as-platform-path-get-fsref-with-cfstring-ref-rec-ptr-selproto
                         *g-acro-support-hft*
                         +as-platform-path-get-fsref-with-cfstring-ref-rec-ptr-sel+)
;; line 455
(define-acrobat-function (as-platform-path-get-cfurlref-rec-ptr "ASPlatformPathGetCFURLRefRecPtr")
                         *g-acro-support-version*
                         +as-calls-hft-version-6+
                         as-platform-path-get-cfurlref-rec-ptr-selproto
                         *g-acro-support-hft*
                         +as-platform-path-get-cfurlref-rec-ptr-sel+)
;; line 456
(define-acrobat-function (as-platform-path-get-posixpath-ptr "ASPlatformPathGetPOSIXPathPtr")
                         *g-acro-support-version*
                         +as-calls-hft-version-6+
                         as-platform-path-get-posixpath-ptr-selproto
                         *g-acro-support-hft*
                         +as-platform-path-get-posixpath-ptr-sel+)
;; line 457
(define-acrobat-function (as-file-sys-get-name-from-path-as-as-text "ASFileSysGetNameFromPathAsASText")
                         *g-acro-support-version*
                         +as-calls-hft-version-6+
                         as-file-sys-get-name-from-path-as-as-text-selproto
                         *g-acro-support-hft*
                         +as-file-sys-get-name-from-path-as-as-text-sel+)
;; line 458
(define-acrobat-function (as-file-sys-display-as-text-from-path "ASFileSysDisplayASTextFromPath")
                         *g-acro-support-version*
                         +as-calls-hft-version-6+
                         as-file-sys-display-as-text-from-path-selproto
                         *g-acro-support-hft*
                         +as-file-sys-display-as-text-from-path-sel+)
;; line 460
(define-acrobat-function (as-stm-flush "ASStmFlush")
                         *g-acro-support-version*
                         +as-calls-hft-version-6+
                         as-stm-flush-selproto
                         *g-acro-support-hft*
                         +as-stm-flush-sel+)
;; line 461
(define-acrobat-function (as-file-has-outstanding-mreads "ASFileHasOutstandingMReads")
                         *g-acro-support-version*
                         +as-calls-hft-version-6+
                         as-file-has-outstanding-mreads-selproto
                         *g-acro-support-hft*
                         +as-file-has-outstanding-mreads-sel+)
;; line 462
(define-acrobat-function (as-file-can-set-eof "ASFileCanSetEOF")
                         *g-acro-support-version*
                         +as-calls-hft-version-6+
                         as-file-can-set-eof-selproto
                         *g-acro-support-hft*
                         +as-file-can-set-eof-sel+)
;; line 463
(define-acrobat-function (hft-get-version "HFTGetVersion")
                         *g-acro-support-version*
                         +as-calls-hft-version-6+
                         hft-get-version-selproto
                         *g-acro-support-hft*
                         +hft-get-version-sel+)
;; line 464
(define-acrobat-function (hft-new-ex "HFTNewEx")
                         *g-acro-support-version*
                         +as-calls-hft-version-6+
                         hft-new-ex-selproto
                         *g-acro-support-hft*
                         +hft-new-ex-sel+)
;; line 465
(define-acrobat-function (as-file-sys-dipath-from-path-ex "ASFileSysDIPathFromPathEx")
                         *g-acro-support-version*
                         +as-calls-hft-version-6+
                         as-file-sys-dipath-from-path-ex-selproto
                         *g-acro-support-hft*
                         +as-file-sys-dipath-from-path-ex-sel+)
;; line 466
(define-acrobat-function (as-file-sys-path-from-dipath-ex "ASFileSysPathFromDIPathEx")
                         *g-acro-support-version*
                         +as-calls-hft-version-6+
                         as-file-sys-path-from-dipath-ex-selproto
                         *g-acro-support-hft*
                         +as-file-sys-path-from-dipath-ex-sel+)
;; line 471
(define-acrobat-function (as-fixed-to-float "ASFixedToFloat")
                         *g-acro-support-version*
                         +as-calls-hft-version-7+
                         as-fixed-to-float-selproto
                         *g-acro-support-hft*
                         +as-fixed-to-float-sel+)
;; line 472
(define-acrobat-function (float-to-as-fixed "FloatToASFixed")
                         *g-acro-support-version*
                         +as-calls-hft-version-7+
                         float-to-as-fixed-selproto
                         *g-acro-support-hft*
                         +float-to-as-fixed-sel+)
;; line 479
(define-acrobat-function (as-file-sys-open-file64 "ASFileSysOpenFile64")
                         *g-acro-support-version*
                         +as-calls-hft-version-7+
                         as-file-sys-open-file64selproto
                         *g-acro-support-hft*
                         +as-file-sys-open-file64sel+)
;; line 480
(define-acrobat-function (as-file-sys-get-file-pos-limit "ASFileSysGetFilePosLimit")
                         *g-acro-support-version*
                         +as-calls-hft-version-7+
                         as-file-sys-get-file-pos-limit-selproto
                         *g-acro-support-hft*
                         +as-file-sys-get-file-pos-limit-sel+)
;; line 481
(define-acrobat-function (as-file-set-pos64 "ASFileSetPos64")
                         *g-acro-support-version*
                         +as-calls-hft-version-7+
                         as-file-set-pos64selproto
                         *g-acro-support-hft*
                         +as-file-set-pos64sel+)
;; line 482
(define-acrobat-function (as-file-get-pos64 "ASFileGetPos64")
                         *g-acro-support-version*
                         +as-calls-hft-version-7+
                         as-file-get-pos64selproto
                         *g-acro-support-hft*
                         +as-file-get-pos64sel+)
;; line 483
(define-acrobat-function (as-file-set-eof64 "ASFileSetEOF64")
                         *g-acro-support-version*
                         +as-calls-hft-version-7+
                         as-file-set-eof64selproto
                         *g-acro-support-hft*
                         +as-file-set-eof64sel+)
;; line 484
(define-acrobat-function (as-file-get-eof64 "ASFileGetEOF64")
                         *g-acro-support-version*
                         +as-calls-hft-version-7+
                         as-file-get-eof64selproto
                         *g-acro-support-hft*
                         +as-file-get-eof64sel+)
;; line 486
(define-acrobat-function (as-file-sys-get-name-from-path-for-display "ASFileSysGetNameFromPathForDisplay")
                         *g-acro-support-version*
                         +as-calls-hft-version-7+
                         as-file-sys-get-name-from-path-for-display-selproto
                         *g-acro-support-hft*
                         +as-file-sys-get-name-from-path-for-display-sel+)
;; line 491
(define-acrobat-function (as-get-default-unicode-file-sys "ASGetDefaultUnicodeFileSys")
                         *g-acro-support-version*
                         +as-calls-hft-version-8+
                         as-get-default-unicode-file-sys-selproto
                         *g-acro-support-hft*
                         +as-get-default-unicode-file-sys-sel+)
;; line 492
(define-acrobat-function (as-get-error-string-as-text "ASGetErrorStringASText")
                         *g-acro-support-version*
                         +as-calls-hft-version-8+
                         as-get-error-string-as-text-selproto
                         *g-acro-support-hft*
                         +as-get-error-string-as-text-sel+)
;; line 493
(define-acrobat-function (as-register-error-string-as-text "ASRegisterErrorStringASText")
                         *g-acro-support-version*
                         +as-calls-hft-version-8+
                         as-register-error-string-as-text-selproto
                         *g-acro-support-hft*
                         +as-register-error-string-as-text-sel+)
;; line 494
(define-acrobat-function (as-get-default-file-sys-for-path "ASGetDefaultFileSysForPath")
                         *g-acro-support-version*
                         +as-calls-hft-version-8+
                         as-get-default-file-sys-for-path-selproto
                         *g-acro-support-hft*
                         +as-get-default-file-sys-for-path-sel+)
;; line 495
(define-acrobat-function (as-file-sys-is-local "ASFileSysIsLocal")
                         *g-acro-support-version*
                         +as-calls-hft-version-8+
                         as-file-sys-is-local-selproto
                         *g-acro-support-hft*
                         +as-file-sys-is-local-sel+)
;; line 496
(define-acrobat-function (as-file-sys-get-storage-free-space64 "ASFileSysGetStorageFreeSpace64")
                         *g-acro-support-version*
                         +as-calls-hft-version-8+
                         as-file-sys-get-storage-free-space64selproto
                         *g-acro-support-hft*
                         +as-file-sys-get-storage-free-space64sel+)
;; line 500
(define-acrobat-function (as-double-matrix-concat "ASDoubleMatrixConcat")
                         *g-acro-support-version*
                         +as-calls-hft-version-10+
                         as-double-matrix-concat-selproto
                         *g-acro-support-hft*
                         +as-double-matrix-concat-sel+)
;; line 501
(define-acrobat-function (as-double-matrix-invert "ASDoubleMatrixInvert")
                         *g-acro-support-version*
                         +as-calls-hft-version-10+
                         as-double-matrix-invert-selproto
                         *g-acro-support-hft*
                         +as-double-matrix-invert-sel+)
;; line 502
(define-acrobat-function (as-double-matrix-transform "ASDoubleMatrixTransform")
                         *g-acro-support-version*
                         +as-calls-hft-version-10+
                         as-double-matrix-transform-selproto
                         *g-acro-support-hft*
                         +as-double-matrix-transform-sel+)
;; line 503
(define-acrobat-function (as-double-matrix-transform-rect "ASDoubleMatrixTransformRect")
                         *g-acro-support-version*
                         +as-calls-hft-version-10+
                         as-double-matrix-transform-rect-selproto
                         *g-acro-support-hft*
                         +as-double-matrix-transform-rect-sel+)
;; line 504
(define-acrobat-function (as-file-open-with-virtual-eof "ASFileOpenWithVirtualEOF")
                         *g-acro-support-version*
                         +as-calls-hft-version-10+
                         as-file-open-with-virtual-eof-selproto
                         *g-acro-support-hft*
                         +as-file-open-with-virtual-eof-sel+)
(defconstant +as-bad-selector+ 0)
(defconstant +as-num-selectorsplus-one+ 1)

;; #include <PIVersn.h>
(define-c-typedef pi-setup-sdk-proc-type
                  (:pointer
                   (:function
                    (as-uns32 (:pointer :void))
                    as-bool
                    :calling-convention
                    :cdecl)))
(define-c-typedef pi-handshake-proc-type
                  (:pointer
                   (:function
                    (as-uns32 (:pointer :void))
                    as-bool
                    :calling-convention
                    :cdecl)))
(define-c-typedef pi-export-hft-s-proc-type
                  (:pointer
                   (:function nil as-bool :calling-convention :cdecl)))
(define-c-typedef pi-import-replace-and-register-proc-type
                  (:pointer
                   (:function nil as-bool :calling-convention :cdecl)))
(define-c-typedef pi-init-proc-type
                  (:pointer
                   (:function nil as-bool :calling-convention :cdecl)))
(define-c-typedef pi-unload-proc-type
                  (:pointer
                   (:function nil as-bool :calling-convention :cdecl)))
(define-c-struct pi-sdk-data-v0200)
(define-c-struct pi-handshake-data-v0200)

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
                 (key-name (:pointer :byte))
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
                 (which-marks as-uns32))
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
                 (doc-title (:pointer :byte))
                 (doc-date (:pointer :byte))
                 (doc-time (:pointer :byte))
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
                 (window-maximized as-bool))
(define-c-typedef av-doc-view-def (:pointer av-doc-view-def-rec))
(define-c-struct av-dest-info-rec
                 (size as-size-t)
                 (named-dest (:pointer :byte))
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
                 (server-type (:pointer :byte))
                 (server-creation-data (:pointer :void))
                 (use-source-doc as-bool)
                 (source-doc av-doc)
                 (use-read-only as-bool)
                 (read-only as-bool)
                 (use-view-type as-bool)
                 (view-type (:pointer :byte))
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
                 (force-open-protected-view\  as-bool)
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
                 (ppd-path (:pointer :byte))
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
                 (filter-id (:pointer :byte))
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
                 (floating-window-name (:pointer :byte))
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
                 (c-date (:pointer :byte))
                 (asp-file as-path-name)
                 (c-description (:pointer :byte))
                 (c-legal (:pointer :byte))
                 (c-dependencies (:pointer :byte)))
(define-c-typedef av-extension-info (:pointer av-extension-info-rec))
(define-c-struct av-simple-sel-procs-rec
                 (size as-size-t)
                 (type (:pointer :byte))
                 (hilite-proc av-simple-sel-hilite-proc)
                 (de-hilite-proc av-simple-sel-de-hilite-proc)
                 (destroy-proc av-simple-sel-data-destroy-proc))
(define-c-typedef av-simple-sel-procs
                  (:pointer av-simple-sel-procs-rec))
(define-c-struct av-undo-handler-rec
                 (size as-size-t)
                 (type (:pointer :byte))
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
                 (notification (:pointer :byte)))
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
                 (flags av-open-save-dialog-flags)
                 (settings-compute-enabled-proc
                  av-open-save-dialog-settings-compute-enabled-proc)
                 (settings-execute-proc
                  av-open-save-dialog-settings-execute-proc)
                 (settings-proc-data (:pointer :void)))
(define-c-typedef old-avopen-save-dialog-params
                  (:pointer old-avopen-save-dialog-params-rec))
(define-c-struct old-avdoc-selection-server-rec
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
                 (page-view-layout-mode pd-layout-mode)
                 (page-view-page-num pd-page-number)
                 (page-view-zoom-type av-zoom-type)
                 (page-view-zoom as-fixed)
                 (page-view-x as-int16)
                 (page-view-y as-int16)
                 (page-view-start-thread as-bool)
                 (page-view-thread-index av-page-index)
                 (page-view-bead pd-bead)
                 (over-view-mode pd-page-mode)
                 (over-view-x as-int32)
                 (over-view-y as-int32)
                 (window-frame old-avrect))
(define-c-typedef old-avdoc-view-def (:pointer old-avdoc-view-def-rec))
(define-c-struct old-avdoc-open-params-rec (size as-size-t))
(define-c-typedef old-avdoc-open-params
                  (:pointer old-avdoc-open-params-rec))
(define-c-struct old-avtool-bar-position-rec
                 (size as-size-t)
                 (in-doc as-bool)
                 (dock-position av-tool-bar-dock-position)
                 (floating-window-name (:pointer :byte))
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
                 (header-string (:pointer :byte)))
(define-c-typedef cos-doc-open-params
                  (:pointer cos-doc-open-params-rec))
(define-c-struct cos-doc-save-params-rec
                 (size as-size-t)
                 (header (:pointer :byte))
                 (crypt-data (:pointer :byte))
                 (crypt-data-len ast-array-size)
                 (mon as-progress-monitor)
                 (mon-client-data (:pointer :void))
                 (crypt-version cos-crypt-version))
(define-c-typedef cos-doc-save-params
                  (:pointer cos-doc-save-params-rec))

;; #include <AVProcs.h>
(defconstant +av-action-handler-get-type-sel+ 1)
(defconstant +av-action-handler-get-uiname-sel+ 2)
(defconstant +av-action-handler-get-procs-sel+ 3)
(defconstant +av-alert-sel+ 4)
(defconstant +av-alert-note-sel+ 5)
(defconstant +av-alert-confirm-sel+ 6)
(defconstant +av-app-get-version-sel+ 7)
(defconstant +av-app-get-language-sel+ 8)
(defconstant +av-app-get-name-sel+ 9)
(defconstant +av-app-get-cancel-proc-sel+ 10)
(defconstant +av-app-can-quit-sel+ 11)
(defconstant +av-app-get-active-doc-sel+ 12)
(defconstant +av-app-get-num-docs-sel+ 13)
(defconstant +av-app-enum-docs-sel+ 14)
(defconstant +av-app-get-doc-progress-monitor-sel+ 15)
(defconstant +av-app-get-menubar-sel+ 16)
(defconstant +av-app-get-legacy-tool-bar-sel+ 17)
(defconstant +av-app-get-active-tool-sel+ 18)
(defconstant +av-app-get-last-active-tool-sel+ 19)
(defconstant +av-app-get-default-tool-sel+ 20)
(defconstant +av-app-set-active-tool-sel+ 21)
(defconstant +av-app-get-tool-by-name-sel+ 22)
(defconstant +av-app-enum-tools-sel+ 23)
(defconstant +old-avapp-register-tool-sel+ 24)
(defconstant +av-app-get-annot-handler-by-name-sel+ 25)
(defconstant +av-app-enum-annot-handlers-sel+ 26)
(defconstant +old-avapp-register-annot-handler-sel+ 27)
(defconstant +av-app-get-action-handler-by-type-sel+ 28)
(defconstant +av-app-enum-action-handlers-sel+ 29)
(defconstant +av-app-register-action-handler-sel+ 30)
(defconstant +av-app-get-preference-sel+ 31)
(defconstant +av-app-set-preference-sel+ 32)
(defconstant +av-app-begin-full-screen-sel+ 33)
(defconstant +av-app-end-full-screen-sel+ 34)
(defconstant +av-app-doing-full-screen-sel+ 35)
(defconstant +av-app-begin-modal-sel+ 36)
(defconstant +av-app-modal-window-is-open-sel+ 37)
(defconstant +av-app-end-modal-sel+ 38)
(defconstant +av-app-register-idle-proc-sel+ 39)
(defconstant +av-app-unregister-idle-proc-sel+ 40)
(defconstant +av-app-register-notification-sel+ 41)
(defconstant +av-app-unregister-notification-sel+ 42)
(defconstant +old-avdoc-open-from-file-sel+ 43)
(defconstant +old-avdoc-open-from-file-with-params-sel+ 44)
(defconstant +old-avdoc-open-from-pddoc-sel+ 45)
(defconstant +old-avdoc-open-from-pddoc-with-params-sel+ 46)
(defconstant +av-doc-close-sel+ 47)
(defconstant +av-doc-get-pddoc-sel+ 48)
(defconstant +av-doc-get-page-view-sel+ 49)
(defconstant +av-doc-get-avwindow-sel+ 50)
(defconstant +av-doc-get-view-mode-sel+ 51)
(defconstant +av-doc-set-view-mode-sel+ 52)
(defconstant +av-doc-get-splitter-position-sel+ 53)
(defconstant +av-doc-set-splitter-position-sel+ 54)
(defconstant +av-doc-print-pages-sel+ 55)
(defconstant +av-doc-get-selection-type-sel+ 56)
(defconstant +av-doc-get-selection-sel+ 57)
(defconstant +av-doc-set-selection-sel+ 58)
(defconstant +av-doc-delete-selection-sel+ 59)
(defconstant +av-doc-clear-selection-sel+ 60)
(defconstant +av-doc-copy-selection-sel+ 61)
(defconstant +av-doc-enum-selection-sel+ 62)
(defconstant +av-doc-do-selection-properties-sel+ 63)
(defconstant +av-doc-show-selection-sel+ 64)
(defconstant +old-avdoc-get-selection-server-by-type-sel+ 65)
(defconstant +old-avdoc-register-selection-server-sel+ 66)
(defconstant +av-doc-perform-action-sel+ 67)
(defconstant +av-menubar-show-sel+ 68)
(defconstant +av-menubar-hide-sel+ 69)
(defconstant +av-menubar-get-num-menus-sel+ 70)
(defconstant +av-menubar-acquire-menu-by-name-sel+ 71)
(defconstant +av-menubar-acquire-menu-by-index-sel+ 72)
(defconstant +av-menubar-acquire-menu-by-predicate-sel+ 73)
(defconstant +av-menubar-acquire-menu-item-by-name-sel+ 74)
(defconstant +av-menubar-acquire-menu-item-by-predicate-sel+ 75)
(defconstant +av-menubar-get-menu-index-sel+ 76)
(defconstant +av-menubar-add-menu-sel+ 77)
(defconstant +av-menu-new-sel+ 78)
(defconstant +av-menu-acquire-sel+ 79)
(defconstant +av-menu-release-sel+ 80)
(defconstant +av-menu-remove-sel+ 81)
(defconstant +av-menu-get-name-sel+ 82)
(defconstant +av-menu-get-title-sel+ 83)
(defconstant +av-menu-get-num-menu-items-sel+ 84)
(defconstant +av-menu-acquire-menu-item-by-index-sel+ 85)
(defconstant +av-menu-get-menu-item-index-sel+ 86)
(defconstant +av-menu-get-parent-menubar-sel+ 87)
(defconstant +av-menu-get-parent-menu-item-sel+ 88)
(defconstant +av-menu-add-menu-item-sel+ 89)
(defconstant +av-menu-item-new-sel+ 90)
(defconstant +av-menu-item-acquire-sel+ 91)
(defconstant +av-menu-item-release-sel+ 92)
(defconstant +av-menu-item-remove-sel+ 93)
(defconstant +av-menu-item-get-name-sel+ 94)
(defconstant +av-menu-item-get-title-sel+ 95)
(defconstant +av-menu-item-set-title-sel+ 96)
(defconstant +av-menu-item-get-shortcut-sel+ 97)
(defconstant +av-menu-item-get-long-only-sel+ 98)
(defconstant +av-menu-item-set-execute-proc-sel+ 99)
(defconstant +av-menu-item-set-compute-enabled-proc-sel+ 100)
(defconstant +av-menu-item-set-compute-marked-proc-sel+ 101)
(defconstant +av-menu-item-acquire-submenu-sel+ 102)
(defconstant +av-menu-item-is-enabled-sel+ 103)
(defconstant +av-menu-item-is-marked-sel+ 104)
(defconstant +av-menu-item-execute-sel+ 105)
(defconstant +av-menu-item-get-parent-menu-sel+ 106)
(defconstant +av-page-view-get-avdoc-sel+ 107)
(defconstant +old-avpage-view-get-aperture-sel+ 108)
(defconstant +av-page-view-get-page-sel+ 109)
(defconstant +av-page-view-get-zoom-sel+ 110)
(defconstant +av-page-view-get-zoom-type-sel+ 111)
(defconstant +av-page-view-get-page-num-sel+ 112)
(defconstant +av-page-view-get-color-sel+ 113)
(defconstant +av-page-view-set-color-sel+ 114)
(defconstant +av-page-view-begin-operation-sel+ 115)
(defconstant +av-page-view-end-operation-sel+ 116)
(defconstant +av-page-view-go-to-sel+ 117)
(defconstant +av-page-view-zoom-to-sel+ 118)
(defconstant +old-avpage-view-scroll-to-sel+ 119)
(defconstant +old-avpage-view-scroll-to-rect-sel+ 120)
(defconstant +av-page-view-read-page-up-sel+ 121)
(defconstant +av-page-view-read-page-down-sel+ 122)
(defconstant +av-page-view-go-back-sel+ 123)
(defconstant +av-page-view-go-forward-sel+ 124)
(defconstant +av-page-view-to-view-dest-sel+ 125)
(defconstant +old-avpage-view-invalidate-rect-sel+ 126)
(defconstant +av-page-view-draw-now-sel+ 127)
(defconstant +old-avpage-view-invert-rect-sel+ 128)
(defconstant +old-avpage-view-invert-rect-outline-sel+ 129)
(defconstant +old-avpage-view-draw-rect-outline-sel+ 130)
(defconstant +old-avpage-view-draw-rect-sel+ 131)
(defconstant +old-avpage-view-get-mouse-position-sel+ 132)
(defconstant +old-avpage-view-drag-out-new-rect-sel+ 133)
(defconstant +old-avpage-view-drag-rect-sel+ 134)
(defconstant +old-avapp-register-for-page-view-drawing-sel+ 135)
(defconstant +av-app-unregister-for-page-view-drawing-sel+ 136)
(defconstant +old-avapp-register-for-page-view-clicks-sel+ 137)
(defconstant +av-app-unregister-for-page-view-clicks-sel+ 138)
(defconstant +old-avapp-register-for-page-view-adjust-cursor-sel+ 139)
(defconstant +av-app-unregister-for-page-view-adjust-cursor-sel+ 140)
(defconstant +old-avpage-view-is-annot-at-point-sel+ 141)
(defconstant +old-avpage-view-get-annot-rect-sel+ 142)
(defconstant +old-avpage-view-set-annot-location-sel+ 143)
(defconstant +av-page-view-start-reading-thread-sel+ 144)
(defconstant +av-page-view-get-thread-index-sel+ 145)
(defconstant +av-page-view-get-active-bead-sel+ 146)
(defconstant +old-avpage-view-is-bead-at-point-sel+ 147)
(defconstant +av-page-view-get-page-to-dev-matrix-sel+ 148)
(defconstant +av-page-view-get-dev-to-page-matrix-sel+ 149)
(defconstant +old-avpage-view-point-to-device-sel+ 150)
(defconstant +old-avpage-view-device-point-to-page-sel+ 151)
(defconstant +old-avpage-view-rect-to-device-sel+ 152)
(defconstant +old-avpage-view-device-rect-to-page-sel+ 153)
(defconstant +av-sys-get-modifiers-sel+ 154)
(defconstant +av-sys-mouse-is-still-down-sel+ 155)
(defconstant +av-sys-beep-sel+ 156)
(defconstant +av-sys-get-standard-cursor-sel+ 157)
(defconstant +av-sys-set-cursor-sel+ 158)
(defconstant +av-sys-get-cursor-sel+ 159)
(defconstant +old-avtool-bar-get-frame-sel+ 160)
(defconstant +av-legacy-tool-bar-get-button-by-name-sel+ 161)
(defconstant +av-legacy-tool-bar-enum-buttons-sel+ 162)
(defconstant +av-legacy-tool-bar-add-button-sel+ 163)
(defconstant +av-legacy-tool-bar-get-num-buttons-sel+ 164)
(defconstant +av-legacy-tool-bar-is-room-for-sel+ 165)
(defconstant +av-legacy-tool-bar-update-button-states-sel+ 166)
(defconstant +av-legacy-tool-button-new-sel+ 167)
(defconstant +av-legacy-tool-button-destroy-sel+ 168)
(defconstant +av-legacy-tool-button-remove-sel+ 169)
(defconstant +av-legacy-tool-button-is-separator-sel+ 170)
(defconstant +av-legacy-tool-button-get-name-sel+ 171)
(defconstant +av-legacy-tool-button-execute-sel+ 172)
(defconstant +av-legacy-tool-button-set-execute-proc-sel+ 173)
(defconstant +av-legacy-tool-button-set-compute-enabled-proc-sel+ 174)
(defconstant +av-legacy-tool-button-set-compute-marked-proc-sel+ 175)
(defconstant +av-legacy-tool-button-is-enabled-sel+ 176)
(defconstant +av-legacy-tool-button-is-marked-sel+ 177)
(defconstant +av-tool-get-type-sel+ 178)
(defconstant +av-tool-is-persistent-sel+ 179)
(defconstant +old-avwindow-new-sel+ 180)
(defconstant +old-avwindow-new-from-platform-thing-sel+ 181)
(defconstant +av-window-destroy-sel+ 182)
(defconstant +av-window-user-close-sel+ 183)
(defconstant +av-window-maximize-sel+ 184)
(defconstant +av-window-show-sel+ 185)
(defconstant +av-window-hide-sel+ 186)
(defconstant +av-window-is-visible-sel+ 187)
(defconstant +av-window-get-platform-thing-sel+ 188)
(defconstant +av-window-get-owner-data-sel+ 189)
(defconstant +av-window-set-owner-data-sel+ 190)
(defconstant +old-avwindow-get-title-sel+ 191)
(defconstant +old-avwindow-set-title-sel+ 192)
(defconstant +old-avwindow-get-frame-sel+ 193)
(defconstant +old-avwindow-set-frame-sel+ 194)
(defconstant +old-avwindow-get-interior-sel+ 195)
(defconstant +av-window-bring-to-front-sel+ 196)
(defconstant +old-avwindow-invalidate-rect-sel+ 197)
(defconstant +av-window-draw-now-sel+ 198)
(defconstant +av-window-set-wants-key-sel+ 199)
(defconstant +av-window-is-key-sel+ 200)
(defconstant +av-window-become-key-sel+ 201)
(defconstant +av-window-resign-key-sel+ 202)
(defconstant +av-graf-select-create-sel+ 203)
(defconstant +av-graf-select-destroy-sel+ 204)
(defconstant +av-graf-select-get-bounding-rect-sel+ 205)
(defconstant +av-crypt-do-std-security-sel+ 206)
(defconstant +av-crypt-get-password-sel+ 207)
(defconstant +av-doc-do-save-sel+ 208)
(defconstant +av-doc-get-client-name-sel+ 209)
(defconstant +av-doc-set-client-name-sel+ 210)
(defconstant +av-doc-get-page-text-sel+ 211)
(defconstant +av-legacy-tool-button-set-help-text-sel+ 212)
(defconstant +old-avpage-view-track-text-sel+ 213)
(defconstant +av-page-view-highlight-text-sel+ 214)
(defconstant +av-page-view-invalidate-text-sel+ 215)
(defconstant +old-avpage-view-point-in-text-sel+ 216)
(defconstant +av-page-view-get-first-visible-page-num-sel+ 217)
(defconstant +av-page-view-get-last-visible-page-num-sel+ 218)
(defconstant +av-page-view-page-num-is-visible-sel+ 219)
(defconstant +av-page-view-set-page-num-sel+ 220)
(defconstant +av-page-view-get-selected-annot-page-num-sel+ 221)
(defconstant +av-doc-send-aux-data-sel+ 222)
(defconstant +av-has-aux-data-handler-sel+ 223)
(defconstant +old-avregister-aux-data-handler-sel+ 224)
(defconstant +av-unregister-aux-data-handler-sel+ 225)
(defconstant +old-avdoc-print-pages-with-params-sel+ 226)
(defconstant +old-avpage-view-draw-cos-obj-sel+ 227)
(defconstant +av-doc-set-dead-sel+ 228)
(defconstant +av-legacy-tool-button-set-external-sel+ 229)
(defconstant +av-app-is-idle-sel+ 230)
(defconstant +old-avdoc-open-from-as-file-with-params-sel+ 231)
(defconstant +av-page-view-get-next-view-sel+ 232)
(defconstant +old-avdoc-get-view-def-sel+ 233)
(defconstant +old-avdoc-set-view-def-sel+ 234)
(defconstant +av-window-handle-platform-event-sel+ 235)
(defconstant +av-window-get-cursor-at-point-sel+ 236)
(defconstant +av-doc-do-action-props-dialog-sel+ 237)
(defconstant +av-app-get-trans-handler-by-type-sel+ 238)
(defconstant +av-app-enum-trans-handlers-sel+ 239)
(defconstant +av-app-register-trans-handler-sel+ 240)
(defconstant +av-doc-do-save-as-sel+ 241)
(defconstant +av-page-view-set-layout-mode-sel+ 242)
(defconstant +av-page-view-get-layout-mode-sel+ 243)
(defconstant +old-avpage-view-inset-rect-sel+ 244)
(defconstant +av-doc-is-external-sel+ 245)
(defconstant +av-page-view-use-this-destination-sel+ 246)
(defconstant +av-auth-open-sel+ 247)
(defconstant +av-doc-copy-annot-sel+ 248)
(defconstant +av-doc-copy-annot-common-sel+ 249)
(defconstant +av-doc-copy-action-sel+ 250)
(defconstant +av-doc-copy-action-common-sel+ 251)
(defconstant +av-doc-copy-additional-actions-sel+ 252)
(defconstant +old-avpage-view-draw-cos-obj-ex-sel+ 253)
(defconstant +av-page-view-to-dest-info-sel+ 254)
(defconstant +av-page-view-use-dest-info-sel+ 255)
(defconstant +av-dest-info-destroy-sel+ 256)
(defconstant +av-doc-do-copy-as-sel+ 257)
(defconstant +old-avpage-view-draw-annot-sequence-sel+ 258)
(defconstant +av-doc-do-print-sel+ 259)
(defconstant +av-doc-do-save-as-with-params-sel+ 260)
(defconstant +av-annot-handler-get-info-sel+ 261)
(defconstant +av-annot-handler-delete-info-sel+ 262)
(defconstant +old-avpage-view-do-popup-menu-sel+ 263)
(defconstant +av-page-view-transform-rect-rz-sel+ 264)
(defconstant +av-page-view-appearance-get-avmatrix-sel+ 265)
(defconstant +av-page-view-get-visible-annot-page-sel+ 266)
(defconstant +av-page-view-invert-quad-sel+ 267)
(defconstant +av-sys-alloc-time-string-from-time-rec-sel+ 268)
(defconstant +av-app-handle-platform-event-sel+ 269)
(defconstant +av-doc-set-read-only-sel+ 270)
(defconstant +av-doc-is-read-only-sel+ 271)
(defconstant +av-page-view-show-control-sel+ 272)
(defconstant +av-legacy-tool-bar-new-flyout-sel+ 273)
(defconstant +av-legacy-tool-button-set-flyout-sel+ 274)
(defconstant +av-legacy-tool-button-get-flyout-sel+ 275)
(defconstant +av-legacy-tool-button-set-menu-sel+ 276)
(defconstant +av-legacy-tool-button-get-menu-sel+ 277)
(defconstant +av-legacy-tool-button-set-icon-sel+ 278)
(defconstant +av-legacy-tool-button-get-icon-sel+ 279)
(defconstant +old-avpage-view-device-rect-to-page-rz-sel+ 280)
(defconstant +av-doc-alert-sel+ 281)
(defconstant +av-doc-alert-note-sel+ 282)
(defconstant +av-doc-alert-confirm-sel+ 283)
(defconstant +av-doc-alert-yes-no-sel+ 284)
(defconstant +av-menubar-add-hidden-menu-sel+ 285)
(defconstant +av-menu-is-hidden-on-menubar-sel+ 286)
(defconstant +av-app-open-help-file-sel+ 287)
(defconstant +old-avpage-view-get-gray-rect-sel+ 288)
(defconstant +av-doc-selection-enum-page-ranges-sel+ 289)
(defconstant +old-avwindow-get-min-max-size-sel+ 290)
(defconstant +old-avwindow-set-min-max-size-sel+ 291)
(defconstant +av-app-register-for-page-view-key-down-sel+ 292)
(defconstant +av-app-unregister-for-page-view-key-down-sel+ 293)
(defconstant +av-app-register-to-pdf-handler-sel+ 294)
(defconstant +av-app-register-from-pdf-handler-sel+ 295)
(defconstant +av-conversion-enum-to-pdf-converters-sel+ 296)
(defconstant +av-conversion-enum-from-pdf-converters-sel+ 297)
(defconstant +av-conversion-convert-to-pdf-with-handler-sel+ 298)
(defconstant +av-conversion-convert-from-pdf-with-handler-sel+ 299)
(defconstant +av-conversion-convert-to-pdf-sel+ 300)
(defconstant +av-command-new-sel+ 301)
(defconstant +av-command-destroy-sel+ 302)
(defconstant +av-command-get-name-sel+ 303)
(defconstant +av-command-get-status-sel+ 304)
(defconstant +av-command-get-cab-sel+ 305)
(defconstant +av-command-put-cab-sel+ 306)
(defconstant +av-command-set-params-sel+ 307)
(defconstant +av-command-get-params-sel+ 308)
(defconstant +av-command-set-config-sel+ 309)
(defconstant +av-command-get-config-sel+ 310)
(defconstant +av-command-get-props-sel+ 311)
(defconstant +av-command-set-inputs-sel+ 312)
(defconstant +av-command-get-inputs-sel+ 313)
(defconstant +av-command-show-dialog-sel+ 314)
(defconstant +av-command-work-sel+ 315)
(defconstant +av-command-cancel-sel+ 316)
(defconstant +av-command-reset-sel+ 317)
(defconstant +av-command-get-uipolicy-sel+ 318)
(defconstant +av-command-get-avdoc-sel+ 319)
(defconstant +av-command-get-pddoc-sel+ 320)
(defconstant +av-command-get-report-proc-sel+ 321)
(defconstant +av-command-get-progress-monitor-sel+ 322)
(defconstant +av-command-get-cancel-proc-sel+ 323)
(defconstant +av-app-register-command-handler-sel+ 324)
(defconstant +av-app-find-command-handler-by-name-sel+ 325)
(defconstant +av-app-register-global-command-sel+ 326)
(defconstant +av-app-find-global-command-by-name-sel+ 327)
(defconstant +av-app-unregister-global-command-sel+ 328)
(defconstant +av-command-execute-sel+ 329)
(defconstant +av-acquire-special-folder-path-name-sel+ 330)
(defconstant +av-page-view-get-focus-annot-sel+ 331)
(defconstant +av-page-view-set-focus-annot-sel+ 332)
(defconstant +av-page-view-clear-focus-annot-sel+ 333)
(defconstant +av-page-view-is-focus-annot-sel+ 334)
(defconstant +av-util-get-base-name-and-extension-by-path-name-sel+ 335)
(defconstant +av-util-get-base-name-and-extension-by-string-sel+ 336)
(defconstant +av-identity-get-text-sel+ 337)
(defconstant +av-identity-set-text-sel+ 338)
(defconstant +av-page-view-focus-annot-perform-op-sel+ 339)
(defconstant +av-page-view-filter-key-down-for-focus-annot-sel+ 340)
(defconstant +old-avpage-view-ghost-rect-outline-sel+ 341)
(defconstant +av-legacy-tool-bar-new-sel+ 342)
(defconstant +old-avapp-register-legacy-tool-bar-position-sel+ 343)
(defconstant +old-avpage-view-snap-point-sel+ 344)
(defconstant +old-avpage-view-get-mouse-position-snapped-sel+ 345)
(defconstant +old-avpage-view-drag-out-new-rect-snapped-sel+ 346)
(defconstant +old-avpage-view-drag-rect-snapped-sel+ 347)
(defconstant +old-avrect-handle-hit-test-sel+ 348)
(defconstant +old-avpage-view-draw-rect-outline-with-handles-sel+ 349)
(defconstant +old-avpage-view-is-annot-of-type-at-point-sel+ 350)
(defconstant +av-window-center-sel+ 351)
(defconstant +av-doc-from-pddoc-sel+ 352)
(defconstant +old-avpage-view-snap-rect-sel+ 353)
(defconstant +av-app-get-report-proc-sel+ 354)
(defconstant +av-doc-is-dead-sel+ 355)
(defconstant +av-app-get-pref-bool-sel+ 356)
(defconstant +av-app-get-pref-int-sel+ 357)
(defconstant +av-app-get-pref-atom-sel+ 358)
(defconstant +av-app-get-pref-double-sel+ 359)
(defconstant +av-app-get-pref-string-sel+ 360)
(defconstant +av-app-get-pref-text-sel+ 361)
(defconstant +av-app-get-pref-cab-sel+ 362)
(defconstant +av-app-get-pref-path-name-sel+ 363)
(defconstant +av-alert-with-params-sel+ 364)
(defconstant +av-alert-set-pref-sel+ 365)
(defconstant +av-alert-get-pref-sel+ 366)
(defconstant +av-alert-reset-prefs-sel+ 367)
(defconstant +av-doc-perform-action-ex-sel+ 368)
(defconstant +av-extension-get-num-plug-ins-sel+ 369)
(defconstant +av-extension-acquire-info-sel+ 370)
(defconstant +av-extension-release-info-sel+ 371)
(defconstant +av-page-view-device-to-info-sel+ 372)
(defconstant +av-page-view-info-to-device-sel+ 373)
(defconstant +av-page-view-point-to-info-sel+ 374)
(defconstant +av-page-view-info-to-point-sel+ 375)
(defconstant +av-page-view-update-info-panel-sel+ 376)
(defconstant +av-app-get-legacy-tool-bar-by-name-sel+ 377)
(defconstant +av-app-get-language-encoding-sel+ 378)
(defconstant +av-page-view-scroll-to-annot-sel+ 379)
(defconstant +av-sys-set-wait-cursor-sel+ 380)
(defconstant +av-doc-perm-request-sel+ 381)
(defconstant +av-page-view-suspend-offscreen-drawing-sel+ 382)
(defconstant +av-page-view-resume-offscreen-drawing-sel+ 383)
(defconstant +av-app-yield-to-other-apps-sel+ 384)
(defconstant +av-window-ensure-in-bounds-sel+ 385)
(defconstant +av-menu-clone-sel+ 386)
(defconstant +av-page-view-scroll-to-sel+ 387)
(defconstant +av-app-register-for-page-view-adjust-cursor-sel+ 388)
(defconstant +av-app-register-for-page-view-clicks-sel+ 389)
(defconstant +av-app-register-for-page-view-drawing-sel+ 390)
(defconstant +av-doc-open-from-file-with-params-sel+ 391)
(defconstant +av-doc-open-from-pddoc-with-params-sel+ 392)
(defconstant +av-doc-open-from-as-file-with-params-sel+ 393)
(defconstant +av-doc-print-pages-with-params-sel+ 394)
(defconstant +av-doc-get-view-def-sel+ 395)
(defconstant +av-doc-set-view-def-sel+ 396)
(defconstant +av-doc-get-selection-server-by-type-sel+ 397)
(defconstant +av-doc-register-selection-server-sel+ 398)
(defconstant +av-page-view-get-aperture-sel+ 399)
(defconstant +av-page-view-scroll-to-rect-sel+ 400)
(defconstant +av-page-view-invalidate-rect-sel+ 401)
(defconstant +av-page-view-invert-rect-sel+ 402)
(defconstant +av-page-view-draw-rect-outline-sel+ 403)
(defconstant +av-page-view-draw-rect-sel+ 404)
(defconstant +av-page-view-get-annot-rect-sel+ 405)
(defconstant +av-page-view-rect-to-device-sel+ 406)
(defconstant +av-page-view-device-rect-to-page-sel+ 407)
(defconstant +av-page-view-draw-cos-obj-sel+ 408)
(defconstant +av-page-view-inset-rect-sel+ 409)
(defconstant +av-page-view-draw-cos-obj-ex-sel+ 410)
(defconstant +av-page-view-draw-annot-sequence-sel+ 411)
(defconstant +av-page-view-get-gray-rect-sel+ 412)
(defconstant +av-page-view-ghost-rect-outline-sel+ 413)
(defconstant +av-rect-handle-hit-test-sel+ 414)
(defconstant +av-page-view-draw-rect-outline-with-handles-sel+ 415)
(defconstant +av-page-view-get-mouse-position-sel+ 416)
(defconstant +av-page-view-drag-out-new-rect-sel+ 417)
(defconstant +av-page-view-drag-rect-sel+ 418)
(defconstant +av-page-view-is-annot-at-point-sel+ 419)
(defconstant +av-page-view-is-bead-at-point-sel+ 420)
(defconstant +av-page-view-device-point-to-page-sel+ 421)
(defconstant +av-page-view-track-text-sel+ 422)
(defconstant +av-page-view-point-in-text-sel+ 423)
(defconstant +av-page-view-do-popup-menu-sel+ 424)
(defconstant +av-page-view-device-rect-to-page-rz-sel+ 425)
(defconstant +av-page-view-snap-point-sel+ 426)
(defconstant +av-page-view-get-mouse-position-snapped-sel+ 427)
(defconstant +av-page-view-drag-out-new-rect-snapped-sel+ 428)
(defconstant +av-page-view-drag-rect-snapped-sel+ 429)
(defconstant +av-page-view-snap-rect-sel+ 430)
(defconstant +av-page-view-invert-rect-outline-sel+ 431)
(defconstant +av-page-view-point-to-device-sel+ 432)
(defconstant +av-page-view-is-annot-of-type-at-point-sel+ 433)
(defconstant +av-page-view-set-annot-location-sel+ 434)
(defconstant +av-app-register-annot-handler-sel+ 435)
(defconstant +av-app-register-tool-sel+ 436)
(defconstant +av-window-new-sel+ 437)
(defconstant +av-window-new-from-platform-thing-sel+ 438)
(defconstant +av-window-get-frame-sel+ 439)
(defconstant +av-window-set-frame-sel+ 440)
(defconstant +av-window-get-interior-sel+ 441)
(defconstant +av-window-invalidate-rect-sel+ 442)
(defconstant +av-window-get-min-max-size-sel+ 443)
(defconstant +av-window-set-min-max-size-sel+ 444)
(defconstant +av-app-get-uuid-sel+ 445)
(defconstant +av-sys-get-icon-from-filename-sel+ 446)
(defconstant +av-sys-get-icon-from-mime-type-sel+ 447)
(defconstant +av-sys-get-icon-from-type-and-creator-sel+ 448)
(defconstant +av-conversion-convert-stream-to-pdf-with-handler-sel+ 449)
(defconstant +av-conversion-convert-stream-from-pdf-with-handler-sel+ 450)
(defconstant +av-conversion-convert-stream-from-struct-node-with-handler-sel+ 451)
(defconstant +av-conversion-convert-stream-to-pdf-sel+ 452)
(defconstant +av-menu-do-pop-up-sel+ 453)
(defconstant +av-doc-get-num-page-views-sel+ 454)
(defconstant +av-doc-get-nth-page-view-sel+ 455)
(defconstant +av-doc-open-from-file-with-param-string-sel+ 456)
(defconstant +av-doc-open-from-pddoc-with-param-string-sel+ 457)
(defconstant +av-doc-open-from-as-file-with-param-string-sel+ 458)
(defconstant +av-app-help-search-sel+ 459)
(defconstant +av-app-help-show-index-sel+ 460)
(defconstant +av-app-open-help-file-with-params-sel+ 461)
(defconstant +av-legacy-tool-button-add-animation-icon-sel+ 462)
(defconstant +av-legacy-tool-button-get-animation-icon-count-sel+ 463)
(defconstant +av-legacy-tool-button-start-animation-sel+ 464)
(defconstant +av-legacy-tool-button-stop-animation-sel+ 465)
(defconstant +av-legacy-tool-button-is-animation-running-sel+ 466)
(defconstant +av-legacy-tool-button-set-animation-period-sel+ 467)
(defconstant +av-legacy-tool-button-get-animation-period-sel+ 468)
(defconstant +av-legacy-tool-button-remove-animation-icons-sel+ 469)
(defconstant +av-menu-new-with-as-text-sel+ 470)
(defconstant +av-menu-get-title-as-as-text-sel+ 471)
(defconstant +av-menu-item-new-with-as-text-sel+ 472)
(defconstant +av-menu-item-get-title-as-as-text-sel+ 473)
(defconstant +av-menu-item-set-title-with-as-text-sel+ 474)
(defconstant +av-window-get-title-sel+ 475)
(defconstant +av-window-set-title-sel+ 476)
(defconstant +av-doc-open-from-file-sel+ 477)
(defconstant +av-doc-open-from-pddoc-sel+ 478)
(defconstant +av-util-get-base-name-and-extension-ex-sel+ 479)
(defconstant +av-page-view-set-visible-inks-sel+ 480)
(defconstant +av-page-view-set-ink-preview-sel+ 481)
(defconstant +av-page-view-get-num-visible-inks-sel+ 482)
(defconstant +av-page-view-get-visible-inks-sel+ 483)
(defconstant +av-page-view-get-pixel-information-at-point-sel+ 484)
(defconstant +av-undo-new-sel+ 485)
(defconstant +av-undo-set-data-sel+ 486)
(defconstant +av-undo-get-data-sel+ 487)
(defconstant +av-undo-get-avdoc-sel+ 488)
(defconstant +av-undo-get-type-sel+ 489)
(defconstant +av-doc-clear-undos-sel+ 490)
(defconstant +av-doc-get-top-undo-sel+ 491)
(defconstant +av-doc-begin-undo-operation-sel+ 492)
(defconstant +av-doc-end-undo-operation-sel+ 493)
(defconstant +av-page-view-draw-now-with-transition-sel+ 494)
(defconstant +av-doc-print-separations-sel+ 495)
(defconstant +av-doc-get-view-def-ex-sel+ 496)
(defconstant +av-doc-set-view-def-ex-sel+ 497)
(defconstant +av-window-do-modal-sel+ 498)
(defconstant +av-window-end-modal-sel+ 499)
(defconstant +av-sys-get-use-pen-for-input-sel+ 500)
(defconstant +av-page-view-snap-point-ex-sel+ 501)
(defconstant +av-page-view-drag-rect-snapped-ex-sel+ 502)
(defconstant +av-legacy-tool-button-set-compute-tooltip-proc-sel+ 503)
(defconstant +av-legacy-tool-button-set-label-text-sel+ 504)
(defconstant +av-legacy-tool-button-get-label-text-sel+ 505)
(defconstant +av-menu-item-clone-sel+ 506)
(defconstant +av-app-get-language-with-params-sel+ 507)
(defconstant +av-app-create-icon-bundle6-sel+ 508)
(defconstant +av-legacy-tool-button-set-notify-tooltip-proc-sel+ 509)
(defconstant +av-window-get-border-widths-sel+ 510)
(defconstant +av-page-view-draw-polygon-sel+ 511)
(defconstant +av-page-view-draw-polygon-outline-sel+ 512)
(defconstant +av-app-register-how-to-panel-sel+ 513)
(defconstant +av-app-set-how-to-panel-auto-show-text-sel+ 514)
(defconstant +av-app-get-how-to-panel-auto-show-sel+ 515)
(defconstant +av-app-set-how-to-panel-auto-show-sel+ 516)
(defconstant +av-app-auto-show-how-to-panel-sel+ 517)
(defconstant +av-menu-item-set-compute-visible-proc-sel+ 518)
(defconstant +av-menu-item-is-visible-sel+ 519)
(defconstant +av-legacy-tool-button-set-compute-visible-proc-sel+ 520)
(defconstant +av-app-register-legacy-tool-bar-position-sel+ 521)
(defconstant +av-doc-get-top-undo-and-redo-sel+ 522)
(defconstant +av-app-register-for-context-menu-addition-sel+ 523)
(defconstant +av-page-view-get-page-to-dev-scaling-sel+ 524)
(defconstant +av-doc-get-active-tool-sel+ 525)
(defconstant +av-doc-set-active-tool-sel+ 526)
(defconstant +av-app-register-for-page-view-right-clicks-sel+ 527)
(defconstant +av-app-unregister-for-page-view-right-clicks-sel+ 528)
(defconstant +av-doc-is-slow-sel+ 529)
(defconstant +av-window-get-desktop-bounds-sel+ 530)
(defconstant +av-doc-get-server-type-sel+ 531)
(defconstant +av-app-unregister-for-page-view-drawing-ex-sel+ 532)
(defconstant +av-page-view-set-wireframe-drawing-sel+ 533)
(defconstant +av-page-view-get-wireframe-drawing-sel+ 534)
(defconstant +av-app-should-key-delete-object-sel+ 535)
(defconstant +av-app-register-late-init-proc-sel+ 536)
(defconstant +av-doc-get-bookmarks-sel+ 537)
(defconstant +av-doc-get-last-active-tool-sel+ 538)
(defconstant +av-doc-get-num-windows-sel+ 539)
(defconstant +av-doc-get-nth-window-sel+ 540)
(defconstant +av-page-view-get-avwindow-sel+ 541)
(defconstant +av-doc-do-annot-properties-sel+ 542)
(defconstant +av-sys-track-mouse-sel+ 543)
(defconstant +av-doc-save-optimized-sel+ 544)
(defconstant +av-get-optimizer-presets-sel+ 545)
(defconstant +av-get-optimizer-params-for-preset-sel+ 546)
(defconstant +av-app-get-annot-appearance-padding-sel+ 547)
(defconstant +av-menu-item-is-scriptable-sel+ 548)
(defconstant +av-sys-time-as-text-from-time-rec-sel+ 549)
(defconstant +av-legacy-tool-button-set-menu-icon-sel+ 550)
(defconstant +av-listen-for-custom-notification-sel+ 551)
(defconstant +av-unlisten-for-custom-notification-sel+ 552)
(defconstant +av-broadcast-custom-notification-sel+ 553)
(defconstant +av-register-aux-data-handler-sel+ 554)
(defconstant +av-doc-apply-redactions-sel+ 555)
(defconstant +av-legacy-tool-bar-add-button-ex-sel+ 556)
(defconstant +av-app-begin-save-sel+ 557)
(defconstant +av-app-end-save-sel+ 558)
(defconstant +av-app-cancel-save-sel+ 559)
(defconstant +av-page-view-get-ink-preview-sel+ 560)
(defconstant +av-page-view-acquire-draw-context-sel+ 561)
(defconstant +av-page-view-release-draw-context-sel+ 562)
(defconstant +av-legacy-tool-button-set-help-text-with-as-text-sel+ 563)
(defconstant +av-legacy-tool-bar-new-with-as-text-sel+ 564)
(defconstant +av-app-unregister-annot-handler-sel+ 565)
(defconstant +av-conversion-append-to-pdf-with-handler-sel+ 566)
(defconstant +av-conversion-get-conversion-queue-status-with-handler-sel+ 567)
(defconstant +av-conversion-to-pdf-set-settings-sel+ 568)
(defconstant +av-doc-is-in-protected-view-sel+ 569)
(defconstant +av-app-register-idle-proc-with-name-sel+ 570)
(defconstant +av-app-register-late-init-proc-with-name-sel+ 571)
(defconstant +av-app-unregister-for-context-menu-addition-sel+ 572)
(defconstant +av-app-save-dialog-ex-sel+ 573)
(defconstant +av-app-begin-save-ex-sel+ 574)
(defconstant +av-app-register-idle-proc-ex-with-name-sel+ 575)
(defconstant +av-app-get-version-ex-sel+ 576)
(defconstant +av-extension-acquire-info-ex-sel+ 577)
(defconstant +av-extension-release-info-ex-sel+ 578)
(defconstant +av-doc-bring-to-front-sel+ 579)
(defconstant +av-doc-get-display-title-sel+ 580)
(defconstant +av-icon-create-from-pdf-sel+ 581)
(defconstant +av-window-get-platform-thing-ex-sel+ 582)
;; sel = 1
(define-foreign-funcallable av-action-handler-get-type-selproto
                            ((handler av-action-handler))
                            :result-type
                            as-atom
                            :calling-convention
                            :cdecl)
;; sel = 2
(define-foreign-funcallable av-action-handler-get-uiname-selproto
                            ((handler av-action-handler))
                            :result-type
                            (:reference-pass :ef-mb-string)
                            :calling-convention
                            :cdecl)
;; sel = 3
(define-foreign-funcallable av-action-handler-get-procs-selproto
                            ((handler av-action-handler))
                            :result-type
                            av-action-handler-procs
                            :calling-convention
                            :cdecl)
;; sel = 4
(define-foreign-funcallable av-alert-selproto
                            ((icon-type as-int32)
                             (msg (:reference-pass :ef-mb-string))
                             (button1 (:reference-pass :ef-mb-string))
                             (button2 (:reference-pass :ef-mb-string))
                             (button3 (:reference-pass :ef-mb-string))
                             (beep as-bool))
                            :result-type
                            as-int32
                            :calling-convention
                            :cdecl)
;; sel = 5
(define-foreign-funcallable av-alert-note-selproto
                            ((msg (:reference-pass :ef-mb-string)))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 6
(define-foreign-funcallable av-alert-confirm-selproto
                            ((msg (:reference-pass :ef-mb-string)))
                            :result-type
                            as-bool
                            :calling-convention
                            :cdecl)
;; sel = 7
(define-foreign-funcallable av-app-get-version-selproto
                            ((major-p (:pointer av-tversion-num-part))
                             (minor-p (:pointer av-tversion-num-part)))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 8
(define-foreign-funcallable av-app-get-language-selproto
                            ((buffer (:reference-pass :ef-mb-string)))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 9
(define-foreign-funcallable av-app-get-name-selproto
                            nil
                            :result-type
                            as-atom
                            :calling-convention
                            :cdecl)
;; sel = 10
(define-foreign-funcallable av-app-get-cancel-proc-selproto
                            ((cancel-proc-client-data-p
                              (:pointer (:pointer :void))))
                            :result-type
                            cancel-proc
                            :calling-convention
                            :cdecl)
;; sel = 11
(define-foreign-funcallable av-app-can-quit-selproto
                            nil
                            :result-type
                            as-bool
                            :calling-convention
                            :cdecl)
;; sel = 12
(define-foreign-funcallable av-app-get-active-doc-selproto
                            nil
                            :result-type
                            av-doc
                            :calling-convention
                            :cdecl)
;; sel = 13
(define-foreign-funcallable av-app-get-num-docs-selproto
                            nil
                            :result-type
                            av-tarray-size
                            :calling-convention
                            :cdecl)
;; sel = 14
(define-foreign-funcallable av-app-enum-docs-selproto
                            ((enum-proc av-doc-enum-proc)
                             (client-data (:pointer :void)))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 15
(define-foreign-funcallable av-app-get-doc-progress-monitor-selproto
                            ((prog-mon-client-data
                              (:pointer (:pointer :void))))
                            :result-type
                            as-progress-monitor
                            :calling-convention
                            :cdecl)
;; sel = 16
(define-foreign-funcallable av-app-get-menubar-selproto
                            nil
                            :result-type
                            av-menubar
                            :calling-convention
                            :cdecl)
;; sel = 17
(define-foreign-funcallable av-app-get-legacy-tool-bar-selproto
                            nil
                            :result-type
                            av-tool-bar
                            :calling-convention
                            :cdecl)
;; sel = 18
(define-foreign-funcallable av-app-get-active-tool-selproto
                            nil
                            :result-type
                            av-tool
                            :calling-convention
                            :cdecl)
;; sel = 19
(define-foreign-funcallable av-app-get-last-active-tool-selproto
                            nil
                            :result-type
                            av-tool
                            :calling-convention
                            :cdecl)
;; sel = 20
(define-foreign-funcallable av-app-get-default-tool-selproto
                            nil
                            :result-type
                            av-tool
                            :calling-convention
                            :cdecl)
;; sel = 21
(define-foreign-funcallable av-app-set-active-tool-selproto
                            ((tool av-tool) (persistent as-bool))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 22
(define-foreign-funcallable av-app-get-tool-by-name-selproto
                            ((name as-atom))
                            :result-type
                            av-tool
                            :calling-convention
                            :cdecl)
;; sel = 23
(define-foreign-funcallable av-app-enum-tools-selproto
                            ((enum-proc av-tool-enum-proc)
                             (client-data (:pointer :void)))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 24
(define-foreign-funcallable old-avapp-register-tool-selproto
                            ((tool av-tool))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 25
(define-foreign-funcallable av-app-get-annot-handler-by-name-selproto
                            ((name as-atom))
                            :result-type
                            av-annot-handler
                            :calling-convention
                            :cdecl)
;; sel = 26
(define-foreign-funcallable av-app-enum-annot-handlers-selproto
                            ((enum-proc av-annot-handler-enum-proc)
                             (client-data (:pointer :void)))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 27
(define-foreign-funcallable old-avapp-register-annot-handler-selproto
                            ((handler av-annot-handler))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 28
(define-foreign-funcallable av-app-get-action-handler-by-type-selproto
                            ((type as-atom))
                            :result-type
                            av-action-handler
                            :calling-convention
                            :cdecl)
;; sel = 29
(define-foreign-funcallable av-app-enum-action-handlers-selproto
                            ((enum-proc av-action-enum-proc)
                             (client-data (:pointer :void)))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 30
(define-foreign-funcallable av-app-register-action-handler-selproto
                            ((action-handler av-action-handler-procs)
                             (action-handler-obj (:pointer :void))
                             (pdf-name (:reference-pass :ef-mb-string))
                             (user-name
                              (:reference-pass :ef-mb-string)))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 31
(define-foreign-funcallable av-app-get-preference-selproto
                            ((preference av-prefs-type))
                            :result-type
                            (:pointer :void)
                            :calling-convention
                            :cdecl)
;; sel = 32
(define-foreign-funcallable av-app-set-preference-selproto
                            ((preference av-prefs-type)
                             (new-value (:pointer :void)))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 33
(define-foreign-funcallable av-app-begin-full-screen-selproto
                            ((color pd-color-value))
                            :result-type
                            as-bool
                            :calling-convention
                            :cdecl)
;; sel = 34
(define-foreign-funcallable av-app-end-full-screen-selproto
                            nil
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 35
(define-foreign-funcallable av-app-doing-full-screen-selproto
                            nil
                            :result-type
                            as-bool
                            :calling-convention
                            :cdecl)
;; sel = 36
(define-foreign-funcallable av-app-begin-modal-selproto
                            ((window av-window))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 37
(define-foreign-funcallable av-app-modal-window-is-open-selproto
                            nil
                            :result-type
                            as-bool
                            :calling-convention
                            :cdecl)
;; sel = 38
(define-foreign-funcallable av-app-end-modal-selproto
                            nil
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 39
(define-foreign-funcallable av-app-register-idle-proc-selproto
                            ((idle-proc av-idle-proc)
                             (client-data (:pointer :void))
                             (period as-uns32))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 40
(define-foreign-funcallable av-app-unregister-idle-proc-selproto
                            ((idle-proc av-idle-proc)
                             (client-data (:pointer :void)))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 41
(define-foreign-funcallable av-app-register-notification-selproto
                            ((nsel nselector)
                             (owner as-extension)
                             (proc (:pointer :void))
                             (client-data (:pointer :void)))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 42
(define-foreign-funcallable av-app-unregister-notification-selproto
                            ((nsel nselector)
                             (owner as-extension)
                             (proc (:pointer :void))
                             (client-data (:pointer :void)))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 43
(define-foreign-funcallable old-avdoc-open-from-file-selproto
                            ((path-name as-path-name)
                             (file-sys as-file-sys)
                             (temp-title
                              (:reference-pass :ef-mb-string)))
                            :result-type
                            av-doc
                            :calling-convention
                            :cdecl)
;; sel = 44
(define-foreign-funcallable old-avdoc-open-from-file-with-params-selproto
                            ((path-name as-path-name)
                             (file-sys as-file-sys)
                             (temp-title
                              (:reference-pass :ef-mb-string))
                             (params old-avdoc-open-params))
                            :result-type
                            av-doc
                            :calling-convention
                            :cdecl)
;; sel = 45
(define-foreign-funcallable old-avdoc-open-from-pddoc-selproto
                            ((doc pd-doc)
                             (temp-title
                              (:reference-pass :ef-mb-string)))
                            :result-type
                            av-doc
                            :calling-convention
                            :cdecl)
;; sel = 46
(define-foreign-funcallable old-avdoc-open-from-pddoc-with-params-selproto
                            ((pd-doc pd-doc)
                             (temp-title
                              (:reference-pass :ef-mb-string))
                             (params old-avdoc-open-params))
                            :result-type
                            av-doc
                            :calling-convention
                            :cdecl)
;; sel = 47
(define-foreign-funcallable av-doc-close-selproto
                            ((doc av-doc) (no-save as-bool))
                            :result-type
                            as-bool
                            :calling-convention
                            :cdecl)
;; sel = 48
(define-foreign-funcallable av-doc-get-pddoc-selproto
                            ((av-doc av-doc))
                            :result-type
                            pd-doc
                            :calling-convention
                            :cdecl)
;; sel = 49
(define-foreign-funcallable av-doc-get-page-view-selproto
                            ((doc av-doc))
                            :result-type
                            av-page-view
                            :calling-convention
                            :cdecl)
;; sel = 50
(define-foreign-funcallable av-doc-get-avwindow-selproto
                            ((doc av-doc))
                            :result-type
                            av-window
                            :calling-convention
                            :cdecl)
;; sel = 51
(define-foreign-funcallable av-doc-get-view-mode-selproto
                            ((doc av-doc))
                            :result-type
                            pd-page-mode
                            :calling-convention
                            :cdecl)
;; sel = 52
(define-foreign-funcallable av-doc-set-view-mode-selproto
                            ((doc av-doc) (new-mode pd-page-mode))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 53
(define-foreign-funcallable av-doc-get-splitter-position-selproto
                            ((doc av-doc))
                            :result-type
                            as-int16
                            :calling-convention
                            :cdecl)
;; sel = 54
(define-foreign-funcallable av-doc-set-splitter-position-selproto
                            ((doc av-doc) (new-position as-int16))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 55
(define-foreign-funcallable av-doc-print-pages-selproto
                            ((doc av-doc)
                             (first-page av-page-index)
                             (last-page av-page-index)
                             (ps-level as-int32)
                             (binary-ok as-bool)
                             (shrink-to-fit as-bool))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 56
(define-foreign-funcallable av-doc-get-selection-type-selproto
                            ((doc av-doc))
                            :result-type
                            as-atom
                            :calling-convention
                            :cdecl)
;; sel = 57
(define-foreign-funcallable av-doc-get-selection-selproto
                            ((doc av-doc))
                            :result-type
                            (:pointer :void)
                            :calling-convention
                            :cdecl)
;; sel = 58
(define-foreign-funcallable av-doc-set-selection-selproto
                            ((doc av-doc)
                             (type as-atom)
                             (data (:pointer :void))
                             (highlight as-bool))
                            :result-type
                            as-bool
                            :calling-convention
                            :cdecl)
;; sel = 59
(define-foreign-funcallable av-doc-delete-selection-selproto
                            ((doc av-doc))
                            :result-type
                            as-bool
                            :calling-convention
                            :cdecl)
;; sel = 60
(define-foreign-funcallable av-doc-clear-selection-selproto
                            ((doc av-doc) (highlight as-bool))
                            :result-type
                            as-bool
                            :calling-convention
                            :cdecl)
;; sel = 61
(define-foreign-funcallable av-doc-copy-selection-selproto
                            ((doc av-doc))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 62
(define-foreign-funcallable av-doc-enum-selection-selproto
                            ((doc av-doc)
                             (proc av-selection-enum-proc)
                             (client-data (:pointer :void)))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 63
(define-foreign-funcallable av-doc-do-selection-properties-selproto
                            ((doc av-doc))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 64
(define-foreign-funcallable av-doc-show-selection-selproto
                            ((doc av-doc))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 65
(define-foreign-funcallable old-avdoc-get-selection-server-by-type-selproto
                            ((type as-atom))
                            :result-type
                            old-avdoc-selection-server
                            :calling-convention
                            :cdecl)
;; sel = 66
(define-foreign-funcallable old-avdoc-register-selection-server-selproto
                            ((server old-avdoc-selection-server))
                            :result-type
                            as-bool
                            :calling-convention
                            :cdecl)
;; sel = 67
(define-foreign-funcallable av-doc-perform-action-selproto
                            ((doc av-doc) (action pd-action))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 68
(define-foreign-funcallable av-menubar-show-selproto
                            ((menubar av-menubar))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 69
(define-foreign-funcallable av-menubar-hide-selproto
                            ((menubar av-menubar))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 70
(define-foreign-funcallable av-menubar-get-num-menus-selproto
                            ((menubar av-menubar))
                            :result-type
                            av-tarray-size
                            :calling-convention
                            :cdecl)
;; sel = 71
(define-foreign-funcallable av-menubar-acquire-menu-by-name-selproto
                            ((menubar av-menubar)
                             (name (:reference-pass :ef-mb-string)))
                            :result-type
                            av-menu
                            :calling-convention
                            :cdecl)
;; sel = 72
(define-foreign-funcallable av-menubar-acquire-menu-by-index-selproto
                            ((menubar av-menubar)
                             (menu-index av-menu-index))
                            :result-type
                            av-menu
                            :calling-convention
                            :cdecl)
;; sel = 73
(define-foreign-funcallable av-menubar-acquire-menu-by-predicate-selproto
                            ((menubar av-menubar)
                             (predicate av-menu-predicate)
                             (client-data (:pointer :void)))
                            :result-type
                            av-menu
                            :calling-convention
                            :cdecl)
;; sel = 74
(define-foreign-funcallable av-menubar-acquire-menu-item-by-name-selproto
                            ((menubar av-menubar)
                             (name (:reference-pass :ef-mb-string)))
                            :result-type
                            av-menu-item
                            :calling-convention
                            :cdecl)
;; sel = 75
(define-foreign-funcallable av-menubar-acquire-menu-item-by-predicate-selproto
                            ((menubar av-menubar)
                             (predicate av-menu-item-predicate)
                             (client-data (:pointer :void)))
                            :result-type
                            av-menu-item
                            :calling-convention
                            :cdecl)
;; sel = 76
(define-foreign-funcallable av-menubar-get-menu-index-selproto
                            ((menubar av-menubar) (menu av-menu))
                            :result-type
                            av-menu-index
                            :calling-convention
                            :cdecl)
;; sel = 77
(define-foreign-funcallable av-menubar-add-menu-selproto
                            ((menubar av-menubar)
                             (menu av-menu)
                             (menu-index av-menu-index))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 78
(define-foreign-funcallable av-menu-new-selproto
                            ((title (:reference-pass :ef-mb-string))
                             (name (:reference-pass :ef-mb-string))
                             (owner as-extension))
                            :result-type
                            av-menu
                            :calling-convention
                            :cdecl)
;; sel = 79
(define-foreign-funcallable av-menu-acquire-selproto
                            ((menu av-menu))
                            :result-type
                            av-menu
                            :calling-convention
                            :cdecl)
;; sel = 80
(define-foreign-funcallable av-menu-release-selproto
                            ((menu av-menu))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 81
(define-foreign-funcallable av-menu-remove-selproto
                            ((menu av-menu))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 82
(define-foreign-funcallable av-menu-get-name-selproto
                            ((menu av-menu))
                            :result-type
                            as-atom
                            :calling-convention
                            :cdecl)
;; sel = 83
(define-foreign-funcallable av-menu-get-title-selproto
                            ((menu av-menu)
                             (buffer (:reference-pass :ef-mb-string))
                             (buffer-size av-tarray-size))
                            :result-type
                            av-tarray-size
                            :calling-convention
                            :cdecl)
;; sel = 84
(define-foreign-funcallable av-menu-get-num-menu-items-selproto
                            ((menu av-menu))
                            :result-type
                            av-tarray-size
                            :calling-convention
                            :cdecl)
;; sel = 85
(define-foreign-funcallable av-menu-acquire-menu-item-by-index-selproto
                            ((menu av-menu)
                             (menu-item-index av-menu-index))
                            :result-type
                            av-menu-item
                            :calling-convention
                            :cdecl)
;; sel = 86
(define-foreign-funcallable av-menu-get-menu-item-index-selproto
                            ((menu av-menu) (menu-item av-menu-item))
                            :result-type
                            av-menu-index
                            :calling-convention
                            :cdecl)
;; sel = 87
(define-foreign-funcallable av-menu-get-parent-menubar-selproto
                            ((menu av-menu))
                            :result-type
                            av-menubar
                            :calling-convention
                            :cdecl)
;; sel = 88
(define-foreign-funcallable av-menu-get-parent-menu-item-selproto
                            ((menu av-menu))
                            :result-type
                            av-menu-item
                            :calling-convention
                            :cdecl)
;; sel = 89
(define-foreign-funcallable av-menu-add-menu-item-selproto
                            ((menu av-menu)
                             (menu-item av-menu-item)
                             (menu-item-index av-menu-index))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 90
(define-foreign-funcallable av-menu-item-new-selproto
                            ((title (:reference-pass :ef-mb-string))
                             (name (:reference-pass :ef-mb-string))
                             (submenu av-menu)
                             (long-menus-only as-bool)
                             (shortcut :byte)
                             (flags av-flag-bits16)
                             (icon av-icon)
                             (owner as-extension))
                            :result-type
                            av-menu-item
                            :calling-convention
                            :cdecl)
;; sel = 91
(define-foreign-funcallable av-menu-item-acquire-selproto
                            ((menu-item av-menu-item))
                            :result-type
                            av-menu-item
                            :calling-convention
                            :cdecl)
;; sel = 92
(define-foreign-funcallable av-menu-item-release-selproto
                            ((menu-item av-menu-item))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 93
(define-foreign-funcallable av-menu-item-remove-selproto
                            ((menu-item av-menu-item))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 94
(define-foreign-funcallable av-menu-item-get-name-selproto
                            ((menu-item av-menu-item))
                            :result-type
                            as-atom
                            :calling-convention
                            :cdecl)
;; sel = 95
(define-foreign-funcallable av-menu-item-get-title-selproto
                            ((menu-item av-menu-item)
                             (buffer (:reference-pass :ef-mb-string))
                             (buffer-size av-tarray-size))
                            :result-type
                            av-tarray-size
                            :calling-convention
                            :cdecl)
;; sel = 96
(define-foreign-funcallable av-menu-item-set-title-selproto
                            ((menu-item av-menu-item)
                             (title (:reference-pass :ef-mb-string)))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 97
(define-foreign-funcallable av-menu-item-get-shortcut-selproto
                            ((menu-item av-menu-item)
                             (key (:reference-pass :ef-mb-string))
                             (flags (:pointer av-flag-bits16)))
                            :result-type
                            as-bool
                            :calling-convention
                            :cdecl)
;; sel = 98
(define-foreign-funcallable av-menu-item-get-long-only-selproto
                            ((menu-item av-menu-item))
                            :result-type
                            as-bool
                            :calling-convention
                            :cdecl)
;; sel = 99
(define-foreign-funcallable av-menu-item-set-execute-proc-selproto
                            ((menu-item av-menu-item)
                             (proc av-execute-proc)
                             (data (:pointer :void)))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 100
(define-foreign-funcallable av-menu-item-set-compute-enabled-proc-selproto
                            ((menu-item av-menu-item)
                             (proc av-compute-enabled-proc)
                             (data (:pointer :void)))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 101
(define-foreign-funcallable av-menu-item-set-compute-marked-proc-selproto
                            ((menu-item av-menu-item)
                             (proc av-compute-marked-proc)
                             (data (:pointer :void)))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 102
(define-foreign-funcallable av-menu-item-acquire-submenu-selproto
                            ((menu-item av-menu-item))
                            :result-type
                            av-menu
                            :calling-convention
                            :cdecl)
;; sel = 103
(define-foreign-funcallable av-menu-item-is-enabled-selproto
                            ((menu-item av-menu-item))
                            :result-type
                            as-bool
                            :calling-convention
                            :cdecl)
;; sel = 104
(define-foreign-funcallable av-menu-item-is-marked-selproto
                            ((menu-item av-menu-item))
                            :result-type
                            as-bool
                            :calling-convention
                            :cdecl)
;; sel = 105
(define-foreign-funcallable av-menu-item-execute-selproto
                            ((menu-item av-menu-item))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 106
(define-foreign-funcallable av-menu-item-get-parent-menu-selproto
                            ((menu-item av-menu-item))
                            :result-type
                            av-menu
                            :calling-convention
                            :cdecl)
;; sel = 107
(define-foreign-funcallable av-page-view-get-avdoc-selproto
                            ((page-view av-page-view))
                            :result-type
                            av-doc
                            :calling-convention
                            :cdecl)
;; sel = 108
(define-foreign-funcallable old-avpage-view-get-aperture-selproto
                            ((page-view av-page-view)
                             (rect (:pointer old-avrect)))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 109
(define-foreign-funcallable av-page-view-get-page-selproto
                            ((page-view av-page-view))
                            :result-type
                            pd-page
                            :calling-convention
                            :cdecl)
;; sel = 110
(define-foreign-funcallable av-page-view-get-zoom-selproto
                            ((page-view av-page-view))
                            :result-type
                            as-fixed
                            :calling-convention
                            :cdecl)
;; sel = 111
(define-foreign-funcallable av-page-view-get-zoom-type-selproto
                            ((page-view av-page-view))
                            :result-type
                            av-zoom-type
                            :calling-convention
                            :cdecl)
;; sel = 112
(define-foreign-funcallable av-page-view-get-page-num-selproto
                            ((page-view av-page-view))
                            :result-type
                            pd-page-number
                            :calling-convention
                            :cdecl)
;; sel = 113
(define-foreign-funcallable av-page-view-get-color-selproto
                            ((page-view av-page-view)
                             (color pd-color-value))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 114
(define-foreign-funcallable av-page-view-set-color-selproto
                            ((page-view av-page-view)
                             (color pd-const-color-value))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 115
(define-foreign-funcallable av-page-view-begin-operation-selproto
                            ((page-view av-page-view))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 116
(define-foreign-funcallable av-page-view-end-operation-selproto
                            ((page-view av-page-view))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 117
(define-foreign-funcallable av-page-view-go-to-selproto
                            ((page-view av-page-view)
                             (page-num pd-page-number))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 118
(define-foreign-funcallable av-page-view-zoom-to-selproto
                            ((page-view av-page-view)
                             (zoom-type av-zoom-type)
                             (scale as-fixed))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 119
(define-foreign-funcallable old-avpage-view-scroll-to-selproto
                            ((page-view av-page-view)
                             (x-origin as-int16)
                             (y-origin as-int16))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 120
(define-foreign-funcallable old-avpage-view-scroll-to-rect-selproto
                            ((page-view av-page-view)
                             (rect (:pointer old-avrect))
                             (favor-left as-bool)
                             (favor-top as-bool)
                             (margin as-int16))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 121
(define-foreign-funcallable av-page-view-read-page-up-selproto
                            ((page-view av-page-view))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 122
(define-foreign-funcallable av-page-view-read-page-down-selproto
                            ((page-view av-page-view))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 123
(define-foreign-funcallable av-page-view-go-back-selproto
                            ((page-view av-page-view))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 124
(define-foreign-funcallable av-page-view-go-forward-selproto
                            ((page-view av-page-view))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 125
(define-foreign-funcallable av-page-view-to-view-dest-selproto
                            ((page-view av-page-view)
                             (fit-type as-atom)
                             (src-pddoc pd-doc))
                            :result-type
                            pd-view-destination
                            :calling-convention
                            :cdecl)
;; sel = 126
(define-foreign-funcallable old-avpage-view-invalidate-rect-selproto
                            ((page-view av-page-view)
                             (area (:pointer old-avrect)))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 127
(define-foreign-funcallable av-page-view-draw-now-selproto
                            ((page-view av-page-view))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 128
(define-foreign-funcallable old-avpage-view-invert-rect-selproto
                            ((page-view av-page-view)
                             (rect (:pointer old-avrect))
                             (highlight as-bool))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 129
(define-foreign-funcallable old-avpage-view-invert-rect-outline-selproto
                            ((page-view av-page-view)
                             (rect (:pointer old-avrect)))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 130
(define-foreign-funcallable old-avpage-view-draw-rect-outline-selproto
                            ((page-view av-page-view)
                             (rect (:pointer old-avrect))
                             (line-width as-int16)
                             (dash-array (:pointer as-fixed))
                             (array-len av-tarray-size))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 131
(define-foreign-funcallable old-avpage-view-draw-rect-selproto
                            ((page-view av-page-view)
                             (rect (:pointer old-avrect)))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 132
(define-foreign-funcallable old-avpage-view-get-mouse-position-selproto
                            ((page-view av-page-view)
                             (x (:pointer as-int16))
                             (y (:pointer as-int16)))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 133
(define-foreign-funcallable old-avpage-view-drag-out-new-rect-selproto
                            ((page-view av-page-view)
                             (x-start as-int16)
                             (y-start as-int16)
                             (result-rect (:pointer old-avrect)))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 134
(define-foreign-funcallable old-avpage-view-drag-rect-selproto
                            ((page-view av-page-view)
                             (x-start as-int16)
                             (y-start as-int16)
                             (start-rect (:pointer old-avrect))
                             (result-rect (:pointer old-avrect))
                             (drag-type as-int32)
                             (extrema (:pointer old-avrect)))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 135
(define-foreign-funcallable old-avapp-register-for-page-view-drawing-selproto
                            ((proc old-avpage-view-draw-proc)
                             (data (:pointer :void)))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 136
(define-foreign-funcallable av-app-unregister-for-page-view-drawing-selproto
                            ((proc av-page-view-draw-proc))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 137
(define-foreign-funcallable old-avapp-register-for-page-view-clicks-selproto
                            ((click-proc old-avpage-view-click-proc)
                             (data (:pointer :void)))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 138
(define-foreign-funcallable av-app-unregister-for-page-view-clicks-selproto
                            ((click-proc av-page-view-click-proc))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 139
(define-foreign-funcallable old-avapp-register-for-page-view-adjust-cursor-selproto
                            ((cursor-proc old-avpage-view-cursor-proc)
                             (data (:pointer :void)))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 140
(define-foreign-funcallable av-app-unregister-for-page-view-adjust-cursor-selproto
                            ((cursor-proc av-page-view-cursor-proc))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 141
(define-foreign-funcallable old-avpage-view-is-annot-at-point-selproto
                            ((page-view av-page-view)
                             (x-hit as-int16)
                             (y-hit as-int16)
                             (hit-annot (:pointer pd-annot)))
                            :result-type
                            as-bool
                            :calling-convention
                            :cdecl)
;; sel = 142
(define-foreign-funcallable old-avpage-view-get-annot-rect-selproto
                            ((page-view av-page-view)
                             (an-annot pd-annot)
                             (rect (:pointer old-avrect)))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 143
(define-foreign-funcallable old-avpage-view-set-annot-location-selproto
                            ((an-annot pd-annot)
                             (page-view av-page-view)
                             (x as-int16)
                             (y as-int16))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 144
(define-foreign-funcallable av-page-view-start-reading-thread-selproto
                            ((page-view av-page-view)
                             (thread pd-thread))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 145
(define-foreign-funcallable av-page-view-get-thread-index-selproto
                            ((page-view av-page-view))
                            :result-type
                            av-tarray-size
                            :calling-convention
                            :cdecl)
;; sel = 146
(define-foreign-funcallable av-page-view-get-active-bead-selproto
                            ((page-view av-page-view))
                            :result-type
                            pd-bead
                            :calling-convention
                            :cdecl)
;; sel = 147
(define-foreign-funcallable old-avpage-view-is-bead-at-point-selproto
                            ((page-view av-page-view)
                             (x-hit as-int16)
                             (y-hit as-int16)
                             (bead-p (:pointer pd-bead)))
                            :result-type
                            as-bool
                            :calling-convention
                            :cdecl)
;; sel = 148
(define-foreign-funcallable av-page-view-get-page-to-dev-matrix-selproto
                            ((page-view av-page-view)
                             (page-to-dev-matrix
                              (:pointer as-fixed-matrix)))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 149
(define-foreign-funcallable av-page-view-get-dev-to-page-matrix-selproto
                            ((page-view av-page-view)
                             (dev-to-page-matrix
                              (:pointer as-fixed-matrix)))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 150
(define-foreign-funcallable old-avpage-view-point-to-device-selproto
                            ((page-view av-page-view)
                             (p as-fixed-point-p)
                             (x (:pointer as-int16))
                             (y (:pointer as-int16)))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 151
(define-foreign-funcallable old-avpage-view-device-point-to-page-selproto
                            ((page-view av-page-view)
                             (x as-int16)
                             (y as-int16)
                             (p (:pointer as-fixed-point)))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 152
(define-foreign-funcallable old-avpage-view-rect-to-device-selproto
                            ((page-view av-page-view)
                             (p as-fixed-rect-p)
                             (rect (:pointer old-avrect)))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 153
(define-foreign-funcallable old-avpage-view-device-rect-to-page-selproto
                            ((page-view av-page-view)
                             (rect (:pointer old-avrect))
                             (p (:pointer as-fixed-rect)))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 154
(define-foreign-funcallable av-sys-get-modifiers-selproto
                            nil
                            :result-type
                            av-flag-bits32
                            :calling-convention
                            :cdecl)
;; sel = 155
(define-foreign-funcallable av-sys-mouse-is-still-down-selproto
                            nil
                            :result-type
                            as-bool
                            :calling-convention
                            :cdecl)
;; sel = 156
(define-foreign-funcallable av-sys-beep-selproto
                            ((duration as-int32))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 157
(define-foreign-funcallable av-sys-get-standard-cursor-selproto
                            ((cursor-id as-int32))
                            :result-type
                            av-cursor
                            :calling-convention
                            :cdecl)
;; sel = 158
(define-foreign-funcallable av-sys-set-cursor-selproto
                            ((cursor av-cursor))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 159
(define-foreign-funcallable av-sys-get-cursor-selproto
                            nil
                            :result-type
                            av-cursor
                            :calling-convention
                            :cdecl)
;; sel = 160
(define-foreign-funcallable old-avtool-bar-get-frame-selproto
                            ((tool-bar av-tool-bar)
                             (frame (:pointer old-avrect)))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 161
(define-foreign-funcallable av-legacy-tool-bar-get-button-by-name-selproto
                            ((tool-bar av-tool-bar)
                             (button-name as-atom))
                            :result-type
                            av-tool-button
                            :calling-convention
                            :cdecl)
;; sel = 162
(define-foreign-funcallable av-legacy-tool-bar-enum-buttons-selproto
                            ((tool-bar av-tool-bar)
                             (enum-proc av-tool-button-enum-proc)
                             (client-data (:pointer :void)))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 163
(define-foreign-funcallable av-legacy-tool-bar-add-button-selproto
                            ((tool-bar av-tool-bar)
                             (button av-tool-button)
                             (before as-bool)
                             (other-button av-tool-button))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 164
(define-foreign-funcallable av-legacy-tool-bar-get-num-buttons-selproto
                            ((tool-bar av-tool-bar))
                            :result-type
                            av-tarray-size
                            :calling-convention
                            :cdecl)
;; sel = 165
(define-foreign-funcallable av-legacy-tool-bar-is-room-for-selproto
                            ((tool-bar av-tool-bar)
                             (n-buttons av-tcount)
                             (n-separators av-tcount))
                            :result-type
                            as-bool
                            :calling-convention
                            :cdecl)
;; sel = 166
(define-foreign-funcallable av-legacy-tool-bar-update-button-states-selproto
                            ((toolbar av-tool-bar))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 167
(define-foreign-funcallable av-legacy-tool-button-new-selproto
                            ((name as-atom)
                             (icon av-icon)
                             (long-only as-bool)
                             (is-separator as-bool))
                            :result-type
                            av-tool-button
                            :calling-convention
                            :cdecl)
;; sel = 168
(define-foreign-funcallable av-legacy-tool-button-destroy-selproto
                            ((tool-button av-tool-button))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 169
(define-foreign-funcallable av-legacy-tool-button-remove-selproto
                            ((button av-tool-button))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 170
(define-foreign-funcallable av-legacy-tool-button-is-separator-selproto
                            ((button av-tool-button))
                            :result-type
                            as-bool
                            :calling-convention
                            :cdecl)
;; sel = 171
(define-foreign-funcallable av-legacy-tool-button-get-name-selproto
                            ((button av-tool-button))
                            :result-type
                            as-atom
                            :calling-convention
                            :cdecl)
;; sel = 172
(define-foreign-funcallable av-legacy-tool-button-execute-selproto
                            ((button av-tool-button))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 173
(define-foreign-funcallable av-legacy-tool-button-set-execute-proc-selproto
                            ((button av-tool-button)
                             (proc av-execute-proc)
                             (client-data (:pointer :void)))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 174
(define-foreign-funcallable av-legacy-tool-button-set-compute-enabled-proc-selproto
                            ((button av-tool-button)
                             (proc av-compute-enabled-proc)
                             (client-data (:pointer :void)))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 175
(define-foreign-funcallable av-legacy-tool-button-set-compute-marked-proc-selproto
                            ((button av-tool-button)
                             (proc av-compute-marked-proc)
                             (client-data (:pointer :void)))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 176
(define-foreign-funcallable av-legacy-tool-button-is-enabled-selproto
                            ((button av-tool-button))
                            :result-type
                            as-bool
                            :calling-convention
                            :cdecl)
;; sel = 177
(define-foreign-funcallable av-legacy-tool-button-is-marked-selproto
                            ((button av-tool-button))
                            :result-type
                            as-bool
                            :calling-convention
                            :cdecl)
;; sel = 178
(define-foreign-funcallable av-tool-get-type-selproto
                            ((tool av-tool))
                            :result-type
                            as-atom
                            :calling-convention
                            :cdecl)
;; sel = 179
(define-foreign-funcallable av-tool-is-persistent-selproto
                            ((tool av-tool))
                            :result-type
                            as-bool
                            :calling-convention
                            :cdecl)
;; sel = 180
(define-foreign-funcallable old-avwindow-new-selproto
                            ((layer av-window-layer)
                             (flags av-flag-bits32)
                             (handler old-avwindow-handler)
                             (owner as-extension))
                            :result-type
                            av-window
                            :calling-convention
                            :cdecl)
;; sel = 181
(define-foreign-funcallable old-avwindow-new-from-platform-thing-selproto
                            ((layer av-window-layer)
                             (flags av-flag-bits32)
                             (handler old-avwindow-handler)
                             (owner as-extension)
                             (platform-thing av-platform-window-ref))
                            :result-type
                            av-window
                            :calling-convention
                            :cdecl)
;; sel = 182
(define-foreign-funcallable av-window-destroy-selproto
                            ((win av-window))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 183
(define-foreign-funcallable av-window-user-close-selproto
                            ((win av-window) (quitting as-bool))
                            :result-type
                            as-bool
                            :calling-convention
                            :cdecl)
;; sel = 184
(define-foreign-funcallable av-window-maximize-selproto
                            ((win av-window) (maximize as-bool))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 185
(define-foreign-funcallable av-window-show-selproto
                            ((win av-window))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 186
(define-foreign-funcallable av-window-hide-selproto
                            ((win av-window))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 187
(define-foreign-funcallable av-window-is-visible-selproto
                            ((win av-window))
                            :result-type
                            as-bool
                            :calling-convention
                            :cdecl)
;; sel = 188
(define-foreign-funcallable av-window-get-platform-thing-selproto
                            ((win av-window))
                            :result-type
                            av-platform-window-ref
                            :calling-convention
                            :cdecl)
;; sel = 189
(define-foreign-funcallable av-window-get-owner-data-selproto
                            ((win av-window))
                            :result-type
                            (:pointer :void)
                            :calling-convention
                            :cdecl)
;; sel = 190
(define-foreign-funcallable av-window-set-owner-data-selproto
                            ((win av-window)
                             (new-data (:pointer :void)))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 191
(define-foreign-funcallable old-avwindow-get-title-selproto
                            ((win av-window)
                             (buffer (:reference-pass :ef-mb-string))
                             (buffer-len av-tbuffer-size))
                            :result-type
                            av-tarray-size
                            :calling-convention
                            :cdecl)
;; sel = 192
(define-foreign-funcallable old-avwindow-set-title-selproto
                            ((win av-window)
                             (new-title
                              (:reference-pass :ef-mb-string)))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 193
(define-foreign-funcallable old-avwindow-get-frame-selproto
                            ((win av-window)
                             (rect (:pointer old-avrect)))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 194
(define-foreign-funcallable old-avwindow-set-frame-selproto
                            ((win av-window)
                             (rect (:pointer old-avrect)))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 195
(define-foreign-funcallable old-avwindow-get-interior-selproto
                            ((win av-window)
                             (rect (:pointer old-avrect)))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 196
(define-foreign-funcallable av-window-bring-to-front-selproto
                            ((win av-window))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 197
(define-foreign-funcallable old-avwindow-invalidate-rect-selproto
                            ((win av-window)
                             (rect (:pointer old-avrect)))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 198
(define-foreign-funcallable av-window-draw-now-selproto
                            ((win av-window))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 199
(define-foreign-funcallable av-window-set-wants-key-selproto
                            ((win av-window) (wants-key as-bool))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 200
(define-foreign-funcallable av-window-is-key-selproto
                            ((win av-window))
                            :result-type
                            as-bool
                            :calling-convention
                            :cdecl)
;; sel = 201
(define-foreign-funcallable av-window-become-key-selproto
                            ((win av-window))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 202
(define-foreign-funcallable av-window-resign-key-selproto
                            ((win av-window))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 203
(define-foreign-funcallable av-graf-select-create-selproto
                            ((page-view av-page-view)
                             (sel-rect as-fixed-rect-p))
                            :result-type
                            av-graf-select
                            :calling-convention
                            :cdecl)
;; sel = 204
(define-foreign-funcallable av-graf-select-destroy-selproto
                            ((av-graf av-graf-select))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 205
(define-foreign-funcallable av-graf-select-get-bounding-rect-selproto
                            ((av-graf av-graf-select)
                             (bound-rect-p (:pointer as-fixed-rect)))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 206
(define-foreign-funcallable av-crypt-do-std-security-selproto
                            ((pd-doc pd-doc)
                             (sec-data (:pointer :void)))
                            :result-type
                            as-bool
                            :calling-convention
                            :cdecl)
;; sel = 207
(define-foreign-funcallable av-crypt-get-password-selproto
                            ((pd-doc pd-doc)
                             (perm-wanted pd-perms)
                             (auth-data-p (:pointer (:pointer :void))))
                            :result-type
                            as-bool
                            :calling-convention
                            :cdecl)
;; sel = 208
(define-foreign-funcallable av-doc-do-save-selproto
                            ((doc av-doc))
                            :result-type
                            as-bool
                            :calling-convention
                            :cdecl)
;; sel = 209
(define-foreign-funcallable av-doc-get-client-name-selproto
                            ((av-doc av-doc)
                             (buffer (:reference-pass :ef-mb-string))
                             (buf-size av-tbuffer-size))
                            :result-type
                            av-tarray-size
                            :calling-convention
                            :cdecl)
;; sel = 210
(define-foreign-funcallable av-doc-set-client-name-selproto
                            ((av-doc av-doc)
                             (client-name
                              (:reference-pass :ef-mb-string)))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 211
(define-foreign-funcallable av-doc-get-page-text-selproto
                            ((doc av-doc)
                             (page-num pd-page-number)
                             (pd-text pd-text-select)
                             (format as-atom)
                             (copy-proc av-text-copy-proc)
                             (client-data (:pointer :void)))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 212
(define-foreign-funcallable av-legacy-tool-button-set-help-text-selproto
                            ((button av-tool-button)
                             (text (:reference-pass :ef-mb-string)))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 213
(define-foreign-funcallable old-avpage-view-track-text-selproto
                            ((page-view av-page-view)
                             (x-hit as-int16)
                             (y-hit as-int16)
                             (current pd-text-select))
                            :result-type
                            pd-text-select
                            :calling-convention
                            :cdecl)
;; sel = 214
(define-foreign-funcallable av-page-view-highlight-text-selproto
                            ((page-view av-page-view)
                             (text-select pd-text-select))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 215
(define-foreign-funcallable av-page-view-invalidate-text-selproto
                            ((page-view av-page-view)
                             (text-select pd-text-select))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 216
(define-foreign-funcallable old-avpage-view-point-in-text-selproto
                            ((page-view av-page-view)
                             (x-hit as-int16)
                             (y-hit as-int16)
                             (pd-text pd-text-select))
                            :result-type
                            as-bool
                            :calling-convention
                            :cdecl)
;; sel = 217
(define-foreign-funcallable av-page-view-get-first-visible-page-num-selproto
                            ((page-view av-page-view))
                            :result-type
                            pd-page-number
                            :calling-convention
                            :cdecl)
;; sel = 218
(define-foreign-funcallable av-page-view-get-last-visible-page-num-selproto
                            ((page-view av-page-view))
                            :result-type
                            pd-page-number
                            :calling-convention
                            :cdecl)
;; sel = 219
(define-foreign-funcallable av-page-view-page-num-is-visible-selproto
                            ((page-view av-page-view)
                             (page-num pd-page-number))
                            :result-type
                            as-bool
                            :calling-convention
                            :cdecl)
;; sel = 220
(define-foreign-funcallable av-page-view-set-page-num-selproto
                            ((page-view av-page-view)
                             (page-num pd-page-number))
                            :result-type
                            pd-page-number
                            :calling-convention
                            :cdecl)
;; sel = 221
(define-foreign-funcallable av-page-view-get-selected-annot-page-num-selproto
                            ((page-view av-page-view))
                            :result-type
                            pd-page-number
                            :calling-convention
                            :cdecl)
;; sel = 222
(define-foreign-funcallable av-doc-send-aux-data-selproto
                            ((av-doc av-doc)
                             (aux-data-type as-atom)
                             (aux-data (:pointer :void))
                             (aux-data-len av-tbuffer-size))
                            :result-type
                            as-bool
                            :calling-convention
                            :cdecl)
;; sel = 223
(define-foreign-funcallable av-has-aux-data-handler-selproto
                            ((aux-data-type as-atom))
                            :result-type
                            as-bool
                            :calling-convention
                            :cdecl)
;; sel = 224
(define-foreign-funcallable old-avregister-aux-data-handler-selproto
                            ((extension as-extension)
                             (aux-data-type as-atom)
                             (handler old-avaux-data-handler))
                            :result-type
                            as-bool
                            :calling-convention
                            :cdecl)
;; sel = 225
(define-foreign-funcallable av-unregister-aux-data-handler-selproto
                            ((extension as-extension)
                             (aux-data-type as-atom)
                             (handler av-aux-data-handler))
                            :result-type
                            as-bool
                            :calling-convention
                            :cdecl)
;; sel = 226
(define-foreign-funcallable old-avdoc-print-pages-with-params-selproto
                            ((doc av-doc) (params av-doc-print-params))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 227
(define-foreign-funcallable old-avpage-view-draw-cos-obj-selproto
                            ((page-view av-page-view)
                             (cos-obj cos-obj)
                             (r (:pointer old-avrect)))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 228
(define-foreign-funcallable av-doc-set-dead-selproto
                            ((doc av-doc) (dead as-bool))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 229
(define-foreign-funcallable av-legacy-tool-button-set-external-selproto
                            ((button av-tool-button)
                             (external av-tflag-bits16))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 230
(define-foreign-funcallable av-app-is-idle-selproto
                            nil
                            :result-type
                            as-bool
                            :calling-convention
                            :cdecl)
;; sel = 231
(define-foreign-funcallable old-avdoc-open-from-as-file-with-params-selproto
                            ((file as-file)
                             (temp-title
                              (:reference-pass :ef-mb-string))
                             (params old-avdoc-open-params))
                            :result-type
                            av-doc
                            :calling-convention
                            :cdecl)
;; sel = 232
(define-foreign-funcallable av-page-view-get-next-view-selproto
                            ((page-view av-page-view)
                             (pd-doc (:pointer pd-doc))
                             (page-num (:pointer pd-page-number))
                             (scale (:pointer as-fixed)))
                            :result-type
                            as-bool
                            :calling-convention
                            :cdecl)
;; sel = 233
(define-foreign-funcallable old-avdoc-get-view-def-selproto
                            ((doc av-doc)
                             (view-def old-avdoc-view-def))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 234
(define-foreign-funcallable old-avdoc-set-view-def-selproto
                            ((doc av-doc)
                             (view-def old-avdoc-view-def))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 235
(define-foreign-funcallable av-window-handle-platform-event-selproto
                            ((win av-window)
                             (platform-event (:pointer :void)))
                            :result-type
                            as-bool
                            :calling-convention
                            :cdecl)
;; sel = 236
(define-foreign-funcallable av-window-get-cursor-at-point-selproto
                            ((win av-window)
                             (x av-l-coord)
                             (y av-l-coord))
                            :result-type
                            av-cursor
                            :calling-convention
                            :cdecl)
;; sel = 237
(define-foreign-funcallable av-doc-do-action-props-dialog-selproto
                            ((doc av-doc)
                             (action (:pointer pd-action))
                             (dialog-title
                              (:reference-pass :ef-mb-string)))
                            :result-type
                            as-bool
                            :calling-convention
                            :cdecl)
;; sel = 238
(define-foreign-funcallable av-app-get-trans-handler-by-type-selproto
                            ((name as-atom))
                            :result-type
                            av-trans-handler
                            :calling-convention
                            :cdecl)
;; sel = 239
(define-foreign-funcallable av-app-enum-trans-handlers-selproto
                            ((enum-proc av-trans-handler-enum-proc)
                             (client-data (:pointer :void)))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 240
(define-foreign-funcallable av-app-register-trans-handler-selproto
                            ((avth av-trans-handler))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 241
(define-foreign-funcallable av-doc-do-save-as-selproto
                            ((doc av-doc))
                            :result-type
                            as-bool
                            :calling-convention
                            :cdecl)
;; sel = 242
(define-foreign-funcallable av-page-view-set-layout-mode-selproto
                            ((page-view av-page-view)
                             (mode pd-layout-mode))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 243
(define-foreign-funcallable av-page-view-get-layout-mode-selproto
                            ((page-view av-page-view))
                            :result-type
                            pd-layout-mode
                            :calling-convention
                            :cdecl)
;; sel = 244
(define-foreign-funcallable old-avpage-view-inset-rect-selproto
                            ((page-view av-page-view)
                             (rr (:pointer old-avrect))
                             (down as-bool))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 245
(define-foreign-funcallable av-doc-is-external-selproto
                            ((doc av-doc))
                            :result-type
                            as-bool
                            :calling-convention
                            :cdecl)
;; sel = 246
(define-foreign-funcallable av-page-view-use-this-destination-selproto
                            ((page-view av-page-view)
                             (view-dest pd-view-destination)
                             (source-zoom as-fixed))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 247
(define-foreign-funcallable av-auth-open-selproto
                            ((pd-doc pd-doc))
                            :result-type
                            as-bool
                            :calling-convention
                            :cdecl)
;; sel = 248
(define-foreign-funcallable av-doc-copy-annot-selproto
                            ((from-doc av-doc)
                             (an-annot pd-annot)
                             (to-doc av-doc))
                            :result-type
                            pd-annot
                            :calling-convention
                            :cdecl)
;; sel = 249
(define-foreign-funcallable av-doc-copy-annot-common-selproto
                            ((from-doc av-doc)
                             (an-annot pd-annot)
                             (to-doc av-doc))
                            :result-type
                            pd-annot
                            :calling-convention
                            :cdecl)
;; sel = 250
(define-foreign-funcallable av-doc-copy-action-selproto
                            ((from-doc av-doc)
                             (an-action pd-action)
                             (to-doc av-doc))
                            :result-type
                            pd-action
                            :calling-convention
                            :cdecl)
;; sel = 251
(define-foreign-funcallable av-doc-copy-action-common-selproto
                            ((from-doc av-doc)
                             (an-action pd-action)
                             (to-doc av-doc))
                            :result-type
                            pd-action
                            :calling-convention
                            :cdecl)
;; sel = 252
(define-foreign-funcallable av-doc-copy-additional-actions-selproto
                            ((av-fr av-doc)
                             (co-fr cos-obj)
                             (av-to av-doc)
                             (co-to cos-obj))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 253
(define-foreign-funcallable old-avpage-view-draw-cos-obj-ex-selproto
                            ((page-view av-page-view)
                             (cos-obj cos-obj)
                             (r (:pointer old-avrect))
                             (matrix (:pointer as-fixed-matrix)))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 254
(define-foreign-funcallable av-page-view-to-dest-info-selproto
                            ((page-view av-page-view)
                             (fit-type as-atom))
                            :result-type
                            av-dest-info
                            :calling-convention
                            :cdecl)
;; sel = 255
(define-foreign-funcallable av-page-view-use-dest-info-selproto
                            ((page-view av-page-view)
                             (dest-info av-dest-info))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 256
(define-foreign-funcallable av-dest-info-destroy-selproto
                            ((dest-info av-dest-info))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 257
(define-foreign-funcallable av-doc-do-copy-as-selproto
                            ((av-doc av-doc))
                            :result-type
                            as-bool
                            :calling-convention
                            :cdecl)
;; sel = 258
(define-foreign-funcallable old-avpage-view-draw-annot-sequence-selproto
                            ((pv av-page-view)
                             (an pd-annot)
                             (bbox (:pointer old-avrect)))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 259
(define-foreign-funcallable av-doc-do-print-selproto
                            ((doc av-doc))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 260
(define-foreign-funcallable av-doc-do-save-as-with-params-selproto
                            ((doc av-doc) (params av-doc-save-params))
                            :result-type
                            as-bool
                            :calling-convention
                            :cdecl)
;; sel = 261
(define-foreign-funcallable av-annot-handler-get-info-selproto
                            ((avanh av-annot-handler))
                            :result-type
                            av-annot-handler-info
                            :calling-convention
                            :cdecl)
;; sel = 262
(define-foreign-funcallable av-annot-handler-delete-info-selproto
                            ((avanh av-annot-handler)
                             (info av-annot-handler-info))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 263
(define-foreign-funcallable old-avpage-view-do-popup-menu-selproto
                            ((page-view av-page-view)
                             (menu av-menu)
                             (x-hit as-int16)
                             (y-hit as-int16)
                             (right-mouse as-bool)
                             (choice av-menu-index))
                            :result-type
                            av-menu-item
                            :calling-convention
                            :cdecl)
;; sel = 264
(define-foreign-funcallable av-page-view-transform-rect-rz-selproto
                            ((pv av-page-view)
                             (flags av-tflag-bits)
                             (ar (:pointer as-fixed-rect))
                             (mr (:pointer as-fixed-matrix)))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 265
(define-foreign-funcallable av-page-view-appearance-get-avmatrix-selproto
                            ((page-view av-page-view)
                             (flags av-flag-bits32)
                             (appear cos-obj)
                             (ar (:pointer as-fixed-rect))
                             (mr (:pointer as-fixed-matrix)))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 266
(define-foreign-funcallable av-page-view-get-visible-annot-page-selproto
                            ((page-view av-page-view) (annot pd-annot))
                            :result-type
                            pd-page-number
                            :calling-convention
                            :cdecl)
;; sel = 267
(define-foreign-funcallable av-page-view-invert-quad-selproto
                            ((page-view av-page-view)
                             (quad (:pointer quad))
                             (highlight as-bool))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 268
(define-foreign-funcallable av-sys-alloc-time-string-from-time-rec-selproto
                            ((time-rec as-time-rec-p))
                            :result-type
                            (:reference-pass :ef-mb-string)
                            :calling-convention
                            :cdecl)
;; sel = 269
(define-foreign-funcallable av-app-handle-platform-event-selproto
                            ((platform-event (:pointer :void)))
                            :result-type
                            as-bool
                            :calling-convention
                            :cdecl)
;; sel = 270
(define-foreign-funcallable av-doc-set-read-only-selproto
                            ((doc av-doc) (read-only as-bool))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 271
(define-foreign-funcallable av-doc-is-read-only-selproto
                            ((doc av-doc))
                            :result-type
                            as-bool
                            :calling-convention
                            :cdecl)
;; sel = 272
(define-foreign-funcallable av-page-view-show-control-selproto
                            ((page-view av-page-view)
                             (control-id av-page-view-control-id)
                             (show as-bool))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 273
(define-foreign-funcallable av-legacy-tool-bar-new-flyout-selproto
                            nil
                            :result-type
                            av-tool-bar
                            :calling-convention
                            :cdecl)
;; sel = 274
(define-foreign-funcallable av-legacy-tool-button-set-flyout-selproto
                            ((button av-tool-button)
                             (flyout av-tool-bar))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 275
(define-foreign-funcallable av-legacy-tool-button-get-flyout-selproto
                            ((button av-tool-button))
                            :result-type
                            av-tool-bar
                            :calling-convention
                            :cdecl)
;; sel = 276
(define-foreign-funcallable av-legacy-tool-button-set-menu-selproto
                            ((button av-tool-button) (menu av-menu))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 277
(define-foreign-funcallable av-legacy-tool-button-get-menu-selproto
                            ((button av-tool-button))
                            :result-type
                            av-menu
                            :calling-convention
                            :cdecl)
;; sel = 278
(define-foreign-funcallable av-legacy-tool-button-set-icon-selproto
                            ((button av-tool-button) (icon av-icon))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 279
(define-foreign-funcallable av-legacy-tool-button-get-icon-selproto
                            ((button av-tool-button))
                            :result-type
                            av-icon
                            :calling-convention
                            :cdecl)
;; sel = 280
(define-foreign-funcallable old-avpage-view-device-rect-to-page-rz-selproto
                            ((page-view av-page-view)
                             (flags av-tflag-bits)
                             (x-hot as-int16)
                             (y-hot as-int16)
                             (rect (:pointer old-avrect))
                             (p (:pointer as-fixed-rect)))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 281
(define-foreign-funcallable av-doc-alert-selproto
                            ((doc av-doc)
                             (icon-type av-icon-type)
                             (msg (:reference-pass :ef-mb-string))
                             (button1 (:reference-pass :ef-mb-string))
                             (button2 (:reference-pass :ef-mb-string))
                             (button3 (:reference-pass :ef-mb-string))
                             (beep as-bool))
                            :result-type
                            as-int32
                            :calling-convention
                            :cdecl)
;; sel = 282
(define-foreign-funcallable av-doc-alert-note-selproto
                            ((doc av-doc)
                             (msg (:reference-pass :ef-mb-string)))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 283
(define-foreign-funcallable av-doc-alert-confirm-selproto
                            ((doc av-doc)
                             (msg (:reference-pass :ef-mb-string)))
                            :result-type
                            as-bool
                            :calling-convention
                            :cdecl)
;; sel = 284
(define-foreign-funcallable av-doc-alert-yes-no-selproto
                            ((doc av-doc)
                             (icon-type av-icon-type)
                             (msg (:reference-pass :ef-mb-string))
                             (cancel as-bool)
                             (beep as-bool))
                            :result-type
                            as-int32
                            :calling-convention
                            :cdecl)
;; sel = 285
(define-foreign-funcallable av-menubar-add-hidden-menu-selproto
                            ((menubar av-menubar) (menu av-menu))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 286
(define-foreign-funcallable av-menu-is-hidden-on-menubar-selproto
                            ((menu av-menu))
                            :result-type
                            as-bool
                            :calling-convention
                            :cdecl)
;; sel = 287
(define-foreign-funcallable av-app-open-help-file-selproto
                            ((file-name
                              (:reference-pass :ef-mb-string))
                             (do-search as-bool))
                            :result-type
                            as-bool
                            :calling-convention
                            :cdecl)
;; sel = 288
(define-foreign-funcallable old-avpage-view-get-gray-rect-selproto
                            ((page-view av-page-view)
                             (grey-rect (:pointer old-avrect)))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 289
(define-foreign-funcallable av-doc-selection-enum-page-ranges-selproto
                            ((doc av-doc)
                             (enum-proc
                              av-selection-page-range-enum-proc)
                             (client-data (:pointer :void)))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 290
(define-foreign-funcallable old-avwindow-get-min-max-size-selproto
                            ((win av-window)
                             (rect (:pointer old-avrect)))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 291
(define-foreign-funcallable old-avwindow-set-min-max-size-selproto
                            ((win av-window)
                             (rect (:pointer old-avrect)))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 292
(define-foreign-funcallable av-app-register-for-page-view-key-down-selproto
                            ((proc av-page-view-key-down-proc)
                             (data (:pointer :void)))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 293
(define-foreign-funcallable av-app-unregister-for-page-view-key-down-selproto
                            ((proc av-page-view-key-down-proc))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 294
(define-foreign-funcallable av-app-register-to-pdf-handler-selproto
                            ((conversion-handler
                              av-conversion-to-pdf-handler))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 295
(define-foreign-funcallable av-app-register-from-pdf-handler-selproto
                            ((conversion-handler
                              av-conversion-from-pdf-handler))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 296
(define-foreign-funcallable av-conversion-enum-to-pdf-converters-selproto
                            ((proc av-conversion-to-pdf-enum-proc)
                             (data av-conversion-enum-proc-data))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 297
(define-foreign-funcallable av-conversion-enum-from-pdf-converters-selproto
                            ((proc av-conversion-from-pdf-enum-proc)
                             (data av-conversion-enum-proc-data))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 298
(define-foreign-funcallable av-conversion-convert-to-pdf-with-handler-selproto
                            ((in-handler av-conversion-to-pdf-handler)
                             (in-settings as-cab)
                             (flags av-conversion-flags)
                             (in-path as-path-name)
                             (in-file-sys as-file-sys)
                             (out-pddoc (:pointer pd-doc))
                             (status-monitor av-status-monitor-procs))
                            :result-type
                            av-conversion-status
                            :calling-convention
                            :cdecl)
;; sel = 299
(define-foreign-funcallable av-conversion-convert-from-pdf-with-handler-selproto
                            ((in-handler
                              av-conversion-from-pdf-handler)
                             (in-settings as-cab)
                             (flags av-conversion-flags)
                             (in-pddoc pd-doc)
                             (out-path as-path-name)
                             (out-file-sys as-file-sys)
                             (status-monitor av-status-monitor-procs))
                            :result-type
                            av-conversion-status
                            :calling-convention
                            :cdecl)
;; sel = 300
(define-foreign-funcallable av-conversion-convert-to-pdf-selproto
                            ((flags av-conversion-flags)
                             (in-path as-path-name)
                             (in-file-sys as-file-sys)
                             (out-pddoc (:pointer pd-doc))
                             (status-monitor av-status-monitor-procs))
                            :result-type
                            av-conversion-status
                            :calling-convention
                            :cdecl)
;; sel = 301
(define-foreign-funcallable av-command-new-selproto
                            ((name as-atom))
                            :result-type
                            av-command
                            :calling-convention
                            :cdecl)
;; sel = 302
(define-foreign-funcallable av-command-destroy-selproto
                            ((cmd av-command))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 303
(define-foreign-funcallable av-command-get-name-selproto
                            ((cmd av-command))
                            :result-type
                            as-atom
                            :calling-convention
                            :cdecl)
;; sel = 304
(define-foreign-funcallable av-command-get-status-selproto
                            ((cmd av-command))
                            :result-type
                            av-command-status
                            :calling-convention
                            :cdecl)
;; sel = 305
(define-foreign-funcallable av-command-get-cab-selproto
                            ((cmd av-command)
                             (cab-name (:reference-pass :ef-mb-string))
                             (create as-bool))
                            :result-type
                            as-cab
                            :calling-convention
                            :cdecl)
;; sel = 306
(define-foreign-funcallable av-command-put-cab-selproto
                            ((cmd av-command)
                             (cab-name (:reference-pass :ef-mb-string))
                             (cab-val as-cab))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 307
(define-foreign-funcallable av-command-set-params-selproto
                            ((cmd av-command) (params as-cab))
                            :result-type
                            av-command-status
                            :calling-convention
                            :cdecl)
;; sel = 308
(define-foreign-funcallable av-command-get-params-selproto
                            ((cmd av-command) (params as-cab))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 309
(define-foreign-funcallable av-command-set-config-selproto
                            ((cmd av-command) (config as-cab))
                            :result-type
                            av-command-status
                            :calling-convention
                            :cdecl)
;; sel = 310
(define-foreign-funcallable av-command-get-config-selproto
                            ((cmd av-command) (config as-cab))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 311
(define-foreign-funcallable av-command-get-props-selproto
                            ((cmd av-command) (props as-cab))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 312
(define-foreign-funcallable av-command-set-inputs-selproto
                            ((cmd av-command) (inputs as-cab))
                            :result-type
                            av-command-status
                            :calling-convention
                            :cdecl)
;; sel = 313
(define-foreign-funcallable av-command-get-inputs-selproto
                            ((cmd av-command) (inputs as-cab))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 314
(define-foreign-funcallable av-command-show-dialog-selproto
                            ((cmd av-command))
                            :result-type
                            av-command-status
                            :calling-convention
                            :cdecl)
;; sel = 315
(define-foreign-funcallable av-command-work-selproto
                            ((cmd av-command))
                            :result-type
                            av-command-status
                            :calling-convention
                            :cdecl)
;; sel = 316
(define-foreign-funcallable av-command-cancel-selproto
                            ((cmd av-command))
                            :result-type
                            av-command-status
                            :calling-convention
                            :cdecl)
;; sel = 317
(define-foreign-funcallable av-command-reset-selproto
                            ((cmd av-command))
                            :result-type
                            av-command-status
                            :calling-convention
                            :cdecl)
;; sel = 318
(define-foreign-funcallable av-command-get-uipolicy-selproto
                            ((cmd av-command))
                            :result-type
                            av-command-uipolicy
                            :calling-convention
                            :cdecl)
;; sel = 319
(define-foreign-funcallable av-command-get-avdoc-selproto
                            ((cmd av-command))
                            :result-type
                            av-doc
                            :calling-convention
                            :cdecl)
;; sel = 320
(define-foreign-funcallable av-command-get-pddoc-selproto
                            ((cmd av-command))
                            :result-type
                            pd-doc
                            :calling-convention
                            :cdecl)
;; sel = 321
(define-foreign-funcallable av-command-get-report-proc-selproto
                            ((cmd av-command))
                            :result-type
                            as-report-proc
                            :calling-convention
                            :cdecl)
;; sel = 322
(define-foreign-funcallable av-command-get-progress-monitor-selproto
                            ((cmd av-command))
                            :result-type
                            as-progress-monitor
                            :calling-convention
                            :cdecl)
;; sel = 323
(define-foreign-funcallable av-command-get-cancel-proc-selproto
                            ((cmd av-command))
                            :result-type
                            as-cancel-proc
                            :calling-convention
                            :cdecl)
;; sel = 324
(define-foreign-funcallable av-app-register-command-handler-selproto
                            ((name as-atom)
                             (handler av-command-handler))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 325
(define-foreign-funcallable av-app-find-command-handler-by-name-selproto
                            ((name as-atom))
                            :result-type
                            av-command-handler
                            :calling-convention
                            :cdecl)
;; sel = 326
(define-foreign-funcallable av-app-register-global-command-selproto
                            ((cmd av-command))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 327
(define-foreign-funcallable av-app-find-global-command-by-name-selproto
                            ((name as-atom))
                            :result-type
                            av-command
                            :calling-convention
                            :cdecl)
;; sel = 328
(define-foreign-funcallable av-app-unregister-global-command-selproto
                            ((cmd av-command))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 329
(define-foreign-funcallable av-command-execute-selproto
                            ((cmd av-command))
                            :result-type
                            av-command-status
                            :calling-convention
                            :cdecl)
;; sel = 330
(define-foreign-funcallable av-acquire-special-folder-path-name-selproto
                            ((cat av-special-category)
                             (fld av-special-folder)
                             (b-create as-bool)
                             (asfs (:pointer as-file-sys))
                             (asp (:pointer as-path-name)))
                            :result-type
                            as-error-code
                            :calling-convention
                            :cdecl)
;; sel = 331
(define-foreign-funcallable av-page-view-get-focus-annot-selproto
                            ((page-view av-page-view)
                             (annot (:pointer pd-annot)))
                            :result-type
                            as-bool
                            :calling-convention
                            :cdecl)
;; sel = 332
(define-foreign-funcallable av-page-view-set-focus-annot-selproto
                            ((page-view av-page-view)
                             (focus-annot pd-annot)
                             (op-data av-annot-op-data))
                            :result-type
                            as-bool
                            :calling-convention
                            :cdecl)
;; sel = 333
(define-foreign-funcallable av-page-view-clear-focus-annot-selproto
                            ((page-view av-page-view))
                            :result-type
                            as-bool
                            :calling-convention
                            :cdecl)
;; sel = 334
(define-foreign-funcallable av-page-view-is-focus-annot-selproto
                            ((page-view av-page-view) (annot pd-annot))
                            :result-type
                            as-bool
                            :calling-convention
                            :cdecl)
;; sel = 335
(define-foreign-funcallable av-util-get-base-name-and-extension-by-path-name-selproto
                            ((file-sys as-file-sys)
                             (path-name as-path-name)
                             (num-add-ext av-tarray-size)
                             (add-ext (:pointer (:pointer :char)))
                             (base-name (:pointer (:pointer :char)))
                             (base-ext (:pointer (:pointer :char))))
                            :result-type
                            as-bool
                            :calling-convention
                            :cdecl)
;; sel = 336
(define-foreign-funcallable av-util-get-base-name-and-extension-by-string-selproto
                            ((file-name
                              (:reference-pass :ef-mb-string))
                             (num-add-ext av-tarray-size)
                             (add-ext (:pointer (:pointer :char)))
                             (base-name (:pointer (:pointer :char)))
                             (base-ext (:pointer (:pointer :char))))
                            :result-type
                            as-bool
                            :calling-convention
                            :cdecl)
;; sel = 337
(define-foreign-funcallable av-identity-get-text-selproto
                            ((it av-identity) (ast as-text))
                            :result-type
                            as-text
                            :calling-convention
                            :cdecl)
;; sel = 338
(define-foreign-funcallable av-identity-set-text-selproto
                            ((it av-identity) (ast as-text))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 339
(define-foreign-funcallable av-page-view-focus-annot-perform-op-selproto
                            ((page-view av-page-view)
                             (annot-op av-annot-op))
                            :result-type
                            as-bool
                            :calling-convention
                            :cdecl)
;; sel = 340
(define-foreign-funcallable av-page-view-filter-key-down-for-focus-annot-selproto
                            ((page-view av-page-view)
                             (key av-key-code)
                             (flags av-flag-bits16)
                             (annot-will-lose-focus
                              (:pointer as-bool)))
                            :result-type
                            as-bool
                            :calling-convention
                            :cdecl)
;; sel = 341
(define-foreign-funcallable old-avpage-view-ghost-rect-outline-selproto
                            ((page-view av-page-view)
                             (rect (:pointer old-avrect)))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 342
(define-foreign-funcallable av-legacy-tool-bar-new-selproto
                            ((name (:reference-pass :ef-mb-string))
                             (title (:reference-pass :ef-mb-string)))
                            :result-type
                            av-tool-bar
                            :calling-convention
                            :cdecl)
;; sel = 343
(define-foreign-funcallable old-avapp-register-legacy-tool-bar-position-selproto
                            ((tool-bar-name
                              (:reference-pass :ef-mb-string))
                             (external as-bool)
                             (position old-avtool-bar-position))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 344
(define-foreign-funcallable old-avpage-view-snap-point-selproto
                            ((page-view av-page-view)
                             (x (:pointer as-int16))
                             (y (:pointer as-int16))
                             (direction av-drag-type))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 345
(define-foreign-funcallable old-avpage-view-get-mouse-position-snapped-selproto
                            ((page-view av-page-view)
                             (x (:pointer as-int16))
                             (y (:pointer as-int16))
                             (direction av-drag-type))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 346
(define-foreign-funcallable old-avpage-view-drag-out-new-rect-snapped-selproto
                            ((page-view av-page-view)
                             (x-start as-int16)
                             (y-start as-int16)
                             (result-rect (:pointer old-avrect))
                             (cursor-array (:pointer av-cursor))
                             (n-cursors av-tsmall-array-size))
                            :result-type
                            av-tflag-bits
                            :calling-convention
                            :cdecl)
;; sel = 347
(define-foreign-funcallable old-avpage-view-drag-rect-snapped-selproto
                            ((page-view av-page-view)
                             (x-start as-int16)
                             (y-start as-int16)
                             (start-rect (:pointer old-avrect))
                             (result-rect (:pointer old-avrect))
                             (drag-type av-l-drag-type)
                             (extrema (:pointer old-avrect))
                             (cursor-array (:pointer av-cursor))
                             (n-cursors av-tsmall-array-size))
                            :result-type
                            av-tflag-bits
                            :calling-convention
                            :cdecl)
;; sel = 348
(define-foreign-funcallable old-avrect-handle-hit-test-selproto
                            ((rect (:pointer old-avrect))
                             (b-midpoints as-bool)
                             (x as-int16)
                             (y as-int16))
                            :result-type
                            av-drag-type-ex
                            :calling-convention
                            :cdecl)
;; sel = 349
(define-foreign-funcallable old-avpage-view-draw-rect-outline-with-handles-selproto
                            ((page-view av-page-view)
                             (rect (:pointer old-avrect))
                             (b-midpoints as-bool)
                             (b-thin as-bool)
                             (dash-array (:pointer as-fixed))
                             (array-len av-tarray-size))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 350
(define-foreign-funcallable old-avpage-view-is-annot-of-type-at-point-selproto
                            ((page-view av-page-view)
                             (x-hit as-int16)
                             (y-hit as-int16)
                             (annot-type as-atom)
                             (below-others as-bool)
                             (annot (:pointer pd-annot)))
                            :result-type
                            as-bool
                            :calling-convention
                            :cdecl)
;; sel = 351
(define-foreign-funcallable av-window-center-selproto
                            ((win av-window))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 352
(define-foreign-funcallable av-doc-from-pddoc-selproto
                            ((pd-doc pd-doc))
                            :result-type
                            av-doc
                            :calling-convention
                            :cdecl)
;; sel = 353
(define-foreign-funcallable old-avpage-view-snap-rect-selproto
                            ((page-view av-page-view)
                             (x-start as-int16)
                             (y-start as-int16)
                             (x-now as-int16)
                             (y-now as-int16)
                             (start-rect (:pointer old-avrect))
                             (result-rect (:pointer old-avrect))
                             (handle-type as-int32)
                             (modifiers as-uns32)
                             (extrema (:pointer old-avrect)))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 354
(define-foreign-funcallable av-app-get-report-proc-selproto
                            ((as-report-proc-client-data-p
                              (:pointer (:pointer :void))))
                            :result-type
                            as-report-proc
                            :calling-convention
                            :cdecl)
;; sel = 355
(define-foreign-funcallable av-doc-is-dead-selproto
                            ((av-doc av-doc))
                            :result-type
                            as-bool
                            :calling-convention
                            :cdecl)
;; sel = 356
(define-foreign-funcallable av-app-get-pref-bool-selproto
                            ((section (:reference-pass :ef-mb-string))
                             (key (:reference-pass :ef-mb-string))
                             (def-value as-bool))
                            :result-type
                            as-bool
                            :calling-convention
                            :cdecl)
;; sel = 357
(define-foreign-funcallable av-app-get-pref-int-selproto
                            ((section (:reference-pass :ef-mb-string))
                             (key (:reference-pass :ef-mb-string))
                             (def-val as-int32))
                            :result-type
                            as-int32
                            :calling-convention
                            :cdecl)
;; sel = 358
(define-foreign-funcallable av-app-get-pref-atom-selproto
                            ((section (:reference-pass :ef-mb-string))
                             (key (:reference-pass :ef-mb-string))
                             (def-val as-atom))
                            :result-type
                            as-atom
                            :calling-convention
                            :cdecl)
;; sel = 359
(define-foreign-funcallable av-app-get-pref-double-selproto
                            ((section (:reference-pass :ef-mb-string))
                             (key (:reference-pass :ef-mb-string))
                             (def-val :double))
                            :result-type
                            :double
                            :calling-convention
                            :cdecl)
;; sel = 360
(define-foreign-funcallable av-app-get-pref-string-selproto
                            ((section (:reference-pass :ef-mb-string))
                             (key (:reference-pass :ef-mb-string)))
                            :result-type
                            (:reference-pass :ef-mb-string)
                            :calling-convention
                            :cdecl)
;; sel = 361
(define-foreign-funcallable av-app-get-pref-text-selproto
                            ((section (:reference-pass :ef-mb-string))
                             (key (:reference-pass :ef-mb-string)))
                            :result-type
                            as-text
                            :calling-convention
                            :cdecl)
;; sel = 362
(define-foreign-funcallable av-app-get-pref-cab-selproto
                            ((section (:reference-pass :ef-mb-string))
                             (key (:reference-pass :ef-mb-string)))
                            :result-type
                            as-cab
                            :calling-convention
                            :cdecl)
;; sel = 363
(define-foreign-funcallable av-app-get-pref-path-name-selproto
                            ((section (:reference-pass :ef-mb-string))
                             (key (:reference-pass :ef-mb-string))
                             (file-sys-val (:pointer as-file-sys))
                             (path-name-val (:pointer as-path-name)))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 364
(define-foreign-funcallable av-alert-with-params-selproto
                            ((params av-alert-params))
                            :result-type
                            as-int32
                            :calling-convention
                            :cdecl)
;; sel = 365
(define-foreign-funcallable av-alert-set-pref-selproto
                            ((name (:reference-pass :ef-mb-string))
                             (n-answer as-int32))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 366
(define-foreign-funcallable av-alert-get-pref-selproto
                            ((name (:reference-pass :ef-mb-string)))
                            :result-type
                            as-int32
                            :calling-convention
                            :cdecl)
;; sel = 367
(define-foreign-funcallable av-alert-reset-prefs-selproto
                            nil
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 368
(define-foreign-funcallable av-doc-perform-action-ex-selproto
                            ((doc av-doc)
                             (action pd-action)
                             (data av-action-context))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 369
(define-foreign-funcallable av-extension-get-num-plug-ins-selproto
                            nil
                            :result-type
                            av-array-size
                            :calling-convention
                            :cdecl)
;; sel = 370
(define-foreign-funcallable av-extension-acquire-info-selproto
                            ((n-index av-array-size))
                            :result-type
                            av-extension-info
                            :calling-convention
                            :cdecl)
;; sel = 371
(define-foreign-funcallable av-extension-release-info-selproto
                            ((info av-extension-info))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 372
(define-foreign-funcallable av-page-view-device-to-info-selproto
                            ((page-view av-page-view)
                             (x av-l-coord)
                             (y av-l-coord)
                             (info (:pointer as-fixed-point)))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 373
(define-foreign-funcallable av-page-view-info-to-device-selproto
                            ((page-view av-page-view)
                             (info (:pointer as-fixed-point))
                             (x (:pointer av-l-coord))
                             (y (:pointer av-l-coord)))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 374
(define-foreign-funcallable av-page-view-point-to-info-selproto
                            ((page-view av-page-view)
                             (pt (:pointer as-fixed-point))
                             (info (:pointer as-fixed-point)))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 375
(define-foreign-funcallable av-page-view-info-to-point-selproto
                            ((page-view av-page-view)
                             (info (:pointer as-fixed-point))
                             (pt (:pointer as-fixed-point)))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 376
(define-foreign-funcallable av-page-view-update-info-panel-selproto
                            ((page-view av-page-view)
                             (update-type av-info-panel-update-type)
                             (data (:pointer :void)))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 377
(define-foreign-funcallable av-app-get-legacy-tool-bar-by-name-selproto
                            ((name (:reference-pass :ef-mb-string)))
                            :result-type
                            av-tool-bar
                            :calling-convention
                            :cdecl)
;; sel = 378
(define-foreign-funcallable av-app-get-language-encoding-selproto
                            nil
                            :result-type
                            as-host-encoding
                            :calling-convention
                            :cdecl)
;; sel = 379
(define-foreign-funcallable av-page-view-scroll-to-annot-selproto
                            ((page-view av-page-view) (annot pd-annot))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 380
(define-foreign-funcallable av-sys-set-wait-cursor-selproto
                            ((turn-on as-bool) (time-limit as-uns32))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 381
(define-foreign-funcallable av-doc-perm-request-selproto
                            ((doc av-doc)
                             (obj pd-perm-req-obj)
                             (opr pd-perm-req-opr))
                            :result-type
                            as-bool
                            :calling-convention
                            :cdecl)
;; sel = 382
(define-foreign-funcallable av-page-view-suspend-offscreen-drawing-selproto
                            ((page-view av-page-view))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 383
(define-foreign-funcallable av-page-view-resume-offscreen-drawing-selproto
                            ((page-view av-page-view))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 384
(define-foreign-funcallable av-app-yield-to-other-apps-selproto
                            ((yield-timeout :double))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 385
(define-foreign-funcallable av-window-ensure-in-bounds-selproto
                            ((win av-window))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 386
(define-foreign-funcallable av-menu-clone-selproto
                            ((menu av-menu))
                            :result-type
                            av-menu
                            :calling-convention
                            :cdecl)
;; sel = 387
(define-foreign-funcallable av-page-view-scroll-to-selproto
                            ((page-view av-page-view)
                             (x-origin av-dev-coord)
                             (y-origin av-dev-coord))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 388
(define-foreign-funcallable av-app-register-for-page-view-adjust-cursor-selproto
                            ((cursor-proc av-page-view-cursor-proc)
                             (data (:pointer :void)))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 389
(define-foreign-funcallable av-app-register-for-page-view-clicks-selproto
                            ((click-proc av-page-view-click-proc)
                             (data (:pointer :void)))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 390
(define-foreign-funcallable av-app-register-for-page-view-drawing-selproto
                            ((proc av-page-view-draw-proc)
                             (data (:pointer :void)))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 391
(define-foreign-funcallable av-doc-open-from-file-with-params-selproto
                            ((path-name as-path-name)
                             (file-sys as-file-sys)
                             (temp-title as-text)
                             (params av-doc-open-params))
                            :result-type
                            av-doc
                            :calling-convention
                            :cdecl)
;; sel = 392
(define-foreign-funcallable av-doc-open-from-pddoc-with-params-selproto
                            ((pd-doc pd-doc)
                             (temp-title as-text)
                             (params av-doc-open-params))
                            :result-type
                            av-doc
                            :calling-convention
                            :cdecl)
;; sel = 393
(define-foreign-funcallable av-doc-open-from-as-file-with-params-selproto
                            ((file as-file)
                             (temp-title as-text)
                             (params av-doc-open-params))
                            :result-type
                            av-doc
                            :calling-convention
                            :cdecl)
;; sel = 394
(define-foreign-funcallable av-doc-print-pages-with-params-selproto
                            ((doc av-doc) (params av-doc-print-params))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 395
(define-foreign-funcallable av-doc-get-view-def-selproto
                            ((doc av-doc) (view-def av-doc-view-def))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 396
(define-foreign-funcallable av-doc-set-view-def-selproto
                            ((doc av-doc) (view-def av-doc-view-def))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 397
(define-foreign-funcallable av-doc-get-selection-server-by-type-selproto
                            ((type as-atom))
                            :result-type
                            av-doc-selection-server
                            :calling-convention
                            :cdecl)
;; sel = 398
(define-foreign-funcallable av-doc-register-selection-server-selproto
                            ((server av-doc-selection-server))
                            :result-type
                            as-bool
                            :calling-convention
                            :cdecl)
;; sel = 399
(define-foreign-funcallable av-page-view-get-aperture-selproto
                            ((page-view av-page-view)
                             (rect (:pointer av-dev-rect)))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 400
(define-foreign-funcallable av-page-view-scroll-to-rect-selproto
                            ((page-view av-page-view)
                             (rect (:pointer av-dev-rect))
                             (favor-left as-bool)
                             (favor-top as-bool)
                             (margin av-dev-size))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 401
(define-foreign-funcallable av-page-view-invalidate-rect-selproto
                            ((page-view av-page-view)
                             (area (:pointer av-dev-rect)))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 402
(define-foreign-funcallable av-page-view-invert-rect-selproto
                            ((page-view av-page-view)
                             (rect (:pointer av-dev-rect))
                             (highlight as-bool))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 403
(define-foreign-funcallable av-page-view-draw-rect-outline-selproto
                            ((page-view av-page-view)
                             (rect (:pointer av-dev-rect))
                             (line-width av-dev-size)
                             (dash-array (:pointer as-fixed))
                             (array-len av-tarray-size))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 404
(define-foreign-funcallable av-page-view-draw-rect-selproto
                            ((page-view av-page-view)
                             (rect (:pointer av-dev-rect)))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 405
(define-foreign-funcallable av-page-view-get-annot-rect-selproto
                            ((page-view av-page-view)
                             (an-annot pd-annot)
                             (rect (:pointer av-dev-rect)))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 406
(define-foreign-funcallable av-page-view-rect-to-device-selproto
                            ((page-view av-page-view)
                             (p as-fixed-rect-p)
                             (rect (:pointer av-dev-rect)))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 407
(define-foreign-funcallable av-page-view-device-rect-to-page-selproto
                            ((page-view av-page-view)
                             (rect (:pointer av-dev-rect))
                             (p (:pointer as-fixed-rect)))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 408
(define-foreign-funcallable av-page-view-draw-cos-obj-selproto
                            ((page-view av-page-view)
                             (cos-obj cos-obj)
                             (r (:pointer av-dev-rect)))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 409
(define-foreign-funcallable av-page-view-inset-rect-selproto
                            ((page-view av-page-view)
                             (rr (:pointer av-dev-rect))
                             (down as-bool))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 410
(define-foreign-funcallable av-page-view-draw-cos-obj-ex-selproto
                            ((page-view av-page-view)
                             (cos-obj cos-obj)
                             (r (:pointer av-dev-rect))
                             (matrix (:pointer as-fixed-matrix)))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 411
(define-foreign-funcallable av-page-view-draw-annot-sequence-selproto
                            ((pv av-page-view)
                             (an pd-annot)
                             (bbox (:pointer av-dev-rect)))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 412
(define-foreign-funcallable av-page-view-get-gray-rect-selproto
                            ((page-view av-page-view)
                             (grey-rect (:pointer av-dev-rect)))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 413
(define-foreign-funcallable av-page-view-ghost-rect-outline-selproto
                            ((page-view av-page-view)
                             (rect (:pointer av-dev-rect)))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 414
(define-foreign-funcallable av-rect-handle-hit-test-selproto
                            ((rect (:pointer av-dev-rect))
                             (b-midpoints as-bool)
                             (x av-dev-coord)
                             (y av-dev-coord))
                            :result-type
                            av-drag-type-ex
                            :calling-convention
                            :cdecl)
;; sel = 415
(define-foreign-funcallable av-page-view-draw-rect-outline-with-handles-selproto
                            ((page-view av-page-view)
                             (rect (:pointer av-dev-rect))
                             (b-midpoints as-bool)
                             (b-thin as-bool)
                             (dash-array (:pointer as-fixed))
                             (array-len av-tarray-size))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 416
(define-foreign-funcallable av-page-view-get-mouse-position-selproto
                            ((page-view av-page-view)
                             (x (:pointer av-dev-coord))
                             (y (:pointer av-dev-coord)))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 417
(define-foreign-funcallable av-page-view-drag-out-new-rect-selproto
                            ((page-view av-page-view)
                             (x-start av-dev-coord)
                             (y-start av-dev-coord)
                             (result-rect (:pointer av-dev-rect)))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 418
(define-foreign-funcallable av-page-view-drag-rect-selproto
                            ((page-view av-page-view)
                             (x-start av-dev-coord)
                             (y-start av-dev-coord)
                             (start-rect (:pointer av-dev-rect))
                             (result-rect (:pointer av-dev-rect))
                             (drag-type as-int32)
                             (extrema (:pointer av-dev-rect)))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 419
(define-foreign-funcallable av-page-view-is-annot-at-point-selproto
                            ((page-view av-page-view)
                             (x-hit av-dev-coord)
                             (y-hit av-dev-coord)
                             (hit-annot (:pointer pd-annot)))
                            :result-type
                            as-bool
                            :calling-convention
                            :cdecl)
;; sel = 420
(define-foreign-funcallable av-page-view-is-bead-at-point-selproto
                            ((page-view av-page-view)
                             (x-hit av-dev-coord)
                             (y-hit av-dev-coord)
                             (bead-p (:pointer pd-bead)))
                            :result-type
                            as-bool
                            :calling-convention
                            :cdecl)
;; sel = 421
(define-foreign-funcallable av-page-view-device-point-to-page-selproto
                            ((page-view av-page-view)
                             (x av-dev-coord)
                             (y av-dev-coord)
                             (p (:pointer as-fixed-point)))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 422
(define-foreign-funcallable av-page-view-track-text-selproto
                            ((page-view av-page-view)
                             (x-hit av-dev-coord)
                             (y-hit av-dev-coord)
                             (current pd-text-select))
                            :result-type
                            pd-text-select
                            :calling-convention
                            :cdecl)
;; sel = 423
(define-foreign-funcallable av-page-view-point-in-text-selproto
                            ((page-view av-page-view)
                             (x-hit av-dev-coord)
                             (y-hit av-dev-coord)
                             (pd-text pd-text-select))
                            :result-type
                            as-bool
                            :calling-convention
                            :cdecl)
;; sel = 424
(define-foreign-funcallable av-page-view-do-popup-menu-selproto
                            ((page-view av-page-view)
                             (menu av-menu)
                             (x-hit av-dev-coord)
                             (y-hit av-dev-coord)
                             (right-mouse as-bool)
                             (choice av-menu-index))
                            :result-type
                            av-menu-item
                            :calling-convention
                            :cdecl)
;; sel = 425
(define-foreign-funcallable av-page-view-device-rect-to-page-rz-selproto
                            ((page-view av-page-view)
                             (flags av-tflag-bits)
                             (x-hot av-dev-coord)
                             (y-hot av-dev-coord)
                             (rect (:pointer av-dev-rect))
                             (p (:pointer as-fixed-rect)))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 426
(define-foreign-funcallable av-page-view-snap-point-selproto
                            ((page-view av-page-view)
                             (x (:pointer av-dev-coord))
                             (y (:pointer av-dev-coord))
                             (direction av-drag-type))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 427
(define-foreign-funcallable av-page-view-get-mouse-position-snapped-selproto
                            ((page-view av-page-view)
                             (x (:pointer av-dev-coord))
                             (y (:pointer av-dev-coord))
                             (direction av-drag-type))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 428
(define-foreign-funcallable av-page-view-drag-out-new-rect-snapped-selproto
                            ((page-view av-page-view)
                             (x-start av-dev-coord)
                             (y-start av-dev-coord)
                             (result-rect (:pointer av-dev-rect))
                             (cursor-array (:pointer av-cursor))
                             (n-cursors av-tsmall-array-size))
                            :result-type
                            av-tflag-bits
                            :calling-convention
                            :cdecl)
;; sel = 429
(define-foreign-funcallable av-page-view-drag-rect-snapped-selproto
                            ((page-view av-page-view)
                             (x-start av-dev-coord)
                             (y-start av-dev-coord)
                             (start-rect (:pointer av-dev-rect))
                             (result-rect (:pointer av-dev-rect))
                             (drag-type av-l-drag-type)
                             (extrema (:pointer av-dev-rect))
                             (cursor-array (:pointer av-cursor))
                             (n-cursors av-tsmall-array-size))
                            :result-type
                            av-tflag-bits
                            :calling-convention
                            :cdecl)
;; sel = 430
(define-foreign-funcallable av-page-view-snap-rect-selproto
                            ((page-view av-page-view)
                             (x-start av-dev-coord)
                             (y-start av-dev-coord)
                             (x-now av-dev-coord)
                             (y-now av-dev-coord)
                             (start-rect (:pointer av-dev-rect))
                             (result-rect (:pointer av-dev-rect))
                             (handle-type as-int32)
                             (modifiers as-uns32)
                             (extrema (:pointer av-dev-rect)))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 431
(define-foreign-funcallable av-page-view-invert-rect-outline-selproto
                            ((page-view av-page-view)
                             (rect (:pointer av-dev-rect)))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 432
(define-foreign-funcallable av-page-view-point-to-device-selproto
                            ((page-view av-page-view)
                             (p as-fixed-point-p)
                             (x (:pointer av-dev-coord))
                             (y (:pointer av-dev-coord)))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 433
(define-foreign-funcallable av-page-view-is-annot-of-type-at-point-selproto
                            ((page-view av-page-view)
                             (x-hit av-dev-coord)
                             (y-hit av-dev-coord)
                             (annot-type as-atom)
                             (below-others as-bool)
                             (annot (:pointer pd-annot)))
                            :result-type
                            as-bool
                            :calling-convention
                            :cdecl)
;; sel = 434
(define-foreign-funcallable av-page-view-set-annot-location-selproto
                            ((an-annot pd-annot)
                             (page-view av-page-view)
                             (x av-dev-coord)
                             (y av-dev-coord))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 435
(define-foreign-funcallable av-app-register-annot-handler-selproto
                            ((handler av-annot-handler))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 436
(define-foreign-funcallable av-app-register-tool-selproto
                            ((tool av-tool))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 437
(define-foreign-funcallable av-window-new-selproto
                            ((layer av-window-layer)
                             (flags av-flag-bits32)
                             (handler av-window-handler)
                             (owner as-extension))
                            :result-type
                            av-window
                            :calling-convention
                            :cdecl)
;; sel = 438
(define-foreign-funcallable av-window-new-from-platform-thing-selproto
                            ((layer av-window-layer)
                             (flags av-flag-bits32)
                             (handler av-window-handler)
                             (owner as-extension)
                             (platform-thing av-platform-window-ref))
                            :result-type
                            av-window
                            :calling-convention
                            :cdecl)
;; sel = 439
(define-foreign-funcallable av-window-get-frame-selproto
                            ((win av-window)
                             (rect (:pointer av-screen-rect)))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 440
(define-foreign-funcallable av-window-set-frame-selproto
                            ((win av-window)
                             (rect (:pointer av-screen-rect)))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 441
(define-foreign-funcallable av-window-get-interior-selproto
                            ((win av-window)
                             (rect (:pointer av-window-rect)))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 442
(define-foreign-funcallable av-window-invalidate-rect-selproto
                            ((win av-window)
                             (rect (:pointer av-window-rect)))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 443
(define-foreign-funcallable av-window-get-min-max-size-selproto
                            ((win av-window) (rect (:pointer av-rect)))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 444
(define-foreign-funcallable av-window-set-min-max-size-selproto
                            ((win av-window) (rect (:pointer av-rect)))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 445
(define-foreign-funcallable av-app-get-uuid-selproto
                            ((type av-app-uuid-type)
                             (dst (:pointer as-uuid)))
                            :result-type
                            as-bool
                            :calling-convention
                            :cdecl)
;; sel = 446
(define-foreign-funcallable av-sys-get-icon-from-filename-selproto
                            ((fname as-text) (itype av-sys-icon-type))
                            :result-type
                            av-icon
                            :calling-convention
                            :cdecl)
;; sel = 447
(define-foreign-funcallable av-sys-get-icon-from-mime-type-selproto
                            ((mime-type
                              (:reference-pass :ef-mb-string))
                             (itype av-sys-icon-type))
                            :result-type
                            av-icon
                            :calling-convention
                            :cdecl)
;; sel = 448
(define-foreign-funcallable av-sys-get-icon-from-type-and-creator-selproto
                            ((type as-uns32)
                             (creator as-uns32)
                             (itype av-sys-icon-type))
                            :result-type
                            av-icon
                            :calling-convention
                            :cdecl)
;; sel = 449
(define-foreign-funcallable av-conversion-convert-stream-to-pdf-with-handler-selproto
                            ((in-handler av-conversion-to-pdf-handler)
                             (in-settings as-cab)
                             (flags av-conversion-flags)
                             (stream as-stm)
                             (meta-data as-cab)
                             (out-pddoc (:pointer pd-doc))
                             (status-monitor av-status-monitor-procs))
                            :result-type
                            av-conversion-status
                            :calling-convention
                            :cdecl)
;; sel = 450
(define-foreign-funcallable av-conversion-convert-stream-from-pdf-with-handler-selproto
                            ((in-handler
                              av-conversion-from-pdf-handler)
                             (in-settings as-cab)
                             (flags av-conversion-flags)
                             (in-pddoc pd-doc)
                             (stream as-stm)
                             (meta-data as-cab)
                             (status-monitor av-status-monitor-procs))
                            :result-type
                            av-conversion-status
                            :calling-convention
                            :cdecl)
;; sel = 451
(define-foreign-funcallable av-conversion-convert-stream-from-struct-node-with-handler-selproto
                            ((in-handler
                              av-conversion-from-pdf-handler)
                             (in-settings as-cab)
                             (flags av-conversion-flags)
                             (in-struct-node av-struct-node)
                             (stream as-stm)
                             (meta-data as-cab)
                             (status-monitor av-status-monitor-procs))
                            :result-type
                            av-conversion-status
                            :calling-convention
                            :cdecl)
;; sel = 452
(define-foreign-funcallable av-conversion-convert-stream-to-pdf-selproto
                            ((flags av-conversion-flags)
                             (mime-type
                              (:reference-pass :ef-mb-string))
                             (stream as-stm)
                             (meta-data as-cab)
                             (out-pddoc (:pointer pd-doc))
                             (status-monitor av-status-monitor-procs))
                            :result-type
                            av-conversion-status
                            :calling-convention
                            :cdecl)
;; sel = 453
(define-foreign-funcallable av-menu-do-pop-up-selproto
                            ((menu av-menu)
                             (x as-int16)
                             (y as-int16)
                             (right-button as-bool)
                             (choice as-int32))
                            :result-type
                            av-menu-item
                            :calling-convention
                            :cdecl)
;; sel = 454
(define-foreign-funcallable av-doc-get-num-page-views-selproto
                            ((av-doc av-doc))
                            :result-type
                            as-count
                            :calling-convention
                            :cdecl)
;; sel = 455
(define-foreign-funcallable av-doc-get-nth-page-view-selproto
                            ((av-doc av-doc) (n as-count))
                            :result-type
                            av-page-view
                            :calling-convention
                            :cdecl)
;; sel = 456
(define-foreign-funcallable av-doc-open-from-file-with-param-string-selproto
                            ((path-name as-path-name)
                             (file-sys as-file-sys)
                             (temp-title as-text)
                             (p av-doc-open-params)
                             (s (:reference-pass :ef-mb-string)))
                            :result-type
                            av-doc
                            :calling-convention
                            :cdecl)
;; sel = 457
(define-foreign-funcallable av-doc-open-from-pddoc-with-param-string-selproto
                            ((pd-doc pd-doc)
                             (temp-title as-text)
                             (p av-doc-open-params)
                             (s (:reference-pass :ef-mb-string)))
                            :result-type
                            av-doc
                            :calling-convention
                            :cdecl)
;; sel = 458
(define-foreign-funcallable av-doc-open-from-as-file-with-param-string-selproto
                            ((file as-file)
                             (temp-title as-text)
                             (p av-doc-open-params)
                             (s (:reference-pass :ef-mb-string)))
                            :result-type
                            av-doc
                            :calling-convention
                            :cdecl)
;; sel = 459
(define-foreign-funcallable av-app-help-search-selproto
                            ((file-name
                              (:reference-pass :ef-mb-string))
                             (search-text
                              (:reference-pass :ef-mb-string)))
                            :result-type
                            as-bool
                            :calling-convention
                            :cdecl)
;; sel = 460
(define-foreign-funcallable av-app-help-show-index-selproto
                            ((file-name
                              (:reference-pass :ef-mb-string)))
                            :result-type
                            as-bool
                            :calling-convention
                            :cdecl)
;; sel = 461
(define-foreign-funcallable av-app-open-help-file-with-params-selproto
                            ((file-name
                              (:reference-pass :ef-mb-string))
                             (do-search as-bool)
                             (p av-doc-open-params))
                            :result-type
                            as-bool
                            :calling-convention
                            :cdecl)
;; sel = 462
(define-foreign-funcallable av-legacy-tool-button-add-animation-icon-selproto
                            ((button av-tool-button)
                             (new-icon av-icon))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 463
(define-foreign-funcallable av-legacy-tool-button-get-animation-icon-count-selproto
                            ((button av-tool-button))
                            :result-type
                            as-int32
                            :calling-convention
                            :cdecl)
;; sel = 464
(define-foreign-funcallable av-legacy-tool-button-start-animation-selproto
                            ((button av-tool-button))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 465
(define-foreign-funcallable av-legacy-tool-button-stop-animation-selproto
                            ((button av-tool-button))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 466
(define-foreign-funcallable av-legacy-tool-button-is-animation-running-selproto
                            ((button av-tool-button))
                            :result-type
                            as-bool
                            :calling-convention
                            :cdecl)
;; sel = 467
(define-foreign-funcallable av-legacy-tool-button-set-animation-period-selproto
                            ((button av-tool-button)
                             (new-period as-int32))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 468
(define-foreign-funcallable av-legacy-tool-button-get-animation-period-selproto
                            ((button av-tool-button))
                            :result-type
                            as-int32
                            :calling-convention
                            :cdecl)
;; sel = 469
(define-foreign-funcallable av-legacy-tool-button-remove-animation-icons-selproto
                            ((button av-tool-button))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 470
(define-foreign-funcallable av-menu-new-with-as-text-selproto
                            ((title as-const-text)
                             (name (:reference-pass :ef-mb-string))
                             (owner as-extension))
                            :result-type
                            av-menu
                            :calling-convention
                            :cdecl)
;; sel = 471
(define-foreign-funcallable av-menu-get-title-as-as-text-selproto
                            ((menu av-menu) (title as-text))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 472
(define-foreign-funcallable av-menu-item-new-with-as-text-selproto
                            ((title as-const-text)
                             (name (:reference-pass :ef-mb-string))
                             (submenu av-menu)
                             (long-menus-only as-bool)
                             (shortcut :byte)
                             (flags av-flag-bits16)
                             (icon av-icon)
                             (owner as-extension))
                            :result-type
                            av-menu-item
                            :calling-convention
                            :cdecl)
;; sel = 473
(define-foreign-funcallable av-menu-item-get-title-as-as-text-selproto
                            ((menu-item av-menu-item) (title as-text))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 474
(define-foreign-funcallable av-menu-item-set-title-with-as-text-selproto
                            ((menu-item av-menu-item)
                             (title as-const-text))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 475
(define-foreign-funcallable av-window-get-title-selproto
                            ((win av-window) (title as-text))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 476
(define-foreign-funcallable av-window-set-title-selproto
                            ((win av-window) (new-title as-text))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 477
(define-foreign-funcallable av-doc-open-from-file-selproto
                            ((path-name as-path-name)
                             (file-sys as-file-sys)
                             (temp-title as-text))
                            :result-type
                            av-doc
                            :calling-convention
                            :cdecl)
;; sel = 478
(define-foreign-funcallable av-doc-open-from-pddoc-selproto
                            ((doc pd-doc) (temp-title as-text))
                            :result-type
                            av-doc
                            :calling-convention
                            :cdecl)
;; sel = 479
(define-foreign-funcallable av-util-get-base-name-and-extension-ex-selproto
                            ((file-sys as-file-sys)
                             (path-name as-path-name)
                             (file-name as-text)
                             (num-add-ext as-int32)
                             (add-ext (:pointer (:pointer :char)))
                             (base-name as-text)
                             (base-ext (:pointer (:pointer :char))))
                            :result-type
                            as-bool
                            :calling-convention
                            :cdecl)
;; sel = 480
(define-foreign-funcallable av-page-view-set-visible-inks-selproto
                            ((page-view av-page-view)
                             (n-inks as-int32)
                             (inks (:pointer pd-page-ink-rec)))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 481
(define-foreign-funcallable av-page-view-set-ink-preview-selproto
                            ((page-view av-page-view)
                             (ink-preview as-bool))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 482
(define-foreign-funcallable av-page-view-get-num-visible-inks-selproto
                            ((page-view av-page-view))
                            :result-type
                            as-int32
                            :calling-convention
                            :cdecl)
;; sel = 483
(define-foreign-funcallable av-page-view-get-visible-inks-selproto
                            ((page-view av-page-view)
                             (inks (:pointer pd-page-ink-rec)))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 484
(define-foreign-funcallable av-page-view-get-pixel-information-at-point-selproto
                            ((page-view av-page-view)
                             (x av-dev-coord)
                             (y av-dev-coord)
                             (ink-vector (:pointer av-ink-value))
                             (ink-vector-length (:pointer as-uns32)))
                            :result-type
                            as-bool
                            :calling-convention
                            :cdecl)
;; sel = 485
(define-foreign-funcallable av-undo-new-selproto
                            ((doc av-doc)
                             (handler av-undo-handler)
                             (undo-data av-undo-handler-data))
                            :result-type
                            av-undo
                            :calling-convention
                            :cdecl)
;; sel = 486
(define-foreign-funcallable av-undo-set-data-selproto
                            ((undo av-undo)
                             (handler-data av-undo-handler-data))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 487
(define-foreign-funcallable av-undo-get-data-selproto
                            ((undo av-undo))
                            :result-type
                            av-undo-handler-data
                            :calling-convention
                            :cdecl)
;; sel = 488
(define-foreign-funcallable av-undo-get-avdoc-selproto
                            ((undo av-undo))
                            :result-type
                            av-doc
                            :calling-convention
                            :cdecl)
;; sel = 489
(define-foreign-funcallable av-undo-get-type-selproto
                            ((undo av-undo))
                            :result-type
                            (:reference-pass :ef-mb-string)
                            :calling-convention
                            :cdecl)
;; sel = 490
(define-foreign-funcallable av-doc-clear-undos-selproto
                            ((doc av-doc))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 491
(define-foreign-funcallable av-doc-get-top-undo-selproto
                            ((doc av-doc)
                             (desired-type
                              (:reference-pass :ef-mb-string)))
                            :result-type
                            av-undo
                            :calling-convention
                            :cdecl)
;; sel = 492
(define-foreign-funcallable av-doc-begin-undo-operation-selproto
                            ((doc av-doc))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 493
(define-foreign-funcallable av-doc-end-undo-operation-selproto
                            ((doc av-doc)
                             (undo-title as-text)
                             (redo-title as-text))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 494
(define-foreign-funcallable av-page-view-draw-now-with-transition-selproto
                            ((page-view av-page-view) (trans pd-trans))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 495
(define-foreign-funcallable av-doc-print-separations-selproto
                            ((params av-doc-print-seps-params))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 496
(define-foreign-funcallable av-doc-get-view-def-ex-selproto
                            ((doc av-doc) (view-def as-cab))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 497
(define-foreign-funcallable av-doc-set-view-def-ex-selproto
                            ((doc av-doc) (view-def as-cab))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 498
(define-foreign-funcallable av-window-do-modal-selproto
                            ((window av-window))
                            :result-type
                            as-bool
                            :calling-convention
                            :cdecl)
;; sel = 499
(define-foreign-funcallable av-window-end-modal-selproto
                            ((window av-window))
                            :result-type
                            as-bool
                            :calling-convention
                            :cdecl)
;; sel = 500
(define-foreign-funcallable av-sys-get-use-pen-for-input-selproto
                            nil
                            :result-type
                            as-bool
                            :calling-convention
                            :cdecl)
;; sel = 501
(define-foreign-funcallable av-page-view-snap-point-ex-selproto
                            ((page-view av-page-view)
                             (pt (:pointer as-fixed-point))
                             (direction av-drag-type))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 502
(define-foreign-funcallable av-page-view-drag-rect-snapped-ex-selproto
                            ((params
                              (:pointer av-drag-rect-params-rec)))
                            :result-type
                            av-tflag-bits
                            :calling-convention
                            :cdecl)
;; sel = 503
(define-foreign-funcallable av-legacy-tool-button-set-compute-tooltip-proc-selproto
                            ((button av-tool-button)
                             (proc av-compute-tooltip-proc)
                             (client-data (:pointer :void)))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 504
(define-foreign-funcallable av-legacy-tool-button-set-label-text-selproto
                            ((button av-tool-button)
                             (label-text as-const-text)
                             (priority av-tool-button-label-priority))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 505
(define-foreign-funcallable av-legacy-tool-button-get-label-text-selproto
                            ((button av-tool-button)
                             (result-text as-text)
                             (priority
                              (:pointer
                               av-tool-button-label-priority)))
                            :result-type
                            as-bool
                            :calling-convention
                            :cdecl)
;; sel = 506
(define-foreign-funcallable av-menu-item-clone-selproto
                            ((menu-item av-menu-item))
                            :result-type
                            av-menu-item
                            :calling-convention
                            :cdecl)
;; sel = 507
(define-foreign-funcallable av-app-get-language-with-params-selproto
                            ((params av-app-language-params))
                            :result-type
                            as-bool
                            :calling-convention
                            :cdecl)
;; sel = 508
(define-foreign-funcallable av-app-create-icon-bundle6-selproto
                            ((e-data-format av-icon-data-format)
                             (data-recs (:pointer av-icon-data-rec))
                             (num-recs as-count))
                            :result-type
                            av-icon-bundle6
                            :calling-convention
                            :cdecl)
;; sel = 509
(define-foreign-funcallable av-legacy-tool-button-set-notify-tooltip-proc-selproto
                            ((button av-tool-button)
                             (proc av-notify-tooltip-proc)
                             (client-data (:pointer :void)))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 510
(define-foreign-funcallable av-window-get-border-widths-selproto
                            ((win av-window) (rect (:pointer av-rect)))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 511
(define-foreign-funcallable av-page-view-draw-polygon-selproto
                            ((page-view av-page-view)
                             (x (:pointer av-dev-coord))
                             (y (:pointer av-dev-coord))
                             (num-points as-count)
                             (invert as-bool))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 512
(define-foreign-funcallable av-page-view-draw-polygon-outline-selproto
                            ((page-view av-page-view)
                             (x (:pointer av-dev-coord))
                             (y (:pointer av-dev-coord))
                             (num-points as-count)
                             (invert as-bool))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 513
(define-foreign-funcallable av-app-register-how-to-panel-selproto
                            ((panel-name as-atom)
                             (panel-url
                              (:reference-pass :ef-mb-string))
                             (panel-icon av-icon)
                             (panel-title as-const-text)
                             (show-in-homepage as-bool)
                             (url-directory as-path-name)
                             (sort-key as-uns32))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 514
(define-foreign-funcallable av-app-set-how-to-panel-auto-show-text-selproto
                            ((panel-name as-atom)
                             (check-box-text as-const-text))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 515
(define-foreign-funcallable av-app-get-how-to-panel-auto-show-selproto
                            ((panel-name as-atom))
                            :result-type
                            as-bool
                            :calling-convention
                            :cdecl)
;; sel = 516
(define-foreign-funcallable av-app-set-how-to-panel-auto-show-selproto
                            ((panel-name as-atom) (auto-show as-bool))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 517
(define-foreign-funcallable av-app-auto-show-how-to-panel-selproto
                            ((avdoc av-doc) (panel-name as-atom))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 518
(define-foreign-funcallable av-menu-item-set-compute-visible-proc-selproto
                            ((menu-item av-menu-item)
                             (proc av-compute-visible-proc)
                             (data (:pointer :void)))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 519
(define-foreign-funcallable av-menu-item-is-visible-selproto
                            ((menu-item av-menu-item))
                            :result-type
                            as-bool
                            :calling-convention
                            :cdecl)
;; sel = 520
(define-foreign-funcallable av-legacy-tool-button-set-compute-visible-proc-selproto
                            ((button av-tool-button)
                             (p av-compute-visible-proc)
                             (data (:pointer :void)))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 521
(define-foreign-funcallable av-app-register-legacy-tool-bar-position-selproto
                            ((tool-bar-name
                              (:reference-pass :ef-mb-string))
                             (external as-bool)
                             (position av-tool-bar-position))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 522
(define-foreign-funcallable av-doc-get-top-undo-and-redo-selproto
                            ((doc av-doc)
                             (undo (:pointer av-undo))
                             (redo (:pointer av-undo))
                             (desired-type
                              (:reference-pass :ef-mb-string)))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 523
(define-foreign-funcallable av-app-register-for-context-menu-addition-selproto
                            ((menu-name as-atom)
                             (proc av-context-menu-addition-proc)
                             (client-data (:pointer :void)))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 524
(define-foreign-funcallable av-page-view-get-page-to-dev-scaling-selproto
                            ((page-view av-page-view)
                             (x-scale (:pointer :float))
                             (y-scale (:pointer :float)))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 525
(define-foreign-funcallable av-doc-get-active-tool-selproto
                            ((doc av-doc))
                            :result-type
                            av-tool
                            :calling-convention
                            :cdecl)
;; sel = 526
(define-foreign-funcallable av-doc-set-active-tool-selproto
                            ((doc av-doc)
                             (tool av-tool)
                             (persistent as-bool))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 527
(define-foreign-funcallable av-app-register-for-page-view-right-clicks-selproto
                            ((click-proc av-page-view-click-proc)
                             (data (:pointer :void)))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 528
(define-foreign-funcallable av-app-unregister-for-page-view-right-clicks-selproto
                            ((click-proc av-page-view-click-proc))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 529
(define-foreign-funcallable av-doc-is-slow-selproto
                            ((doc av-doc))
                            :result-type
                            as-bool
                            :calling-convention
                            :cdecl)
;; sel = 530
(define-foreign-funcallable av-window-get-desktop-bounds-selproto
                            ((win av-window)
                             (frame (:pointer av-rect))
                             (bounds (:pointer av-rect)))
                            :result-type
                            as-bool
                            :calling-convention
                            :cdecl)
;; sel = 531
(define-foreign-funcallable av-doc-get-server-type-selproto
                            ((doc av-doc))
                            :result-type
                            av-doc-server-type
                            :calling-convention
                            :cdecl)
;; sel = 532
(define-foreign-funcallable av-app-unregister-for-page-view-drawing-ex-selproto
                            ((proc av-page-view-draw-proc)
                             (client-data (:pointer :void)))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 533
(define-foreign-funcallable av-page-view-set-wireframe-drawing-selproto
                            ((page-view av-page-view)
                             (draw-wireframe as-bool))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 534
(define-foreign-funcallable av-page-view-get-wireframe-drawing-selproto
                            ((page-view av-page-view))
                            :result-type
                            as-bool
                            :calling-convention
                            :cdecl)
;; sel = 535
(define-foreign-funcallable av-app-should-key-delete-object-selproto
                            ((key av-key-code) (flags av-flag-bits16))
                            :result-type
                            as-bool
                            :calling-convention
                            :cdecl)
;; sel = 536
(define-foreign-funcallable av-app-register-late-init-proc-selproto
                            ((late-init-proc av-idle-proc)
                             (client-data (:pointer :void))
                             (delay as-uns32))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 537
(define-foreign-funcallable av-doc-get-bookmarks-selproto
                            ((av-doc av-doc)
                             (av-bookmark-filter av-bookmark-filter)
                             (p-pdbookmark-array
                              (:pointer (:pointer pd-bookmark))))
                            :result-type
                            as-int32
                            :calling-convention
                            :cdecl)
;; sel = 538
(define-foreign-funcallable av-doc-get-last-active-tool-selproto
                            ((av-doc av-doc))
                            :result-type
                            av-tool
                            :calling-convention
                            :cdecl)
;; sel = 539
(define-foreign-funcallable av-doc-get-num-windows-selproto
                            ((av-doc av-doc))
                            :result-type
                            as-count
                            :calling-convention
                            :cdecl)
;; sel = 540
(define-foreign-funcallable av-doc-get-nth-window-selproto
                            ((av-doc av-doc) (n as-count))
                            :result-type
                            av-window
                            :calling-convention
                            :cdecl)
;; sel = 541
(define-foreign-funcallable av-page-view-get-avwindow-selproto
                            ((page-view av-page-view))
                            :result-type
                            av-window
                            :calling-convention
                            :cdecl)
;; sel = 542
(define-foreign-funcallable av-doc-do-annot-properties-selproto
                            ((doc av-doc)
                             (page-num as-int32)
                             (annot pd-annot))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 543
(define-foreign-funcallable av-sys-track-mouse-selproto
                            ((canceled (:pointer as-bool))
                             (committed (:pointer as-bool))
                             (remove-events as-bool))
                            :result-type
                            av-flag-bits32
                            :calling-convention
                            :cdecl)
;; sel = 544
(define-foreign-funcallable av-doc-save-optimized-selproto
                            ((av-doc av-doc)
                             (pdf-opt-params
                              (:pointer pd-fopt-params-rec)))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 545
(define-foreign-funcallable av-get-optimizer-presets-selproto
                            ((p-preset-names
                              (:pointer (:pointer as-text))))
                            :result-type
                            as-int32
                            :calling-convention
                            :cdecl)
;; sel = 546
(define-foreign-funcallable av-get-optimizer-params-for-preset-selproto
                            ((preset-name as-text)
                             (av-doc av-doc)
                             (pdf-opt-params pd-fopt-params))
                            :result-type
                            as-bool
                            :calling-convention
                            :cdecl)
;; sel = 547
(define-foreign-funcallable av-app-get-annot-appearance-padding-selproto
                            ((flags as-uns32))
                            :result-type
                            as-count
                            :calling-convention
                            :cdecl)
;; sel = 548
(define-foreign-funcallable av-menu-item-is-scriptable-selproto
                            ((menu-item av-menu-item))
                            :result-type
                            as-bool
                            :calling-convention
                            :cdecl)
;; sel = 549
(define-foreign-funcallable av-sys-time-as-text-from-time-rec-selproto
                            ((time-rec as-time-rec-p) (text as-text))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 550
(define-foreign-funcallable av-legacy-tool-button-set-menu-icon-selproto
                            ((button av-tool-button) (icon av-icon))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 551
(define-foreign-funcallable av-listen-for-custom-notification-selproto
                            ((notification
                              (:reference-pass :ef-mb-string))
                             (proc av-custom-notification-proc)
                             (client-data (:pointer :void)))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 552
(define-foreign-funcallable av-unlisten-for-custom-notification-selproto
                            ((notification
                              (:reference-pass :ef-mb-string))
                             (proc av-custom-notification-proc)
                             (client-data (:pointer :void)))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 553
(define-foreign-funcallable av-broadcast-custom-notification-selproto
                            ((notification
                              (:reference-pass :ef-mb-string))
                             (data av-notification-data))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 554
(define-foreign-funcallable av-register-aux-data-handler-selproto
                            ((aux-data-type as-atom)
                             (handler av-aux-data-handler)
                             (client-data (:pointer :void)))
                            :result-type
                            as-bool
                            :calling-convention
                            :cdecl)
;; sel = 555
(define-foreign-funcallable av-doc-apply-redactions-selproto
                            ((av-doc av-doc)
                             (apply-params pd-apply-redaction-params)
                             (show-confirmation as-bool)
                             (show-warnings as-bool)
                             (show-errors as-bool))
                            :result-type
                            as-bool
                            :calling-convention
                            :cdecl)
;; sel = 556
(define-foreign-funcallable av-legacy-tool-bar-add-button-ex-selproto
                            ((tool-bar av-tool-bar)
                             (button av-tool-button)
                             (params av-tool-bar-add-button-params))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 557
(define-foreign-funcallable av-app-begin-save-selproto
                            ((dialog-params av-open-save-dialog-params)
                             (out-file-sys (:pointer as-file-sys))
                             (out-as-path-name-to-write
                              (:pointer as-path-name))
                             (out-chosen-filter-index
                              (:pointer as-int16))
                             (out-as-path-name-chosen
                              (:pointer as-path-name))
                             (out-file-save-handle
                              (:pointer av-app-file-save-handle)))
                            :result-type
                            as-bool
                            :calling-convention
                            :cdecl)
;; sel = 558
(define-foreign-funcallable av-app-end-save-selproto
                            ((in-file-save-handle
                              av-app-file-save-handle)
                             (in-as-path-name-written as-path-name))
                            :result-type
                            as-bool
                            :calling-convention
                            :cdecl)
;; sel = 559
(define-foreign-funcallable av-app-cancel-save-selproto
                            ((in-file-save-handle
                              av-app-file-save-handle))
                            :result-type
                            as-bool
                            :calling-convention
                            :cdecl)
;; sel = 560
(define-foreign-funcallable av-page-view-get-ink-preview-selproto
                            ((page-view av-page-view))
                            :result-type
                            as-bool
                            :calling-convention
                            :cdecl)
;; sel = 561
(define-foreign-funcallable av-page-view-acquire-draw-context-selproto
                            ((page-view av-page-view)
                             (context-type draw-context-type))
                            :result-type
                            (:pointer :void)
                            :calling-convention
                            :cdecl)
;; sel = 562
(define-foreign-funcallable av-page-view-release-draw-context-selproto
                            ((page-view av-page-view)
                             (context-type draw-context-type)
                             (draw-context (:pointer :void)))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 563
(define-foreign-funcallable av-legacy-tool-button-set-help-text-with-as-text-selproto
                            ((button av-tool-button)
                             (text as-const-text))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 564
(define-foreign-funcallable av-legacy-tool-bar-new-with-as-text-selproto
                            ((name (:reference-pass :ef-mb-string))
                             (title as-const-text))
                            :result-type
                            av-tool-bar
                            :calling-convention
                            :cdecl)
;; sel = 565
(define-foreign-funcallable av-app-unregister-annot-handler-selproto
                            ((handler av-annot-handler))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 566
(define-foreign-funcallable av-conversion-append-to-pdf-with-handler-selproto
                            ((in-handler av-conversion-to-pdf-handler)
                             (in-settings as-cab)
                             (flags av-conversion-flags)
                             (in-path as-path-name)
                             (in-file-sys as-file-sys)
                             (out-pddoc pd-doc)
                             (status-monitor av-status-monitor-procs))
                            :result-type
                            av-conversion-status
                            :calling-convention
                            :cdecl)
;; sel = 567
(define-foreign-funcallable av-conversion-get-conversion-queue-status-with-handler-selproto
                            ((in-handler av-conversion-to-pdf-handler))
                            :result-type
                            as-uns32
                            :calling-convention
                            :cdecl)
;; sel = 568
(define-foreign-funcallable av-conversion-to-pdf-set-settings-selproto
                            ((in-handler av-conversion-to-pdf-handler)
                             (in-settings as-cab))
                            :result-type
                            as-bool
                            :calling-convention
                            :cdecl)
;; sel = 569
(define-foreign-funcallable av-doc-is-in-protected-view-selproto
                            ((av-doc av-doc))
                            :result-type
                            as-bool
                            :calling-convention
                            :cdecl)
;; sel = 570
(define-foreign-funcallable av-app-register-idle-proc-with-name-selproto
                            ((idle-proc av-idle-proc)
                             (client-data (:pointer :void))
                             (period as-uns32)
                             (p-pgm-file-name
                              (:reference-pass :ef-mb-string))
                             (p-proc-name
                              (:reference-pass :ef-mb-string)))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 571
(define-foreign-funcallable av-app-register-late-init-proc-with-name-selproto
                            ((idle-proc av-idle-proc)
                             (client-data (:pointer :void))
                             (period as-uns32)
                             (p-pgm-file-name
                              (:reference-pass :ef-mb-string))
                             (p-proc-name
                              (:reference-pass :ef-mb-string)))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 572
(define-foreign-funcallable av-app-unregister-for-context-menu-addition-selproto
                            ((menu-name as-atom)
                             (proc av-context-menu-addition-proc)
                             (client-data (:pointer :void)))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 573
(define-foreign-funcallable av-app-save-dialog-ex-selproto
                            ((dialog-params av-open-save-dialog-params)
                             (out-dialog-params
                              av-open-save-dialog-out-params))
                            :result-type
                            as-bool
                            :calling-convention
                            :cdecl)
;; sel = 574
(define-foreign-funcallable av-app-begin-save-ex-selproto
                            ((dialog-params av-open-save-dialog-params)
                             (out-dialog-params
                              av-open-save-dialog-out-params)
                             (out-as-path-name-to-write
                              (:pointer as-path-name))
                             (out-file-save-handle
                              (:pointer av-app-file-save-handle)))
                            :result-type
                            as-bool
                            :calling-convention
                            :cdecl)
;; sel = 575
(define-foreign-funcallable av-app-register-idle-proc-ex-with-name-selproto
                            ((idle-proc av-idle-proc)
                             (client-data (:pointer :void))
                             (low-priority as-bool)
                             (initial-delay as-uns32)
                             (repeating as-bool)
                             (period as-uns32)
                             (max-period as-uns32)
                             (p-pgm-file-name
                              (:reference-pass :ef-mb-string))
                             (p-proc-name
                              (:reference-pass :ef-mb-string)))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 576
(define-foreign-funcallable av-app-get-version-ex-selproto
                            ((av-version-params av-version-params))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 577
(define-foreign-funcallable av-extension-acquire-info-ex-selproto
                            ((n-index av-array-size))
                            :result-type
                            av-extension-info-ex
                            :calling-convention
                            :cdecl)
;; sel = 578
(define-foreign-funcallable av-extension-release-info-ex-selproto
                            ((info av-extension-info-ex))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 579
(define-foreign-funcallable av-doc-bring-to-front-selproto
                            ((doc av-doc))
                            :result-type
                            as-bool
                            :calling-convention
                            :cdecl)
;; sel = 580
(define-foreign-funcallable av-doc-get-display-title-selproto
                            ((doc av-doc) (title as-text))
                            :result-type
                            as-bool
                            :calling-convention
                            :cdecl)
;; sel = 581
(define-foreign-funcallable av-icon-create-from-pdf-selproto
                            ((pd-doc pd-doc)
                             (page-num as-int32)
                             (width as-int32)
                             (height as-int32))
                            :result-type
                            av-icon
                            :calling-convention
                            :cdecl)
;; sel = 582
(define-foreign-funcallable av-window-get-platform-thing-ex-selproto
                            ((win av-window))
                            :result-type
                            av-platform-window-ref
                            :calling-convention
                            :cdecl)
