;;; This file was generated automatically from Acrobat Pro's SDK headers.

(in-package :pdf-plugin-tools) 

;; #include <PEExpT.h>
;; line 46
(define-c-typedef pex1 ac-cb1)
;; line 47
(define-c-typedef pex2 ac-cb2)
;; line 105
(define-opaque-pointer pde-object -t-pdeobject)
;; line 119
(define-opaque-pointer pde-content -t-pdecontent)
;; line 140
(define-opaque-pointer pde-element -t-pdeelement)
;; line 163
(define-opaque-pointer pde-text -t-pdetext)
;; line 171
(define-opaque-pointer pde-path -t-pdepath)
;; line 180
(define-opaque-pointer pde-image -t-pdeimage)
;; line 199
(define-opaque-pointer pde-form -t-pdeform)
;; line 207
(define-opaque-pointer pde-ps -t-pdeps)
;; line 214
(define-opaque-pointer pde-xobject -t-pdexobject)
;; line 229
(define-opaque-pointer pde-place -t-pdeplace)
;; line 234
(define-opaque-pointer pde-unknown -t-pdeunknown)
;; line 245
(define-opaque-pointer pde-container -t-pdecontainer)
;; line 254
(define-opaque-pointer pde-group -t-pdegroup)
;; line 262
(define-opaque-pointer pde-shading -t-pdeshading)
;; line 270
(define-opaque-pointer pde-begin-container -t-pdebegin-container)
;; line 278
(define-opaque-pointer pde-end-container -t-pdeend-container)
;; line 285
(define-opaque-pointer pde-begin-group -t-pdebegin-group)
;; line 292
(define-opaque-pointer pde-end-group -t-pdeend-group)
;; line 310
(define-opaque-pointer pde-font -t-pdefont)
;; line 321
(define-opaque-pointer pde-color-space -t-pdecolor-space)
;; line 339
(define-opaque-pointer pde-clip -t-pdeclip)
;; line 347
(define-opaque-pointer pde-ext-gstate -t-pdeext-gstate)
;; line 355
(define-opaque-pointer pde-pattern -t-pdepattern)
;; line 362
(define-opaque-pointer pde-device-ncolors -t-pdedevice-ncolors)
;; line 367
(define-opaque-pointer pde-state -t-pdestate)
;; line 372
(define-opaque-pointer pde-emit-state-p -t-pdeemit-state)
;; line 382
(define-opaque-pointer pde-soft-mask -t-pdesoft-mask)
;; line 391
(define-opaque-pointer pde-xgroup -t-pdexgroup)
;; line 396
(define-opaque-pointer pde-reader -t-pdereader)
;; line 401
(define-opaque-pointer pde-writer -t-pdewriter)
;; line 410
(define-opaque-pointer pd-sys-encoding -t-pdsys-encoding)
;; line 415
(define-opaque-pointer pde-doc -t-pdedoc)
;; line 420
(define-opaque-pointer pde-page -t-pdepage)
;; line 425
(define-opaque-pointer pde-text-item -t-pdetext-item)
;; line 429
(define-opaque-pointer pde-image-flate -t-pdeimage-flate)
;; line 434
(define-opaque-pointer pde-image-jpx -t-pdeimage-jpx)
;; line 439
(define-opaque-pointer jpxcolor-space -t-jpxcolor-space)
;; line 444
(define-opaque-pointer jpxpalette -t-jpxpalette)
;; line 448
(define-opaque-pointer pde-svgcontent -t-pdesvgcontent)
;; line 1952
(define-c-typedef pde-white-point-flt pde-xyzcolor-flt)
;; line 1958
(define-c-typedef pde-black-point-flt pde-xyzcolor-flt)
;; line 2038
(define-c-typedef pde-pattern-color-space pde-color-space)
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +k-pdefill-cspace-was-set+ 1))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +k-pdefill-cvalue-was-set+ 2))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +k-pdestroke-cspace-was-set+ 4))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +k-pdestroke-cvalue-was-set+ 8))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +k-pdedash-was-set+ 16))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +k-pdeline-width-was-set+ 32))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +k-pdemiter-limit-was-set+ 64))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +k-pdeflatness-was-set+ 128))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +k-pdeline-cap-was-set+ 256))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +k-pdeline-join-was-set+ 512))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +k-pderender-intent-was-set+ 1024))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +k-pdeext-gstate-was-set+ 2048))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +k-pdesoft-mask-matrix-was-set+ 4096))
(define-c-typedef pde-graphic-state-was-set-flags :int)
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +k-pdechar-spacing-was-set+ 1))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +k-pdeword-spacing-was-set+ 2))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +k-pderender-mode-was-set+ 4))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +k-pdefont-size-was-set+ 8))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +k-pdehscale-was-set+ 16))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +k-pdetext-rise-was-set+ 32))
(define-c-typedef pde-text-state-was-set-flags :int)
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +k-pdecontent+ 0))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +k-pdetext+ 1))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +k-pdepath+ 2))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +k-pdeimage+ 3))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +k-pdeform+ 4))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +k-pdeps+ 5))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +k-pdexobject+ 6))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +k-pdeclip+ 7))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +k-pdefont+ 8))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +k-pdecolor-space+ 9))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +k-pdeext-gstate+ 10))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +k-pdeplace+ 11))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +k-pdecontainer+ 12))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +k-pdsys-font+ 13))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +k-pdepattern+ 14))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +k-pdedevice-ncolors+ 15))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +k-pdeshading+ 16))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +k-pdegroup+ 17))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +k-pdeunknown+ 18))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +k-pdebegin-container+ 19))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +k-pdeend-container+ 20))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +k-pdebegin-group+ 21))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +k-pdeend-group+ 22))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +k-pdexgroup+ 23))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +k-pdesoft-mask+ 24))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +k-pdsys-encoding+ 25))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +k-pdedoc+ 26))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +k-pdepage+ 27))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +k-pdereader+ 28))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +k-pdewriter+ 29))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +k-pdetext-item+ 30))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +k-pdeimage-flate+ 31))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +k-pdeimage-jpx+ 32))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +k-jpxcolor-space+ 33))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +k-jpxpalette+ 34))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +k-pdesvgcontent+ 35))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +k-pdelast-type+ 36))
(define-c-typedef pde-type :int)
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +k-pdecontent-to-page+ 1))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +k-pdecontent-to-form+ 2))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +k-pdecontent-to-char-proc+ 4))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +k-pdecontent-rev1compat+ 8))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +k-pdecontent-do-not-resolve-forms+ 16))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +k-pdecontent-do-not-resolve-type3+ 32))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +dictionary+ 33))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +k-pdecontent-emit-default-rgband-gray+ 64))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +k-pdecontent-inherit-state+ 128))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +k-pdecontent-do-not-emit-bxex+ 256))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +k-pdecontent-use-max-precision+ 512))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +k-pdecontent-use-space-as-eol+ 1024))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +k-pdecontent-honor-was-set-flags+ 2048))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +k-pdecontent-skip-bbox+ 4096))
(define-c-typedef pde-content-to-cos-obj-flags :int)
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +k-pdecontent-ignore-marked-content+ 1))
(define-c-typedef pde-enum-elements-flags :int)
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +k-pdeget-fonts+ 0))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +k-pdeget-xobjects+ 1))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +k-pdeget-color-spaces+ 2))
(define-c-typedef pde-content-get-resource-flags :int)
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +k-pdeset-cache-device+ 1))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +k-pdeset-char-width+ 2))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +k-pdeform-matrix+ 4))
(define-c-typedef pde-content-flags :int)
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +k-pdetext-run+ 1))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +k-pdetext-char+ 2))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +k-pdetext-page-space+ 4))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +k-pdetext-get-bounds+ 8))
(define-c-typedef pde-text-flags :int)
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +k-pdetext-fill+ 0))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +k-pdetext-stroke+ 1))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +k-pdetext-fill-and-stroke+ 2))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +k-pdetext-invisible+ 3))
(define-c-typedef pde-text-render-mode :int)
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +k-pdemove-to+ 0))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +k-pdeline-to+ 1))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +k-pdecurve-to+ 2))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +k-pdecurve-to-v+ 3))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +k-pdecurve-to-y+ 4))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +k-pderect+ 5))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +k-pdeclose-path+ 6))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +k-pdepath-last-type+ 7))
(define-c-typedef pde-path-element-type :int)
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +k-pdeinvisible+ 0))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +k-pdestroke+ 1))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +k-pdefill+ 2))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +fill+ 3))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +k-pdeeo-fill+ 4))
(define-c-typedef pde-path-op-flags :int)
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +k-pdeimage-external+ 1))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +k-pdeimage-is-mask+ 2))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +k-pdeimage-interpolate+ 4))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +k-pdeimage-have-decode+ 8))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +k-pdeimage-is-indexed+ 16))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +k-pdeimage-masked-by-position+ 32))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +k-pdeimage-masked-by-color+ 64))
(define-c-typedef pde-image-attr-flags :int)
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +k-pdeimage-encoded-data+ 1))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +k-pdeimage-allow-delayed-read+ 2))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +k-pdeimage16bpc-data+ 4))
(define-c-typedef pde-image-data-flags :int)
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +k-pdeimage-convert16bpc-color-space+ 1))
(define-c-typedef pde-image-color-space-flags :int)
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +k-pdepsexternal+ 1))
(define-c-typedef pde-psflags :int)
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +k-pdeelement-copy-for-clip+ 1))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +k-pdeelement-copy-clipping+ 2))
(define-c-typedef pde-element-copy-flags :int)
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +k-pdefont-create-embedded+ 1))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +k-pdefont-will-subset+ 2))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +k-pdefont-do-not-embed+ 4))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +k-pdefont-encode-by-gid+ 8))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +k-pdefont-defer-widths+ 16))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +k-pdefont-create-subset+ +k-pdefont-will-subset+))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +k-pdefont-create-gidoverride+ 32))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +k-pdefont-create-to-unicode+ 64))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +k-pdefont-create-all-widths+ 128))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +k-pdefont-create-embed-open-type+ 256))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +k-pdefont-create-reserved1+ 512))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +k-pdefont-create-full-cidset+ 1024))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +k-pdefont-throw-if-to-unicode-uses-pua+ 2048))
(define-c-typedef pde-font-create-flags :int)
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +k-pdefont-create-need-widths+ 65536))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +k-pdefont-create-need-to-unicode+ 131072))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +k-pdefont-create-need-embed+ 262144))
(define-c-typedef pde-font-create-need-flags :int)
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +k-pdsys-font-unknown+ 0))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +k-pdsys-font-type1+ 1))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +k-pdsys-font-true-type+ 2))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +k-pdsys-font-cid+ 3))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +k-pdsys-font-atc+ 4))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +k-pdsys-font-ocf+ 5))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +k-pdsys-font-open-type-cff+ 6))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +k-pdsys-font-open-type-cid+ 7))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +k-pdsys-font-open-type-tt+ 8))
(define-c-typedef pd-sys-font-package-type :int)
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +k-pdesoft-mask-type-luminosity+ 1))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +k-pdesoft-mask-type-alpha+ 2))
(define-c-typedef pde-soft-mask-create-flags :int)
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +k-pdexgroup-type-transparency+ 1))
(define-c-typedef pde-xgroup-create-flags :int)
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +k-pdcode-page-win-east-european-roman+ 1250))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +k-pdcode-page-win-cyrillic+ 1251))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +k-pdcode-page-win-greek+ 1253))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +k-pdcode-page-win-turkish+ 1254))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +k-pdcode-page-win-hebrew+ 1255))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +k-pdcode-page-win-arabic+ 1256))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +k-pdcode-page-win-baltic+ 1257))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +k-pdcode-page-mac-central-european+ -9994))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +k-pdcode-page-mac-croatian+ -9993))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +k-pdcode-page-mac-romanian+ -9992))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +k-pdcode-page-mac-cyrillic+ -9991))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +k-pdcode-page-mac-ukrainian+ -9990))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +k-pdcode-page-mac-greek+ -9989))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +k-pdcode-page-mac-turkish+ -9988))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +k-pdcode-page-mac-hebrew+ -9987))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +k-pdcode-page-mac-arabic+ -9986))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +k-jpxcsunknown+ 0))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +k-jpxcsenumerated+ 1))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +k-jpxcsrestricted-icc+ 2))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +k-jpxcsany-icc+ 3))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +k-jpxcsvender-color+ 4))
(define-c-typedef jpxcolor-space-type :int)
(define-c-typedef pde-element-enum-proc
                  (:pointer
                   (:function
                    (pde-element (:pointer :void))
                    as-bool
                    :calling-convention
                    :cdecl)))
