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
(define-opaque-pointer as-extension -t-as-extension)
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
;; line 229
(define-c-typedef max-uns8 as-max-uns8)
;; line 230
(define-c-typedef min-uns8 as-min-uns8)
;; line 231
(define-c-typedef max-uns16 as-max-uns16)
;; line 232
(define-c-typedef min-uns16 as-min-uns16)
;; line 233
(define-c-typedef max-uns32 as-max-uns32)
;; line 234
(define-c-typedef min-uns32 as-min-uns32)
;; line 237
(define-c-typedef boolean as-bool)
;; line 240
(define-c-typedef os-size-t as-size)
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
(define-opaque-pointer as-stm -t-as-stm-rec)
;; line 294
(define-opaque-pointer as-crypt-stm -t-as-crypt-stm-rec)
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
(define-opaque-pointer as-cab -t-as-cabinet)
;; line 1368
(define-opaque-pointer as-const-cab -t-as-cabinet)
;; line 1451
(define-opaque-pointer as-text -t-as-text-rec)
;; line 1457
(define-opaque-pointer as-const-text -t-as-text-rec)
;; line 1610
(define-c-typedef k-acrobat-creator-code as-four-char-code)
;; line 1615
(define-c-typedef k-photoshop-creator-code as-four-char-code)
;; line 1620
(define-c-typedef k-image-ready-creator-code as-four-char-code)
;; line 1625
(define-c-typedef k-illustrator-creator-code as-four-char-code)
;; line 1632
(define-c-typedef k-pdf-type-code as-four-char-code)
;; line 1637
(define-c-typedef k-fdf-type-code as-four-char-code)
;; line 1642
(define-c-typedef k-xfdf-type-code as-four-char-code)
;; line 1647
(define-c-typedef k-xdp-type-code as-four-char-code)
;; line 1652
(define-c-typedef k-pxdf-type-code as-four-char-code)
;; line 1657
(define-c-typedef k-prefs-type-code as-four-char-code)
;; line 1662
(define-c-typedef k-pdx-type-code as-four-char-code)
;; line 1667
(define-c-typedef k-rmf-type-code as-four-char-code)
;; line 1672
(define-c-typedef k-apf-type-code as-four-char-code)
;; line 1677
(define-c-typedef k-sequence-type-code as-four-char-code)
;; line 1682
(define-c-typedef k-dictionary-type-code as-four-char-code)
;; line 1687
(define-c-typedef k-wha-type-code as-four-char-code)
;; line 1692
(define-c-typedef k-locale-type-code as-four-char-code)
;; line 1697
(define-c-typedef k-plugin-type-code as-four-char-code)
;; line 1705
(define-c-typedef k-plugin-new-type-code as-four-char-code)
;; line 1710
(define-c-typedef k-etd-type-code as-four-char-code)
;; line 1715
(define-c-typedef k-edn-type-code as-four-char-code)
;; line 1722
(define-c-typedef k-psd-type-code as-four-char-code)
;; line 1727
(define-c-typedef k-pict-type-code as-four-char-code)
;; line 1732
(define-c-typedef k-tiff-type-code as-four-char-code)
;; line 1737
(define-c-typedef k-gif-type-code as-four-char-code)
;; line 1742
(define-c-typedef k-jpeg-type-code as-four-char-code)
;; line 1747
(define-c-typedef k-png-type-code as-four-char-code)
;; line 1754
(define-c-typedef kai-type-code as-four-char-code)
;; line 1759
(define-c-typedef k-eps-type-code as-four-char-code)
;; line 1765
(define-c-typedef k-text-type-code as-four-char-code)
;; line 1770
(define-c-typedef k-rtf-type-code as-four-char-code)
;; line 1775
(define-c-typedef k-text-creator-code as-four-char-code)
;; line 1780
(define-c-typedef k-quick-time-type-code as-four-char-code)
;; line 1785
(define-c-typedef k-quick-time-creator-code as-four-char-code)
;; line 1790
(define-c-typedef k-html-type-code as-four-char-code)
;; line 1795
(define-c-typedef k-html-creator-code as-four-char-code)
;; line 1800
(define-c-typedef k-xml-type-code as-four-char-code)
;; line 1805
(define-c-typedef k-excel-creator-code as-four-char-code)
;; line 1810
(define-c-typedef k-word-creator-code as-four-char-code)
;; line 1815
(define-c-typedef k-power-point-creator-code as-four-char-code)
;; line 1833
(define-opaque-pointer as-file-sys -t-as-file-sys-rec)
;; line 1846
(define-opaque-pointer as-path-name -t-as-path-name-rec)
;; line 1857
(define-opaque-pointer as-file -t-as-file)
;; line 1924
(define-c-typedef asmd-file (:pointer :void))
;; line 1926
(define-c-typedef md-file asmd-file)
;; line 1935
(define-opaque-pointer asio-request -t-asio-request-rec)
;; line 2074
(define-c-typedef as-file-sys-item-type as-enum16)
;; line 2167
(define-opaque-pointer as-folder-iterator -t-as-folder-iterator)
;; line 2176
(define-opaque-pointer as-platform-path -t-as-platform-path)
;; line 2181
(define-c-typedef cstring-ptr (:reference-pass :ef-mb-string))
;; line 2186
(define-c-typedef posix-path-ptr (:reference-pass :ef-mb-string))
;; line 2202
(define-opaque-pointer fs-ref-ptr fs-ref)
;; line 2218
(define-c-typedef fs-ref-with-cf-string-ref-rec-ptr
                  (:pointer fs-ref-with-cf-string-ref-rec))
;; line 2231
(define-c-typedef cfurl-ref-rec-ptr (:pointer cfurl-ref-rec))
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
(define-c-typedef asutf32val as-uns32)
;; line 3891
(define-c-typedef asutf16val as-uns16)
;; line 3896
(define-c-typedef asutf8val as-uns8)
;; line 3973
(define-c-typedef as-script as-int32)
;; line 4033
(define-c-typedef as-date-time-format as-enum8)
;; line 4046
(define-opaque-pointer as-date -t-as-date-rec)
;; line 4075
(define-opaque-pointer as-time-span -t-as-time-span-rec)

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
(define-foreign-funcallable as-raise-selproto
                            ((error as-error-code))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl
                            :language
                            :ansi-c)
(define-foreign-funcallable as-push-exception-frame-selproto
                            ((as-environ (:pointer :void))
                             (restore-func ac-restore-environ-proc))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl
                            :language
                            :ansi-c)
