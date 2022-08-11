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
(define-c-typedef k-as-max-enum8 as-max-int8)
;; line 81
(define-c-typedef k-as-max-enum16 as-max-int16)
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
                 (ref (:pointer (struct fsref)))
                 (str (:pointer (struct --cfstring))))
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
(define-c-typedef av-struct-node (:pointer (struct -t-avstruct-node)))
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
(define-c-typedef pdf-opt-downsampling-algo as-enum16)
;; line 10321
(define-c-typedef pdf-opt-compression-algo as-enum16)
;; line 10341
(define-c-typedef pdf-opt-compression-qlty as-enum16)
;; line 10430
(define-c-typedef pdf-opt-pdf-version as-enum16)
;; line 10443
(define-c-typedef pdf-opt-object-compression as-enum16)
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
                     pdpage-number
                     pdpage-number)
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
(define-c-typedef av-doc-selection-losing-selection-proc
                  (:pointer
                   (:function
                    (av-doc (:pointer :void) as-bool)
                    :void
                    :calling-convention
                    :cdecl)))
(define-c-typedef av-doc-selection-can-select-all-proc
                  (:pointer
                   (:function
                    (av-doc (:pointer :void))
                    as-bool
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
                     pdpage-number
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
                    (av-doc (:pointer :void) as-int32 nil)
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
                    (av-doc pdperm-req-obj pdperm-req-opr)
                    pdperm-req-status
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
                     pdannot
                     av-page-view
                     (:pointer av-dev-rect))
                    :void
                    :calling-convention
                    :cdecl)))
(define-c-typedef av-annot-handler-post-draw-proc
                  (:pointer
                   (:function
                    (av-annot-handler
                     pdannot
                     av-page-view
                     (:pointer av-dev-rect))
                    :void
                    :calling-convention
                    :cdecl)))
(define-c-typedef av-annot-handler-do-click-proc
                  (:pointer
                   (:function
                    (av-annot-handler
                     pdannot
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
                     pdannot
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
                     pdannot
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
                    (av-annot-handler pdannot av-doc)
                    :void
                    :calling-convention
                    :cdecl)))
(define-c-typedef av-annot-handler-do-key-down-proc
                  (:pointer
                   (:function
                    (av-annot-handler
                     pdannot
                     av-key-code
                     av-flag-bits16)
                    as-bool
                    :calling-convention
                    :cdecl)))
(define-c-typedef av-annot-handler-get-layer-proc
                  (:pointer
                   (:function
                    (av-annot-handler pdannot)
                    as-fixed
                    :calling-convention
                    :cdecl)))
(define-c-typedef av-annot-handler-cursor-enter-proc
                  (:pointer
                   (:function
                    (av-annot-handler pdannot av-page-view)
                    :void
                    :calling-convention
                    :cdecl)))
(define-c-typedef av-annot-handler-cursor-exit-proc
                  (:pointer
                   (:function
                    (av-annot-handler pdannot av-page-view)
                    :void
                    :calling-convention
                    :cdecl)))
(define-c-typedef av-annot-handler-copy-proc
                  (:pointer
                   (:function
                    (av-annot-handler av-doc pdannot av-doc)
                    pdannot
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
                     pdannot
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
                     pdannot
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
                     pdannot
                     av-page-view
                     av-key-code
                     av-flag-bits16)
                    as-bool
                    :calling-convention
                    :cdecl)))
(define-c-typedef av-annot-handler-get-flags-proc
                  (:pointer
                   (:function
                    (av-annot-handler pdannot)
                    av-flag-bits32
                    :calling-convention
                    :cdecl)))
(define-c-typedef av-annot-handler-get-appearance-proc
                  (:pointer
                   (:function
                    (av-annot-handler
                     pdannot
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
                     pdannot
                     av-page-view
                     (:pointer av-dev-rect)
                     (:pointer av-dev-rect))
                    :void
                    :calling-convention
                    :cdecl)))
(define-c-typedef av-annot-handler-do-properties-ex-proc
                  (:pointer
                   (:function
                    (av-annot-handler pdannot av-page-view)
                    :void
                    :calling-convention
                    :cdecl)))
(define-c-typedef av-annot-handler-get-layer-ex-proc
                  (:pointer
                   (:function
                    (av-annot-handler pdannot av-page-view)
                    as-fixed
                    :calling-convention
                    :cdecl)))
(define-c-typedef av-annot-handler-do-click-ex-proc
                  (:pointer
                   (:function
                    (av-annot-handler
                     pdannot
                     av-page-view
                     av-click-params)
                    as-bool
                    :calling-convention
                    :cdecl)))
(define-c-typedef av-annot-handler-adjust-cursor-ex-proc
                  (:pointer
                   (:function
                    (av-annot-handler
                     pdannot
                     av-page-view
                     av-adjust-cursor-params)
                    as-bool
                    :calling-convention
                    :cdecl)))
(define-c-typedef av-annot-handler-get-accessibility-string-proc
                  (:pointer
                   (:function
                    (av-annot-handler
                     pdannot
                     pdpage-number
                     av-annot-acc-str-type
                     as-text)
                    as-bool
                    :calling-convention
                    :cdecl)))