(define-c-typedef pde-clip-enum-proc
                  (:pointer
                   (:function
                    (pde-element (:pointer :void))
                    as-bool
                    :calling-convention
                    :cdecl)))
(define-c-typedef pde-object-dump-proc
                  (:pointer
                   (:function
                    (pde-object
                     (:reference-pass :ef-mb-string)
                     (:pointer :void))
                    :void
                    :calling-convention
                    :cdecl)))
(define-c-typedef pde-attr-enum-proc
                  (:pointer
                   (:function
                    ((:pointer :void)
                     as-uns32
                     as-uns16
                     (:pointer :void))
                    as-bool
                    :calling-convention
                    :cdecl)))
(define-c-struct pde-content-attrs
                 (flags as-uns32)
                 (cache-device (:c-array as-fixed 8))
                 (form-type as-int32)
                 (bbox as-fixed-rect)
                 (matrix as-fixed-matrix)
                 (xuid cos-obj))
(define-c-typedef pde-content-attrs-p (:pointer pde-content-attrs))
(define-c-struct pde-color-value
                 (color (:c-array as-fixed 7))
                 (color-obj2 pde-object)
                 (color-obj pde-object))
(define-c-typedef pde-color-value-p (:pointer pde-color-value))
(define-c-struct pde-color-spec
                 (space pde-color-space)
                 (value pde-color-value))
(define-c-typedef pde-color-spec-p (:pointer pde-color-spec))
(define-c-struct pde-dash
                 (dash-phase as-fixed)
                 (dash-len as-int32)
                 (dashes (:c-array as-fixed 11)))
(define-c-typedef pde-dash-p (:pointer pde-dash))
(define-c-struct pde-graphic-state
                 (was-set-flags as-uns32)
                 (fill-color-spec pde-color-spec)
                 (stroke-color-spec pde-color-spec)
                 (dash pde-dash)
                 (line-width as-fixed)
                 (miter-limit as-fixed)
                 (flatness as-fixed)
                 (line-cap as-int32)
                 (line-join as-int32)
                 (render-intent as-atom)
                 (ext-gstate pde-ext-gstate)
                 (soft-mask-matrix as-fixed-matrix))
(define-c-typedef pde-graphic-state-p (:pointer pde-graphic-state))
(define-c-struct pde-text-state
                 (was-set-flags as-uns32)
                 (char-spacing as-fixed)
                 (word-spacing as-fixed)
                 (render-mode as-int32)
                 (font-size as-fixed)
                 (h-scale as-fixed)
                 (text-rise as-fixed))
(define-c-typedef pde-text-state-p (:pointer pde-text-state))
(define-c-struct pde-image-attrs
                 (flags as-uns32)
                 (width as-int32)
                 (height as-int32)
                 (bits-per-component as-int32)
                 (decode (:c-array as-fixed 8))
                 (intent as-atom))
(define-c-typedef pde-image-attrs-p (:pointer pde-image-attrs))
(define-c-typedef pde-image-flate-attrs pde-image-attrs)
(define-c-typedef pde-image-flate-attrs-p
                  (:pointer pde-image-flate-attrs))
(define-c-struct pde-filter-spec
                 (decode-parms cos-obj)
                 (encode-parms cos-obj)
                 (name as-atom)
                 (padding as-int16))
(define-c-typedef pde-filter-spec-p (:pointer pde-filter-spec))
(define-c-struct pde-filter-array
                 (num-filters as-int32)
                 (spec (:c-array pde-filter-spec 1)))
(define-c-typedef pde-filter-array-p (:pointer pde-filter-array))
(define-c-struct pde-psattrs (flags as-uns32))
(define-c-typedef pde-psattrs-p (:pointer pde-psattrs))
(define-c-struct pde-font-attrs
                 (name as-atom)
                 (type as-atom)
                 (char-set as-atom)
                 (encoding as-atom)
                 (flags as-uns32)
                 (font-bbox as-fixed-rect)
                 (missing-width as-int16)
                 (stem-v as-int16)
                 (stem-h as-int16)
                 (cap-height as-int16)
                 (x-height as-int16)
                 (ascent as-int16)
                 (descent as-int16)
                 (leading as-int16)
                 (max-width as-int16)
                 (avg-width as-int16)
                 (italic-angle as-int16)
                 (cid-font-type as-atom)
                 (w-mode as-int16)
                 (ps-name as-atom)
                 (platform-name as-atom)
                 (lang as-atom)
                 (registry as-atom)
                 (ordering as-atom)
                 (supplement as-int32)
                 (cant-embed as-int32)
                 (delta-encoding as-atom)
                 (protection as-uns32)
                 (package-type as-int32))
(define-c-typedef pde-font-attrs-p (:pointer pde-font-attrs))
(define-c-struct pde-font-create-params-rec
                 (attrs-p pde-font-attrs-p)
                 (attrs-size as-uns32)
                 (first-char as-int32)
                 (last-char as-int32)
                 (widths-p (:pointer as-int16))
                 (encoding-base-name as-atom)
                 (font-stm as-stm)
                 (len1 as-int32)
                 (len2 as-int32)
                 (len3 as-int32)
                 (has-dw as-bool)
                 (dw as-int32)
                 (w cos-obj)
                 (has-dw2 as-bool)
                 (dw2 (:c-array as-int32 2))
                 (w2 cos-obj)
                 (to-unicode-len as-int32)
                 (to-unicode-stm as-stm)
                 (cid-to-gid-map-stm as-stm)
                 (panose-no (:reference-pass :ef-mb-string))
                 (fd cos-obj)
                 (cid-set-stm as-stm)
                 (flags as-uns32)
                 (mm-design-vec (:pointer as-fixed))
                 (source-font-type as-atom))
(define-c-typedef pde-font-create-params
                  (:pointer pde-font-create-params-rec))
(define-c-struct pde-font-create-from-sys-font-params-rec
                 (struct-size as-uns32)
                 (flags as-uns32)
                 (snapshot-name as-atom)
                 (mm-design-vec (:pointer as-fixed))
                 (ct-code-page :long)
                 (encoding as-atom)
                 (cos-doc cos-doc))
(define-c-typedef pde-font-create-from-sys-font-params
                  (:pointer pde-font-create-from-sys-font-params-rec))
(define-c-struct pde-glyph-description
                 (glyph-id as-uns32)
                 (char-indices (:pointer as-int16))
                 (char-indices-len as-int32)
                 (x-position as-real)
                 (y-position as-real))
(define-c-typedef pde-glyph-description-p
                  (:pointer pde-glyph-description))
(define-c-struct pde-glyph-run
                 (glyphs pde-glyph-description-p)
                 (glyph-len as-int32)
                 (uni-text (:pointer as-utf32val))
                 (uni-text-len as-int32))
(define-c-typedef pde-glyph-run-p (:pointer pde-glyph-run))
(define-c-struct pde-span-item
                 (first-glyph as-int32)
                 (n-glyphs as-int32)
                 (first-uni-char as-int32)
                 (n-uni-chars as-int32))
(define-c-typedef pde-span-item-p (:pointer pde-span-item))
(define-c-struct pde-span-set
                 (spans pde-span-item-p)
                 (span-count as-int32))
(define-c-typedef pde-span-set-p (:pointer pde-span-set))
(define-c-struct pde-color-range-flt (min :float) (max :float))
(define-c-struct pde-xyzcolor-flt (x :float) (y :float) (z :float))
(define-c-struct pde-gray-cal-flt
                 (white-point pde-white-point-flt)
                 (black-point pde-black-point-flt)
                 (gamma :float))
(define-c-struct pde-rgbcal-flt
                 (white-point pde-white-point-flt)
                 (black-point pde-black-point-flt)
                 (red-gamma :float)
                 (green-gamma :float)
                 (blue-gamma :float)
                 (matrix (:c-array :float 9)))
(define-c-struct pde-lab-cal-flt
                 (white-point pde-white-point-flt)
                 (black-point pde-black-point-flt)
                 (range-a pde-color-range-flt)
                 (range-b pde-color-range-flt))
(define-c-struct pde-iccbased-color-data
                 (size as-size-t)
                 (iccstream as-stm)
                 (n-comps as-uns32)
                 (alt-cs pde-color-space))
(define-c-struct pde-indexed-color-data
                 (size as-size-t)
                 (base-cs pde-color-space)
                 (hival as-uns16)
                 (lookup (:reference-pass :ef-mb-string))
                 (lookup-len as-uns32))
(define-c-struct pde-separation-color-data
                 (size as-size-t)
                 (name as-atom)
                 (alt pde-color-space)
                 (tint-transform cos-obj))
(define-c-struct pde-device-ncolor-data
                 (size as-size-t)
                 (names (:pointer as-atom))
                 (n-names as-uns32)
                 (alt pde-color-space)
                 (tint-transform cos-obj))
(define-c-union pde-color-space-struct
                (cal-gray (:pointer pde-gray-cal-flt))
                (cal-rgb (:pointer pde-rgbcal-flt))
                (lab (:pointer pde-lab-cal-flt))
                (icc (:pointer pde-iccbased-color-data))
                (indexed (:pointer pde-indexed-color-data))
                (patternbase pde-pattern-color-space)
                (sep (:pointer pde-separation-color-data))
                (devn (:pointer pde-device-ncolor-data)))