(define-foreign-funcallable as-pop-exception-frame-selproto
                            nil
                            :result-type
                            :void
                            :calling-convention
                            :cdecl
                            :language
                            :ansi-c)
(define-foreign-funcallable as-get-exception-error-code-selproto
                            nil
                            :result-type
                            as-error-code
                            :calling-convention
                            :cdecl
                            :language
                            :ansi-c)
(define-foreign-funcallable as-atom-from-string-selproto
                            ((name-str
                              (:reference-pass :ef-mb-string)))
                            :result-type
                            as-atom
                            :calling-convention
                            :cdecl
                            :language
                            :ansi-c)
(define-foreign-funcallable as-atom-exists-for-string-selproto
                            ((name-str (:reference-pass :ef-mb-string))
                             (atom (:pointer as-atom)))
                            :result-type
                            as-bool
                            :calling-convention
                            :cdecl
                            :language
                            :ansi-c)
(define-foreign-funcallable as-atom-get-string-selproto
                            ((atm as-atom))
                            :result-type
                            (:reference-pass :ef-mb-string)
                            :calling-convention
                            :cdecl
                            :language
                            :ansi-c)
(define-foreign-funcallable as-callback-create-selproto
                            ((extension-id as-extension)
                             (proc (:pointer :void)))
                            :result-type
                            as-callback
                            :calling-convention
                            :cdecl
                            :language
                            :ansi-c)
(define-foreign-funcallable as-callback-destroy-selproto
                            ((callback as-callback))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl
                            :language
                            :ansi-c)
(define-foreign-funcallable as-extension-mgr-get-hft-selproto
                            ((name as-atom) (version as-version))
                            :result-type
                            hft
                            :calling-convention
                            :cdecl
                            :language
                            :ansi-c)
(define-foreign-funcallable as-get-configuration-selproto
                            ((key as-atom))
                            :result-type
                            (:pointer :void)
                            :calling-convention
                            :cdecl
                            :language
                            :ansi-c)
(define-foreign-funcallable as-enum-extensions-selproto
                            ((proc as-extension-enum-proc)
                             (client-data (:pointer :void))
                             (only-living-extensions as-bool))
                            :result-type
                            as-extension
                            :calling-convention
                            :cdecl
                            :language
                            :ansi-c)
(define-foreign-funcallable as-extension-get-file-name-selproto
                            ((extension as-extension)
                             (buffer (:reference-pass :ef-mb-string))
                             (buf-size ast-array-size))
                            :result-type
                            ast-array-size
                            :calling-convention
                            :cdecl
                            :language
                            :ansi-c)
(define-foreign-funcallable as-extension-get-registered-name-selproto
                            ((extension as-extension))
                            :result-type
                            as-atom
                            :calling-convention
                            :cdecl
                            :language
                            :ansi-c)

;; #include <CorCalls.h>
;; line 329
(define-c-typedef ac-push-exception-frame as-push-exception-frame)
;; line 330
(define-c-typedef ac-pop-exception-frame as-pop-exception-frame)
;; line 331
(define-c-typedef ac-get-exception-error-code
                  as-get-exception-error-code)
