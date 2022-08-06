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
(define-c-typedef as-size :size-t)
;; line 149
(define-c-typedef as-int-ptr :intptr)

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
(define-c-typedef a-sl-file-mode as-uns32)
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
(define-c-typedef as-real float)
;; line 1188
(define-c-typedef as-double double)
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
(define-c-typedef cstring-ptr (:pointer :byte))
;; line 2186
(define-c-typedef posix-path-ptr (:pointer :byte))
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
;; line 308
(defconstant +as-raise-sel+ 1)
;; line 308
(defconstant +as-push-exception-frame-sel+ 2)
;; line 308
(defconstant +as-pop-exception-frame-sel+ 3)
;; line 308
(defconstant +as-get-exception-error-code-sel+ 4)
;; line 308
(defconstant +as-atom-from-string-sel+ 5)
;; line 308
(defconstant +as-atom-exists-for-string-sel+ 6)
;; line 308
(defconstant +as-atom-get-string-sel+ 7)
;; line 308
(defconstant +as-callback-create-sel+ 8)
;; line 308
(defconstant +as-callback-destroy-sel+ 9)
;; line 308
(defconstant +as-extension-mgr-get-hft-sel+ 10)
;; line 308
(defconstant +as-get-configuration-sel+ 11)
;; line 308
(defconstant +as-enum-extensions-sel+ 12)
;; line 308
(defconstant +as-extension-get-file-name-sel+ 13)
;; line 308
(defconstant +as-extension-get-registered-name-sel+ 14)
(define-foreign-funcallable as-raise-selproto
                            ((error as-error-code))
                            :result-type
                            :void)
(define-foreign-funcallable as-push-exception-frame-selproto
                            ((as-environ (:pointer :void))
                             (restore-func ac-restore-environ-proc))
                            :result-type
                            :void)
(define-foreign-funcallable as-pop-exception-frame-selproto
                            nil
                            :result-type
                            :void)
(define-foreign-funcallable as-get-exception-error-code-selproto
                            nil
                            :result-type
                            as-error-code)
(define-foreign-funcallable as-atom-from-string-selproto
                            ((name-str (:pointer :byte)))
                            :result-type
                            as-atom)
(define-foreign-funcallable as-atom-exists-for-string-selproto
                            ((name-str (:pointer :byte))
                             (atom (:pointer as-atom)))
                            :result-type
                            as-bool)
(define-foreign-funcallable as-atom-get-string-selproto
                            ((atm as-atom))
                            :result-type
                            (:pointer :byte))
(define-foreign-funcallable as-callback-create-selproto
                            ((extension-id as-extension)
                             (proc (:pointer :void)))
                            :result-type
                            as-callback)
(define-foreign-funcallable as-callback-destroy-selproto
                            ((callback as-callback))
                            :result-type
                            :void)
(define-foreign-funcallable as-extension-mgr-get-hft-selproto
                            ((name as-atom) (version as-version))
                            :result-type
                            hft)
(define-foreign-funcallable as-get-configuration-selproto
                            ((key as-atom))
                            :result-type
                            (:pointer :void))
(define-foreign-funcallable as-enum-extensions-selproto
                            ((proc as-extension-enum-proc)
                             (client-data (:pointer :void))
                             (only-living-extensions as-bool))
                            :result-type
                            as-extension)
(define-foreign-funcallable as-extension-get-file-name-selproto
                            ((extension as-extension)
                             (buffer (:pointer :byte))
                             (buf-size ast-array-size))
                            :result-type
                            ast-array-size)