(define-c-typedef av-annot-handler-get-aux-icon-count-proc
                  (:pointer
                   (:function
                    (av-annot-handler pdannot av-page-view)
                    as-int32
                    :calling-convention
                    :cdecl)))
(define-c-typedef av-annot-handler-get-appearance-ex-proc
                  (:pointer
                   (:function
                    (av-annot-handler
                     pdannot
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
                    ((:pointer :void) pdaction av-doc)
                    :void
                    :calling-convention
                    :cdecl)))
(define-c-typedef av-action-do-properties-proc
                  (:pointer
                   (:function
                    ((:pointer :void) pdaction av-doc)
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
                     pdaction
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
                     pdaction
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
                     pdaction
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
                     pdaction
                     (:reference-pass :ef-mb-string)
                     av-tarray-size
                     av-doc)
                    av-tarray-size
                    :calling-convention
                    :cdecl)))
(define-c-typedef av-action-copy-proc
                  (:pointer
                   (:function
                    ((:pointer :void) av-doc pdaction av-doc)
                    pdaction
                    :calling-convention
                    :cdecl)))
(define-c-typedef av-action-get-details-proc
                  (:pointer
                   (:function
                    ((:pointer :void) av-doc pdaction as-cab)
                    :void
                    :calling-convention
                    :cdecl)))
(define-c-typedef av-action-perform-ex-proc
                  (:pointer
                   (:function
                    ((:pointer :void)
                     pdaction
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
                     (:pointer pdaction)
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
                     pdtrans
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
                     pdtrans
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
                    (av-trans-handler pdtrans)
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
                     pdtrans)
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
                     (:pointer pddoc)
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
                     (:pointer pddoc)
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
                     pddoc
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
                     pddoc
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
                     pddoc
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
                    (av-command pddoc)
                    av-command-status
                    :calling-convention
                    :cdecl)))
(define-c-typedef av-command-postflight-file-proc
                  (:pointer
                   (:function
                    (av-command pddoc)
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
                 (page-view-layout-mode pdlayout-mode)
                 (page-view-page-num pdpage-number)
                 (page-view-zoom-type av-zoom-type)
                 (page-view-zoom as-fixed)
                 (page-view-x av-dev-coord)
                 (page-view-y av-dev-coord)
                 (page-view-start-thread as-bool)
                 (page-view-thread-index av-page-index)
                 (page-view-bead pdbead)
                 (use-over-view-info as-bool)
                 (over-view-mode pdpage-mode)
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
                 (page-num pdpage-number)
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
                 (ranges (:pointer pdpage-range))
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
                 (oc-context pdoccontext)
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
                 (seps-spec pdhost-seps-spec)
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
(define-c-struct pdf-opt-image-options-rec
                 (size as-size-t)
                 (enm-downsampling-algo pdf-opt-downsampling-algo)
                 (ppi-downsample-to as-int32)
                 (ppi-downsample-above as-int32)
                 (enm-compression-algo pdf-opt-compression-algo)
                 (enm-compression-qlty pdf-opt-compression-qlty)
                 (n-tile-size as-int32))
(define-c-typedef pdf-opt-image-options
                  (:pointer pdf-opt-image-options-rec))
(define-c-struct pdf-opt-flatten-transparency-options-rec
                 (size as-size-t)
                 (pct-raster-vector-balance as-int32)
                 (ppi-line-art-and-text as-int32)
                 (ppi-gradient-and-mesh as-int32)
                 (b-convert-text as-bool)
                 (b-convert-strokes as-bool)
                 (b-clip-complex-regions as-bool)
                 (b-preserve-overprint as-bool))
(define-c-typedef pdf-opt-flatten-transparency-options
                  (:pointer pdf-opt-flatten-transparency-options-rec))
(define-c-struct pdf-opt-params-rec
                 (size as-size-t)
                 (as-path-dest as-path-name)
                 (file-sys as-file-sys)
                 (prog-mon progress-monitor)
                 (prog-mon-client-data (:pointer :void))
                 (enm-acrobat-version pdf-opt-pdf-version)
                 (image-options-color pdf-opt-image-options-rec)
                 (image-options-grayscale pdf-opt-image-options-rec)
                 (image-options-monochrome pdf-opt-image-options-rec)
                 (arr-pdf-onts-to-unembed (:pointer pdf-ont))
                 (c-pdf-onts-to-unembed as-int32)
                 (pdf-opt-flatten-transparency-options
                  pdf-opt-flatten-transparency-options)
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
                 (enm-object-compression pdf-opt-object-compression)
                 (b-unencoded-to-flate as-bool)
                 (b-lzwto-flate as-bool)
                 (b-remove-invalid-bookmarks as-bool)
                 (b-remove-invalid-links as-bool)
                 (b-remove-unreferenced-named-dests as-bool)
                 (b-linearize as-bool)
                 (b-skip-irreducible-images as-bool)
                 (b-subset-embedded-fonts as-bool)
                 (b-optimize-content-stms as-bool))
(define-c-typedef pdf-opt-params (:pointer pdf-opt-params-rec))
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