(define-c-struct pde-image-jpxattrs
                 (flags as-uns32)
                 (width as-int32)
                 (height as-int32)
                 (tile-width as-int32)
                 (tile-height as-int32)
                 (n-resolutions as-int32)
                 (n-components as-int32)
                 (bpc (:c-array as-int32 24))
                 (decode (:c-array as-fixed 24)))
(define-c-typedef pde-image-jpxattrs-p (:pointer pde-image-jpxattrs))
(define-c-struct jpxcsenum-attrs
                 (enum-number as-uns32)
                 (std-illuminant as-bool)
                 (illuminant as-uns32)
                 (lab-range (:c-array as-uns32 3))
                 (lab-offset (:c-array as-uns32 3)))
(define-c-typedef jpxcsenum-attrs-p (:pointer jpxcsenum-attrs))

;; #include <PDSysFontExpT.h>
;; line 39
(define-c-typedef atsfont-ref uint32)
;; line 40
(define-c-typedef atsfont-family-ref uint32)
;; line 50
(define-c-typedef pd-sys-font-mode as-int16)
;; line 53
(define-c-typedef pd-sys-font-fref atsfont-ref)
;; line 55
(define-c-typedef pd-sys-font-font-family-ref atsfont-family-ref)
;; line 59
(define-c-typedef pd-sys-font-fstyle as-int16)
;; line 71
(define-opaque-pointer pd-sys-font -t-pdsys-font)
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +k-pdsys-font-match-name-and-char-set+ 1))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +k-pdsys-font-match-font-type+ 2))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +k-pdsys-font-match-writing-mode+ 4))
(define-c-typedef pd-sys-font-match-flags :int)
(define-c-typedef pd-sys-font-enum-proc
                  (:pointer
                   (:function
                    (pd-sys-font (:pointer :void))
                    as-bool
                    :calling-convention
                    :cdecl)))
(define-c-struct pde-font-info-rec
                 (name as-atom)
                 (type as-atom)
                 (char-set as-atom)
                 (encoding as-atom)
                 (w-mode pd-sys-font-mode))
(define-c-typedef pde-font-info-p (:pointer pde-font-info-rec))
(define-c-struct pd-sys-font-plat-data
                 (size as-size-t)
                 (font-ref pd-sys-font-fref))
(define-c-typedef pd-sys-font-plat-data-p
                  (:pointer pd-sys-font-plat-data))

;; #include <PERProcs.h>
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +pde-content-create-from-cos-obj-sel+ 1))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +pde-content-get-attrs-sel+ 2))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +pde-content-get-resources-sel+ 3))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +pde-content-get-num-elems-sel+ 4))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +pde-content-get-elem-sel+ 5))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +pde-element-get-bbox-sel+ 6))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +pde-element-get-gstate-sel+ 7))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +pde-element-get-matrix-sel+ 8))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +pde-element-get-clip-sel+ 9))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +pde-text-get-num-chars-sel+ 10))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +pde-text-get-num-runs-sel+ 11))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +pde-text-run-get-char-offset-sel+ 12))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +pde-text-get-run-for-char-sel+ 13))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +pde-text-run-get-num-chars-sel+ 14))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +pde-path-get-data-sel+ 15))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +pde-path-get-paint-op-sel+ 16))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +pde-image-get-attrs-sel+ 17))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +pde-image-get-color-space-sel+ 18))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +pde-image-is-cos-obj-sel+ 19))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +pde-image-data-is-encoded-sel+ 20))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +pde-image-get-data-sel+ 21))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +pde-image-get-data-stm-sel+ 22))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +pde-image-get-data-len-sel+ 23))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +pde-image-get-filter-array-sel+ 24))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +pde-image-get-cos-obj-sel+ 25))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +pde-clip-get-num-elems-sel+ 26))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +pde-clip-get-elem-sel+ 27))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +pde-xobject-get-cos-obj-sel+ 28))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +pde-form-get-cos-obj-sel+ 29))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +pde-psget-attrs-sel+ 30))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +pde-psget-data-sel+ 31))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +pde-psget-data-stm-sel+ 32))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +pde-font-get-attrs-sel+ 33))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +pde-font-get-widths-sel+ 34))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +pde-font-get-cos-obj-sel+ 35))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +pde-color-space-get-name-sel+ 36))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +pde-color-space-get-cos-obj-sel+ 37))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +pde-color-space-get-num-comps-sel+ 38))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +pde-color-space-get-base-sel+ 39))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +pde-color-space-get-hi-val-sel+ 40))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +pde-color-space-get-ctable-sel+ 41))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +pde-object-get-type-sel+ 42))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +pde-acquire-sel+ 43))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +pde-release-sel+ 44))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +pde-object-dump-sel+ 45))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +pde-log-dump-sel+ 46))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +pde-attr-enum-table-sel+ 47))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +pde-ext-gstate-get-cos-obj-sel+ 48))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +pde-place-get-mctag-sel+ 49))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +pde-place-get-dict-sel+ 50))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +pde-container-get-mctag-sel+ 51))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +pde-container-get-dict-sel+ 52))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +pde-container-get-content-sel+ 53))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +pde-color-space-get-base-num-comps-sel+ 54))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +pde-default-gstate-sel+ 55))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +pde-pattern-get-cos-obj-sel+ 56))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +pde-font-sum-widths-sel+ 57))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +pde-font-get-num-code-bytes-sel+ 58))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +pde-device-ncolors-get-color-value-sel+ 59))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +pde-group-get-content-sel+ 60))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +pde-clip-flattened-enum-elems-sel+ 61))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +pde-element-is-at-point-sel+ 62))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +pde-element-is-at-rect-sel+ 63))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +pde-font-get-one-byte-encoding-sel+ 64))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +pde-shading-get-cos-obj-sel+ 65))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +pde-unknown-get-op-name-sel+ 66))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +pde-content-get-default-color-space-sel+ 67))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +pde-image-get-decode-array-sel+ 68))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +pde-begin-container-get-mctag-sel+ 69))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +pde-begin-container-get-dict-sel+ 70))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +pde-soft-mask-get-cos-obj-sel+ 71))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +pde-soft-mask-acquire-form-sel+ 72))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +pde-soft-mask-get-backdrop-color-sel+ 73))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +pde-soft-mask-get-transfer-function-sel+ 74))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +pde-xgroup-get-cos-obj-sel+ 75))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +pde-xgroup-get-knockout-sel+ 76))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +pde-xgroup-get-isolated-sel+ 77))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +pde-xgroup-acquire-color-space-sel+ 78))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +pde-form-acquire-xgroup-sel+ 79))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +pde-form-has-xgroup-sel+ 80))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +pde-element-has-gstate-sel+ 81))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +pde-ext-gstate-get-opm-sel+ 82))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +pde-ext-gstate-get-opfill-sel+ 83))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +pde-ext-gstate-get-opstroke-sel+ 84))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +pde-ext-gstate-get-opacity-fill-sel+ 85))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +pde-ext-gstate-get-opacity-stroke-sel+ 86))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +pde-ext-gstate-get-blend-mode-sel+ 87))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +pde-ext-gstate-get-ais-sel+ 88))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +pde-ext-gstate-has-soft-mask-sel+ 89))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +pde-ext-gstate-acquire-soft-mask-sel+ 90))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +pde-image-has-smask-sel+ 91))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +pde-image-get-smask-sel+ 92))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +pde-image-get-matte-array-sel+ 93))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +pde-ext-gstate-get-tk-sel+ 94))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +pd-sys-encoding-get-wmode-sel+ 95))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +pd-sys-encoding-is-identity-sel+ 96))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +pd-sys-encoding-is-multi-byte-sel+ 97))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +pde-ext-gstate-get-sa-sel+ 98))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +pde-soft-mask-get-name-sel+ 99))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +pde-element-get-ocmd-sel+ 100))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +pde-element-is-currently-visible-sel+ 101))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +pde-element-get-all-visibilities-sel+ 102))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +pde-element-make-visible-sel+ 103))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +pde-font-is-embedded-sel+ 104))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +pde-font-get-sys-font-sel+ 105))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +pde-font-get-sys-encoding-sel+ 106))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +pde-text-item-get-font-sel+ 107))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +pde-text-item-get-text-matrix-sel+ 108))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +pde-text-item-get-text-state-sel+ 109))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +pde-text-item-get-text-len-sel+ 110))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +pde-text-item-copy-text-sel+ 111))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +pde-text-item-get-gstate-sel+ 112))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +pde-text-get-item-sel+ 113))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +pde-image-get-type-sel+ 114))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +pde-image-acquire-image-flate-sel+ 115))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +pde-image-acquire-image-jpx-sel+ 116))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +pde-image-jpxget-cos-obj-sel+ 117))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +pde-image-flate-get-cos-obj-sel+ 118))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +pde-image-flate-get-attrs-sel+ 119))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +pde-image-flate-acquire-color-space-sel+ 120))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +pde-image-flate-get-data-stm-sel+ 121))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +pde-image-jpxget-attrs-sel+ 122))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +pde-image-jpxacquire-color-space-sel+ 123))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +pde-image-jpxget-data-stm-sel+ 124))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +pde-image-jpxget-num-color-spaces-sel+ 125))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +pde-image-jpxacquire-jpxcolor-space-sel+ 126))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +pde-image-jpxhas-palette-sel+ 127))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +pde-image-jpxacquire-palette-sel+ 128))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +jpxpalette-get-num-entries-sel+ 129))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +jpxpalette-get-bit-depths-sel+ 130))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +jpxpalette-get-num-components-sel+ 131))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +jpxpalette-get-table-sel+ 132))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +jpxcolor-space-acquire-next-sel+ 133))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +jpxcolor-space-get-type-sel+ 134))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +jpxcolor-space-get-enum-attrs-sel+ 135))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +jpxcolor-space-get-profile-sel+ 136))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +pde-color-space-get-struct-sel+ 137))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +pde-image-get-color-space-ex-sel+ 138))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +pde-form-get-content-to-cos-obj-flags-sel+ 139))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +pde-element-get-matrix-ex-sel+ 140))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +pde-soft-mask-acquire-form-ex-sel+ 141))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +pde-text-item-get-text-matrix-ex-sel+ 142))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +pde-path-get-data-ex-sel+ 143))
;; sel = 1
(define-foreign-funcallable pde-content-create-from-cos-obj-selproto
                            ((contents (:pointer cos-obj))
                             (resources (:pointer cos-obj)))
                            :result-type
                            pde-content
                            :calling-convention
                            :cdecl)