(define-foreign-funcallable as-extension-get-registered-name-selproto
                            ((extension as-extension))
                            :result-type
                            as-atom)

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
        (nconc (list 'as-raise-selproto
                     '(foreign-typed-aref 'hft-entry
                                          *g-core-hft*
                                          +as-raise-sel+))
               args)
        (list 'error "Not implemented")))
;; line 438
(defmacro as-push-exception-frame (&rest args)
  (list 'if
        (list '>= '*g-core-version* '+core-hft-version-2+)
        (nconc (list 'as-push-exception-frame-selproto
                     '(foreign-typed-aref 'hft-entry
                                          *g-core-hft*
                                          +as-push-exception-frame-sel+))
               args)
        (list 'error "Not implemented")))
;; line 445
(defmacro as-pop-exception-frame (&rest args)
  (list 'if
        (list '>= '*g-core-version* '+core-hft-version-2+)
        (nconc (list 'as-pop-exception-frame-selproto
                     '(foreign-typed-aref 'hft-entry
                                          *g-core-hft*
                                          +as-pop-exception-frame-sel+))
               args)
        (list 'error "Not implemented")))
;; line 452
(defmacro as-get-exception-error-code (&rest args)
  (list 'if
        (list '>= '*g-core-version* '+core-hft-version-2+)
        (nconc (list 'as-get-exception-error-code-selproto
                     '(foreign-typed-aref 'hft-entry
                                          *g-core-hft*
                                          +as-get-exception-error-code-sel+))
               args)
        (list 'error "Not implemented")))
;; line 461
(defmacro as-atom-from-string (&rest args)
  (list 'if
        (list '>= '*g-core-version* '+core-hft-version-2+)
        (nconc (list 'as-atom-from-string-selproto
                     '(foreign-typed-aref 'hft-entry
                                          *g-core-hft*
                                          +as-atom-from-string-sel+))
               args)
        (list 'error "Not implemented")))
;; line 468
(defmacro as-atom-exists-for-string (&rest args)
  (list 'if
        (list '>= '*g-core-version* '+core-hft-version-2+)
        (nconc (list 'as-atom-exists-for-string-selproto
                     '(foreign-typed-aref 'hft-entry
                                          *g-core-hft*
                                          +as-atom-exists-for-string-sel+))
               args)
        (list 'error "Not implemented")))
;; line 475
(defmacro as-atom-get-string (&rest args)
  (list 'if
        (list '>= '*g-core-version* '+core-hft-version-2+)
        (nconc (list 'as-atom-get-string-selproto
                     '(foreign-typed-aref 'hft-entry
                                          *g-core-hft*
                                          +as-atom-get-string-sel+))
               args)
        (list 'error "Not implemented")))
;; line 510
(defmacro as-callback-destroy (&rest args)
  (list 'if
        (list '>= '*g-core-version* '+core-hft-version-2+)
        (nconc (list 'as-callback-destroy-selproto
                     '(foreign-typed-aref 'hft-entry
                                          *g-core-hft*
                                          +as-callback-destroy-sel+))
               args)
        (list 'error "Not implemented")))
;; line 515
(defmacro as-extension-mgr-get-hft (&rest args)
  (list 'if
        (list '>= '*g-core-version* '+core-hft-version-2+)
        (nconc (list 'as-extension-mgr-get-hft-selproto
                     '(foreign-typed-aref 'hft-entry
                                          *g-core-hft*
                                          +as-extension-mgr-get-hft-sel+))
               args)
        (list 'error "Not implemented")))
;; line 528
(defmacro as-get-configuration (&rest args)
  (list 'if
        (list '>= '*g-core-version* '+core-hft-version-2+)
        (nconc (list 'as-get-configuration-selproto
                     '(foreign-typed-aref 'hft-entry
                                          *g-core-hft*
                                          +as-get-configuration-sel+))
               args)
        (list 'error "Not implemented")))
;; line 534
(defmacro as-enum-extensions (&rest args)
  (list 'if
        (list '>= '*g-core-version* '+core-hft-version-4+)
        (nconc (list 'as-enum-extensions-selproto
                     '(foreign-typed-aref 'hft-entry
                                          *g-core-hft*
                                          +as-enum-extensions-sel+))
               args)
        (list 'error "Not implemented")))