;; line 420
(defmacro as-raise-impl (&rest args)
  (list 'if
        (list '>= '*g-core-version* '+core-hft-version-2+)
        (list 'with-coerced-pointer
              (list 'temp ':type ''hft)
              '*g-core-hft*
              (list 'incf-pointer 'temp '+as-raise-sel+)
              (nconc (list 'as-raise-selproto
                           (list 'dereference 'temp))
                     args))
        (list 'error "Not implemented")))
;; line 438
(defmacro as-push-exception-frame (&rest args)
  (list 'if
        (list '>= '*g-core-version* '+core-hft-version-2+)
        (list 'with-coerced-pointer
              (list 'temp ':type ''hft)
              '*g-core-hft*
              (list 'incf-pointer 'temp '+as-push-exception-frame-sel+)
              (nconc (list 'as-push-exception-frame-selproto
                           (list 'dereference 'temp))
                     args))
        (list 'error "Not implemented")))
;; line 445
(defmacro as-pop-exception-frame (&rest args)
  (list 'if
        (list '>= '*g-core-version* '+core-hft-version-2+)
        (list 'with-coerced-pointer
              (list 'temp ':type ''hft)
              '*g-core-hft*
              (list 'incf-pointer 'temp '+as-pop-exception-frame-sel+)
              (nconc (list 'as-pop-exception-frame-selproto
                           (list 'dereference 'temp))
                     args))
        (list 'error "Not implemented")))
;; line 452
(defmacro as-get-exception-error-code (&rest args)
  (list 'if
        (list '>= '*g-core-version* '+core-hft-version-2+)
        (list 'with-coerced-pointer
              (list 'temp ':type ''hft)
              '*g-core-hft*
              (list 'incf-pointer
                    'temp
                    '+as-get-exception-error-code-sel+)
              (nconc (list 'as-get-exception-error-code-selproto
                           (list 'dereference 'temp))
                     args))
        (list 'error "Not implemented")))
;; line 461
(defmacro as-atom-from-string (&rest args)
  (list 'if
        (list '>= '*g-core-version* '+core-hft-version-2+)
        (list 'with-coerced-pointer
              (list 'temp ':type ''hft)
              '*g-core-hft*
              (list 'incf-pointer 'temp '+as-atom-from-string-sel+)
              (nconc (list 'as-atom-from-string-selproto
                           (list 'dereference 'temp))
                     args))
        (list 'error "Not implemented")))
;; line 468
(defmacro as-atom-exists-for-string (&rest args)
  (list 'if
        (list '>= '*g-core-version* '+core-hft-version-2+)
        (list 'with-coerced-pointer
              (list 'temp ':type ''hft)
              '*g-core-hft*
              (list 'incf-pointer
                    'temp
                    '+as-atom-exists-for-string-sel+)
              (nconc (list 'as-atom-exists-for-string-selproto
                           (list 'dereference 'temp))
                     args))
        (list 'error "Not implemented")))
;; line 475
(defmacro as-atom-get-string (&rest args)
  (list 'if
        (list '>= '*g-core-version* '+core-hft-version-2+)
        (list 'with-coerced-pointer
              (list 'temp ':type ''hft)
              '*g-core-hft*
              (list 'incf-pointer 'temp '+as-atom-get-string-sel+)
              (nconc (list 'as-atom-get-string-selproto
                           (list 'dereference 'temp))
                     args))
        (list 'error "Not implemented")))
;; line 510
(defmacro as-callback-destroy (&rest args)
  (list 'if
        (list '>= '*g-core-version* '+core-hft-version-2+)
        (list 'with-coerced-pointer
              (list 'temp ':type ''hft)
              '*g-core-hft*
              (list 'incf-pointer 'temp '+as-callback-destroy-sel+)
              (nconc (list 'as-callback-destroy-selproto
                           (list 'dereference 'temp))
                     args))
        (list 'error "Not implemented")))
;; line 515
(defmacro as-extension-mgr-get-hft (&rest args)
  (list 'if
        (list '>= '*g-core-version* '+core-hft-version-2+)
        (list 'with-coerced-pointer
              (list 'temp ':type ''hft)
              '*g-core-hft*
              (list 'incf-pointer
                    'temp
                    '+as-extension-mgr-get-hft-sel+)
              (nconc (list 'as-extension-mgr-get-hft-selproto
                           (list 'dereference 'temp))
                     args))
        (list 'error "Not implemented")))
;; line 528
(defmacro as-get-configuration (&rest args)
  (list 'if
        (list '>= '*g-core-version* '+core-hft-version-2+)
        (list 'with-coerced-pointer
              (list 'temp ':type ''hft)
              '*g-core-hft*
              (list 'incf-pointer 'temp '+as-get-configuration-sel+)
              (nconc (list 'as-get-configuration-selproto
                           (list 'dereference 'temp))
                     args))
        (list 'error "Not implemented")))
;; line 534
(defmacro as-enum-extensions (&rest args)
  (list 'if
        (list '>= '*g-core-version* '+core-hft-version-4+)
        (list 'with-coerced-pointer
              (list 'temp ':type ''hft)
              '*g-core-hft*
              (list 'incf-pointer 'temp '+as-enum-extensions-sel+)
              (nconc (list 'as-enum-extensions-selproto
                           (list 'dereference 'temp))
                     args))
        (list 'error "Not implemented")))

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
(defconstant +as-fixed-to-c-string-sel+ 14)
(defconstant +asc-string-to-fixed-sel+ 15)
(defconstant +as-fixed-matrix-concat-sel+ 16)
(defconstant +as-fixed-matrix-invert-sel+ 17)
(defconstant +as-fixed-matrix-transform-sel+ 18)
(defconstant +as-fixed-matrix-transform-rect-sel+ 19)
(defconstant +as-path-from-platform-path-sel+ 20)
(defconstant +as-get-default-file-sys-sel+ 21)
(defconstant +as-file-sys-di-path-from-path-sel+ 22)
(defconstant +as-file-sys-path-from-di-path-sel+ 23)
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
(defconstant +as-file-from-md-file-sel+ 50)
(defconstant +as-file-get-md-file-sel+ 51)
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
(defconstant +as-file-m-read-request-sel+ 68)
(defconstant +as-file-clear-outstanding-m-reads-sel+ 69)
(defconstant +as-file-sys-url-from-path-sel+ 70)
(defconstant +as-file-get-urlsel+ 71)
(defconstant +as-file-sys-create-folder-sel+ 72)
(defconstant +as-file-sys-remove-folder-sel+ 73)
(defconstant +as-file-get-open-mode-sel+ 74)
(defconstant +as-file-sys-display-string-from-path-sel+ 75)
(defconstant +as-get-secs-sel+ 76)
(defconstant +as-file-sys-set-type-and-creator-sel+ 77)
(defconstant +as-file-sys-get-type-and-creator-sel+ 78)
(defconstant +as-host-mb-len-sel+ 79)
(defconstant +as-file-hard-flush-sel+ 80)
(defconstant +hft-replace-entry-ex-sel+ 81)
(defconstant +hft-unreplace-entry-sel+ 82)
(defconstant +as-proc-stm-rd-open-ex-sel+ 83)
(defconstant +as-uuid-gen-unique-sel+ 84)
(defconstant +as-uuid-gen-from-name-sel+ 85)
(defconstant +as-uuid-from-c-string-sel+ 86)
(defconstant +as-uuid-to-c-string-sel+ 87)
(defconstant +as-file-sys-get-platform-thing-sel+ 88)
(defconstant +as-file-sys-acquire-platform-path-sel+ 89)
(defconstant +as-file-sys-release-platform-path-sel+ 90)
(defconstant +as-platform-path-get-cstring-ptr-sel+ 91)
(defconstant +as-platform-path-get-fs-spec-ptr-sel+ 92)
(defconstant +as-platform-path-get-fs-ref-ptr-sel+ 93)
(defconstant +as-platform-path-get-fs-ref-with-cf-string-ref-rec-ptr-sel+ 94)
(defconstant +as-platform-path-get-cfurl-ref-rec-ptr-sel+ 95)
(defconstant +as-platform-path-get-posix-path-ptr-sel+ 96)
(defconstant +as-file-sys-get-name-from-path-as-as-text-sel+ 97)
(defconstant +as-file-sys-display-as-text-from-path-sel+ 98)
(defconstant +as-stm-flush-sel+ 99)
(defconstant +as-file-can-set-eof-sel+ 100)
(defconstant +hft-get-version-sel+ 101)
(defconstant +hft-new-ex-sel+ 102)
(defconstant +as-file-sys-di-path-from-path-ex-sel+ 103)
(defconstant +as-file-sys-path-from-di-path-ex-sel+ 104)
(defconstant +as-get-temp-file-sys-sel+ 105)
(defconstant +as-set-temp-file-sys-sel+ 106)
(defconstant +as-get-ram-file-sys-sel+ 107)
(defconstant +as-fixed-to-float-sel+ 108)
(defconstant +float-to-as-fixed-sel+ 109)
(defconstant +as-file-sys-open-file64sel+ 110)
(defconstant +as-file-sys-get-file-pos-limit-sel+ 111)
(defconstant +as-file-set-pos64sel+ 112)
(defconstant +as-file-get-pos64sel+ 113)
(defconstant +as-file-set-eof64sel+ 114)
(defconstant +as-file-get-eof64sel+ 115)
(defconstant +as-ram-file-sys-set-limit-kbsel+ 116)
(defconstant +as-file-sys-get-name-from-path-for-display-sel+ 117)
(defconstant +as-get-default-unicode-file-sys-sel+ 118)
(defconstant +as-get-error-string-as-text-sel+ 119)
(defconstant +as-register-error-string-as-text-sel+ 120)
(defconstant +as-get-default-file-sys-for-path-sel+ 121)
(defconstant +as-file-sys-is-local-sel+ 122)
(defconstant +as-file-sys-get-storage-free-space64sel+ 123)
(defconstant +as-double-matrix-concat-sel+ 124)
(defconstant +as-double-matrix-invert-sel+ 125)
(defconstant +as-double-matrix-transform-sel+ 126)
(defconstant +as-double-matrix-transform-rect-sel+ 127)
(defconstant +as-file-open-with-virtual-eof-sel+ 128)
(define-foreign-funcallable as-malloc-selproto
                            ((n-bytes os-size-t))
                            :result-type
                            (:pointer :void)
                            :calling-convention
                            :cdecl
                            :language
                            :ansi-c)
(define-foreign-funcallable as-realloc-selproto
                            ((ptr (:pointer :void))
                             (new-n-bytes os-size-t))
                            :result-type
                            (:pointer :void)
                            :calling-convention
                            :cdecl
                            :language
                            :ansi-c)
(define-foreign-funcallable as-free-selproto
                            ((ptr (:pointer :void)))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl
                            :language
                            :ansi-c)
(define-foreign-funcallable as-get-error-string-selproto
                            ((error-code as-error-code)
                             (buffer (:reference-pass :ef-mb-string))
                             (len-buffer ast-array-size))
                            :result-type
                            (:reference-pass :ef-mb-string)
                            :calling-convention
                            :cdecl
                            :language
                            :ansi-c)
(define-foreign-funcallable as-register-error-string-selproto
                            ((severity as-err-severity)
                             (error-string
                              (:reference-pass :ef-mb-string)))
                            :result-type
                            as-error-code
                            :calling-convention
                            :cdecl
                            :language
                            :ansi-c)
(define-foreign-funcallable hft-server-new-selproto
                            ((name (:reference-pass :ef-mb-string))
                             (server-proc hft-server-provide-hft-proc)
                             (destroy-proc hft-server-destroy-proc)
                             (client-data (:pointer :void)))
                            :result-type
                            hft-server
                            :calling-convention
                            :cdecl
                            :language
                            :ansi-c)
(define-foreign-funcallable hft-server-destroy-selproto
                            ((hft-server hft-server))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl
                            :language
                            :ansi-c)
(define-foreign-funcallable hft-new-selproto
                            ((hft-server hft-server)
                             (num-selectors ast-count))
                            :result-type
                            hft
                            :calling-convention
                            :cdecl
                            :language
                            :ansi-c)
(define-foreign-funcallable hft-destroy-selproto
                            ((hft hft))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl
                            :language
                            :ansi-c)
(define-foreign-funcallable hft-replace-entry-selproto
                            ((hft hft)
                             (sel selector)
                             (new-entry hft-entry)
                             (flags as-flag-bits))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl
                            :language
                            :ansi-c)
(define-foreign-funcallable hft-get-replaced-entry-selproto
                            ((hft hft)
                             (sel selector)
                             (old-entry hft-entry))
                            :result-type
                            hft-entry
                            :calling-convention
                            :cdecl
                            :language
                            :ansi-c)
(define-foreign-funcallable as-fixed-mul-selproto
                            ((a as-fixed) (b as-fixed))
                            :result-type
                            as-fixed
                            :calling-convention
                            :cdecl
                            :language
                            :ansi-c)
(define-foreign-funcallable as-fixed-div-selproto
                            ((a as-fixed) (b as-fixed))
                            :result-type
                            as-fixed
                            :calling-convention
                            :cdecl
                            :language
                            :ansi-c)
(define-foreign-funcallable as-fixed-to-c-string-selproto
                            ((f as-fixed)
                             (s (:reference-pass :ef-mb-string))
                             (max-length os-size-t)
                             (precision as-small-count))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl
                            :language
                            :ansi-c)
(define-foreign-funcallable asc-string-to-fixed-selproto
                            ((s (:reference-pass :ef-mb-string)))
                            :result-type
                            as-fixed
                            :calling-convention
                            :cdecl
                            :language
                            :ansi-c)
(define-foreign-funcallable as-fixed-matrix-concat-selproto
                            ((result as-fixed-matrix-p)
                             (m1 (:pointer as-fixed-matrix))
                             (m2 (:pointer as-fixed-matrix)))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl
                            :language
                            :ansi-c)
(define-foreign-funcallable as-fixed-matrix-invert-selproto
                            ((result as-fixed-matrix-p)
                             (m as-fixed-matrix-p))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl
                            :language
                            :ansi-c)
(define-foreign-funcallable as-fixed-matrix-transform-selproto
                            ((result as-fixed-point-p)
                             (m as-fixed-matrix-p)
                             (p as-fixed-point-p))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl
                            :language
                            :ansi-c)
(define-foreign-funcallable as-fixed-matrix-transform-rect-selproto
                            ((result as-fixed-rect-p)
                             (m as-fixed-matrix-p)
                             (rect-in as-fixed-rect-p))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl
                            :language
                            :ansi-c)
(define-foreign-funcallable as-path-from-platform-path-selproto
                            ((platform-path (:pointer :void)))
                            :result-type
                            as-path-name
                            :calling-convention
                            :cdecl
                            :language
                            :ansi-c)
(define-foreign-funcallable as-get-default-file-sys-selproto
                            nil
                            :result-type
                            as-file-sys
                            :calling-convention
                            :cdecl
                            :language
                            :ansi-c)
(define-foreign-funcallable as-file-sys-di-path-from-path-selproto
                            ((file-sys as-file-sys)
                             (path as-path-name)
                             (relative-to-this-path as-path-name))
                            :result-type
                            (:reference-pass :ef-mb-string)
                            :calling-convention
                            :cdecl
                            :language
                            :ansi-c)
(define-foreign-funcallable as-file-sys-path-from-di-path-selproto
                            ((file-sys as-file-sys)
                             (di-path (:reference-pass :ef-mb-string))
                             (relative-to-this-path as-path-name))
                            :result-type
                            as-path-name
                            :calling-convention
                            :cdecl
                            :language
                            :ansi-c)
(define-foreign-funcallable as-file-sys-copy-path-selproto
                            ((file-sys as-file-sys)
                             (path-name as-path-name))
                            :result-type
                            as-path-name
                            :calling-convention
                            :cdecl
                            :language
                            :ansi-c)
(define-foreign-funcallable as-file-sys-release-path-selproto
                            ((file-sys as-file-sys)
                             (path-name as-path-name))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl
                            :language
                            :ansi-c)
(define-foreign-funcallable as-file-sys-open-file-selproto
                            ((file-sys as-file-sys)
                             (path-name as-path-name)
                             (mode as-file-mode)
                             (f-p (:pointer as-file)))
                            :result-type
                            as-error-code
                            :calling-convention
                            :cdecl
                            :language
                            :ansi-c)
(define-foreign-funcallable as-file-sys-remove-file-selproto
                            ((file-sys as-file-sys)
                             (path-name as-path-name))
                            :result-type
                            as-error-code
                            :calling-convention
                            :cdecl
                            :language
                            :ansi-c)
(define-foreign-funcallable as-file-reopen-selproto
                            ((a-file as-file) (mode as-file-mode))
                            :result-type
                            as-error-code
                            :calling-convention
                            :cdecl
                            :language
                            :ansi-c)
(define-foreign-funcallable as-file-close-selproto
                            ((a-file as-file))
                            :result-type
                            as-error-code
                            :calling-convention
                            :cdecl
                            :language
                            :ansi-c)
(define-foreign-funcallable as-file-set-pos-selproto
                            ((a-file as-file) (pos ast-file-pos))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl
                            :language
                            :ansi-c)
(define-foreign-funcallable as-file-get-pos-selproto
                            ((a-file as-file))
                            :result-type
                            ast-file-pos
                            :calling-convention
                            :cdecl
                            :language
                            :ansi-c)
(define-foreign-funcallable as-file-set-eof-selproto
                            ((a-file as-file)
                             (new-file-size ast-file-pos))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl
                            :language
                            :ansi-c)
(define-foreign-funcallable as-file-get-eof-selproto
                            ((a-file as-file))
                            :result-type
                            ast-file-pos
                            :calling-convention
                            :cdecl
                            :language
                            :ansi-c)
(define-foreign-funcallable as-file-read-selproto
                            ((a-file as-file)
                             (p (:reference-pass :ef-mb-string))
                             (count ast-array-size))
                            :result-type
                            ast-array-size
                            :calling-convention
                            :cdecl
                            :language
                            :ansi-c)
(define-foreign-funcallable as-file-write-selproto
                            ((a-file as-file)
                             (p (:reference-pass :ef-mb-string))
                             (count ast-array-size))
                            :result-type
                            ast-array-size
                            :calling-convention
                            :cdecl
                            :language
                            :ansi-c)
(define-foreign-funcallable as-file-flush-selproto
                            ((a-file as-file))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl
                            :language
                            :ansi-c)
(define-foreign-funcallable as-file-acquire-path-name-selproto
                            ((a-file as-file))
                            :result-type
                            as-path-name
                            :calling-convention
                            :cdecl
                            :language
                            :ansi-c)
(define-foreign-funcallable as-file-get-file-sys-selproto
                            ((a-file as-file))
                            :result-type
                            as-file-sys
                            :calling-convention
                            :cdecl
                            :language
                            :ansi-c)
(define-foreign-funcallable as-debug-selproto
                            ((op as-int32)
                             (parm (:pointer :void))
                             (parm-len ast-array-size)
                             (client-data (:pointer :void)))
                            :result-type
                            (:pointer :void)
                            :calling-convention
                            :cdecl
                            :language
                            :ansi-c)
(define-foreign-funcallable as-file-stm-rd-open-selproto
                            ((afile as-file)
                             (buf-size as-small-buffer-size))
                            :result-type
                            as-stm
                            :calling-convention
                            :cdecl
                            :language
                            :ansi-c)
(define-foreign-funcallable as-mem-stm-rd-open-selproto
                            ((data (:reference-pass :ef-mb-string))
                             (len as-array-size))
                            :result-type
                            as-stm
                            :calling-convention
                            :cdecl
                            :language
                            :ansi-c)
(define-foreign-funcallable as-proc-stm-rd-open-selproto
                            ((read-proc as-stm-proc)
                             (client-data (:pointer :void)))
                            :result-type
                            as-stm
                            :calling-convention
                            :cdecl
                            :language
                            :ansi-c)
(define-foreign-funcallable as-stm-read-selproto
                            ((ptr (:reference-pass :ef-mb-string))
                             (item-size ast-array-size)
                             (n-items ast-count)
                             (stm as-stm))
                            :result-type
                            ast-count
                            :calling-convention
                            :cdecl
                            :language
                            :ansi-c)
(define-foreign-funcallable as-stm-write-selproto
                            ((ptr (:reference-pass :ef-mb-string))
                             (item-size ast-array-size)
                             (n-items ast-count)
                             (stm as-stm))
                            :result-type
                            ast-count
                            :calling-convention
                            :cdecl
                            :language
                            :ansi-c)
(define-foreign-funcallable as-stm-close-selproto
                            ((stm as-stm))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl
                            :language
                            :ansi-c)
(define-foreign-funcallable as-file-unregister-file-sys-selproto
                            ((extension as-extension)
                             (file-sys as-file-sys))
                            :result-type
                            as-bool
                            :calling-convention
                            :cdecl
                            :language
                            :ansi-c)
(define-foreign-funcallable as-file-push-data-selproto
                            ((a-file as-file)
                             (p (:reference-pass :ef-mb-string))
                             (offset ast-file-pos)
                             (length ast-array-size))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl
                            :language
                            :ansi-c)
(define-foreign-funcallable as-file-register-file-sys-selproto
                            ((extension as-extension)
                             (file-sys as-file-sys))
                            :result-type
                            as-bool
                            :calling-convention
                            :cdecl
                            :language
                            :ansi-c)
(define-foreign-funcallable as-file-get-file-sys-by-name-selproto
                            ((name as-atom))
                            :result-type
                            as-file-sys
                            :calling-convention
                            :cdecl
                            :language
                            :ansi-c)
(define-foreign-funcallable as-file-from-md-file-selproto
                            ((md-file asmd-file)
                             (file-sys as-file-sys)
                             (pf-n (:pointer as-file)))
                            :result-type
                            as-bool
                            :calling-convention
                            :cdecl
                            :language
                            :ansi-c)
(define-foreign-funcallable as-file-get-md-file-selproto
                            ((f-n as-file)
                             (p-file-id (:pointer asmd-file))
                             (p-file-sys (:pointer as-file-sys)))
                            :result-type
                            as-bool
                            :calling-convention
                            :cdecl
                            :language
                            :ansi-c)
(define-foreign-funcallable as-file-sys-create-path-name-selproto
                            ((file-sys as-file-sys)
                             (path-spec-type as-atom)
                             (path-spec (:pointer :void))
                             (additional-data (:pointer :void)))
                            :result-type
                            as-path-name
                            :calling-convention
                            :cdecl
                            :language
                            :ansi-c)
(define-foreign-funcallable as-file-sys-acquire-file-sys-path-selproto
                            ((old-file-sys as-file-sys)
                             (old-path-name as-path-name)
                             (new-file-sys as-file-sys))
                            :result-type
                            as-path-name
                            :calling-convention
                            :cdecl
                            :language
                            :ansi-c)
(define-foreign-funcallable as-file-set-mode-selproto
                            ((f-n as-file)
                             (mode-value as-flag-bits)
                             (mode-mask as-flag-bits))
                            :result-type
                            as-flag-bits
                            :calling-convention
                            :cdecl
                            :language
                            :ansi-c)
(define-foreign-funcallable as-proc-stm-wr-open-selproto
                            ((write-proc as-stm-proc)
                             (destroy-proc as-proc-stm-destroy-proc)
                             (client-data (:pointer :void)))
                            :result-type
                            as-stm
                            :calling-convention
                            :cdecl
                            :language
                            :ansi-c)
(define-foreign-funcallable as-file-stm-wr-open-selproto
                            ((afile as-file)
                             (buf-size as-small-buffer-size))
                            :result-type
                            as-stm
                            :calling-convention
                            :cdecl
                            :language
                            :ansi-c)
(define-foreign-funcallable hft-is-valid-selproto
                            ((hft hft))
                            :result-type
                            as-bool
                            :calling-convention
                            :cdecl
                            :language
                            :ansi-c)
(define-foreign-funcallable as-file-sys-get-item-props-selproto
                            ((file-sys as-file-sys)
                             (path-name as-path-name)
                             (props as-file-sys-item-props))
                            :result-type
                            as-error-code
                            :calling-convention
                            :cdecl
                            :language
                            :ansi-c)
(define-foreign-funcallable as-file-sys-first-folder-item-selproto
                            ((file-sys as-file-sys)
                             (folder-path as-path-name)
                             (props as-file-sys-item-props)
                             (item-path (:pointer as-path-name)))
                            :result-type
                            as-folder-iterator
                            :calling-convention
                            :cdecl
                            :language
                            :ansi-c)
(define-foreign-funcallable as-file-sys-next-folder-item-selproto
                            ((file-sys as-file-sys)
                             (folder-iter as-folder-iterator)
                             (props as-file-sys-item-props)
                             (item-path (:pointer as-path-name)))
                            :result-type
                            as-bool
                            :calling-convention
                            :cdecl
                            :language
                            :ansi-c)
(define-foreign-funcallable as-file-sys-destroy-folder-iterator-selproto
                            ((file-sys as-file-sys)
                             (folder-iter as-folder-iterator))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl
                            :language
                            :ansi-c)
(define-foreign-funcallable as-file-sys-acquire-parent-selproto
                            ((file-sys as-file-sys)
                             (path-name as-path-name))
                            :result-type
                            as-path-name
                            :calling-convention
                            :cdecl
                            :language
                            :ansi-c)
(define-foreign-funcallable as-file-is-same-selproto
                            ((f-n as-file)
                             (path-name as-path-name)
                             (file-sys as-file-sys))
                            :result-type
                            as-bool
                            :calling-convention
                            :cdecl
                            :language
                            :ansi-c)
(define-foreign-funcallable as-file-sys-get-name-from-path-selproto
                            ((file-sys as-file-sys)
                             (path-name as-path-name)
                             (name (:reference-pass :ef-mb-string))
                             (max-length ast-array-size))
                            :result-type
                            as-error-code
                            :calling-convention
                            :cdecl
                            :language
                            :ansi-c)
(define-foreign-funcallable as-file-sys-get-temp-path-name-selproto
                            ((file-sys as-file-sys)
                             (sibling-path-name as-path-name))
                            :result-type
                            as-path-name
                            :calling-convention
                            :cdecl
                            :language
                            :ansi-c)
(define-foreign-funcallable as-file-sys-get-storage-free-space-selproto
                            ((file-sys as-file-sys)
                             (path-name as-path-name))
                            :result-type
                            as-disk-space
                            :calling-convention
                            :cdecl
                            :language
                            :ansi-c)
(define-foreign-funcallable as-file-sys-flush-volume-selproto
                            ((file-sys as-file-sys)
                             (path-name as-path-name))
                            :result-type
                            as-error-code
                            :calling-convention
                            :cdecl
                            :language
                            :ansi-c)
(define-foreign-funcallable as-file-m-read-request-selproto
                            ((f-n as-file)
                             (block-pairs (:pointer as-int32))
                             (n-block-pairs ast-count))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl
                            :language
                            :ansi-c)
(define-foreign-funcallable as-file-clear-outstanding-m-reads-selproto
                            ((f-n as-file))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl
                            :language
                            :ansi-c)
(define-foreign-funcallable as-file-sys-url-from-path-selproto
                            ((file-sys as-file-sys)
                             (path as-path-name))
                            :result-type
                            (:reference-pass :ef-mb-string)
                            :calling-convention
                            :cdecl
                            :language
                            :ansi-c)
(define-foreign-funcallable as-file-get-urlselproto
                            ((asf as-file))
                            :result-type
                            (:reference-pass :ef-mb-string)
                            :calling-convention
                            :cdecl
                            :language
                            :ansi-c)
(define-foreign-funcallable as-file-sys-create-folder-selproto
                            ((file-sys as-file-sys)
                             (path as-path-name)
                             (recurse as-bool))
                            :result-type
                            as-error-code
                            :calling-convention
                            :cdecl
                            :language
                            :ansi-c)
(define-foreign-funcallable as-file-sys-remove-folder-selproto
                            ((file-sys as-file-sys)
                             (path as-path-name))
                            :result-type
                            as-error-code
                            :calling-convention
                            :cdecl
                            :language
                            :ansi-c)
(define-foreign-funcallable as-file-get-open-mode-selproto
                            ((f-n as-file))
                            :result-type
                            as-file-mode
                            :calling-convention
                            :cdecl
                            :language
                            :ansi-c)
(define-foreign-funcallable as-file-sys-display-string-from-path-selproto
                            ((file-sys as-file-sys)
                             (path as-path-name))
                            :result-type
                            (:reference-pass :ef-mb-string)
                            :calling-convention
                            :cdecl
                            :language
                            :ansi-c)
(define-foreign-funcallable as-get-secs-selproto
                            nil
                            :result-type
                            as-count
                            :calling-convention
                            :cdecl
                            :language
                            :ansi-c)
(define-foreign-funcallable as-file-sys-set-type-and-creator-selproto
                            ((file-sys as-file-sys)
                             (path as-path-name)
                             (type as-uns32)
                             (creator as-uns32))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl
                            :language
                            :ansi-c)
(define-foreign-funcallable as-file-sys-get-type-and-creator-selproto
                            ((file-sys as-file-sys)
                             (path as-path-name)
                             (type (:pointer as-uns32))
                             (creator (:pointer as-uns32)))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl
                            :language
                            :ansi-c)
(define-foreign-funcallable as-host-mb-len-selproto
                            ((encoding as-host-encoding)
                             (byte as-uns8))
                            :result-type
                            as-int32
                            :calling-convention
                            :cdecl
                            :language
                            :ansi-c)
(define-foreign-funcallable as-file-hard-flush-selproto
                            ((a-file as-file))
                            :result-type
                            as-error-code
                            :calling-convention
                            :cdecl
                            :language
                            :ansi-c)
(define-foreign-funcallable hft-replace-entry-ex-selproto
                            ((hft hft)
                             (sel selector)
                             (new-entry hft-entry)
                             (extension as-extension)
                             (flags as-flag-bits))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl
                            :language
                            :ansi-c)
(define-foreign-funcallable hft-unreplace-entry-selproto
                            ((hft hft)
                             (sel selector)
                             (old-entry hft-entry)
                             (extension as-extension))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl
                            :language
                            :ansi-c)
(define-foreign-funcallable as-proc-stm-rd-open-ex-selproto
                            ((handler as-proc-stm-rd-ex-handler)
                             (client-data (:pointer :void)))
                            :result-type
                            as-stm
                            :calling-convention
                            :cdecl
                            :language
                            :ansi-c)
(define-foreign-funcallable as-uuid-gen-unique-selproto
                            ((dst (:pointer asuuid)))
                            :result-type
                            as-bool
                            :calling-convention
                            :cdecl
                            :language
                            :ansi-c)
(define-foreign-funcallable as-uuid-gen-from-name-selproto
                            ((dst (:pointer asuuid))
                             (ns (:pointer asuuid))
                             (name (:pointer :void))
                             (bytes as-byte-count))
                            :result-type
                            as-bool
                            :calling-convention
                            :cdecl
                            :language
                            :ansi-c)
(define-foreign-funcallable as-uuid-from-c-string-selproto
                            ((dst (:pointer asuuid))
                             (str (:reference-pass :ef-mb-string)))
                            :result-type
                            as-bool
                            :calling-convention
                            :cdecl
                            :language
                            :ansi-c)
(define-foreign-funcallable as-uuid-to-c-string-selproto
                            ((dst (:reference-pass :ef-mb-string))
                             (src (:pointer asuuid)))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl
                            :language
                            :ansi-c)
(define-foreign-funcallable as-file-sys-get-platform-thing-selproto
                            ((file-sys as-file-sys)
                             (path as-path-name)
                             (thing as-atom))
                            :result-type
                            (:pointer :void)
                            :calling-convention
                            :cdecl
                            :language
                            :ansi-c)
(define-foreign-funcallable as-file-sys-acquire-platform-path-selproto
                            ((file-sys as-file-sys)
                             (path as-path-name)
                             (platform-path-type as-atom)
                             (platform-path
                              (:pointer as-platform-path)))
                            :result-type
                            as-int32
                            :calling-convention
                            :cdecl
                            :language
                            :ansi-c)
(define-foreign-funcallable as-file-sys-release-platform-path-selproto
                            ((file-sys as-file-sys)
                             (platform-path as-platform-path))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl
                            :language
                            :ansi-c)
(define-foreign-funcallable as-platform-path-get-cstring-ptr-selproto
                            ((path as-platform-path))
                            :result-type
                            cstring-ptr
                            :calling-convention
                            :cdecl
                            :language
                            :ansi-c)
(define-foreign-funcallable as-platform-path-get-fs-spec-ptr-selproto
                            ((path as-platform-path))
                            :result-type
                            fs-spec-ptr
                            :calling-convention
                            :cdecl
                            :language
                            :ansi-c)
(define-foreign-funcallable as-platform-path-get-fs-ref-ptr-selproto
                            ((path as-platform-path))
                            :result-type
                            fs-ref-ptr
                            :calling-convention
                            :cdecl
                            :language
                            :ansi-c)
(define-foreign-funcallable as-platform-path-get-fs-ref-with-cf-string-ref-rec-ptr-selproto
                            ((path as-platform-path))
                            :result-type
                            fs-ref-with-cf-string-ref-rec-ptr
                            :calling-convention
                            :cdecl
                            :language
                            :ansi-c)
(define-foreign-funcallable as-platform-path-get-cfurl-ref-rec-ptr-selproto
                            ((path as-platform-path))
                            :result-type
                            cfurl-ref-rec-ptr
                            :calling-convention
                            :cdecl
                            :language
                            :ansi-c)
(define-foreign-funcallable as-platform-path-get-posix-path-ptr-selproto
                            ((path as-platform-path))
                            :result-type
                            posix-path-ptr
                            :calling-convention
                            :cdecl
                            :language
                            :ansi-c)
(define-foreign-funcallable as-file-sys-get-name-from-path-as-as-text-selproto
                            ((file-sys as-file-sys)
                             (path-name as-path-name)
                             (name as-text))
                            :result-type
                            as-error-code
                            :calling-convention
                            :cdecl
                            :language
                            :ansi-c)
(define-foreign-funcallable as-file-sys-display-as-text-from-path-selproto
                            ((file-sys as-file-sys)
                             (path as-path-name)
                             (display-text as-text))
                            :result-type
                            as-error-code
                            :calling-convention
                            :cdecl
                            :language
                            :ansi-c)
(define-foreign-funcallable as-stm-flush-selproto
                            ((stm as-stm))
                            :result-type
                            ast-count
                            :calling-convention
                            :cdecl
                            :language
                            :ansi-c)
(define-foreign-funcallable as-file-can-set-eof-selproto
                            ((file as-file) (new-file-size as-int32))
                            :result-type
                            as-bool
                            :calling-convention
                            :cdecl
                            :language
                            :ansi-c)
(define-foreign-funcallable hft-get-version-selproto
                            ((hft hft))
                            :result-type
                            as-version
                            :calling-convention
                            :cdecl
                            :language
                            :ansi-c)
(define-foreign-funcallable hft-new-ex-selproto
                            ((hft-server hft-server) (data hft-data))
                            :result-type
                            hft
                            :calling-convention
                            :cdecl
                            :language
                            :ansi-c)
(define-foreign-funcallable as-file-sys-di-path-from-path-ex-selproto
                            ((file-sys as-file-sys)
                             (path as-path-name)
                             (relative-to-this-path as-path-name)
                             (di-path-text as-text))
                            :result-type
                            as-error-code
                            :calling-convention
                            :cdecl
                            :language
                            :ansi-c)
(define-foreign-funcallable as-file-sys-path-from-di-path-ex-selproto
                            ((file-sys as-file-sys)
                             (di-path-text as-const-text)
                             (relative-to-this-path as-path-name))
                            :result-type
                            as-path-name
                            :calling-convention
                            :cdecl
                            :language
                            :ansi-c)
(define-foreign-funcallable as-get-temp-file-sys-selproto
                            nil
                            :result-type
                            as-file-sys
                            :calling-convention
                            :cdecl
                            :language
                            :ansi-c)
(define-foreign-funcallable as-set-temp-file-sys-selproto
                            ((file-sys as-file-sys))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl
                            :language
                            :ansi-c)
(define-foreign-funcallable as-get-ram-file-sys-selproto
                            nil
                            :result-type
                            as-file-sys
                            :calling-convention
                            :cdecl
                            :language
                            :ansi-c)
(define-foreign-funcallable as-fixed-to-float-selproto
                            ((in-as-fixed as-fixed))
                            :result-type
                            :float
                            :calling-convention
                            :cdecl
                            :language
                            :ansi-c)
(define-foreign-funcallable float-to-as-fixed-selproto
                            ((in-float :double))
                            :result-type
                            as-fixed
                            :calling-convention
                            :cdecl
                            :language
                            :ansi-c)
(define-foreign-funcallable as-file-sys-open-file64selproto
                            ((file-sys as-file-sys)
                             (path-name as-path-name)
                             (mode as-file-mode)
                             (f-p (:pointer as-file)))
                            :result-type
                            as-error-code
                            :calling-convention
                            :cdecl
                            :language
                            :ansi-c)
(define-foreign-funcallable as-file-sys-get-file-pos-limit-selproto
                            ((file-sys as-file-sys))
                            :result-type
                            as-file-pos64
                            :calling-convention
                            :cdecl
                            :language
                            :ansi-c)
(define-foreign-funcallable as-file-set-pos64selproto
                            ((a-file as-file) (pos as-file-pos64))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl
                            :language
                            :ansi-c)
(define-foreign-funcallable as-file-get-pos64selproto
                            ((a-file as-file))
                            :result-type
                            as-file-pos64
                            :calling-convention
                            :cdecl
                            :language
                            :ansi-c)
(define-foreign-funcallable as-file-set-eof64selproto
                            ((a-file as-file)
                             (new-file-size as-file-pos64))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl
                            :language
                            :ansi-c)
(define-foreign-funcallable as-file-get-eof64selproto
                            ((a-file as-file))
                            :result-type
                            as-file-pos64
                            :calling-convention
                            :cdecl
                            :language
                            :ansi-c)
(define-foreign-funcallable as-ram-file-sys-set-limit-kbselproto
                            ((limit as-int32))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl
                            :language
                            :ansi-c)
(define-foreign-funcallable as-file-sys-get-name-from-path-for-display-selproto
                            ((file-sys as-file-sys)
                             (path-name as-path-name)
                             (name-for-display as-text))
                            :result-type
                            as-error-code
                            :calling-convention
                            :cdecl
                            :language
                            :ansi-c)
(define-foreign-funcallable as-get-default-unicode-file-sys-selproto
                            nil
                            :result-type
                            as-file-sys
                            :calling-convention
                            :cdecl
                            :language
                            :ansi-c)
(define-foreign-funcallable as-get-error-string-as-text-selproto
                            ((error-code as-error-code)
                             (error-string as-text))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl
                            :language
                            :ansi-c)
(define-foreign-funcallable as-register-error-string-as-text-selproto
                            ((severity as-err-severity)
                             (error-string as-text))
                            :result-type
                            as-error-code
                            :calling-convention
                            :cdecl
                            :language
                            :ansi-c)
(define-foreign-funcallable as-get-default-file-sys-for-path-selproto
                            ((path-spec-type as-atom)
                             (path-spec (:pointer :void)))
                            :result-type
                            as-file-sys
                            :calling-convention
                            :cdecl
                            :language
                            :ansi-c)
(define-foreign-funcallable as-file-sys-is-local-selproto
                            ((file-sys as-file-sys))
                            :result-type
                            as-bool
                            :calling-convention
                            :cdecl
                            :language
                            :ansi-c)
(define-foreign-funcallable as-file-sys-get-storage-free-space64selproto
                            ((file-sys as-file-sys)
                             (path-name as-path-name))
                            :result-type
                            as-disk-space64
                            :calling-convention
                            :cdecl
                            :language
                            :ansi-c)
(define-foreign-funcallable as-double-matrix-concat-selproto
                            ((result (:pointer as-double-matrix))
                             (m1 (:pointer as-double-matrix))
                             (m2 (:pointer as-double-matrix)))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl
                            :language
                            :ansi-c)
(define-foreign-funcallable as-double-matrix-invert-selproto
                            ((result (:pointer as-double-matrix))
                             (m (:pointer as-double-matrix)))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl
                            :language
                            :ansi-c)
(define-foreign-funcallable as-double-matrix-transform-selproto
                            ((result (:pointer as-double-point))
                             (m (:pointer as-double-matrix))
                             (p (:pointer as-double-point)))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl
                            :language
                            :ansi-c)
(define-foreign-funcallable as-double-matrix-transform-rect-selproto
                            ((result (:pointer as-double-rect))
                             (m (:pointer as-double-matrix))
                             (rect-in (:pointer as-double-rect)))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl
                            :language
                            :ansi-c)
(define-foreign-funcallable as-file-open-with-virtual-eof-selproto
                            ((f-n as-file)
                             (virtual-eof as-file-pos64)
                             (new-file (:pointer as-file)))
                            :result-type
                            as-int32
                            :calling-convention
                            :cdecl
                            :language
                            :ansi-c)

;; #include <ASCalls.h>
;; line 104
(define-c-typedef as-calls-hft-version-10 as-calls-hft)
;; line 517
(define-c-typedef as-float-to-fixed float-to-as-fixed)