;; sel = 2
(define-foreign-funcallable pde-content-get-attrs-selproto
                            ((pde-content pde-content)
                             (attrs-p pde-content-attrs-p)
                             (attrs-size as-uns32))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 3
(define-foreign-funcallable pde-content-get-resources-selproto
                            ((pde-content pde-content)
                             (type as-int32)
                             (resources-p (:pointer pde-object)))
                            :result-type
                            as-int32
                            :calling-convention
                            :cdecl)
;; sel = 4
(define-foreign-funcallable pde-content-get-num-elems-selproto
                            ((pde-content pde-content))
                            :result-type
                            as-int32
                            :calling-convention
                            :cdecl)
;; sel = 5
(define-foreign-funcallable pde-content-get-elem-selproto
                            ((pde-content pde-content)
                             (index as-int32))
                            :result-type
                            pde-element
                            :calling-convention
                            :cdecl)
;; sel = 6
(define-foreign-funcallable pde-element-get-bbox-selproto
                            ((pde-element pde-element)
                             (bbox-p as-fixed-rect-p))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 7
(define-foreign-funcallable pde-element-get-gstate-selproto
                            ((pde-element pde-element)
                             (state-p pde-graphic-state-p)
                             (state-size as-uns32))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 8
(define-foreign-funcallable pde-element-get-matrix-selproto
                            ((pde-element pde-element)
                             (matrix-p as-fixed-matrix-p))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 9
(define-foreign-funcallable pde-element-get-clip-selproto
                            ((pde-element pde-element))
                            :result-type
                            pde-clip
                            :calling-convention
                            :cdecl)
;; sel = 10
(define-foreign-funcallable pde-text-get-num-chars-selproto
                            ((pde-text pde-text))
                            :result-type
                            as-int32
                            :calling-convention
                            :cdecl)
;; sel = 11
(define-foreign-funcallable pde-text-get-num-runs-selproto
                            ((pde-text pde-text))
                            :result-type
                            as-int32
                            :calling-convention
                            :cdecl)
;; sel = 12
(define-foreign-funcallable pde-text-run-get-char-offset-selproto
                            ((pde-text pde-text) (run-index as-int32))
                            :result-type
                            as-int32
                            :calling-convention
                            :cdecl)
;; sel = 13
(define-foreign-funcallable pde-text-get-run-for-char-selproto
                            ((pde-text pde-text) (char-index as-int32))
                            :result-type
                            as-int32
                            :calling-convention
                            :cdecl)
;; sel = 14
(define-foreign-funcallable pde-text-run-get-num-chars-selproto
                            ((pde-text pde-text) (run-index as-int32))
                            :result-type
                            as-int32
                            :calling-convention
                            :cdecl)
;; sel = 15
(define-foreign-funcallable pde-path-get-data-selproto
                            ((path pde-path)
                             (data (:pointer as-int32))
                             (data-size as-uns32))
                            :result-type
                            as-uns32
                            :calling-convention
                            :cdecl)
;; sel = 16
(define-foreign-funcallable pde-path-get-paint-op-selproto
                            ((path pde-path))
                            :result-type
                            as-uns32
                            :calling-convention
                            :cdecl)
;; sel = 17
(define-foreign-funcallable pde-image-get-attrs-selproto
                            ((image pde-image)
                             (attrs-p pde-image-attrs-p)
                             (attrs-size as-uns32))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 18
(define-foreign-funcallable pde-image-get-color-space-selproto
                            ((image pde-image))
                            :result-type
                            pde-color-space
                            :calling-convention
                            :cdecl)
;; sel = 19
(define-foreign-funcallable pde-image-is-cos-obj-selproto
                            ((image pde-image))
                            :result-type
                            as-bool
                            :calling-convention
                            :cdecl)
;; sel = 20
(define-foreign-funcallable pde-image-data-is-encoded-selproto
                            ((image pde-image)
                             (encoded-len-p (:pointer as-uns32)))
                            :result-type
                            as-bool
                            :calling-convention
                            :cdecl)
;; sel = 21
(define-foreign-funcallable pde-image-get-data-selproto
                            ((image pde-image)
                             (flags as-uns32)
                             (buffer (:pointer as-uns8)))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 22
(define-foreign-funcallable pde-image-get-data-stm-selproto
                            ((image pde-image) (flags as-uns32))
                            :result-type
                            as-stm
                            :calling-convention
                            :cdecl)
;; sel = 23
(define-foreign-funcallable pde-image-get-data-len-selproto
                            ((image pde-image))
                            :result-type
                            as-int32
                            :calling-convention
                            :cdecl)
;; sel = 24
(define-foreign-funcallable pde-image-get-filter-array-selproto
                            ((image pde-image)
                             (filters-p pde-filter-array-p))
                            :result-type
                            as-int32
                            :calling-convention
                            :cdecl)
;; sel = 25
(define-foreign-funcallable pde-image-get-cos-obj-selproto
                            ((image pde-image)
                             (cos-obj-p (:pointer cos-obj)))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 26
(define-foreign-funcallable pde-clip-get-num-elems-selproto
                            ((clip pde-clip))
                            :result-type
                            as-int32
                            :calling-convention
                            :cdecl)
;; sel = 27
(define-foreign-funcallable pde-clip-get-elem-selproto
                            ((clip pde-clip) (index as-int32))
                            :result-type
                            pde-element
                            :calling-convention
                            :cdecl)
;; sel = 28
(define-foreign-funcallable pde-xobject-get-cos-obj-selproto
                            ((x-object pde-xobject)
                             (cos-obj-p (:pointer cos-obj)))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 29
(define-foreign-funcallable pde-form-get-cos-obj-selproto
                            ((form pde-form)
                             (cos-obj-p (:pointer cos-obj)))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 30
(define-foreign-funcallable pde-psget-attrs-selproto
                            ((ps pde-ps)
                             (attrs-p pde-psattrs-p)
                             (attrs-size as-uns32))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 31
(define-foreign-funcallable pde-psget-data-selproto
                            ((ps pde-ps)
                             (buffer (:pointer as-uns8))
                             (buffer-size as-uns32)
                             (offset as-int32))
                            :result-type
                            as-uns32
                            :calling-convention
                            :cdecl)
;; sel = 32
(define-foreign-funcallable pde-psget-data-stm-selproto
                            ((ps pde-ps))
                            :result-type
                            as-stm
                            :calling-convention
                            :cdecl)
;; sel = 33
(define-foreign-funcallable pde-font-get-attrs-selproto
                            ((font pde-font)
                             (attrs-p pde-font-attrs-p)
                             (attrs-size as-uns32))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 34
(define-foreign-funcallable pde-font-get-widths-selproto
                            ((font pde-font)
                             (widths-p (:pointer as-int16)))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 35
(define-foreign-funcallable pde-font-get-cos-obj-selproto
                            ((font pde-font)
                             (cos-obj-p (:pointer cos-obj)))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 36
(define-foreign-funcallable pde-color-space-get-name-selproto
                            ((color-space pde-color-space))
                            :result-type
                            as-atom
                            :calling-convention
                            :cdecl)
;; sel = 37
(define-foreign-funcallable pde-color-space-get-cos-obj-selproto
                            ((color-space pde-color-space)
                             (cos-obj-p (:pointer cos-obj)))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 38
(define-foreign-funcallable pde-color-space-get-num-comps-selproto
                            ((color-space pde-color-space))
                            :result-type
                            as-int32
                            :calling-convention
                            :cdecl)
;; sel = 39
(define-foreign-funcallable pde-color-space-get-base-selproto
                            ((color-space pde-color-space))
                            :result-type
                            as-atom
                            :calling-convention
                            :cdecl)
;; sel = 40
(define-foreign-funcallable pde-color-space-get-hi-val-selproto
                            ((color-space pde-color-space))
                            :result-type
                            as-int32
                            :calling-convention
                            :cdecl)
;; sel = 41
(define-foreign-funcallable pde-color-space-get-ctable-selproto
                            ((color-space pde-color-space)
                             (color-table-p (:pointer as-uns8)))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 42
(define-foreign-funcallable pde-object-get-type-selproto
                            ((obj pde-object))
                            :result-type
                            as-int32
                            :calling-convention
                            :cdecl)
;; sel = 43
(define-foreign-funcallable pde-acquire-selproto
                            ((obj pde-object))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 44
(define-foreign-funcallable pde-release-selproto
                            ((obj pde-object))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 45
(define-foreign-funcallable pde-object-dump-selproto
                            ((obj pde-object)
                             (levels as-int32)
                             (proc pde-object-dump-proc)
                             (client-data (:pointer :void)))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 46
(define-foreign-funcallable pde-log-dump-selproto
                            ((proc pde-object-dump-proc)
                             (client-data (:pointer :void)))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 47
(define-foreign-funcallable pde-attr-enum-table-selproto
                            ((enum-proc pde-attr-enum-proc)
                             (client-data (:pointer :void)))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 48
(define-foreign-funcallable pde-ext-gstate-get-cos-obj-selproto
                            ((ext-gstate pde-ext-gstate)
                             (cos-obj-p (:pointer cos-obj)))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 49
(define-foreign-funcallable pde-place-get-mctag-selproto
                            ((pde-place pde-place))
                            :result-type
                            as-atom
                            :calling-convention
                            :cdecl)
;; sel = 50
(define-foreign-funcallable pde-place-get-dict-selproto
                            ((pde-place pde-place)
                             (place-dict-p (:pointer cos-obj))
                             (is-inline (:pointer as-bool)))
                            :result-type
                            as-bool
                            :calling-convention
                            :cdecl)
;; sel = 51
(define-foreign-funcallable pde-container-get-mctag-selproto
                            ((pde-container pde-container))
                            :result-type
                            as-atom
                            :calling-convention
                            :cdecl)
;; sel = 52
(define-foreign-funcallable pde-container-get-dict-selproto
                            ((pde-container pde-container)
                             (place-dict-p (:pointer cos-obj))
                             (is-inline (:pointer as-bool)))
                            :result-type
                            as-bool
                            :calling-convention
                            :cdecl)
;; sel = 53
(define-foreign-funcallable pde-container-get-content-selproto
                            ((pde-container pde-container))
                            :result-type
                            pde-content
                            :calling-convention
                            :cdecl)
;; sel = 54
(define-foreign-funcallable pde-color-space-get-base-num-comps-selproto
                            ((color-space pde-color-space))
                            :result-type
                            as-int32
                            :calling-convention
                            :cdecl)
;; sel = 55
(define-foreign-funcallable pde-default-gstate-selproto
                            ((state-p pde-graphic-state-p)
                             (state-size as-int32))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 56
(define-foreign-funcallable pde-pattern-get-cos-obj-selproto
                            ((pattern pde-pattern)
                             (cos-obj-p (:pointer cos-obj)))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 57
(define-foreign-funcallable pde-font-sum-widths-selproto
                            ((font pde-font)
                             (text (:pointer as-uns8))
                             (len as-int32))
                            :result-type
                            as-int32
                            :calling-convention
                            :cdecl)
;; sel = 58
(define-foreign-funcallable pde-font-get-num-code-bytes-selproto
                            ((font pde-font)
                             (text (:pointer as-uns8))
                             (len as-int32))
                            :result-type
                            as-int16
                            :calling-convention
                            :cdecl)
;; sel = 59
(define-foreign-funcallable pde-device-ncolors-get-color-value-selproto
                            ((colors pde-device-ncolors)
                             (index as-int32))
                            :result-type
                            as-fixed
                            :calling-convention
                            :cdecl)
;; sel = 60
(define-foreign-funcallable pde-group-get-content-selproto
                            ((pde-group pde-group))
                            :result-type
                            pde-content
                            :calling-convention
                            :cdecl)
;; sel = 61
(define-foreign-funcallable pde-clip-flattened-enum-elems-selproto
                            ((clip pde-clip)
                             (enum-proc pde-clip-enum-proc)
                             (enum-proc-client-data (:pointer :void)))
                            :result-type
                            as-bool
                            :calling-convention
                            :cdecl)
;; sel = 62
(define-foreign-funcallable pde-element-is-at-point-selproto
                            ((elem pde-element) (point as-fixed-point))
                            :result-type
                            as-bool
                            :calling-convention
                            :cdecl)
;; sel = 63
(define-foreign-funcallable pde-element-is-at-rect-selproto
                            ((elem pde-element) (rect as-fixed-rect))
                            :result-type
                            as-bool
                            :calling-convention
                            :cdecl)
;; sel = 64
(define-foreign-funcallable pde-font-get-one-byte-encoding-selproto
                            ((font pde-font)
                             (encoding-delta (:pointer as-atom)))
                            :result-type
                            as-bool
                            :calling-convention
                            :cdecl)
;; sel = 65
(define-foreign-funcallable pde-shading-get-cos-obj-selproto
                            ((shading pde-shading)
                             (cos-obj-p (:pointer cos-obj)))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 66
(define-foreign-funcallable pde-unknown-get-op-name-selproto
                            ((pde-unknown pde-unknown))
                            :result-type
                            as-atom
                            :calling-convention
                            :cdecl)
;; sel = 67
(define-foreign-funcallable pde-content-get-default-color-space-selproto
                            ((pde-content pde-content)
                             (color-space-name as-atom))
                            :result-type
                            pde-color-space
                            :calling-convention
                            :cdecl)
;; sel = 68
(define-foreign-funcallable pde-image-get-decode-array-selproto
                            ((image pde-image)
                             (decode (:pointer as-fixed))
                             (decode-size as-uns32))
                            :result-type
                            as-uns32
                            :calling-convention
                            :cdecl)
;; sel = 69
(define-foreign-funcallable pde-begin-container-get-mctag-selproto
                            ((pde-begin-container pde-begin-container))
                            :result-type
                            as-atom
                            :calling-convention
                            :cdecl)
;; sel = 70
(define-foreign-funcallable pde-begin-container-get-dict-selproto
                            ((pde-begin-container pde-begin-container)
                             (dict-p (:pointer cos-obj))
                             (is-inline-p (:pointer as-bool)))
                            :result-type
                            as-bool
                            :calling-convention
                            :cdecl)
;; sel = 71
(define-foreign-funcallable pde-soft-mask-get-cos-obj-selproto
                            ((pde-soft-mask pde-soft-mask)
                             (cos-obj-p (:pointer cos-obj)))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 72
(define-foreign-funcallable pde-soft-mask-acquire-form-selproto
                            ((pde-soft-mask pde-soft-mask)
                             (matrix-p as-fixed-matrix-p))
                            :result-type
                            pde-form
                            :calling-convention
                            :cdecl)
;; sel = 73
(define-foreign-funcallable pde-soft-mask-get-backdrop-color-selproto
                            ((pde-soft-mask pde-soft-mask)
                             (p-color-values (:pointer as-fixed))
                             (num-values as-int32))
                            :result-type
                            as-int32
                            :calling-convention
                            :cdecl)
;; sel = 74
(define-foreign-funcallable pde-soft-mask-get-transfer-function-selproto
                            ((pde-soft-mask pde-soft-mask))
                            :result-type
                            cos-obj
                            :calling-convention
                            :cdecl)
;; sel = 75
(define-foreign-funcallable pde-xgroup-get-cos-obj-selproto
                            ((pde-xgroup pde-xgroup)
                             (cos-obj-p (:pointer cos-obj)))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 76
(define-foreign-funcallable pde-xgroup-get-knockout-selproto
                            ((pde-xgroup pde-xgroup))
                            :result-type
                            as-bool
                            :calling-convention
                            :cdecl)
;; sel = 77
(define-foreign-funcallable pde-xgroup-get-isolated-selproto
                            ((pde-xgroup pde-xgroup))
                            :result-type
                            as-bool
                            :calling-convention
                            :cdecl)
;; sel = 78
(define-foreign-funcallable pde-xgroup-acquire-color-space-selproto
                            ((pde-xgroup pde-xgroup))
                            :result-type
                            pde-color-space
                            :calling-convention
                            :cdecl)
;; sel = 79
(define-foreign-funcallable pde-form-acquire-xgroup-selproto
                            ((pde-form pde-form))
                            :result-type
                            pde-xgroup
                            :calling-convention
                            :cdecl)
;; sel = 80
(define-foreign-funcallable pde-form-has-xgroup-selproto
                            ((pde-form pde-form))
                            :result-type
                            as-bool
                            :calling-convention
                            :cdecl)
;; sel = 81
(define-foreign-funcallable pde-element-has-gstate-selproto
                            ((pde-element pde-element)
                             (state-p pde-graphic-state-p)
                             (state-size as-uns32))
                            :result-type
                            as-bool
                            :calling-convention
                            :cdecl)
;; sel = 82
(define-foreign-funcallable pde-ext-gstate-get-opm-selproto
                            ((pde-ext-gstate pde-ext-gstate))
                            :result-type
                            as-int32
                            :calling-convention
                            :cdecl)
;; sel = 83
(define-foreign-funcallable pde-ext-gstate-get-opfill-selproto
                            ((pde-ext-gstate pde-ext-gstate))
                            :result-type
                            as-bool
                            :calling-convention
                            :cdecl)
;; sel = 84
(define-foreign-funcallable pde-ext-gstate-get-opstroke-selproto
                            ((pde-ext-gstate pde-ext-gstate))
                            :result-type
                            as-bool
                            :calling-convention
                            :cdecl)
;; sel = 85
(define-foreign-funcallable pde-ext-gstate-get-opacity-fill-selproto
                            ((pde-ext-gstate pde-ext-gstate))
                            :result-type
                            as-fixed
                            :calling-convention
                            :cdecl)
;; sel = 86
(define-foreign-funcallable pde-ext-gstate-get-opacity-stroke-selproto
                            ((pde-ext-gstate pde-ext-gstate))
                            :result-type
                            as-fixed
                            :calling-convention
                            :cdecl)
;; sel = 87
(define-foreign-funcallable pde-ext-gstate-get-blend-mode-selproto
                            ((pde-ext-gstate pde-ext-gstate))
                            :result-type
                            as-atom
                            :calling-convention
                            :cdecl)
;; sel = 88
(define-foreign-funcallable pde-ext-gstate-get-ais-selproto
                            ((pde-ext-gstate pde-ext-gstate))
                            :result-type
                            as-bool
                            :calling-convention
                            :cdecl)
;; sel = 89
(define-foreign-funcallable pde-ext-gstate-has-soft-mask-selproto
                            ((pde-ext-gstate pde-ext-gstate))
                            :result-type
                            as-bool
                            :calling-convention
                            :cdecl)
;; sel = 90
(define-foreign-funcallable pde-ext-gstate-acquire-soft-mask-selproto
                            ((pde-ext-gstate pde-ext-gstate))
                            :result-type
                            pde-soft-mask
                            :calling-convention
                            :cdecl)
;; sel = 91
(define-foreign-funcallable pde-image-has-smask-selproto
                            ((image pde-image))
                            :result-type
                            as-bool
                            :calling-convention
                            :cdecl)
;; sel = 92
(define-foreign-funcallable pde-image-get-smask-selproto
                            ((image pde-image))
                            :result-type
                            pde-image
                            :calling-convention
                            :cdecl)
;; sel = 93
(define-foreign-funcallable pde-image-get-matte-array-selproto
                            ((image pde-image)
                             (matte (:pointer as-fixed))
                             (num-comp as-uns32))
                            :result-type
                            as-uns32
                            :calling-convention
                            :cdecl)
;; sel = 94
(define-foreign-funcallable pde-ext-gstate-get-tk-selproto
                            ((pde-ext-gstate pde-ext-gstate))
                            :result-type
                            as-bool
                            :calling-convention
                            :cdecl)
;; sel = 95
(define-foreign-funcallable pd-sys-encoding-get-wmode-selproto
                            ((sys-enc pd-sys-encoding))
                            :result-type
                            as-int16
                            :calling-convention
                            :cdecl)
;; sel = 96
(define-foreign-funcallable pd-sys-encoding-is-identity-selproto
                            ((sys-enc pd-sys-encoding))
                            :result-type
                            as-bool
                            :calling-convention
                            :cdecl)
;; sel = 97
(define-foreign-funcallable pd-sys-encoding-is-multi-byte-selproto
                            ((sys-enc pd-sys-encoding))
                            :result-type
                            as-bool
                            :calling-convention
                            :cdecl)
;; sel = 98
(define-foreign-funcallable pde-ext-gstate-get-sa-selproto
                            ((pde-ext-gstate pde-ext-gstate))
                            :result-type
                            as-bool
                            :calling-convention
                            :cdecl)
;; sel = 99
(define-foreign-funcallable pde-soft-mask-get-name-selproto
                            ((pde-soft-mask pde-soft-mask))
                            :result-type
                            as-atom
                            :calling-convention
                            :cdecl)
;; sel = 100
(define-foreign-funcallable pde-element-get-ocmd-selproto
                            ((elem pde-element))
                            :result-type
                            pd-ocmd
                            :calling-convention
                            :cdecl)
;; sel = 101
(define-foreign-funcallable pde-element-is-currently-visible-selproto
                            ((elem pde-element)
                             (content pde-content)
                             (oc-context pd-occontext))
                            :result-type
                            as-bool
                            :calling-convention
                            :cdecl)
;; sel = 102
(define-foreign-funcallable pde-element-get-all-visibilities-selproto
                            ((elem pde-element)
                             (content pde-content)
                             (oc-context pd-occontext)
                             (visibilities (:pointer as-bool))
                             (capacity as-uns32))
                            :result-type
                            as-uns32
                            :calling-convention
                            :cdecl)
;; sel = 103
(define-foreign-funcallable pde-element-make-visible-selproto
                            ((elem pde-element)
                             (content pde-content)
                             (oc-context pd-occontext))
                            :result-type
                            as-bool
                            :calling-convention
                            :cdecl)
;; sel = 104
(define-foreign-funcallable pde-font-is-embedded-selproto
                            ((pde-font pde-font))
                            :result-type
                            as-bool
                            :calling-convention
                            :cdecl)
;; sel = 105
(define-foreign-funcallable pde-font-get-sys-font-selproto
                            ((pde-font pde-font))
                            :result-type
                            pd-sys-font
                            :calling-convention
                            :cdecl)
;; sel = 106
(define-foreign-funcallable pde-font-get-sys-encoding-selproto
                            ((pde-font pde-font))
                            :result-type
                            pd-sys-encoding
                            :calling-convention
                            :cdecl)
;; sel = 107
(define-foreign-funcallable pde-text-item-get-font-selproto
                            ((text-item pde-text-item))
                            :result-type
                            pde-font
                            :calling-convention
                            :cdecl)
;; sel = 108
(define-foreign-funcallable pde-text-item-get-text-matrix-selproto
                            ((text-item pde-text-item)
                             (char-offset as-uns32)
                             (text-matrix-p
                              (:pointer as-fixed-matrix)))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 109
(define-foreign-funcallable pde-text-item-get-text-state-selproto
                            ((text-item pde-text-item)
                             (text-state-p pde-text-state-p)
                             (text-state-size as-uns32))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 110
(define-foreign-funcallable pde-text-item-get-text-len-selproto
                            ((text-item pde-text-item))
                            :result-type
                            as-uns32
                            :calling-convention
                            :cdecl)
;; sel = 111
(define-foreign-funcallable pde-text-item-copy-text-selproto
                            ((text-item pde-text-item)
                             (buffer (:pointer as-uns8))
                             (buffer-size as-uns32))
                            :result-type
                            as-uns32
                            :calling-convention
                            :cdecl)
;; sel = 112
(define-foreign-funcallable pde-text-item-get-gstate-selproto
                            ((text-item pde-text-item)
                             (state-p pde-graphic-state-p)
                             (state-size as-uns32))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 113
(define-foreign-funcallable pde-text-get-item-selproto
                            ((text pde-text) (index as-uns32))
                            :result-type
                            pde-text-item
                            :calling-convention
                            :cdecl)
;; sel = 114
(define-foreign-funcallable pde-image-get-type-selproto
                            ((image pde-image))
                            :result-type
                            as-atom
                            :calling-convention
                            :cdecl)
;; sel = 115
(define-foreign-funcallable pde-image-acquire-image-flate-selproto
                            ((image pde-image))
                            :result-type
                            pde-image-flate
                            :calling-convention
                            :cdecl)
;; sel = 116
(define-foreign-funcallable pde-image-acquire-image-jpx-selproto
                            ((image pde-image))
                            :result-type
                            pde-image-jpx
                            :calling-convention
                            :cdecl)
;; sel = 117
(define-foreign-funcallable pde-image-jpxget-cos-obj-selproto
                            ((pde-image-jpx pde-image-jpx)
                             (cos-obj-p (:pointer cos-obj)))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 118
(define-foreign-funcallable pde-image-flate-get-cos-obj-selproto
                            ((pde-image-flate pde-image-flate)
                             (cos-obj-p (:pointer cos-obj)))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 119
(define-foreign-funcallable pde-image-flate-get-attrs-selproto
                            ((img-flate pde-image-flate)
                             (attrs-p pde-image-flate-attrs-p)
                             (attrs-size as-uns32))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 120
(define-foreign-funcallable pde-image-flate-acquire-color-space-selproto
                            ((img-flate pde-image-flate))
                            :result-type
                            pde-color-space
                            :calling-convention
                            :cdecl)
;; sel = 121
(define-foreign-funcallable pde-image-flate-get-data-stm-selproto
                            ((img-flate pde-image-flate)
                             (flags as-uns32))
                            :result-type
                            as-stm
                            :calling-convention
                            :cdecl)
;; sel = 122
(define-foreign-funcallable pde-image-jpxget-attrs-selproto
                            ((pde-image-jpx pde-image-jpx)
                             (attrs-p pde-image-jpxattrs-p)
                             (attrs-size as-uns32))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 123
(define-foreign-funcallable pde-image-jpxacquire-color-space-selproto
                            ((pde-image-jpx pde-image-jpx))
                            :result-type
                            pde-color-space
                            :calling-convention
                            :cdecl)
;; sel = 124
(define-foreign-funcallable pde-image-jpxget-data-stm-selproto
                            ((pde-image-jpx pde-image-jpx)
                             (flags as-uns32))
                            :result-type
                            as-stm
                            :calling-convention
                            :cdecl)
;; sel = 125
(define-foreign-funcallable pde-image-jpxget-num-color-spaces-selproto
                            ((pde-image-jpx pde-image-jpx))
                            :result-type
                            as-int32
                            :calling-convention
                            :cdecl)
;; sel = 126
(define-foreign-funcallable pde-image-jpxacquire-jpxcolor-space-selproto
                            ((pde-image-jpx pde-image-jpx))
                            :result-type
                            jpxcolor-space
                            :calling-convention
                            :cdecl)
;; sel = 127
(define-foreign-funcallable pde-image-jpxhas-palette-selproto
                            ((pde-image-jpx pde-image-jpx))
                            :result-type
                            as-bool
                            :calling-convention
                            :cdecl)
;; sel = 128
(define-foreign-funcallable pde-image-jpxacquire-palette-selproto
                            ((pde-image-jpx pde-image-jpx))
                            :result-type
                            jpxpalette
                            :calling-convention
                            :cdecl)
;; sel = 129
(define-foreign-funcallable jpxpalette-get-num-entries-selproto
                            ((jpx-palette jpxpalette))
                            :result-type
                            as-int32
                            :calling-convention
                            :cdecl)
;; sel = 130
(define-foreign-funcallable jpxpalette-get-bit-depths-selproto
                            ((jpx-palette jpxpalette)
                             (bit-depths (:pointer as-int32)))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 131
(define-foreign-funcallable jpxpalette-get-num-components-selproto
                            ((jpx-palette jpxpalette))
                            :result-type
                            as-int32
                            :calling-convention
                            :cdecl)
;; sel = 132
(define-foreign-funcallable jpxpalette-get-table-selproto
                            ((jpx-palette jpxpalette)
                             (palette-length (:pointer as-int32)))
                            :result-type
                            as-stm
                            :calling-convention
                            :cdecl)
;; sel = 133
(define-foreign-funcallable jpxcolor-space-acquire-next-selproto
                            ((jpx-color-space jpxcolor-space))
                            :result-type
                            jpxcolor-space
                            :calling-convention
                            :cdecl)
;; sel = 134
(define-foreign-funcallable jpxcolor-space-get-type-selproto
                            ((jpx-color-space jpxcolor-space))
                            :result-type
                            jpxcolor-space-type
                            :calling-convention
                            :cdecl)
;; sel = 135
(define-foreign-funcallable jpxcolor-space-get-enum-attrs-selproto
                            ((jpx-color-space jpxcolor-space)
                             (jpx-csenum-attrs-p jpxcsenum-attrs-p))
                            :result-type
                            as-bool
                            :calling-convention
                            :cdecl)
;; sel = 136
(define-foreign-funcallable jpxcolor-space-get-profile-selproto
                            ((jpx-color-space jpxcolor-space)
                             (profile (:pointer as-uns8))
                             (profile-length as-int32))
                            :result-type
                            as-int32
                            :calling-convention
                            :cdecl)
;; sel = 137
(define-foreign-funcallable pde-color-space-get-struct-selproto
                            ((cs pde-color-space)
                             (pde-color-space-struct
                              (:pointer pde-color-space-struct)))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 138
(define-foreign-funcallable pde-image-get-color-space-ex-selproto
                            ((image pde-image) (flags as-uns32))
                            :result-type
                            pde-color-space
                            :calling-convention
                            :cdecl)
;; sel = 139
(define-foreign-funcallable pde-form-get-content-to-cos-obj-flags-selproto
                            ((form pde-form))
                            :result-type
                            as-uns32
                            :calling-convention
                            :cdecl)
;; sel = 140
(define-foreign-funcallable pde-element-get-matrix-ex-selproto
                            ((pde-element pde-element)
                             (matrix-p as-double-matrix-p))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 141
(define-foreign-funcallable pde-soft-mask-acquire-form-ex-selproto
                            ((pde-soft-mask pde-soft-mask)
                             (matrix-p as-double-matrix-p))
                            :result-type
                            pde-form
                            :calling-convention
                            :cdecl)
;; sel = 142
(define-foreign-funcallable pde-text-item-get-text-matrix-ex-selproto
                            ((text-item pde-text-item)
                             (char-offset as-uns32)
                             (text-matrix-p
                              (:pointer as-double-matrix)))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 143
(define-foreign-funcallable pde-path-get-data-ex-selproto
                            ((path pde-path)
                             (data (:pointer as-real))
                             (data-size as-uns32))
                            :result-type
                            as-uns32
                            :calling-convention
                            :cdecl)

;; #include <PERCalls.h>
;; line 91
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +-pdf-edit-read-hft-is-beta+ 0))
;; line 101
(define-c-typedef pdf-edit-read-hft-version-10
                  pdf-edit-read-hft-latest-version)
;; line 185
(define-acrobat-function (pde-text-run-get-num-chars
                          "PDETextRunGetNumChars")
                         *g-pdf-edit-read-version*
                         +pdf-edit-read-hft-version-4+
                         pde-text-run-get-num-chars-selproto
                         *g-pdf-edit-read-hft*
                         +pde-text-run-get-num-chars-sel+)
;; line 247
(define-acrobat-function (pde-color-space-get-base-num-comps
                          "PDEColorSpaceGetBaseNumComps")
                         *g-pdf-edit-read-version*
                         +pdf-edit-read-hft-version-4+
                         pde-color-space-get-base-num-comps-selproto
                         *g-pdf-edit-read-hft*
                         +pde-color-space-get-base-num-comps-sel+)
;; line 281
(define-acrobat-function (pde-soft-mask-get-cos-obj
                          "PDESoftMaskGetCosObj")
                         *g-pdf-edit-read-version*
                         +pdf-edit-read-hft-version-5+
                         pde-soft-mask-get-cos-obj-selproto
                         *g-pdf-edit-read-hft*
                         +pde-soft-mask-get-cos-obj-sel+)
;; line 282
(define-acrobat-function (pde-soft-mask-acquire-form
                          "PDESoftMaskAcquireForm")
                         *g-pdf-edit-read-version*
                         +pdf-edit-read-hft-version-5+
                         pde-soft-mask-acquire-form-selproto
                         *g-pdf-edit-read-hft*
                         +pde-soft-mask-acquire-form-sel+)
;; line 283
(define-acrobat-function (pde-soft-mask-get-backdrop-color
                          "PDESoftMaskGetBackdropColor")
                         *g-pdf-edit-read-version*
                         +pdf-edit-read-hft-version-5+
                         pde-soft-mask-get-backdrop-color-selproto
                         *g-pdf-edit-read-hft*
                         +pde-soft-mask-get-backdrop-color-sel+)
;; line 284
(define-acrobat-function (pde-soft-mask-get-transfer-function
                          "PDESoftMaskGetTransferFunction")
                         *g-pdf-edit-read-version*
                         +pdf-edit-read-hft-version-5+
                         pde-soft-mask-get-transfer-function-selproto
                         *g-pdf-edit-read-hft*
                         +pde-soft-mask-get-transfer-function-sel+)
;; line 286
(define-acrobat-function (pde-xgroup-get-cos-obj "PDEXGroupGetCosObj")
                         *g-pdf-edit-read-version*
                         +pdf-edit-read-hft-version-5+
                         pde-xgroup-get-cos-obj-selproto
                         *g-pdf-edit-read-hft*
                         +pde-xgroup-get-cos-obj-sel+)
;; line 287
(define-acrobat-function (pde-xgroup-get-knockout
                          "PDEXGroupGetKnockout")
                         *g-pdf-edit-read-version*
                         +pdf-edit-read-hft-version-5+
                         pde-xgroup-get-knockout-selproto
                         *g-pdf-edit-read-hft*
                         +pde-xgroup-get-knockout-sel+)
;; line 288
(define-acrobat-function (pde-xgroup-get-isolated
                          "PDEXGroupGetIsolated")
                         *g-pdf-edit-read-version*
                         +pdf-edit-read-hft-version-5+
                         pde-xgroup-get-isolated-selproto
                         *g-pdf-edit-read-hft*
                         +pde-xgroup-get-isolated-sel+)
;; line 289
(define-acrobat-function (pde-xgroup-acquire-color-space
                          "PDEXGroupAcquireColorSpace")
                         *g-pdf-edit-read-version*
                         +pdf-edit-read-hft-version-5+
                         pde-xgroup-acquire-color-space-selproto
                         *g-pdf-edit-read-hft*
                         +pde-xgroup-acquire-color-space-sel+)
;; line 291
(define-acrobat-function (pde-form-acquire-xgroup
                          "PDEFormAcquireXGroup")
                         *g-pdf-edit-read-version*
                         +pdf-edit-read-hft-version-5+
                         pde-form-acquire-xgroup-selproto
                         *g-pdf-edit-read-hft*
                         +pde-form-acquire-xgroup-sel+)
;; line 292
(define-acrobat-function (pde-form-has-xgroup "PDEFormHasXGroup")
                         *g-pdf-edit-read-version*
                         +pdf-edit-read-hft-version-5+
                         pde-form-has-xgroup-selproto
                         *g-pdf-edit-read-hft*
                         +pde-form-has-xgroup-sel+)
;; line 296
(define-acrobat-function (pde-ext-gstate-get-opm "PDEExtGStateGetOPM")
                         *g-pdf-edit-read-version*
                         +pdf-edit-read-hft-version-5+
                         pde-ext-gstate-get-opm-selproto
                         *g-pdf-edit-read-hft*
                         +pde-ext-gstate-get-opm-sel+)
;; line 297
(define-acrobat-function (pde-ext-gstate-get-opfill
                          "PDEExtGStateGetOPFill")
                         *g-pdf-edit-read-version*
                         +pdf-edit-read-hft-version-5+
                         pde-ext-gstate-get-opfill-selproto
                         *g-pdf-edit-read-hft*
                         +pde-ext-gstate-get-opfill-sel+)
;; line 298
(define-acrobat-function (pde-ext-gstate-get-opstroke
                          "PDEExtGStateGetOPStroke")
                         *g-pdf-edit-read-version*
                         +pdf-edit-read-hft-version-5+
                         pde-ext-gstate-get-opstroke-selproto
                         *g-pdf-edit-read-hft*
                         +pde-ext-gstate-get-opstroke-sel+)
;; line 299
(define-acrobat-function (pde-ext-gstate-get-opacity-fill
                          "PDEExtGStateGetOpacityFill")
                         *g-pdf-edit-read-version*
                         +pdf-edit-read-hft-version-5+
                         pde-ext-gstate-get-opacity-fill-selproto
                         *g-pdf-edit-read-hft*
                         +pde-ext-gstate-get-opacity-fill-sel+)
;; line 300
(define-acrobat-function (pde-ext-gstate-get-opacity-stroke
                          "PDEExtGStateGetOpacityStroke")
                         *g-pdf-edit-read-version*
                         +pdf-edit-read-hft-version-5+
                         pde-ext-gstate-get-opacity-stroke-selproto
                         *g-pdf-edit-read-hft*
                         +pde-ext-gstate-get-opacity-stroke-sel+)
;; line 301
(define-acrobat-function (pde-ext-gstate-get-blend-mode
                          "PDEExtGStateGetBlendMode")
                         *g-pdf-edit-read-version*
                         +pdf-edit-read-hft-version-5+
                         pde-ext-gstate-get-blend-mode-selproto
                         *g-pdf-edit-read-hft*
                         +pde-ext-gstate-get-blend-mode-sel+)
;; line 302
(define-acrobat-function (pde-ext-gstate-get-ais "PDEExtGStateGetAIS")
                         *g-pdf-edit-read-version*
                         +pdf-edit-read-hft-version-5+
                         pde-ext-gstate-get-ais-selproto
                         *g-pdf-edit-read-hft*
                         +pde-ext-gstate-get-ais-sel+)
;; line 303
(define-acrobat-function (pde-ext-gstate-has-soft-mask
                          "PDEExtGStateHasSoftMask")
                         *g-pdf-edit-read-version*
                         +pdf-edit-read-hft-version-5+
                         pde-ext-gstate-has-soft-mask-selproto
                         *g-pdf-edit-read-hft*
                         +pde-ext-gstate-has-soft-mask-sel+)
;; line 304
(define-acrobat-function (pde-ext-gstate-acquire-soft-mask
                          "PDEExtGStateAcquireSoftMask")
                         *g-pdf-edit-read-version*
                         +pdf-edit-read-hft-version-5+
                         pde-ext-gstate-acquire-soft-mask-selproto
                         *g-pdf-edit-read-hft*
                         +pde-ext-gstate-acquire-soft-mask-sel+)
;; line 306
(define-acrobat-function (pde-image-has-smask "PDEImageHasSMask")
                         *g-pdf-edit-read-version*
                         +pdf-edit-read-hft-version-5+
                         pde-image-has-smask-selproto
                         *g-pdf-edit-read-hft*
                         +pde-image-has-smask-sel+)
;; line 307
(define-acrobat-function (pde-image-get-smask "PDEImageGetSMask")
                         *g-pdf-edit-read-version*
                         +pdf-edit-read-hft-version-5+
                         pde-image-get-smask-selproto
                         *g-pdf-edit-read-hft*
                         +pde-image-get-smask-sel+)
;; line 308
(define-acrobat-function (pde-image-get-matte-array
                          "PDEImageGetMatteArray")
                         *g-pdf-edit-read-version*
                         +pdf-edit-read-hft-version-5+
                         pde-image-get-matte-array-selproto
                         *g-pdf-edit-read-hft*
                         +pde-image-get-matte-array-sel+)
;; line 310
(define-acrobat-function (pde-ext-gstate-get-tk "PDEExtGStateGetTK")
                         *g-pdf-edit-read-version*
                         +pdf-edit-read-hft-version-5+
                         pde-ext-gstate-get-tk-selproto
                         *g-pdf-edit-read-hft*
                         +pde-ext-gstate-get-tk-sel+)
;; line 317
(define-acrobat-function (pde-ext-gstate-get-sa "PDEExtGStateGetSA")
                         *g-pdf-edit-read-version*
                         +pdf-edit-read-hft-version-5+
                         pde-ext-gstate-get-sa-selproto
                         *g-pdf-edit-read-hft*
                         +pde-ext-gstate-get-sa-sel+)
;; line 318
(define-acrobat-function (pde-soft-mask-get-name "PDESoftMaskGetName")
                         *g-pdf-edit-read-version*
                         +pdf-edit-read-hft-version-5+
                         pde-soft-mask-get-name-selproto
                         *g-pdf-edit-read-hft*
                         +pde-soft-mask-get-name-sel+)
;; line 320
(define-acrobat-function (pde-text-get-matrix "PDETextGetMatrix")
                         *g-pdf-edit-read-version*
                         +pdf-edit-read-hft-version-5+
                         pde-text-get-matrix-selproto
                         *g-pdf-edit-read-hft*
                         +pde-text-get-matrix-sel+)
;; line 329
(define-acrobat-function (pde-font-is-embedded "PDEFontIsEmbedded")
                         *g-pdf-edit-read-version*
                         +pdf-edit-read-hft-version-6+
                         pde-font-is-embedded-selproto
                         *g-pdf-edit-read-hft*
                         +pde-font-is-embedded-sel+)
;; line 330
(define-acrobat-function (pde-font-get-sys-font "PDEFontGetSysFont")
                         *g-pdf-edit-read-version*
                         +pdf-edit-read-hft-version-6+
                         pde-font-get-sys-font-selproto
                         *g-pdf-edit-read-hft*
                         +pde-font-get-sys-font-sel+)
;; line 331
(define-acrobat-function (pde-font-get-sys-encoding
                          "PDEFontGetSysEncoding")
                         *g-pdf-edit-read-version*
                         +pdf-edit-read-hft-version-6+
                         pde-font-get-sys-encoding-selproto
                         *g-pdf-edit-read-hft*
                         +pde-font-get-sys-encoding-sel+)
;; line 332
(define-acrobat-function (pde-text-get-advance "PDETextGetAdvance")
                         *g-pdf-edit-read-version*
                         +pdf-edit-read-hft-version-6+
                         pde-text-get-advance-selproto
                         *g-pdf-edit-read-hft*
                         +pde-text-get-advance-sel+)
;; line 333
(define-acrobat-function (pde-text-item-get-font "PDETextItemGetFont")
                         *g-pdf-edit-read-version*
                         +pdf-edit-read-hft-version-6+
                         pde-text-item-get-font-selproto
                         *g-pdf-edit-read-hft*
                         +pde-text-item-get-font-sel+)
;; line 334
(define-acrobat-function (pde-text-item-get-text-matrix
                          "PDETextItemGetTextMatrix")
                         *g-pdf-edit-read-version*
                         +pdf-edit-read-hft-version-6+
                         pde-text-item-get-text-matrix-selproto
                         *g-pdf-edit-read-hft*
                         +pde-text-item-get-text-matrix-sel+)
;; line 335
(define-acrobat-function (pde-text-item-get-text-state
                          "PDETextItemGetTextState")
                         *g-pdf-edit-read-version*
                         +pdf-edit-read-hft-version-6+
                         pde-text-item-get-text-state-selproto
                         *g-pdf-edit-read-hft*
                         +pde-text-item-get-text-state-sel+)
;; line 336
(define-acrobat-function (pde-text-item-get-text-len
                          "PDETextItemGetTextLen")
                         *g-pdf-edit-read-version*
                         +pdf-edit-read-hft-version-6+
                         pde-text-item-get-text-len-selproto
                         *g-pdf-edit-read-hft*
                         +pde-text-item-get-text-len-sel+)
;; line 337
(define-acrobat-function (pde-text-item-copy-text
                          "PDETextItemCopyText")
                         *g-pdf-edit-read-version*
                         +pdf-edit-read-hft-version-6+
                         pde-text-item-copy-text-selproto
                         *g-pdf-edit-read-hft*
                         +pde-text-item-copy-text-sel+)
;; line 338
(define-acrobat-function (pde-text-item-get-gstate
                          "PDETextItemGetGState")
                         *g-pdf-edit-read-version*
                         +pdf-edit-read-hft-version-6+
                         pde-text-item-get-gstate-selproto
                         *g-pdf-edit-read-hft*
                         +pde-text-item-get-gstate-sel+)
;; line 339
(define-acrobat-function (pde-text-get-item "PDETextGetItem")
                         *g-pdf-edit-read-version*
                         +pdf-edit-read-hft-version-6+
                         pde-text-get-item-selproto
                         *g-pdf-edit-read-hft*
                         +pde-text-get-item-sel+)
;; line 343
(define-acrobat-function (pde-image-get-type "PDEImageGetType")
                         *g-pdf-edit-read-version*
                         +pdf-edit-read-hft-version-6+
                         pde-image-get-type-selproto
                         *g-pdf-edit-read-hft*
                         +pde-image-get-type-sel+)
;; line 344
(define-acrobat-function (pde-image-acquire-image-flate
                          "PDEImageAcquireImageFlate")
                         *g-pdf-edit-read-version*
                         +pdf-edit-read-hft-version-6+
                         pde-image-acquire-image-flate-selproto
                         *g-pdf-edit-read-hft*
                         +pde-image-acquire-image-flate-sel+)
;; line 345
(define-acrobat-function (pde-image-acquire-image-jpx
                          "PDEImageAcquireImageJPX")
                         *g-pdf-edit-read-version*
                         +pdf-edit-read-hft-version-6+
                         pde-image-acquire-image-jpx-selproto
                         *g-pdf-edit-read-hft*
                         +pde-image-acquire-image-jpx-sel+)
;; line 347
(define-acrobat-function (pde-image-jpxget-cos-obj
                          "PDEImageJPXGetCosObj")
                         *g-pdf-edit-read-version*
                         +pdf-edit-read-hft-version-6+
                         pde-image-jpxget-cos-obj-selproto
                         *g-pdf-edit-read-hft*
                         +pde-image-jpxget-cos-obj-sel+)
;; line 349
(define-acrobat-function (pde-image-flate-get-cos-obj
                          "PDEImageFlateGetCosObj")
                         *g-pdf-edit-read-version*
                         +pdf-edit-read-hft-version-6+
                         pde-image-flate-get-cos-obj-selproto
                         *g-pdf-edit-read-hft*
                         +pde-image-flate-get-cos-obj-sel+)
;; line 350
(define-acrobat-function (pde-image-flate-get-attrs
                          "PDEImageFlateGetAttrs")
                         *g-pdf-edit-read-version*
                         +pdf-edit-read-hft-version-6+
                         pde-image-flate-get-attrs-selproto
                         *g-pdf-edit-read-hft*
                         +pde-image-flate-get-attrs-sel+)
;; line 351
(define-acrobat-function (pde-image-flate-acquire-color-space
                          "PDEImageFlateAcquireColorSpace")
                         *g-pdf-edit-read-version*
                         +pdf-edit-read-hft-version-6+
                         pde-image-flate-acquire-color-space-selproto
                         *g-pdf-edit-read-hft*
                         +pde-image-flate-acquire-color-space-sel+)
;; line 352
(define-acrobat-function (pde-image-flate-get-data-stm
                          "PDEImageFlateGetDataStm")
                         *g-pdf-edit-read-version*
                         +pdf-edit-read-hft-version-6+
                         pde-image-flate-get-data-stm-selproto
                         *g-pdf-edit-read-hft*
                         +pde-image-flate-get-data-stm-sel+)
;; line 354
(define-acrobat-function (pde-image-jpxget-attrs "PDEImageJPXGetAttrs")
                         *g-pdf-edit-read-version*
                         +pdf-edit-read-hft-version-6+
                         pde-image-jpxget-attrs-selproto
                         *g-pdf-edit-read-hft*
                         +pde-image-jpxget-attrs-sel+)
;; line 355
(define-acrobat-function (pde-image-jpxacquire-color-space
                          "PDEImageJPXAcquireColorSpace")
                         *g-pdf-edit-read-version*
                         +pdf-edit-read-hft-version-6+
                         pde-image-jpxacquire-color-space-selproto
                         *g-pdf-edit-read-hft*
                         +pde-image-jpxacquire-color-space-sel+)
;; line 356
(define-acrobat-function (pde-image-jpxget-data-stm
                          "PDEImageJPXGetDataStm")
                         *g-pdf-edit-read-version*
                         +pdf-edit-read-hft-version-6+
                         pde-image-jpxget-data-stm-selproto
                         *g-pdf-edit-read-hft*
                         +pde-image-jpxget-data-stm-sel+)
;; line 357
(define-acrobat-function (pde-image-jpxget-num-color-spaces
                          "PDEImageJPXGetNumColorSpaces")
                         *g-pdf-edit-read-version*
                         +pdf-edit-read-hft-version-6+
                         pde-image-jpxget-num-color-spaces-selproto
                         *g-pdf-edit-read-hft*
                         +pde-image-jpxget-num-color-spaces-sel+)
;; line 358
(define-acrobat-function (pde-image-jpxacquire-jpxcolor-space
                          "PDEImageJPXAcquireJPXColorSpace")
                         *g-pdf-edit-read-version*
                         +pdf-edit-read-hft-version-6+
                         pde-image-jpxacquire-jpxcolor-space-selproto
                         *g-pdf-edit-read-hft*
                         +pde-image-jpxacquire-jpxcolor-space-sel+)
;; line 359
(define-acrobat-function (pde-image-jpxhas-palette
                          "PDEImageJPXHasPalette")
                         *g-pdf-edit-read-version*
                         +pdf-edit-read-hft-version-6+
                         pde-image-jpxhas-palette-selproto
                         *g-pdf-edit-read-hft*
                         +pde-image-jpxhas-palette-sel+)
;; line 360
(define-acrobat-function (pde-image-jpxacquire-palette
                          "PDEImageJPXAcquirePalette")
                         *g-pdf-edit-read-version*
                         +pdf-edit-read-hft-version-6+
                         pde-image-jpxacquire-palette-selproto
                         *g-pdf-edit-read-hft*
                         +pde-image-jpxacquire-palette-sel+)
;; line 362
(define-acrobat-function (jpxpalette-get-num-entries
                          "JPXPaletteGetNumEntries")
                         *g-pdf-edit-read-version*
                         +pdf-edit-read-hft-version-6+
                         jpxpalette-get-num-entries-selproto
                         *g-pdf-edit-read-hft*
                         +jpxpalette-get-num-entries-sel+)
;; line 363
(define-acrobat-function (jpxpalette-get-bit-depths
                          "JPXPaletteGetBitDepths")
                         *g-pdf-edit-read-version*
                         +pdf-edit-read-hft-version-6+
                         jpxpalette-get-bit-depths-selproto
                         *g-pdf-edit-read-hft*
                         +jpxpalette-get-bit-depths-sel+)
;; line 364
(define-acrobat-function (jpxpalette-get-num-components
                          "JPXPaletteGetNumComponents")
                         *g-pdf-edit-read-version*
                         +pdf-edit-read-hft-version-6+
                         jpxpalette-get-num-components-selproto
                         *g-pdf-edit-read-hft*
                         +jpxpalette-get-num-components-sel+)
;; line 365
(define-acrobat-function (jpxpalette-get-table "JPXPaletteGetTable")
                         *g-pdf-edit-read-version*
                         +pdf-edit-read-hft-version-6+
                         jpxpalette-get-table-selproto
                         *g-pdf-edit-read-hft*
                         +jpxpalette-get-table-sel+)
;; line 367
(define-acrobat-function (jpxcolor-space-acquire-next
                          "JPXColorSpaceAcquireNext")
                         *g-pdf-edit-read-version*
                         +pdf-edit-read-hft-version-6+
                         jpxcolor-space-acquire-next-selproto
                         *g-pdf-edit-read-hft*
                         +jpxcolor-space-acquire-next-sel+)
;; line 368
(define-acrobat-function (jpxcolor-space-get-type
                          "JPXColorSpaceGetType")
                         *g-pdf-edit-read-version*
                         +pdf-edit-read-hft-version-6+
                         jpxcolor-space-get-type-selproto
                         *g-pdf-edit-read-hft*
                         +jpxcolor-space-get-type-sel+)
;; line 369
(define-acrobat-function (jpxcolor-space-get-enum-attrs
                          "JPXColorSpaceGetEnumAttrs")
                         *g-pdf-edit-read-version*
                         +pdf-edit-read-hft-version-6+
                         jpxcolor-space-get-enum-attrs-selproto
                         *g-pdf-edit-read-hft*
                         +jpxcolor-space-get-enum-attrs-sel+)
;; line 370
(define-acrobat-function (jpxcolor-space-get-profile
                          "JPXColorSpaceGetProfile")
                         *g-pdf-edit-read-version*
                         +pdf-edit-read-hft-version-6+
                         jpxcolor-space-get-profile-selproto
                         *g-pdf-edit-read-hft*
                         +jpxcolor-space-get-profile-sel+)
;; line 374
(define-acrobat-function (pde-image-get-color-space-ex
                          "PDEImageGetColorSpaceEx")
                         *g-pdf-edit-read-version*
                         +pdf-edit-read-hft-version-9+
                         pde-image-get-color-space-ex-selproto
                         *g-pdf-edit-read-hft*
                         +pde-image-get-color-space-ex-sel+)
;; line 375
(define-acrobat-function (pde-form-get-content-to-cos-obj-flags
                          "PDEFormGetContentToCosObjFlags")
                         *g-pdf-edit-read-version*
                         +pdf-edit-read-hft-version-9+
                         pde-form-get-content-to-cos-obj-flags-selproto
                         *g-pdf-edit-read-hft*
                         +pde-form-get-content-to-cos-obj-flags-sel+)
;; line 379
(define-acrobat-function (pde-soft-mask-acquire-form-ex
                          "PDESoftMaskAcquireFormEx")
                         *g-pdf-edit-read-version*
                         +pdf-edit-read-hft-version-10+
                         pde-soft-mask-acquire-form-ex-selproto
                         *g-pdf-edit-read-hft*
                         +pde-soft-mask-acquire-form-ex-sel+)
;; line 380
(define-acrobat-function (pde-text-item-get-text-matrix-ex
                          "PDETextItemGetTextMatrixEx")
                         *g-pdf-edit-read-version*
                         +pdf-edit-read-hft-version-10+
                         pde-text-item-get-text-matrix-ex-selproto
                         *g-pdf-edit-read-hft*
                         +pde-text-item-get-text-matrix-ex-sel+)
;; line 381
(define-acrobat-function (pde-text-get-matrix-ex "PDETextGetMatrixEx")
                         *g-pdf-edit-read-version*
                         +pdf-edit-read-hft-version-10+
                         pde-text-get-matrix-ex-selproto
                         *g-pdf-edit-read-hft*
                         +pde-text-get-matrix-ex-sel+)
;; line 384
(define-acrobat-function (pde-path-get-data-ex "PDEPathGetDataEx")
                         *g-pdf-edit-read-version*
                         +pdf-edit-read-hft-version-10+
                         pde-path-get-data-ex-selproto
                         *g-pdf-edit-read-hft*
                         +pde-path-get-data-ex-sel+)
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +pdf-edit-read-bad-selector+ 0))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +pdf-edit-read-num-selectorsplus-one+ 1))
