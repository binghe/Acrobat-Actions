;;; This file was generated automatically from Acrobat Pro's SDK headers.

(in-package :pdf-plugin-tools) 

;; #include <AVProcs.h>
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-action-handler-get-type-sel+ 1))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-action-handler-get-uiname-sel+ 2))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-action-handler-get-procs-sel+ 3))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-alert-sel+ 4))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-alert-note-sel+ 5))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-alert-confirm-sel+ 6))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-app-get-version-sel+ 7))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-app-get-language-sel+ 8))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-app-get-name-sel+ 9))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-app-get-cancel-proc-sel+ 10))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-app-can-quit-sel+ 11))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-app-get-active-doc-sel+ 12))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-app-get-num-docs-sel+ 13))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-app-enum-docs-sel+ 14))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-app-get-doc-progress-monitor-sel+ 15))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-app-get-menubar-sel+ 16))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-app-get-legacy-tool-bar-sel+ 17))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-app-get-active-tool-sel+ 18))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-app-get-last-active-tool-sel+ 19))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-app-get-default-tool-sel+ 20))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-app-set-active-tool-sel+ 21))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-app-get-tool-by-name-sel+ 22))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-app-enum-tools-sel+ 23))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +old-avapp-register-tool-sel+ 24))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-app-get-annot-handler-by-name-sel+ 25))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-app-enum-annot-handlers-sel+ 26))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +old-avapp-register-annot-handler-sel+ 27))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-app-get-action-handler-by-type-sel+ 28))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-app-enum-action-handlers-sel+ 29))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-app-register-action-handler-sel+ 30))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-app-get-preference-sel+ 31))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-app-set-preference-sel+ 32))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-app-begin-full-screen-sel+ 33))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-app-end-full-screen-sel+ 34))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-app-doing-full-screen-sel+ 35))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-app-begin-modal-sel+ 36))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-app-modal-window-is-open-sel+ 37))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-app-end-modal-sel+ 38))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-app-register-idle-proc-sel+ 39))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-app-unregister-idle-proc-sel+ 40))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-app-register-notification-sel+ 41))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-app-unregister-notification-sel+ 42))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +old-avdoc-open-from-file-sel+ 43))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +old-avdoc-open-from-file-with-params-sel+ 44))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +old-avdoc-open-from-pddoc-sel+ 45))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +old-avdoc-open-from-pddoc-with-params-sel+ 46))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-doc-close-sel+ 47))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-doc-get-pddoc-sel+ 48))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-doc-get-page-view-sel+ 49))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-doc-get-avwindow-sel+ 50))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-doc-get-view-mode-sel+ 51))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-doc-set-view-mode-sel+ 52))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-doc-get-splitter-position-sel+ 53))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-doc-set-splitter-position-sel+ 54))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-doc-print-pages-sel+ 55))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-doc-get-selection-type-sel+ 56))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-doc-get-selection-sel+ 57))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-doc-set-selection-sel+ 58))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-doc-delete-selection-sel+ 59))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-doc-clear-selection-sel+ 60))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-doc-copy-selection-sel+ 61))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-doc-enum-selection-sel+ 62))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-doc-do-selection-properties-sel+ 63))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-doc-show-selection-sel+ 64))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +old-avdoc-get-selection-server-by-type-sel+ 65))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +old-avdoc-register-selection-server-sel+ 66))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-doc-perform-action-sel+ 67))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-menubar-show-sel+ 68))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-menubar-hide-sel+ 69))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-menubar-get-num-menus-sel+ 70))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-menubar-acquire-menu-by-name-sel+ 71))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-menubar-acquire-menu-by-index-sel+ 72))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-menubar-acquire-menu-by-predicate-sel+ 73))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-menubar-acquire-menu-item-by-name-sel+ 74))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-menubar-acquire-menu-item-by-predicate-sel+ 75))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-menubar-get-menu-index-sel+ 76))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-menubar-add-menu-sel+ 77))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-menu-new-sel+ 78))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-menu-acquire-sel+ 79))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-menu-release-sel+ 80))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-menu-remove-sel+ 81))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-menu-get-name-sel+ 82))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-menu-get-title-sel+ 83))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-menu-get-num-menu-items-sel+ 84))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-menu-acquire-menu-item-by-index-sel+ 85))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-menu-get-menu-item-index-sel+ 86))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-menu-get-parent-menubar-sel+ 87))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-menu-get-parent-menu-item-sel+ 88))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-menu-add-menu-item-sel+ 89))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-menu-item-new-sel+ 90))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-menu-item-acquire-sel+ 91))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-menu-item-release-sel+ 92))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-menu-item-remove-sel+ 93))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-menu-item-get-name-sel+ 94))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-menu-item-get-title-sel+ 95))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-menu-item-set-title-sel+ 96))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-menu-item-get-shortcut-sel+ 97))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-menu-item-get-long-only-sel+ 98))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-menu-item-set-execute-proc-sel+ 99))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-menu-item-set-compute-enabled-proc-sel+ 100))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-menu-item-set-compute-marked-proc-sel+ 101))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-menu-item-acquire-submenu-sel+ 102))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-menu-item-is-enabled-sel+ 103))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-menu-item-is-marked-sel+ 104))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-menu-item-execute-sel+ 105))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-menu-item-get-parent-menu-sel+ 106))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-page-view-get-avdoc-sel+ 107))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +old-avpage-view-get-aperture-sel+ 108))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-page-view-get-page-sel+ 109))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-page-view-get-zoom-sel+ 110))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-page-view-get-zoom-type-sel+ 111))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-page-view-get-page-num-sel+ 112))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-page-view-get-color-sel+ 113))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-page-view-set-color-sel+ 114))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-page-view-begin-operation-sel+ 115))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-page-view-end-operation-sel+ 116))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-page-view-go-to-sel+ 117))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-page-view-zoom-to-sel+ 118))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +old-avpage-view-scroll-to-sel+ 119))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +old-avpage-view-scroll-to-rect-sel+ 120))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-page-view-read-page-up-sel+ 121))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-page-view-read-page-down-sel+ 122))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-page-view-go-back-sel+ 123))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-page-view-go-forward-sel+ 124))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-page-view-to-view-dest-sel+ 125))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +old-avpage-view-invalidate-rect-sel+ 126))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-page-view-draw-now-sel+ 127))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +old-avpage-view-invert-rect-sel+ 128))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +old-avpage-view-invert-rect-outline-sel+ 129))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +old-avpage-view-draw-rect-outline-sel+ 130))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +old-avpage-view-draw-rect-sel+ 131))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +old-avpage-view-get-mouse-position-sel+ 132))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +old-avpage-view-drag-out-new-rect-sel+ 133))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +old-avpage-view-drag-rect-sel+ 134))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +old-avapp-register-for-page-view-drawing-sel+ 135))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-app-unregister-for-page-view-drawing-sel+ 136))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +old-avapp-register-for-page-view-clicks-sel+ 137))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-app-unregister-for-page-view-clicks-sel+ 138))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +old-avapp-register-for-page-view-adjust-cursor-sel+ 139))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-app-unregister-for-page-view-adjust-cursor-sel+ 140))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +old-avpage-view-is-annot-at-point-sel+ 141))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +old-avpage-view-get-annot-rect-sel+ 142))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +old-avpage-view-set-annot-location-sel+ 143))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-page-view-start-reading-thread-sel+ 144))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-page-view-get-thread-index-sel+ 145))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-page-view-get-active-bead-sel+ 146))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +old-avpage-view-is-bead-at-point-sel+ 147))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-page-view-get-page-to-dev-matrix-sel+ 148))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-page-view-get-dev-to-page-matrix-sel+ 149))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +old-avpage-view-point-to-device-sel+ 150))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +old-avpage-view-device-point-to-page-sel+ 151))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +old-avpage-view-rect-to-device-sel+ 152))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +old-avpage-view-device-rect-to-page-sel+ 153))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-sys-get-modifiers-sel+ 154))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-sys-mouse-is-still-down-sel+ 155))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-sys-beep-sel+ 156))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-sys-get-standard-cursor-sel+ 157))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-sys-set-cursor-sel+ 158))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-sys-get-cursor-sel+ 159))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +old-avtool-bar-get-frame-sel+ 160))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-legacy-tool-bar-get-button-by-name-sel+ 161))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-legacy-tool-bar-enum-buttons-sel+ 162))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-legacy-tool-bar-add-button-sel+ 163))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-legacy-tool-bar-get-num-buttons-sel+ 164))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-legacy-tool-bar-is-room-for-sel+ 165))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-legacy-tool-bar-update-button-states-sel+ 166))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-legacy-tool-button-new-sel+ 167))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-legacy-tool-button-destroy-sel+ 168))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-legacy-tool-button-remove-sel+ 169))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-legacy-tool-button-is-separator-sel+ 170))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-legacy-tool-button-get-name-sel+ 171))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-legacy-tool-button-execute-sel+ 172))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-legacy-tool-button-set-execute-proc-sel+ 173))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-legacy-tool-button-set-compute-enabled-proc-sel+ 174))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-legacy-tool-button-set-compute-marked-proc-sel+ 175))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-legacy-tool-button-is-enabled-sel+ 176))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-legacy-tool-button-is-marked-sel+ 177))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-tool-get-type-sel+ 178))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-tool-is-persistent-sel+ 179))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +old-avwindow-new-sel+ 180))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +old-avwindow-new-from-platform-thing-sel+ 181))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-window-destroy-sel+ 182))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-window-user-close-sel+ 183))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-window-maximize-sel+ 184))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-window-show-sel+ 185))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-window-hide-sel+ 186))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-window-is-visible-sel+ 187))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-window-get-platform-thing-sel+ 188))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-window-get-owner-data-sel+ 189))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-window-set-owner-data-sel+ 190))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +old-avwindow-get-title-sel+ 191))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +old-avwindow-set-title-sel+ 192))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +old-avwindow-get-frame-sel+ 193))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +old-avwindow-set-frame-sel+ 194))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +old-avwindow-get-interior-sel+ 195))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-window-bring-to-front-sel+ 196))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +old-avwindow-invalidate-rect-sel+ 197))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-window-draw-now-sel+ 198))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-window-set-wants-key-sel+ 199))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-window-is-key-sel+ 200))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-window-become-key-sel+ 201))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-window-resign-key-sel+ 202))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-graf-select-create-sel+ 203))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-graf-select-destroy-sel+ 204))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-graf-select-get-bounding-rect-sel+ 205))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-crypt-do-std-security-sel+ 206))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-crypt-get-password-sel+ 207))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-doc-do-save-sel+ 208))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-doc-get-client-name-sel+ 209))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-doc-set-client-name-sel+ 210))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-doc-get-page-text-sel+ 211))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-legacy-tool-button-set-help-text-sel+ 212))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +old-avpage-view-track-text-sel+ 213))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-page-view-highlight-text-sel+ 214))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-page-view-invalidate-text-sel+ 215))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +old-avpage-view-point-in-text-sel+ 216))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-page-view-get-first-visible-page-num-sel+ 217))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-page-view-get-last-visible-page-num-sel+ 218))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-page-view-page-num-is-visible-sel+ 219))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-page-view-set-page-num-sel+ 220))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-page-view-get-selected-annot-page-num-sel+ 221))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-doc-send-aux-data-sel+ 222))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-has-aux-data-handler-sel+ 223))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +old-avregister-aux-data-handler-sel+ 224))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-unregister-aux-data-handler-sel+ 225))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +old-avdoc-print-pages-with-params-sel+ 226))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +old-avpage-view-draw-cos-obj-sel+ 227))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-doc-set-dead-sel+ 228))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-legacy-tool-button-set-external-sel+ 229))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-app-is-idle-sel+ 230))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +old-avdoc-open-from-as-file-with-params-sel+ 231))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-page-view-get-next-view-sel+ 232))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +old-avdoc-get-view-def-sel+ 233))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +old-avdoc-set-view-def-sel+ 234))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-window-handle-platform-event-sel+ 235))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-window-get-cursor-at-point-sel+ 236))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-doc-do-action-props-dialog-sel+ 237))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-app-get-trans-handler-by-type-sel+ 238))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-app-enum-trans-handlers-sel+ 239))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-app-register-trans-handler-sel+ 240))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-doc-do-save-as-sel+ 241))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-page-view-set-layout-mode-sel+ 242))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-page-view-get-layout-mode-sel+ 243))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +old-avpage-view-inset-rect-sel+ 244))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-doc-is-external-sel+ 245))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-page-view-use-this-destination-sel+ 246))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-auth-open-sel+ 247))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-doc-copy-annot-sel+ 248))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-doc-copy-annot-common-sel+ 249))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-doc-copy-action-sel+ 250))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-doc-copy-action-common-sel+ 251))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-doc-copy-additional-actions-sel+ 252))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +old-avpage-view-draw-cos-obj-ex-sel+ 253))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-page-view-to-dest-info-sel+ 254))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-page-view-use-dest-info-sel+ 255))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-dest-info-destroy-sel+ 256))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-doc-do-copy-as-sel+ 257))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +old-avpage-view-draw-annot-sequence-sel+ 258))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-doc-do-print-sel+ 259))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-doc-do-save-as-with-params-sel+ 260))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-annot-handler-get-info-sel+ 261))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-annot-handler-delete-info-sel+ 262))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +old-avpage-view-do-popup-menu-sel+ 263))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-page-view-transform-rect-rz-sel+ 264))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-page-view-appearance-get-avmatrix-sel+ 265))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-page-view-get-visible-annot-page-sel+ 266))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-page-view-invert-quad-sel+ 267))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-sys-alloc-time-string-from-time-rec-sel+ 268))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-app-handle-platform-event-sel+ 269))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-doc-set-read-only-sel+ 270))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-doc-is-read-only-sel+ 271))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-page-view-show-control-sel+ 272))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-legacy-tool-bar-new-flyout-sel+ 273))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-legacy-tool-button-set-flyout-sel+ 274))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-legacy-tool-button-get-flyout-sel+ 275))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-legacy-tool-button-set-menu-sel+ 276))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-legacy-tool-button-get-menu-sel+ 277))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-legacy-tool-button-set-icon-sel+ 278))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-legacy-tool-button-get-icon-sel+ 279))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +old-avpage-view-device-rect-to-page-rz-sel+ 280))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-doc-alert-sel+ 281))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-doc-alert-note-sel+ 282))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-doc-alert-confirm-sel+ 283))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-doc-alert-yes-no-sel+ 284))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-menubar-add-hidden-menu-sel+ 285))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-menu-is-hidden-on-menubar-sel+ 286))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-app-open-help-file-sel+ 287))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +old-avpage-view-get-gray-rect-sel+ 288))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-doc-selection-enum-page-ranges-sel+ 289))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +old-avwindow-get-min-max-size-sel+ 290))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +old-avwindow-set-min-max-size-sel+ 291))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-app-register-for-page-view-key-down-sel+ 292))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-app-unregister-for-page-view-key-down-sel+ 293))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-app-register-to-pdf-handler-sel+ 294))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-app-register-from-pdf-handler-sel+ 295))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-conversion-enum-to-pdf-converters-sel+ 296))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-conversion-enum-from-pdf-converters-sel+ 297))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-conversion-convert-to-pdf-with-handler-sel+ 298))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-conversion-convert-from-pdf-with-handler-sel+ 299))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-conversion-convert-to-pdf-sel+ 300))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-command-new-sel+ 301))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-command-destroy-sel+ 302))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-command-get-name-sel+ 303))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-command-get-status-sel+ 304))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-command-get-cab-sel+ 305))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-command-put-cab-sel+ 306))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-command-set-params-sel+ 307))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-command-get-params-sel+ 308))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-command-set-config-sel+ 309))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-command-get-config-sel+ 310))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-command-get-props-sel+ 311))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-command-set-inputs-sel+ 312))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-command-get-inputs-sel+ 313))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-command-show-dialog-sel+ 314))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-command-work-sel+ 315))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-command-cancel-sel+ 316))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-command-reset-sel+ 317))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-command-get-uipolicy-sel+ 318))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-command-get-avdoc-sel+ 319))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-command-get-pddoc-sel+ 320))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-command-get-report-proc-sel+ 321))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-command-get-progress-monitor-sel+ 322))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-command-get-cancel-proc-sel+ 323))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-app-register-command-handler-sel+ 324))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-app-find-command-handler-by-name-sel+ 325))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-app-register-global-command-sel+ 326))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-app-find-global-command-by-name-sel+ 327))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-app-unregister-global-command-sel+ 328))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-command-execute-sel+ 329))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-acquire-special-folder-path-name-sel+ 330))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-page-view-get-focus-annot-sel+ 331))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-page-view-set-focus-annot-sel+ 332))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-page-view-clear-focus-annot-sel+ 333))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-page-view-is-focus-annot-sel+ 334))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-util-get-base-name-and-extension-by-path-name-sel+ 335))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-util-get-base-name-and-extension-by-string-sel+ 336))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-identity-get-text-sel+ 337))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-identity-set-text-sel+ 338))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-page-view-focus-annot-perform-op-sel+ 339))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-page-view-filter-key-down-for-focus-annot-sel+ 340))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +old-avpage-view-ghost-rect-outline-sel+ 341))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-legacy-tool-bar-new-sel+ 342))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +old-avapp-register-legacy-tool-bar-position-sel+ 343))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +old-avpage-view-snap-point-sel+ 344))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +old-avpage-view-get-mouse-position-snapped-sel+ 345))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +old-avpage-view-drag-out-new-rect-snapped-sel+ 346))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +old-avpage-view-drag-rect-snapped-sel+ 347))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +old-avrect-handle-hit-test-sel+ 348))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +old-avpage-view-draw-rect-outline-with-handles-sel+ 349))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +old-avpage-view-is-annot-of-type-at-point-sel+ 350))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-window-center-sel+ 351))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-doc-from-pddoc-sel+ 352))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +old-avpage-view-snap-rect-sel+ 353))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-app-get-report-proc-sel+ 354))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-doc-is-dead-sel+ 355))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-app-get-pref-bool-sel+ 356))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-app-get-pref-int-sel+ 357))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-app-get-pref-atom-sel+ 358))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-app-get-pref-double-sel+ 359))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-app-get-pref-string-sel+ 360))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-app-get-pref-text-sel+ 361))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-app-get-pref-cab-sel+ 362))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-app-get-pref-path-name-sel+ 363))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-alert-with-params-sel+ 364))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-alert-set-pref-sel+ 365))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-alert-get-pref-sel+ 366))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-alert-reset-prefs-sel+ 367))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-doc-perform-action-ex-sel+ 368))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-extension-get-num-plug-ins-sel+ 369))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-extension-acquire-info-sel+ 370))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-extension-release-info-sel+ 371))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-page-view-device-to-info-sel+ 372))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-page-view-info-to-device-sel+ 373))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-page-view-point-to-info-sel+ 374))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-page-view-info-to-point-sel+ 375))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-page-view-update-info-panel-sel+ 376))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-app-get-legacy-tool-bar-by-name-sel+ 377))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-app-get-language-encoding-sel+ 378))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-page-view-scroll-to-annot-sel+ 379))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-sys-set-wait-cursor-sel+ 380))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-doc-perm-request-sel+ 381))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-page-view-suspend-offscreen-drawing-sel+ 382))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-page-view-resume-offscreen-drawing-sel+ 383))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-app-did-or-will-switch-for-dialog-sel+ 384))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-app-yield-to-other-apps-sel+ 385))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-window-ensure-in-bounds-sel+ 386))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-menu-clone-sel+ 387))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-page-view-scroll-to-sel+ 388))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-app-register-for-page-view-adjust-cursor-sel+ 389))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-app-register-for-page-view-clicks-sel+ 390))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-app-register-for-page-view-drawing-sel+ 391))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-doc-open-from-file-with-params-sel+ 392))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-doc-open-from-pddoc-with-params-sel+ 393))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-doc-open-from-as-file-with-params-sel+ 394))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-doc-print-pages-with-params-sel+ 395))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-doc-get-view-def-sel+ 396))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-doc-set-view-def-sel+ 397))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-doc-get-selection-server-by-type-sel+ 398))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-doc-register-selection-server-sel+ 399))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-page-view-get-aperture-sel+ 400))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-page-view-scroll-to-rect-sel+ 401))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-page-view-invalidate-rect-sel+ 402))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-page-view-invert-rect-sel+ 403))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-page-view-draw-rect-outline-sel+ 404))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-page-view-draw-rect-sel+ 405))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-page-view-get-annot-rect-sel+ 406))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-page-view-rect-to-device-sel+ 407))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-page-view-device-rect-to-page-sel+ 408))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-page-view-draw-cos-obj-sel+ 409))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-page-view-inset-rect-sel+ 410))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-page-view-draw-cos-obj-ex-sel+ 411))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-page-view-draw-annot-sequence-sel+ 412))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-page-view-get-gray-rect-sel+ 413))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-page-view-ghost-rect-outline-sel+ 414))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-rect-handle-hit-test-sel+ 415))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-page-view-draw-rect-outline-with-handles-sel+ 416))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-page-view-get-mouse-position-sel+ 417))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-page-view-drag-out-new-rect-sel+ 418))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-page-view-drag-rect-sel+ 419))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-page-view-is-annot-at-point-sel+ 420))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-page-view-is-bead-at-point-sel+ 421))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-page-view-device-point-to-page-sel+ 422))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-page-view-track-text-sel+ 423))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-page-view-point-in-text-sel+ 424))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-page-view-do-popup-menu-sel+ 425))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-page-view-device-rect-to-page-rz-sel+ 426))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-page-view-snap-point-sel+ 427))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-page-view-get-mouse-position-snapped-sel+ 428))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-page-view-drag-out-new-rect-snapped-sel+ 429))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-page-view-drag-rect-snapped-sel+ 430))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-page-view-snap-rect-sel+ 431))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-page-view-invert-rect-outline-sel+ 432))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-page-view-point-to-device-sel+ 433))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-page-view-is-annot-of-type-at-point-sel+ 434))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-page-view-set-annot-location-sel+ 435))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-app-register-annot-handler-sel+ 436))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-app-register-tool-sel+ 437))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-window-new-sel+ 438))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-window-new-from-platform-thing-sel+ 439))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-window-get-frame-sel+ 440))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-window-set-frame-sel+ 441))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-window-get-interior-sel+ 442))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-window-invalidate-rect-sel+ 443))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-window-get-min-max-size-sel+ 444))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-window-set-min-max-size-sel+ 445))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-app-get-uuid-sel+ 446))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-sys-get-icon-from-filename-sel+ 447))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-sys-get-icon-from-mime-type-sel+ 448))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-sys-get-icon-from-type-and-creator-sel+ 449))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-conversion-convert-stream-to-pdf-with-handler-sel+ 450))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-conversion-convert-stream-from-pdf-with-handler-sel+ 451))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-conversion-convert-stream-from-struct-node-with-handler-sel+ 452))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-conversion-convert-stream-to-pdf-sel+ 453))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-menu-do-pop-up-sel+ 454))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-doc-get-num-page-views-sel+ 455))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-doc-get-nth-page-view-sel+ 456))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-doc-open-from-file-with-param-string-sel+ 457))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-doc-open-from-pddoc-with-param-string-sel+ 458))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-doc-open-from-as-file-with-param-string-sel+ 459))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-app-help-show-contents-sel+ 460))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-app-help-search-sel+ 461))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-app-help-show-index-sel+ 462))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-app-open-help-file-with-params-sel+ 463))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-legacy-tool-button-add-animation-icon-sel+ 464))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-legacy-tool-button-get-animation-icon-count-sel+ 465))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-legacy-tool-button-start-animation-sel+ 466))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-legacy-tool-button-stop-animation-sel+ 467))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-legacy-tool-button-is-animation-running-sel+ 468))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-legacy-tool-button-set-animation-period-sel+ 469))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-legacy-tool-button-get-animation-period-sel+ 470))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-legacy-tool-button-remove-animation-icons-sel+ 471))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-menu-new-with-as-text-sel+ 472))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-menu-get-title-as-as-text-sel+ 473))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-menu-item-new-with-as-text-sel+ 474))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-menu-item-get-title-as-as-text-sel+ 475))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-menu-item-set-title-with-as-text-sel+ 476))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-window-get-title-sel+ 477))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-window-set-title-sel+ 478))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-doc-open-from-file-sel+ 479))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-doc-open-from-pddoc-sel+ 480))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-util-get-base-name-and-extension-ex-sel+ 481))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-page-view-set-visible-inks-sel+ 482))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-page-view-set-ink-preview-sel+ 483))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-page-view-get-num-visible-inks-sel+ 484))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-page-view-get-visible-inks-sel+ 485))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-page-view-get-pixel-information-at-point-sel+ 486))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-undo-new-sel+ 487))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-undo-set-data-sel+ 488))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-undo-get-data-sel+ 489))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-undo-get-avdoc-sel+ 490))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-undo-get-type-sel+ 491))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-doc-clear-undos-sel+ 492))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-doc-get-top-undo-sel+ 493))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-doc-begin-undo-operation-sel+ 494))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-doc-end-undo-operation-sel+ 495))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-page-view-draw-now-with-transition-sel+ 496))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-doc-print-separations-sel+ 497))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-doc-get-view-def-ex-sel+ 498))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-doc-set-view-def-ex-sel+ 499))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-window-do-modal-sel+ 500))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-window-end-modal-sel+ 501))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-sys-get-use-pen-for-input-sel+ 502))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-page-view-snap-point-ex-sel+ 503))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-page-view-drag-rect-snapped-ex-sel+ 504))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-legacy-tool-button-set-compute-tooltip-proc-sel+ 505))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-legacy-tool-button-set-label-text-sel+ 506))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-legacy-tool-button-get-label-text-sel+ 507))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-menu-item-clone-sel+ 508))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-app-get-language-with-params-sel+ 509))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-app-create-icon-bundle6-sel+ 510))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-legacy-tool-button-set-notify-tooltip-proc-sel+ 511))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-window-get-border-widths-sel+ 512))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-page-view-draw-polygon-sel+ 513))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-page-view-draw-polygon-outline-sel+ 514))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-app-register-how-to-panel-sel+ 515))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-app-set-how-to-panel-auto-show-text-sel+ 516))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-app-get-how-to-panel-auto-show-sel+ 517))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-app-set-how-to-panel-auto-show-sel+ 518))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-app-auto-show-how-to-panel-sel+ 519))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-menu-item-set-compute-visible-proc-sel+ 520))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-menu-item-is-visible-sel+ 521))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-legacy-tool-button-set-compute-visible-proc-sel+ 522))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-app-set-how-to-panel-compute-visible-proc-sel+ 523))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-app-register-legacy-tool-bar-position-sel+ 524))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-doc-get-top-undo-and-redo-sel+ 525))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-app-register-for-context-menu-addition-sel+ 526))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-page-view-get-page-to-dev-scaling-sel+ 527))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-doc-get-active-tool-sel+ 528))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-doc-set-active-tool-sel+ 529))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-app-register-for-page-view-right-clicks-sel+ 530))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-app-unregister-for-page-view-right-clicks-sel+ 531))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-doc-is-slow-sel+ 532))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-window-get-desktop-bounds-sel+ 533))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-doc-get-server-type-sel+ 534))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-app-unregister-for-page-view-drawing-ex-sel+ 535))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-page-view-set-wireframe-drawing-sel+ 536))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-page-view-get-wireframe-drawing-sel+ 537))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-app-should-key-delete-object-sel+ 538))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-app-register-late-init-proc-sel+ 539))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-doc-get-bookmarks-sel+ 540))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-doc-get-last-active-tool-sel+ 541))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-doc-get-num-windows-sel+ 542))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-doc-get-nth-window-sel+ 543))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-page-view-get-avwindow-sel+ 544))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-doc-do-annot-properties-sel+ 545))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-sys-track-mouse-sel+ 546))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-doc-save-optimized-sel+ 547))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-get-optimizer-presets-sel+ 548))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-get-optimizer-params-for-preset-sel+ 549))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-app-get-annot-appearance-padding-sel+ 550))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-menu-item-is-scriptable-sel+ 551))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-sys-time-as-text-from-time-rec-sel+ 552))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-legacy-tool-button-set-menu-icon-sel+ 553))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-listen-for-custom-notification-sel+ 554))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-unlisten-for-custom-notification-sel+ 555))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-broadcast-custom-notification-sel+ 556))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-register-aux-data-handler-sel+ 557))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-doc-apply-redactions-sel+ 558))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-legacy-tool-bar-add-button-ex-sel+ 559))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-app-begin-save-sel+ 560))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-app-end-save-sel+ 561))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-app-cancel-save-sel+ 562))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-page-view-get-ink-preview-sel+ 563))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-page-view-acquire-draw-context-sel+ 564))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-page-view-release-draw-context-sel+ 565))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-legacy-tool-button-set-help-text-with-as-text-sel+ 566))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-legacy-tool-bar-new-with-as-text-sel+ 567))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-app-unregister-annot-handler-sel+ 568))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-conversion-append-to-pdf-with-handler-sel+ 569))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-conversion-get-conversion-queue-status-with-handler-sel+ 570))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-conversion-to-pdf-set-settings-sel+ 571))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-doc-is-in-protected-view-sel+ 572))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-app-register-idle-proc-with-name-sel+ 573))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-app-register-late-init-proc-with-name-sel+ 574))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-app-unregister-for-context-menu-addition-sel+ 575))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-app-save-dialog-ex-sel+ 576))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-app-begin-save-ex-sel+ 577))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-app-register-idle-proc-ex-with-name-sel+ 578))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-app-get-version-ex-sel+ 579))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-extension-acquire-info-ex-sel+ 580))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-extension-release-info-ex-sel+ 581))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-doc-bring-to-front-sel+ 582))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-doc-get-display-title-sel+ 583))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-icon-create-from-pdf-sel+ 584))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-tool-bar-set-icon-sel+ 585))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-storage-register-new-storage-sel+ 586))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-storage-register-account-sel+ 587))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-storage-get-account-info-sel+ 588))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-storage-perform-oauth2authentication-sel+ 589))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-make-web-services-request-sel+ 590))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-page-view-draw-now-optimized-sel+ 591))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-make-acrobat-default-sel+ 592))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-window-get-platform-thing-ex-sel+ 593))
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
(define-foreign-funcallable av-app-did-or-will-switch-for-dialog-selproto
                            nil
                            :result-type
                            as-bool
                            :calling-convention
                            :cdecl)
;; sel = 385
(define-foreign-funcallable av-app-yield-to-other-apps-selproto
                            ((yield-timeout :double))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 386
(define-foreign-funcallable av-window-ensure-in-bounds-selproto
                            ((win av-window))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 387
(define-foreign-funcallable av-menu-clone-selproto
                            ((menu av-menu))
                            :result-type
                            av-menu
                            :calling-convention
                            :cdecl)
;; sel = 388
(define-foreign-funcallable av-page-view-scroll-to-selproto
                            ((page-view av-page-view)
                             (x-origin av-dev-coord)
                             (y-origin av-dev-coord))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 389
(define-foreign-funcallable av-app-register-for-page-view-adjust-cursor-selproto
                            ((cursor-proc av-page-view-cursor-proc)
                             (data (:pointer :void)))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 390
(define-foreign-funcallable av-app-register-for-page-view-clicks-selproto
                            ((click-proc av-page-view-click-proc)
                             (data (:pointer :void)))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 391
(define-foreign-funcallable av-app-register-for-page-view-drawing-selproto
                            ((proc av-page-view-draw-proc)
                             (data (:pointer :void)))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 392
(define-foreign-funcallable av-doc-open-from-file-with-params-selproto
                            ((path-name as-path-name)
                             (file-sys as-file-sys)
                             (temp-title as-text)
                             (params av-doc-open-params))
                            :result-type
                            av-doc
                            :calling-convention
                            :cdecl)
;; sel = 393
(define-foreign-funcallable av-doc-open-from-pddoc-with-params-selproto
                            ((pd-doc pd-doc)
                             (temp-title as-text)
                             (params av-doc-open-params))
                            :result-type
                            av-doc
                            :calling-convention
                            :cdecl)
;; sel = 394
(define-foreign-funcallable av-doc-open-from-as-file-with-params-selproto
                            ((file as-file)
                             (temp-title as-text)
                             (params av-doc-open-params))
                            :result-type
                            av-doc
                            :calling-convention
                            :cdecl)
;; sel = 395
(define-foreign-funcallable av-doc-print-pages-with-params-selproto
                            ((doc av-doc) (params av-doc-print-params))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 396
(define-foreign-funcallable av-doc-get-view-def-selproto
                            ((doc av-doc) (view-def av-doc-view-def))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 397
(define-foreign-funcallable av-doc-set-view-def-selproto
                            ((doc av-doc) (view-def av-doc-view-def))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 398
(define-foreign-funcallable av-doc-get-selection-server-by-type-selproto
                            ((type as-atom))
                            :result-type
                            av-doc-selection-server
                            :calling-convention
                            :cdecl)
;; sel = 399
(define-foreign-funcallable av-doc-register-selection-server-selproto
                            ((server av-doc-selection-server))
                            :result-type
                            as-bool
                            :calling-convention
                            :cdecl)
;; sel = 400
(define-foreign-funcallable av-page-view-get-aperture-selproto
                            ((page-view av-page-view)
                             (rect (:pointer av-dev-rect)))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 401
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
;; sel = 402
(define-foreign-funcallable av-page-view-invalidate-rect-selproto
                            ((page-view av-page-view)
                             (area (:pointer av-dev-rect)))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 403
(define-foreign-funcallable av-page-view-invert-rect-selproto
                            ((page-view av-page-view)
                             (rect (:pointer av-dev-rect))
                             (highlight as-bool))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 404
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
;; sel = 405
(define-foreign-funcallable av-page-view-draw-rect-selproto
                            ((page-view av-page-view)
                             (rect (:pointer av-dev-rect)))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 406
(define-foreign-funcallable av-page-view-get-annot-rect-selproto
                            ((page-view av-page-view)
                             (an-annot pd-annot)
                             (rect (:pointer av-dev-rect)))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 407
(define-foreign-funcallable av-page-view-rect-to-device-selproto
                            ((page-view av-page-view)
                             (p as-fixed-rect-p)
                             (rect (:pointer av-dev-rect)))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 408
(define-foreign-funcallable av-page-view-device-rect-to-page-selproto
                            ((page-view av-page-view)
                             (rect (:pointer av-dev-rect))
                             (p (:pointer as-fixed-rect)))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 409
(define-foreign-funcallable av-page-view-draw-cos-obj-selproto
                            ((page-view av-page-view)
                             (cos-obj cos-obj)
                             (r (:pointer av-dev-rect)))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 410
(define-foreign-funcallable av-page-view-inset-rect-selproto
                            ((page-view av-page-view)
                             (rr (:pointer av-dev-rect))
                             (down as-bool))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 411
(define-foreign-funcallable av-page-view-draw-cos-obj-ex-selproto
                            ((page-view av-page-view)
                             (cos-obj cos-obj)
                             (r (:pointer av-dev-rect))
                             (matrix (:pointer as-fixed-matrix)))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 412
(define-foreign-funcallable av-page-view-draw-annot-sequence-selproto
                            ((pv av-page-view)
                             (an pd-annot)
                             (bbox (:pointer av-dev-rect)))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 413
(define-foreign-funcallable av-page-view-get-gray-rect-selproto
                            ((page-view av-page-view)
                             (grey-rect (:pointer av-dev-rect)))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 414
(define-foreign-funcallable av-page-view-ghost-rect-outline-selproto
                            ((page-view av-page-view)
                             (rect (:pointer av-dev-rect)))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 415
(define-foreign-funcallable av-rect-handle-hit-test-selproto
                            ((rect (:pointer av-dev-rect))
                             (b-midpoints as-bool)
                             (x av-dev-coord)
                             (y av-dev-coord))
                            :result-type
                            av-drag-type-ex
                            :calling-convention
                            :cdecl)
;; sel = 416
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
;; sel = 417
(define-foreign-funcallable av-page-view-get-mouse-position-selproto
                            ((page-view av-page-view)
                             (x (:pointer av-dev-coord))
                             (y (:pointer av-dev-coord)))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 418
(define-foreign-funcallable av-page-view-drag-out-new-rect-selproto
                            ((page-view av-page-view)
                             (x-start av-dev-coord)
                             (y-start av-dev-coord)
                             (result-rect (:pointer av-dev-rect)))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 419
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
;; sel = 420
(define-foreign-funcallable av-page-view-is-annot-at-point-selproto
                            ((page-view av-page-view)
                             (x-hit av-dev-coord)
                             (y-hit av-dev-coord)
                             (hit-annot (:pointer pd-annot)))
                            :result-type
                            as-bool
                            :calling-convention
                            :cdecl)
;; sel = 421
(define-foreign-funcallable av-page-view-is-bead-at-point-selproto
                            ((page-view av-page-view)
                             (x-hit av-dev-coord)
                             (y-hit av-dev-coord)
                             (bead-p (:pointer pd-bead)))
                            :result-type
                            as-bool
                            :calling-convention
                            :cdecl)
;; sel = 422
(define-foreign-funcallable av-page-view-device-point-to-page-selproto
                            ((page-view av-page-view)
                             (x av-dev-coord)
                             (y av-dev-coord)
                             (p (:pointer as-fixed-point)))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 423
(define-foreign-funcallable av-page-view-track-text-selproto
                            ((page-view av-page-view)
                             (x-hit av-dev-coord)
                             (y-hit av-dev-coord)
                             (current pd-text-select))
                            :result-type
                            pd-text-select
                            :calling-convention
                            :cdecl)
;; sel = 424
(define-foreign-funcallable av-page-view-point-in-text-selproto
                            ((page-view av-page-view)
                             (x-hit av-dev-coord)
                             (y-hit av-dev-coord)
                             (pd-text pd-text-select))
                            :result-type
                            as-bool
                            :calling-convention
                            :cdecl)
;; sel = 425
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
;; sel = 426
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
;; sel = 427
(define-foreign-funcallable av-page-view-snap-point-selproto
                            ((page-view av-page-view)
                             (x (:pointer av-dev-coord))
                             (y (:pointer av-dev-coord))
                             (direction av-drag-type))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 428
(define-foreign-funcallable av-page-view-get-mouse-position-snapped-selproto
                            ((page-view av-page-view)
                             (x (:pointer av-dev-coord))
                             (y (:pointer av-dev-coord))
                             (direction av-drag-type))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 429
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
;; sel = 430
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
;; sel = 431
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
;; sel = 432
(define-foreign-funcallable av-page-view-invert-rect-outline-selproto
                            ((page-view av-page-view)
                             (rect (:pointer av-dev-rect)))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 433
(define-foreign-funcallable av-page-view-point-to-device-selproto
                            ((page-view av-page-view)
                             (p as-fixed-point-p)
                             (x (:pointer av-dev-coord))
                             (y (:pointer av-dev-coord)))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 434
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
;; sel = 435
(define-foreign-funcallable av-page-view-set-annot-location-selproto
                            ((an-annot pd-annot)
                             (page-view av-page-view)
                             (x av-dev-coord)
                             (y av-dev-coord))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 436
(define-foreign-funcallable av-app-register-annot-handler-selproto
                            ((handler av-annot-handler))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 437
(define-foreign-funcallable av-app-register-tool-selproto
                            ((tool av-tool))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 438
(define-foreign-funcallable av-window-new-selproto
                            ((layer av-window-layer)
                             (flags av-flag-bits32)
                             (handler av-window-handler)
                             (owner as-extension))
                            :result-type
                            av-window
                            :calling-convention
                            :cdecl)
;; sel = 439
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
;; sel = 440
(define-foreign-funcallable av-window-get-frame-selproto
                            ((win av-window)
                             (rect (:pointer av-screen-rect)))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 441
(define-foreign-funcallable av-window-set-frame-selproto
                            ((win av-window)
                             (rect (:pointer av-screen-rect)))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 442
(define-foreign-funcallable av-window-get-interior-selproto
                            ((win av-window)
                             (rect (:pointer av-window-rect)))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 443
(define-foreign-funcallable av-window-invalidate-rect-selproto
                            ((win av-window)
                             (rect (:pointer av-window-rect)))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 444
(define-foreign-funcallable av-window-get-min-max-size-selproto
                            ((win av-window) (rect (:pointer av-rect)))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 445
(define-foreign-funcallable av-window-set-min-max-size-selproto
                            ((win av-window) (rect (:pointer av-rect)))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 446
(define-foreign-funcallable av-app-get-uuid-selproto
                            ((type av-app-uuid-type)
                             (dst (:pointer as-uuid)))
                            :result-type
                            as-bool
                            :calling-convention
                            :cdecl)
;; sel = 447
(define-foreign-funcallable av-sys-get-icon-from-filename-selproto
                            ((fname as-text) (itype av-sys-icon-type))
                            :result-type
                            av-icon
                            :calling-convention
                            :cdecl)
;; sel = 448
(define-foreign-funcallable av-sys-get-icon-from-mime-type-selproto
                            ((mime-type
                              (:reference-pass :ef-mb-string))
                             (itype av-sys-icon-type))
                            :result-type
                            av-icon
                            :calling-convention
                            :cdecl)
;; sel = 449
(define-foreign-funcallable av-sys-get-icon-from-type-and-creator-selproto
                            ((type as-uns32)
                             (creator as-uns32)
                             (itype av-sys-icon-type))
                            :result-type
                            av-icon
                            :calling-convention
                            :cdecl)
;; sel = 450
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
;; sel = 451
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
;; sel = 452
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
;; sel = 453
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
;; sel = 454
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
;; sel = 455
(define-foreign-funcallable av-doc-get-num-page-views-selproto
                            ((av-doc av-doc))
                            :result-type
                            as-count
                            :calling-convention
                            :cdecl)
;; sel = 456
(define-foreign-funcallable av-doc-get-nth-page-view-selproto
                            ((av-doc av-doc) (n as-count))
                            :result-type
                            av-page-view
                            :calling-convention
                            :cdecl)
;; sel = 457
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
;; sel = 458
(define-foreign-funcallable av-doc-open-from-pddoc-with-param-string-selproto
                            ((pd-doc pd-doc)
                             (temp-title as-text)
                             (p av-doc-open-params)
                             (s (:reference-pass :ef-mb-string)))
                            :result-type
                            av-doc
                            :calling-convention
                            :cdecl)
;; sel = 459
(define-foreign-funcallable av-doc-open-from-as-file-with-param-string-selproto
                            ((file as-file)
                             (temp-title as-text)
                             (p av-doc-open-params)
                             (s (:reference-pass :ef-mb-string)))
                            :result-type
                            av-doc
                            :calling-convention
                            :cdecl)
;; sel = 460
(define-foreign-funcallable av-app-help-show-contents-selproto
                            ((file-name
                              (:reference-pass :ef-mb-string))
                             (content-tag
                              (:reference-pass :ef-mb-string)))
                            :result-type
                            as-bool
                            :calling-convention
                            :cdecl)
;; sel = 461
(define-foreign-funcallable av-app-help-search-selproto
                            ((file-name
                              (:reference-pass :ef-mb-string))
                             (search-text
                              (:reference-pass :ef-mb-string)))
                            :result-type
                            as-bool
                            :calling-convention
                            :cdecl)
;; sel = 462
(define-foreign-funcallable av-app-help-show-index-selproto
                            ((file-name
                              (:reference-pass :ef-mb-string)))
                            :result-type
                            as-bool
                            :calling-convention
                            :cdecl)
;; sel = 463
(define-foreign-funcallable av-app-open-help-file-with-params-selproto
                            ((file-name
                              (:reference-pass :ef-mb-string))
                             (do-search as-bool)
                             (p av-doc-open-params))
                            :result-type
                            as-bool
                            :calling-convention
                            :cdecl)
;; sel = 464
(define-foreign-funcallable av-legacy-tool-button-add-animation-icon-selproto
                            ((button av-tool-button)
                             (new-icon av-icon))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 465
(define-foreign-funcallable av-legacy-tool-button-get-animation-icon-count-selproto
                            ((button av-tool-button))
                            :result-type
                            as-int32
                            :calling-convention
                            :cdecl)
;; sel = 466
(define-foreign-funcallable av-legacy-tool-button-start-animation-selproto
                            ((button av-tool-button))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 467
(define-foreign-funcallable av-legacy-tool-button-stop-animation-selproto
                            ((button av-tool-button))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 468
(define-foreign-funcallable av-legacy-tool-button-is-animation-running-selproto
                            ((button av-tool-button))
                            :result-type
                            as-bool
                            :calling-convention
                            :cdecl)
;; sel = 469
(define-foreign-funcallable av-legacy-tool-button-set-animation-period-selproto
                            ((button av-tool-button)
                             (new-period as-int32))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 470
(define-foreign-funcallable av-legacy-tool-button-get-animation-period-selproto
                            ((button av-tool-button))
                            :result-type
                            as-int32
                            :calling-convention
                            :cdecl)
;; sel = 471
(define-foreign-funcallable av-legacy-tool-button-remove-animation-icons-selproto
                            ((button av-tool-button))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 472
(define-foreign-funcallable av-menu-new-with-as-text-selproto
                            ((title as-const-text)
                             (name (:reference-pass :ef-mb-string))
                             (owner as-extension))
                            :result-type
                            av-menu
                            :calling-convention
                            :cdecl)
;; sel = 473
(define-foreign-funcallable av-menu-get-title-as-as-text-selproto
                            ((menu av-menu) (title as-text))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 474
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
;; sel = 475
(define-foreign-funcallable av-menu-item-get-title-as-as-text-selproto
                            ((menu-item av-menu-item) (title as-text))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 476
(define-foreign-funcallable av-menu-item-set-title-with-as-text-selproto
                            ((menu-item av-menu-item)
                             (title as-const-text))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 477
(define-foreign-funcallable av-window-get-title-selproto
                            ((win av-window) (title as-text))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 478
(define-foreign-funcallable av-window-set-title-selproto
                            ((win av-window) (new-title as-text))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 479
(define-foreign-funcallable av-doc-open-from-file-selproto
                            ((path-name as-path-name)
                             (file-sys as-file-sys)
                             (temp-title as-text))
                            :result-type
                            av-doc
                            :calling-convention
                            :cdecl)
;; sel = 480
(define-foreign-funcallable av-doc-open-from-pddoc-selproto
                            ((doc pd-doc) (temp-title as-text))
                            :result-type
                            av-doc
                            :calling-convention
                            :cdecl)
;; sel = 481
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
;; sel = 482
(define-foreign-funcallable av-page-view-set-visible-inks-selproto
                            ((page-view av-page-view)
                             (n-inks as-int32)
                             (inks (:pointer pd-page-ink-rec)))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 483
(define-foreign-funcallable av-page-view-set-ink-preview-selproto
                            ((page-view av-page-view)
                             (ink-preview as-bool))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 484
(define-foreign-funcallable av-page-view-get-num-visible-inks-selproto
                            ((page-view av-page-view))
                            :result-type
                            as-int32
                            :calling-convention
                            :cdecl)
;; sel = 485
(define-foreign-funcallable av-page-view-get-visible-inks-selproto
                            ((page-view av-page-view)
                             (inks (:pointer pd-page-ink-rec)))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 486
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
;; sel = 487
(define-foreign-funcallable av-undo-new-selproto
                            ((doc av-doc)
                             (handler av-undo-handler)
                             (undo-data av-undo-handler-data))
                            :result-type
                            av-undo
                            :calling-convention
                            :cdecl)
;; sel = 488
(define-foreign-funcallable av-undo-set-data-selproto
                            ((undo av-undo)
                             (handler-data av-undo-handler-data))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 489
(define-foreign-funcallable av-undo-get-data-selproto
                            ((undo av-undo))
                            :result-type
                            av-undo-handler-data
                            :calling-convention
                            :cdecl)
;; sel = 490
(define-foreign-funcallable av-undo-get-avdoc-selproto
                            ((undo av-undo))
                            :result-type
                            av-doc
                            :calling-convention
                            :cdecl)
;; sel = 491
(define-foreign-funcallable av-undo-get-type-selproto
                            ((undo av-undo))
                            :result-type
                            (:reference-pass :ef-mb-string)
                            :calling-convention
                            :cdecl)
;; sel = 492
(define-foreign-funcallable av-doc-clear-undos-selproto
                            ((doc av-doc))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 493
(define-foreign-funcallable av-doc-get-top-undo-selproto
                            ((doc av-doc)
                             (desired-type
                              (:reference-pass :ef-mb-string)))
                            :result-type
                            av-undo
                            :calling-convention
                            :cdecl)
;; sel = 494
(define-foreign-funcallable av-doc-begin-undo-operation-selproto
                            ((doc av-doc))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 495
(define-foreign-funcallable av-doc-end-undo-operation-selproto
                            ((doc av-doc)
                             (undo-title as-text)
                             (redo-title as-text))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 496
(define-foreign-funcallable av-page-view-draw-now-with-transition-selproto
                            ((page-view av-page-view) (trans pd-trans))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 497
(define-foreign-funcallable av-doc-print-separations-selproto
                            ((params av-doc-print-seps-params))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 498
(define-foreign-funcallable av-doc-get-view-def-ex-selproto
                            ((doc av-doc) (view-def as-cab))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 499
(define-foreign-funcallable av-doc-set-view-def-ex-selproto
                            ((doc av-doc) (view-def as-cab))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 500
(define-foreign-funcallable av-window-do-modal-selproto
                            ((window av-window))
                            :result-type
                            as-bool
                            :calling-convention
                            :cdecl)
;; sel = 501
(define-foreign-funcallable av-window-end-modal-selproto
                            ((window av-window))
                            :result-type
                            as-bool
                            :calling-convention
                            :cdecl)
;; sel = 502
(define-foreign-funcallable av-sys-get-use-pen-for-input-selproto
                            nil
                            :result-type
                            as-bool
                            :calling-convention
                            :cdecl)
;; sel = 503
(define-foreign-funcallable av-page-view-snap-point-ex-selproto
                            ((page-view av-page-view)
                             (pt (:pointer as-fixed-point))
                             (direction av-drag-type))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 504
(define-foreign-funcallable av-page-view-drag-rect-snapped-ex-selproto
                            ((params
                              (:pointer av-drag-rect-params-rec)))
                            :result-type
                            av-tflag-bits
                            :calling-convention
                            :cdecl)
;; sel = 505
(define-foreign-funcallable av-legacy-tool-button-set-compute-tooltip-proc-selproto
                            ((button av-tool-button)
                             (proc av-compute-tooltip-proc)
                             (client-data (:pointer :void)))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 506
(define-foreign-funcallable av-legacy-tool-button-set-label-text-selproto
                            ((button av-tool-button)
                             (label-text as-const-text)
                             (priority av-tool-button-label-priority))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 507
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
;; sel = 508
(define-foreign-funcallable av-menu-item-clone-selproto
                            ((menu-item av-menu-item))
                            :result-type
                            av-menu-item
                            :calling-convention
                            :cdecl)
;; sel = 509
(define-foreign-funcallable av-app-get-language-with-params-selproto
                            ((params av-app-language-params))
                            :result-type
                            as-bool
                            :calling-convention
                            :cdecl)
;; sel = 510
(define-foreign-funcallable av-app-create-icon-bundle6-selproto
                            ((e-data-format av-icon-data-format)
                             (data-recs (:pointer av-icon-data-rec))
                             (num-recs as-count))
                            :result-type
                            av-icon-bundle6
                            :calling-convention
                            :cdecl)
;; sel = 511
(define-foreign-funcallable av-legacy-tool-button-set-notify-tooltip-proc-selproto
                            ((button av-tool-button)
                             (proc av-notify-tooltip-proc)
                             (client-data (:pointer :void)))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 512
(define-foreign-funcallable av-window-get-border-widths-selproto
                            ((win av-window) (rect (:pointer av-rect)))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 513
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
;; sel = 514
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
;; sel = 515
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
;; sel = 516
(define-foreign-funcallable av-app-set-how-to-panel-auto-show-text-selproto
                            ((panel-name as-atom)
                             (check-box-text as-const-text))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 517
(define-foreign-funcallable av-app-get-how-to-panel-auto-show-selproto
                            ((panel-name as-atom))
                            :result-type
                            as-bool
                            :calling-convention
                            :cdecl)
;; sel = 518
(define-foreign-funcallable av-app-set-how-to-panel-auto-show-selproto
                            ((panel-name as-atom) (auto-show as-bool))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 519
(define-foreign-funcallable av-app-auto-show-how-to-panel-selproto
                            ((avdoc av-doc) (panel-name as-atom))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 520
(define-foreign-funcallable av-menu-item-set-compute-visible-proc-selproto
                            ((menu-item av-menu-item)
                             (proc av-compute-visible-proc)
                             (data (:pointer :void)))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 521
(define-foreign-funcallable av-menu-item-is-visible-selproto
                            ((menu-item av-menu-item))
                            :result-type
                            as-bool
                            :calling-convention
                            :cdecl)
;; sel = 522
(define-foreign-funcallable av-legacy-tool-button-set-compute-visible-proc-selproto
                            ((button av-tool-button)
                             (p av-compute-visible-proc)
                             (data (:pointer :void)))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 523
(define-foreign-funcallable av-app-set-how-to-panel-compute-visible-proc-selproto
                            ((panel-name as-atom)
                             (p av-compute-visible-proc)
                             (data (:pointer :void)))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 524
(define-foreign-funcallable av-app-register-legacy-tool-bar-position-selproto
                            ((tool-bar-name
                              (:reference-pass :ef-mb-string))
                             (external as-bool)
                             (position av-tool-bar-position))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 525
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
;; sel = 526
(define-foreign-funcallable av-app-register-for-context-menu-addition-selproto
                            ((menu-name as-atom)
                             (proc av-context-menu-addition-proc)
                             (client-data (:pointer :void)))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 527
(define-foreign-funcallable av-page-view-get-page-to-dev-scaling-selproto
                            ((page-view av-page-view)
                             (x-scale (:pointer :float))
                             (y-scale (:pointer :float)))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 528
(define-foreign-funcallable av-doc-get-active-tool-selproto
                            ((doc av-doc))
                            :result-type
                            av-tool
                            :calling-convention
                            :cdecl)
;; sel = 529
(define-foreign-funcallable av-doc-set-active-tool-selproto
                            ((doc av-doc)
                             (tool av-tool)
                             (persistent as-bool))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 530
(define-foreign-funcallable av-app-register-for-page-view-right-clicks-selproto
                            ((click-proc av-page-view-click-proc)
                             (data (:pointer :void)))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 531
(define-foreign-funcallable av-app-unregister-for-page-view-right-clicks-selproto
                            ((click-proc av-page-view-click-proc))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 532
(define-foreign-funcallable av-doc-is-slow-selproto
                            ((doc av-doc))
                            :result-type
                            as-bool
                            :calling-convention
                            :cdecl)
;; sel = 533
(define-foreign-funcallable av-window-get-desktop-bounds-selproto
                            ((win av-window)
                             (frame (:pointer av-rect))
                             (bounds (:pointer av-rect)))
                            :result-type
                            as-bool
                            :calling-convention
                            :cdecl)
;; sel = 534
(define-foreign-funcallable av-doc-get-server-type-selproto
                            ((doc av-doc))
                            :result-type
                            av-doc-server-type
                            :calling-convention
                            :cdecl)
;; sel = 535
(define-foreign-funcallable av-app-unregister-for-page-view-drawing-ex-selproto
                            ((proc av-page-view-draw-proc)
                             (client-data (:pointer :void)))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 536
(define-foreign-funcallable av-page-view-set-wireframe-drawing-selproto
                            ((page-view av-page-view)
                             (draw-wireframe as-bool))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 537
(define-foreign-funcallable av-page-view-get-wireframe-drawing-selproto
                            ((page-view av-page-view))
                            :result-type
                            as-bool
                            :calling-convention
                            :cdecl)
;; sel = 538
(define-foreign-funcallable av-app-should-key-delete-object-selproto
                            ((key av-key-code) (flags av-flag-bits16))
                            :result-type
                            as-bool
                            :calling-convention
                            :cdecl)
;; sel = 539
(define-foreign-funcallable av-app-register-late-init-proc-selproto
                            ((late-init-proc av-idle-proc)
                             (client-data (:pointer :void))
                             (delay as-uns32))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 540
(define-foreign-funcallable av-doc-get-bookmarks-selproto
                            ((av-doc av-doc)
                             (av-bookmark-filter av-bookmark-filter)
                             (p-pdbookmark-array
                              (:pointer (:pointer pd-bookmark))))
                            :result-type
                            as-int32
                            :calling-convention
                            :cdecl)
;; sel = 541
(define-foreign-funcallable av-doc-get-last-active-tool-selproto
                            ((av-doc av-doc))
                            :result-type
                            av-tool
                            :calling-convention
                            :cdecl)
;; sel = 542
(define-foreign-funcallable av-doc-get-num-windows-selproto
                            ((av-doc av-doc))
                            :result-type
                            as-count
                            :calling-convention
                            :cdecl)
;; sel = 543
(define-foreign-funcallable av-doc-get-nth-window-selproto
                            ((av-doc av-doc) (n as-count))
                            :result-type
                            av-window
                            :calling-convention
                            :cdecl)
;; sel = 544
(define-foreign-funcallable av-page-view-get-avwindow-selproto
                            ((page-view av-page-view))
                            :result-type
                            av-window
                            :calling-convention
                            :cdecl)
;; sel = 545
(define-foreign-funcallable av-doc-do-annot-properties-selproto
                            ((doc av-doc)
                             (page-num as-int32)
                             (annot pd-annot))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 546
(define-foreign-funcallable av-sys-track-mouse-selproto
                            ((canceled (:pointer as-bool))
                             (committed (:pointer as-bool))
                             (remove-events as-bool))
                            :result-type
                            av-flag-bits32
                            :calling-convention
                            :cdecl)
;; sel = 547
(define-foreign-funcallable av-doc-save-optimized-selproto
                            ((av-doc av-doc)
                             (pdf-opt-params
                              (:pointer pdf-opt-params-rec)))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 548
(define-foreign-funcallable av-get-optimizer-presets-selproto
                            ((p-preset-names
                              (:pointer (:pointer as-text))))
                            :result-type
                            as-int32
                            :calling-convention
                            :cdecl)
;; sel = 549
(define-foreign-funcallable av-get-optimizer-params-for-preset-selproto
                            ((preset-name as-text)
                             (av-doc av-doc)
                             (pdf-opt-params pdf-opt-params))
                            :result-type
                            as-bool
                            :calling-convention
                            :cdecl)
;; sel = 550
(define-foreign-funcallable av-app-get-annot-appearance-padding-selproto
                            ((flags as-uns32))
                            :result-type
                            as-count
                            :calling-convention
                            :cdecl)
;; sel = 551
(define-foreign-funcallable av-menu-item-is-scriptable-selproto
                            ((menu-item av-menu-item))
                            :result-type
                            as-bool
                            :calling-convention
                            :cdecl)
;; sel = 552
(define-foreign-funcallable av-sys-time-as-text-from-time-rec-selproto
                            ((time-rec as-time-rec-p) (text as-text))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 553
(define-foreign-funcallable av-legacy-tool-button-set-menu-icon-selproto
                            ((button av-tool-button) (icon av-icon))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 554
(define-foreign-funcallable av-listen-for-custom-notification-selproto
                            ((notification
                              (:reference-pass :ef-mb-string))
                             (proc av-custom-notification-proc)
                             (client-data (:pointer :void)))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 555
(define-foreign-funcallable av-unlisten-for-custom-notification-selproto
                            ((notification
                              (:reference-pass :ef-mb-string))
                             (proc av-custom-notification-proc)
                             (client-data (:pointer :void)))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 556
(define-foreign-funcallable av-broadcast-custom-notification-selproto
                            ((notification
                              (:reference-pass :ef-mb-string))
                             (data av-notification-data))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 557
(define-foreign-funcallable av-register-aux-data-handler-selproto
                            ((aux-data-type as-atom)
                             (handler av-aux-data-handler)
                             (client-data (:pointer :void)))
                            :result-type
                            as-bool
                            :calling-convention
                            :cdecl)
;; sel = 558
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
;; sel = 559
(define-foreign-funcallable av-legacy-tool-bar-add-button-ex-selproto
                            ((tool-bar av-tool-bar)
                             (button av-tool-button)
                             (params av-tool-bar-add-button-params))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 560
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
;; sel = 561
(define-foreign-funcallable av-app-end-save-selproto
                            ((in-file-save-handle
                              av-app-file-save-handle)
                             (in-as-path-name-written as-path-name))
                            :result-type
                            as-bool
                            :calling-convention
                            :cdecl)
;; sel = 562
(define-foreign-funcallable av-app-cancel-save-selproto
                            ((in-file-save-handle
                              av-app-file-save-handle))
                            :result-type
                            as-bool
                            :calling-convention
                            :cdecl)
;; sel = 563
(define-foreign-funcallable av-page-view-get-ink-preview-selproto
                            ((page-view av-page-view))
                            :result-type
                            as-bool
                            :calling-convention
                            :cdecl)
;; sel = 564
(define-foreign-funcallable av-page-view-acquire-draw-context-selproto
                            ((page-view av-page-view)
                             (context-type draw-context-type))
                            :result-type
                            (:pointer :void)
                            :calling-convention
                            :cdecl)
;; sel = 565
(define-foreign-funcallable av-page-view-release-draw-context-selproto
                            ((page-view av-page-view)
                             (context-type draw-context-type)
                             (draw-context (:pointer :void)))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 566
(define-foreign-funcallable av-legacy-tool-button-set-help-text-with-as-text-selproto
                            ((button av-tool-button)
                             (text as-const-text))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 567
(define-foreign-funcallable av-legacy-tool-bar-new-with-as-text-selproto
                            ((name (:reference-pass :ef-mb-string))
                             (title as-const-text))
                            :result-type
                            av-tool-bar
                            :calling-convention
                            :cdecl)
;; sel = 568
(define-foreign-funcallable av-app-unregister-annot-handler-selproto
                            ((handler av-annot-handler))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 569
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
;; sel = 570
(define-foreign-funcallable av-conversion-get-conversion-queue-status-with-handler-selproto
                            ((in-handler av-conversion-to-pdf-handler))
                            :result-type
                            as-uns32
                            :calling-convention
                            :cdecl)
;; sel = 571
(define-foreign-funcallable av-conversion-to-pdf-set-settings-selproto
                            ((in-handler av-conversion-to-pdf-handler)
                             (in-settings as-cab))
                            :result-type
                            as-bool
                            :calling-convention
                            :cdecl)
;; sel = 572
(define-foreign-funcallable av-doc-is-in-protected-view-selproto
                            ((av-doc av-doc))
                            :result-type
                            as-bool
                            :calling-convention
                            :cdecl)
;; sel = 573
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
;; sel = 574
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
;; sel = 575
(define-foreign-funcallable av-app-unregister-for-context-menu-addition-selproto
                            ((menu-name as-atom)
                             (proc av-context-menu-addition-proc)
                             (client-data (:pointer :void)))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 576
(define-foreign-funcallable av-app-save-dialog-ex-selproto
                            ((dialog-params av-open-save-dialog-params)
                             (out-dialog-params
                              av-open-save-dialog-out-params))
                            :result-type
                            as-bool
                            :calling-convention
                            :cdecl)
;; sel = 577
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
;; sel = 578
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
;; sel = 579
(define-foreign-funcallable av-app-get-version-ex-selproto
                            ((av-version-params av-version-params))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 580
(define-foreign-funcallable av-extension-acquire-info-ex-selproto
                            ((n-index av-array-size))
                            :result-type
                            av-extension-info-ex
                            :calling-convention
                            :cdecl)
;; sel = 581
(define-foreign-funcallable av-extension-release-info-ex-selproto
                            ((info av-extension-info-ex))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 582
(define-foreign-funcallable av-doc-bring-to-front-selproto
                            ((doc av-doc))
                            :result-type
                            as-bool
                            :calling-convention
                            :cdecl)
;; sel = 583
(define-foreign-funcallable av-doc-get-display-title-selproto
                            ((doc av-doc) (title as-text))
                            :result-type
                            as-bool
                            :calling-convention
                            :cdecl)
;; sel = 584
(define-foreign-funcallable av-icon-create-from-pdf-selproto
                            ((pd-doc pd-doc)
                             (page-num as-int32)
                             (width as-int32)
                             (height as-int32))
                            :result-type
                            av-icon
                            :calling-convention
                            :cdecl)
;; sel = 585
(define-foreign-funcallable av-tool-bar-set-icon-selproto
                            ((toolbar av-tool-bar)
                             (normal-icon av-icon)
                             (active-icon av-icon))
                            :result-type
                            as-bool
                            :calling-convention
                            :cdecl)
;; sel = 586
(define-foreign-funcallable av-storage-register-new-storage-selproto
                            ((fs-name as-atom)
                             (info av-storage-entry)
                             (additional-info as-const-cab))
                            :result-type
                            av-storage-error-code
                            :calling-convention
                            :cdecl)
;; sel = 587
(define-foreign-funcallable av-storage-register-account-selproto
                            ((storage-key as-const-text)
                             (account-label as-const-text)
                             (info as-const-cab))
                            :result-type
                            as-text
                            :calling-convention
                            :cdecl)
;; sel = 588
(define-foreign-funcallable av-storage-get-account-info-selproto
                            ((storage-key as-const-text)
                             (account-id as-const-text))
                            :result-type
                            as-cab
                            :calling-convention
                            :cdecl)
;; sel = 589
(define-foreign-funcallable av-storage-perform-oauth2authentication-selproto
                            ((standard-oauth-params-cab as-cab)
                             (auth-step-additional-data as-cab)
                             (accesstoken-step-additional-header-cab
                              as-cab)
                             (out-result-cab as-cab))
                            :result-type
                            oauth2error-code
                            :calling-convention
                            :cdecl)
;; sel = 590
(define-foreign-funcallable av-make-web-services-request-selproto
                            ((request av-web-service-request))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 591
(define-foreign-funcallable av-page-view-draw-now-optimized-selproto
                            ((page-view av-page-view))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 592
(define-foreign-funcallable av-make-acrobat-default-selproto
                            ((show-successwindow :boolean))
                            :result-type
                            :void
                            :calling-convention
                            :cdecl)
;; sel = 593
(define-foreign-funcallable av-window-get-platform-thing-ex-selproto
                            ((win av-window))
                            :result-type
                            av-platform-window-ref
                            :calling-convention
                            :cdecl)

;; #include <AVCalls.h>
;; line 317
(define-acrobat-function (av-action-handler-get-type "AVActionHandlerGetType")
                         *g-acro-view-version*
                         +acro-view-hft-version-2+
                         av-action-handler-get-type-selproto
                         *g-acro-view-hft*
                         +av-action-handler-get-type-sel+)
;; line 320
(define-acrobat-function (av-action-handler-get-uiname "AVActionHandlerGetUIName")
                         *g-acro-view-version*
                         +acro-view-hft-version-2+
                         av-action-handler-get-uiname-selproto
                         *g-acro-view-hft*
                         +av-action-handler-get-uiname-sel+)
;; line 323
(define-acrobat-function (av-action-handler-get-procs "AVActionHandlerGetProcs")
                         *g-acro-view-version*
                         +acro-view-hft-version-2+
                         av-action-handler-get-procs-selproto
                         *g-acro-view-hft*
                         +av-action-handler-get-procs-sel+)
;; line 326
(define-acrobat-function (av-alert "AVAlert")
                         *g-acro-view-version*
                         +acro-view-hft-version-2+
                         av-alert-selproto
                         *g-acro-view-hft*
                         +av-alert-sel+)
;; line 329
(define-acrobat-function (av-alert-note "AVAlertNote")
                         *g-acro-view-version*
                         +acro-view-hft-version-2+
                         av-alert-note-selproto
                         *g-acro-view-hft*
                         +av-alert-note-sel+)
;; line 332
(define-acrobat-function (av-alert-confirm "AVAlertConfirm")
                         *g-acro-view-version*
                         +acro-view-hft-version-2+
                         av-alert-confirm-selproto
                         *g-acro-view-hft*
                         +av-alert-confirm-sel+)
;; line 335
(define-acrobat-function (av-app-get-version "AVAppGetVersion")
                         *g-acro-view-version*
                         +acro-view-hft-version-2+
                         av-app-get-version-selproto
                         *g-acro-view-hft*
                         +av-app-get-version-sel+)
;; line 338
(define-acrobat-function (av-app-get-language "AVAppGetLanguage")
                         *g-acro-view-version*
                         +acro-view-hft-version-2+
                         av-app-get-language-selproto
                         *g-acro-view-hft*
                         +av-app-get-language-sel+)
;; line 341
(define-acrobat-function (av-app-get-name "AVAppGetName")
                         *g-acro-view-version*
                         +acro-view-hft-version-2+
                         av-app-get-name-selproto
                         *g-acro-view-hft*
                         +av-app-get-name-sel+)
;; line 344
(define-acrobat-function (av-app-get-cancel-proc "AVAppGetCancelProc")
                         *g-acro-view-version*
                         +acro-view-hft-version-2+
                         av-app-get-cancel-proc-selproto
                         *g-acro-view-hft*
                         +av-app-get-cancel-proc-sel+)
;; line 347
(define-acrobat-function (av-app-can-quit "AVAppCanQuit")
                         *g-acro-view-version*
                         +acro-view-hft-version-2+
                         av-app-can-quit-selproto
                         *g-acro-view-hft*
                         +av-app-can-quit-sel+)
;; line 350
(define-acrobat-function (av-app-get-active-doc "AVAppGetActiveDoc")
                         *g-acro-view-version*
                         +acro-view-hft-version-2+
                         av-app-get-active-doc-selproto
                         *g-acro-view-hft*
                         +av-app-get-active-doc-sel+)
;; line 353
(define-acrobat-function (av-app-get-num-docs "AVAppGetNumDocs")
                         *g-acro-view-version*
                         +acro-view-hft-version-2+
                         av-app-get-num-docs-selproto
                         *g-acro-view-hft*
                         +av-app-get-num-docs-sel+)
;; line 356
(define-acrobat-function (av-app-enum-docs "AVAppEnumDocs")
                         *g-acro-view-version*
                         +acro-view-hft-version-2+
                         av-app-enum-docs-selproto
                         *g-acro-view-hft*
                         +av-app-enum-docs-sel+)
;; line 359
(define-acrobat-function (av-app-get-doc-progress-monitor "AVAppGetDocProgressMonitor")
                         *g-acro-view-version*
                         +acro-view-hft-version-2+
                         av-app-get-doc-progress-monitor-selproto
                         *g-acro-view-hft*
                         +av-app-get-doc-progress-monitor-sel+)
;; line 362
(define-acrobat-function (av-app-get-menubar "AVAppGetMenubar")
                         *g-acro-view-version*
                         +acro-view-hft-version-2+
                         av-app-get-menubar-selproto
                         *g-acro-view-hft*
                         +av-app-get-menubar-sel+)
;; line 365
(define-acrobat-function (av-app-get-active-tool "AVAppGetActiveTool")
                         *g-acro-view-version*
                         +acro-view-hft-version-2+
                         av-app-get-active-tool-selproto
                         *g-acro-view-hft*
                         +av-app-get-active-tool-sel+)
;; line 368
(define-acrobat-function (av-app-get-last-active-tool "AVAppGetLastActiveTool")
                         *g-acro-view-version*
                         +acro-view-hft-version-2+
                         av-app-get-last-active-tool-selproto
                         *g-acro-view-hft*
                         +av-app-get-last-active-tool-sel+)
;; line 371
(define-acrobat-function (av-app-get-default-tool "AVAppGetDefaultTool")
                         *g-acro-view-version*
                         +acro-view-hft-version-2+
                         av-app-get-default-tool-selproto
                         *g-acro-view-hft*
                         +av-app-get-default-tool-sel+)
;; line 374
(define-acrobat-function (av-app-set-active-tool "AVAppSetActiveTool")
                         *g-acro-view-version*
                         +acro-view-hft-version-2+
                         av-app-set-active-tool-selproto
                         *g-acro-view-hft*
                         +av-app-set-active-tool-sel+)
;; line 377
(define-acrobat-function (av-app-get-tool-by-name "AVAppGetToolByName")
                         *g-acro-view-version*
                         +acro-view-hft-version-2+
                         av-app-get-tool-by-name-selproto
                         *g-acro-view-hft*
                         +av-app-get-tool-by-name-sel+)
;; line 380
(define-acrobat-function (av-app-enum-tools "AVAppEnumTools")
                         *g-acro-view-version*
                         +acro-view-hft-version-2+
                         av-app-enum-tools-selproto
                         *g-acro-view-hft*
                         +av-app-enum-tools-sel+)
;; line 386
(define-acrobat-function (av-app-get-annot-handler-by-name "AVAppGetAnnotHandlerByName")
                         *g-acro-view-version*
                         +acro-view-hft-version-2+
                         av-app-get-annot-handler-by-name-selproto
                         *g-acro-view-hft*
                         +av-app-get-annot-handler-by-name-sel+)
;; line 389
(define-acrobat-function (av-app-enum-annot-handlers "AVAppEnumAnnotHandlers")
                         *g-acro-view-version*
                         +acro-view-hft-version-2+
                         av-app-enum-annot-handlers-selproto
                         *g-acro-view-hft*
                         +av-app-enum-annot-handlers-sel+)
;; line 395
(define-acrobat-function (av-app-unregister-annot-handler "AVAppUnregisterAnnotHandler")
                         *g-acro-view-version*
                         +acro-view-hft-version-10+
                         av-app-unregister-annot-handler-selproto
                         *g-acro-view-hft*
                         +av-app-unregister-annot-handler-sel+)
;; line 398
(define-acrobat-function (av-app-get-action-handler-by-type "AVAppGetActionHandlerByType")
                         *g-acro-view-version*
                         +acro-view-hft-version-2+
                         av-app-get-action-handler-by-type-selproto
                         *g-acro-view-hft*
                         +av-app-get-action-handler-by-type-sel+)
;; line 401
(define-acrobat-function (av-app-enum-action-handlers "AVAppEnumActionHandlers")
                         *g-acro-view-version*
                         +acro-view-hft-version-2+
                         av-app-enum-action-handlers-selproto
                         *g-acro-view-hft*
                         +av-app-enum-action-handlers-sel+)
;; line 404
(define-acrobat-function (av-app-register-action-handler "AVAppRegisterActionHandler")
                         *g-acro-view-version*
                         +acro-view-hft-version-2+
                         av-app-register-action-handler-selproto
                         *g-acro-view-hft*
                         +av-app-register-action-handler-sel+)
;; line 407
(define-acrobat-function (av-app-get-preference "AVAppGetPreference")
                         *g-acro-view-version*
                         +acro-view-hft-version-2+
                         av-app-get-preference-selproto
                         *g-acro-view-hft*
                         +av-app-get-preference-sel+)
;; line 410
(define-acrobat-function (av-app-set-preference "AVAppSetPreference")
                         *g-acro-view-version*
                         +acro-view-hft-version-2+
                         av-app-set-preference-selproto
                         *g-acro-view-hft*
                         +av-app-set-preference-sel+)
;; line 413
(define-acrobat-function (av-app-begin-full-screen "AVAppBeginFullScreen")
                         *g-acro-view-version*
                         +acro-view-hft-version-2+
                         av-app-begin-full-screen-selproto
                         *g-acro-view-hft*
                         +av-app-begin-full-screen-sel+)
;; line 416
(define-acrobat-function (av-app-end-full-screen "AVAppEndFullScreen")
                         *g-acro-view-version*
                         +acro-view-hft-version-2+
                         av-app-end-full-screen-selproto
                         *g-acro-view-hft*
                         +av-app-end-full-screen-sel+)
;; line 419
(define-acrobat-function (av-app-doing-full-screen "AVAppDoingFullScreen")
                         *g-acro-view-version*
                         +acro-view-hft-version-2+
                         av-app-doing-full-screen-selproto
                         *g-acro-view-hft*
                         +av-app-doing-full-screen-sel+)
;; line 422
(define-acrobat-function (av-app-begin-modal "AVAppBeginModal")
                         *g-acro-view-version*
                         +acro-view-hft-version-2+
                         av-app-begin-modal-selproto
                         *g-acro-view-hft*
                         +av-app-begin-modal-sel+)
;; line 425
(define-acrobat-function (av-app-modal-window-is-open "AVAppModalWindowIsOpen")
                         *g-acro-view-version*
                         +acro-view-hft-version-2+
                         av-app-modal-window-is-open-selproto
                         *g-acro-view-hft*
                         +av-app-modal-window-is-open-sel+)
;; line 428
(define-acrobat-function (av-app-end-modal "AVAppEndModal")
                         *g-acro-view-version*
                         +acro-view-hft-version-2+
                         av-app-end-modal-selproto
                         *g-acro-view-hft*
                         +av-app-end-modal-sel+)
;; line 434
(define-acrobat-function (av-app-register-idle-proc "AVAppRegisterIdleProc")
                         *g-acro-view-version*
                         +acro-view-hft-version-2+
                         av-app-register-idle-proc-selproto
                         *g-acro-view-hft*
                         +av-app-register-idle-proc-sel+)
;; line 438
(define-acrobat-function (av-app-unregister-idle-proc "AVAppUnregisterIdleProc")
                         *g-acro-view-version*
                         +acro-view-hft-version-2+
                         av-app-unregister-idle-proc-selproto
                         *g-acro-view-hft*
                         +av-app-unregister-idle-proc-sel+)
;; line 441
(define-acrobat-function (av-app-register-notification "AVAppRegisterNotification")
                         *g-acro-view-version*
                         +acro-view-hft-version-2+
                         av-app-register-notification-selproto
                         *g-acro-view-hft*
                         +av-app-register-notification-sel+)
;; line 444
(define-acrobat-function (av-app-unregister-notification "AVAppUnregisterNotification")
                         *g-acro-view-version*
                         +acro-view-hft-version-2+
                         av-app-unregister-notification-selproto
                         *g-acro-view-hft*
                         +av-app-unregister-notification-sel+)
;; line 459
(define-acrobat-function (av-doc-open-from-file-with-param-string "AVDocOpenFromFileWithParamString")
                         *g-acro-view-version*
                         +acro-view-hft-version-6+
                         av-doc-open-from-file-with-param-string-selproto
                         *g-acro-view-hft*
                         +av-doc-open-from-file-with-param-string-sel+)
;; line 462
(define-acrobat-function (av-doc-open-from-pddoc-with-param-string "AVDocOpenFromPDDocWithParamString")
                         *g-acro-view-version*
                         +acro-view-hft-version-6+
                         av-doc-open-from-pddoc-with-param-string-selproto
                         *g-acro-view-hft*
                         +av-doc-open-from-pddoc-with-param-string-sel+)
;; line 465
(define-acrobat-function (av-doc-open-from-as-file-with-param-string "AVDocOpenFromASFileWithParamString")
                         *g-acro-view-version*
                         +acro-view-hft-version-6+
                         av-doc-open-from-as-file-with-param-string-selproto
                         *g-acro-view-hft*
                         +av-doc-open-from-as-file-with-param-string-sel+)
;; line 468
(define-acrobat-function (av-doc-close "AVDocClose")
                         *g-acro-view-version*
                         +acro-view-hft-version-2+
                         av-doc-close-selproto
                         *g-acro-view-hft*
                         +av-doc-close-sel+)
;; line 471
(define-acrobat-function (av-doc-get-pddoc "AVDocGetPDDoc")
                         *g-acro-view-version*
                         +acro-view-hft-version-2+
                         av-doc-get-pddoc-selproto
                         *g-acro-view-hft*
                         +av-doc-get-pddoc-sel+)
;; line 474
(define-acrobat-function (av-doc-get-page-view "AVDocGetPageView")
                         *g-acro-view-version*
                         +acro-view-hft-version-2+
                         av-doc-get-page-view-selproto
                         *g-acro-view-hft*
                         +av-doc-get-page-view-sel+)
;; line 477
(define-acrobat-function (av-doc-get-avwindow "AVDocGetAVWindow")
                         *g-acro-view-version*
                         +acro-view-hft-version-2+
                         av-doc-get-avwindow-selproto
                         *g-acro-view-hft*
                         +av-doc-get-avwindow-sel+)
;; line 480
(define-acrobat-function (av-doc-get-view-mode "AVDocGetViewMode")
                         *g-acro-view-version*
                         +acro-view-hft-version-2+
                         av-doc-get-view-mode-selproto
                         *g-acro-view-hft*
                         +av-doc-get-view-mode-sel+)
;; line 483
(define-acrobat-function (av-doc-set-view-mode "AVDocSetViewMode")
                         *g-acro-view-version*
                         +acro-view-hft-version-2+
                         av-doc-set-view-mode-selproto
                         *g-acro-view-hft*
                         +av-doc-set-view-mode-sel+)
;; line 486
(define-acrobat-function (av-doc-get-splitter-position "AVDocGetSplitterPosition")
                         *g-acro-view-version*
                         +acro-view-hft-version-2+
                         av-doc-get-splitter-position-selproto
                         *g-acro-view-hft*
                         +av-doc-get-splitter-position-sel+)
;; line 489
(define-acrobat-function (av-doc-set-splitter-position "AVDocSetSplitterPosition")
                         *g-acro-view-version*
                         +acro-view-hft-version-2+
                         av-doc-set-splitter-position-selproto
                         *g-acro-view-hft*
                         +av-doc-set-splitter-position-sel+)
;; line 492
(define-acrobat-function (av-doc-print-pages "AVDocPrintPages")
                         *g-acro-view-version*
                         +acro-view-hft-version-2+
                         av-doc-print-pages-selproto
                         *g-acro-view-hft*
                         +av-doc-print-pages-sel+)
;; line 495
(define-acrobat-function (av-doc-get-selection-type "AVDocGetSelectionType")
                         *g-acro-view-version*
                         +acro-view-hft-version-2+
                         av-doc-get-selection-type-selproto
                         *g-acro-view-hft*
                         +av-doc-get-selection-type-sel+)
;; line 498
(define-acrobat-function (av-doc-get-selection "AVDocGetSelection")
                         *g-acro-view-version*
                         +acro-view-hft-version-2+
                         av-doc-get-selection-selproto
                         *g-acro-view-hft*
                         +av-doc-get-selection-sel+)
;; line 501
(define-acrobat-function (av-doc-set-selection "AVDocSetSelection")
                         *g-acro-view-version*
                         +acro-view-hft-version-2+
                         av-doc-set-selection-selproto
                         *g-acro-view-hft*
                         +av-doc-set-selection-sel+)
;; line 504
(define-acrobat-function (av-doc-delete-selection "AVDocDeleteSelection")
                         *g-acro-view-version*
                         +acro-view-hft-version-2+
                         av-doc-delete-selection-selproto
                         *g-acro-view-hft*
                         +av-doc-delete-selection-sel+)
;; line 507
(define-acrobat-function (av-doc-clear-selection "AVDocClearSelection")
                         *g-acro-view-version*
                         +acro-view-hft-version-2+
                         av-doc-clear-selection-selproto
                         *g-acro-view-hft*
                         +av-doc-clear-selection-sel+)
;; line 510
(define-acrobat-function (av-doc-copy-selection "AVDocCopySelection")
                         *g-acro-view-version*
                         +acro-view-hft-version-2+
                         av-doc-copy-selection-selproto
                         *g-acro-view-hft*
                         +av-doc-copy-selection-sel+)
;; line 513
(define-acrobat-function (av-doc-enum-selection "AVDocEnumSelection")
                         *g-acro-view-version*
                         +acro-view-hft-version-2+
                         av-doc-enum-selection-selproto
                         *g-acro-view-hft*
                         +av-doc-enum-selection-sel+)
;; line 516
(define-acrobat-function (av-doc-do-selection-properties "AVDocDoSelectionProperties")
                         *g-acro-view-version*
                         +acro-view-hft-version-2+
                         av-doc-do-selection-properties-selproto
                         *g-acro-view-hft*
                         +av-doc-do-selection-properties-sel+)
;; line 519
(define-acrobat-function (av-doc-show-selection "AVDocShowSelection")
                         *g-acro-view-version*
                         +acro-view-hft-version-2+
                         av-doc-show-selection-selproto
                         *g-acro-view-hft*
                         +av-doc-show-selection-sel+)
;; line 522
(define-acrobat-function (av-doc-get-selection-server-by-type "AVDocGetSelectionServerByType")
                         *g-acro-view-version*
                         +acro-view-hft-version-2+
                         av-doc-get-selection-server-by-type-selproto
                         *g-acro-view-hft*
                         +av-doc-get-selection-server-by-type-sel+)
;; line 528
(define-acrobat-function (av-doc-perform-action "AVDocPerformAction")
                         *g-acro-view-version*
                         +acro-view-hft-version-2+
                         av-doc-perform-action-selproto
                         *g-acro-view-hft*
                         +av-doc-perform-action-sel+)
;; line 531
(define-acrobat-function (av-menubar-show "AVMenubarShow")
                         *g-acro-view-version*
                         +acro-view-hft-version-2+
                         av-menubar-show-selproto
                         *g-acro-view-hft*
                         +av-menubar-show-sel+)
;; line 534
(define-acrobat-function (av-menubar-hide "AVMenubarHide")
                         *g-acro-view-version*
                         +acro-view-hft-version-2+
                         av-menubar-hide-selproto
                         *g-acro-view-hft*
                         +av-menubar-hide-sel+)
;; line 537
(define-acrobat-function (av-menubar-get-num-menus "AVMenubarGetNumMenus")
                         *g-acro-view-version*
                         +acro-view-hft-version-2+
                         av-menubar-get-num-menus-selproto
                         *g-acro-view-hft*
                         +av-menubar-get-num-menus-sel+)
;; line 540
(define-acrobat-function (av-menubar-acquire-menu-by-name "AVMenubarAcquireMenuByName")
                         *g-acro-view-version*
                         +acro-view-hft-version-2+
                         av-menubar-acquire-menu-by-name-selproto
                         *g-acro-view-hft*
                         +av-menubar-acquire-menu-by-name-sel+)
;; line 543
(define-acrobat-function (av-menubar-acquire-menu-by-index "AVMenubarAcquireMenuByIndex")
                         *g-acro-view-version*
                         +acro-view-hft-version-2+
                         av-menubar-acquire-menu-by-index-selproto
                         *g-acro-view-hft*
                         +av-menubar-acquire-menu-by-index-sel+)
;; line 546
(define-acrobat-function (av-menubar-acquire-menu-by-predicate "AVMenubarAcquireMenuByPredicate")
                         *g-acro-view-version*
                         +acro-view-hft-version-2+
                         av-menubar-acquire-menu-by-predicate-selproto
                         *g-acro-view-hft*
                         +av-menubar-acquire-menu-by-predicate-sel+)
;; line 549
(define-acrobat-function (av-menubar-acquire-menu-item-by-name "AVMenubarAcquireMenuItemByName")
                         *g-acro-view-version*
                         +acro-view-hft-version-2+
                         av-menubar-acquire-menu-item-by-name-selproto
                         *g-acro-view-hft*
                         +av-menubar-acquire-menu-item-by-name-sel+)
;; line 552
(define-acrobat-function (av-menubar-acquire-menu-item-by-predicate "AVMenubarAcquireMenuItemByPredicate")
                         *g-acro-view-version*
                         +acro-view-hft-version-2+
                         av-menubar-acquire-menu-item-by-predicate-selproto
                         *g-acro-view-hft*
                         +av-menubar-acquire-menu-item-by-predicate-sel+)
;; line 555
(define-acrobat-function (av-menubar-get-menu-index "AVMenubarGetMenuIndex")
                         *g-acro-view-version*
                         +acro-view-hft-version-2+
                         av-menubar-get-menu-index-selproto
                         *g-acro-view-hft*
                         +av-menubar-get-menu-index-sel+)
;; line 558
(define-acrobat-function (av-menubar-add-menu "AVMenubarAddMenu")
                         *g-acro-view-version*
                         +acro-view-hft-version-2+
                         av-menubar-add-menu-selproto
                         *g-acro-view-hft*
                         +av-menubar-add-menu-sel+)
;; line 561
(define-acrobat-function (av-menu-new "AVMenuNew")
                         *g-acro-view-version*
                         +acro-view-hft-version-2+
                         av-menu-new-selproto
                         *g-acro-view-hft*
                         +av-menu-new-sel+)
;; line 564
(define-acrobat-function (av-menu-acquire "AVMenuAcquire")
                         *g-acro-view-version*
                         +acro-view-hft-version-2+
                         av-menu-acquire-selproto
                         *g-acro-view-hft*
                         +av-menu-acquire-sel+)
;; line 567
(define-acrobat-function (av-menu-release "AVMenuRelease")
                         *g-acro-view-version*
                         +acro-view-hft-version-2+
                         av-menu-release-selproto
                         *g-acro-view-hft*
                         +av-menu-release-sel+)
;; line 570
(define-acrobat-function (av-menu-remove "AVMenuRemove")
                         *g-acro-view-version*
                         +acro-view-hft-version-2+
                         av-menu-remove-selproto
                         *g-acro-view-hft*
                         +av-menu-remove-sel+)
;; line 573
(define-acrobat-function (av-menu-get-name "AVMenuGetName")
                         *g-acro-view-version*
                         +acro-view-hft-version-2+
                         av-menu-get-name-selproto
                         *g-acro-view-hft*
                         +av-menu-get-name-sel+)
;; line 576
(define-acrobat-function (av-menu-get-title "AVMenuGetTitle")
                         *g-acro-view-version*
                         +acro-view-hft-version-2+
                         av-menu-get-title-selproto
                         *g-acro-view-hft*
                         +av-menu-get-title-sel+)
;; line 580
(define-acrobat-function (av-menu-get-num-menu-items "AVMenuGetNumMenuItems")
                         *g-acro-view-version*
                         +acro-view-hft-version-2+
                         av-menu-get-num-menu-items-selproto
                         *g-acro-view-hft*
                         +av-menu-get-num-menu-items-sel+)
;; line 583
(define-acrobat-function (av-menu-acquire-menu-item-by-index "AVMenuAcquireMenuItemByIndex")
                         *g-acro-view-version*
                         +acro-view-hft-version-2+
                         av-menu-acquire-menu-item-by-index-selproto
                         *g-acro-view-hft*
                         +av-menu-acquire-menu-item-by-index-sel+)
;; line 586
(define-acrobat-function (av-menu-get-menu-item-index "AVMenuGetMenuItemIndex")
                         *g-acro-view-version*
                         +acro-view-hft-version-2+
                         av-menu-get-menu-item-index-selproto
                         *g-acro-view-hft*
                         +av-menu-get-menu-item-index-sel+)
;; line 589
(define-acrobat-function (av-menu-get-parent-menubar "AVMenuGetParentMenubar")
                         *g-acro-view-version*
                         +acro-view-hft-version-2+
                         av-menu-get-parent-menubar-selproto
                         *g-acro-view-hft*
                         +av-menu-get-parent-menubar-sel+)
;; line 592
(define-acrobat-function (av-menu-get-parent-menu-item "AVMenuGetParentMenuItem")
                         *g-acro-view-version*
                         +acro-view-hft-version-2+
                         av-menu-get-parent-menu-item-selproto
                         *g-acro-view-hft*
                         +av-menu-get-parent-menu-item-sel+)
;; line 595
(define-acrobat-function (av-menu-add-menu-item "AVMenuAddMenuItem")
                         *g-acro-view-version*
                         +acro-view-hft-version-2+
                         av-menu-add-menu-item-selproto
                         *g-acro-view-hft*
                         +av-menu-add-menu-item-sel+)
;; line 598
(define-acrobat-function (av-menu-item-new "AVMenuItemNew")
                         *g-acro-view-version*
                         +acro-view-hft-version-2+
                         av-menu-item-new-selproto
                         *g-acro-view-hft*
                         +av-menu-item-new-sel+)
;; line 601
(define-acrobat-function (av-menu-item-acquire "AVMenuItemAcquire")
                         *g-acro-view-version*
                         +acro-view-hft-version-2+
                         av-menu-item-acquire-selproto
                         *g-acro-view-hft*
                         +av-menu-item-acquire-sel+)
;; line 604
(define-acrobat-function (av-menu-item-release "AVMenuItemRelease")
                         *g-acro-view-version*
                         +acro-view-hft-version-2+
                         av-menu-item-release-selproto
                         *g-acro-view-hft*
                         +av-menu-item-release-sel+)
;; line 607
(define-acrobat-function (av-menu-item-remove "AVMenuItemRemove")
                         *g-acro-view-version*
                         +acro-view-hft-version-2+
                         av-menu-item-remove-selproto
                         *g-acro-view-hft*
                         +av-menu-item-remove-sel+)
;; line 610
(define-acrobat-function (av-menu-item-get-name "AVMenuItemGetName")
                         *g-acro-view-version*
                         +acro-view-hft-version-2+
                         av-menu-item-get-name-selproto
                         *g-acro-view-hft*
                         +av-menu-item-get-name-sel+)
;; line 613
(define-acrobat-function (av-menu-item-get-title "AVMenuItemGetTitle")
                         *g-acro-view-version*
                         +acro-view-hft-version-2+
                         av-menu-item-get-title-selproto
                         *g-acro-view-hft*
                         +av-menu-item-get-title-sel+)
;; line 616
(define-acrobat-function (av-menu-item-set-title "AVMenuItemSetTitle")
                         *g-acro-view-version*
                         +acro-view-hft-version-2+
                         av-menu-item-set-title-selproto
                         *g-acro-view-hft*
                         +av-menu-item-set-title-sel+)
;; line 619
(define-acrobat-function (av-menu-item-get-shortcut "AVMenuItemGetShortcut")
                         *g-acro-view-version*
                         +acro-view-hft-version-2+
                         av-menu-item-get-shortcut-selproto
                         *g-acro-view-hft*
                         +av-menu-item-get-shortcut-sel+)
;; line 622
(define-acrobat-function (av-menu-item-get-long-only "AVMenuItemGetLongOnly")
                         *g-acro-view-version*
                         +acro-view-hft-version-2+
                         av-menu-item-get-long-only-selproto
                         *g-acro-view-hft*
                         +av-menu-item-get-long-only-sel+)
;; line 625
(define-acrobat-function (av-menu-item-set-execute-proc "AVMenuItemSetExecuteProc")
                         *g-acro-view-version*
                         +acro-view-hft-version-2+
                         av-menu-item-set-execute-proc-selproto
                         *g-acro-view-hft*
                         +av-menu-item-set-execute-proc-sel+)
;; line 628
(define-acrobat-function (av-menu-item-set-compute-enabled-proc "AVMenuItemSetComputeEnabledProc")
                         *g-acro-view-version*
                         +acro-view-hft-version-2+
                         av-menu-item-set-compute-enabled-proc-selproto
                         *g-acro-view-hft*
                         +av-menu-item-set-compute-enabled-proc-sel+)
;; line 631
(define-acrobat-function (av-menu-item-set-compute-marked-proc "AVMenuItemSetComputeMarkedProc")
                         *g-acro-view-version*
                         +acro-view-hft-version-2+
                         av-menu-item-set-compute-marked-proc-selproto
                         *g-acro-view-hft*
                         +av-menu-item-set-compute-marked-proc-sel+)
;; line 634
(define-acrobat-function (av-menu-item-acquire-submenu "AVMenuItemAcquireSubmenu")
                         *g-acro-view-version*
                         +acro-view-hft-version-2+
                         av-menu-item-acquire-submenu-selproto
                         *g-acro-view-hft*
                         +av-menu-item-acquire-submenu-sel+)
;; line 637
(define-acrobat-function (av-menu-item-is-enabled "AVMenuItemIsEnabled")
                         *g-acro-view-version*
                         +acro-view-hft-version-2+
                         av-menu-item-is-enabled-selproto
                         *g-acro-view-hft*
                         +av-menu-item-is-enabled-sel+)
;; line 640
(define-acrobat-function (av-menu-item-is-marked "AVMenuItemIsMarked")
                         *g-acro-view-version*
                         +acro-view-hft-version-2+
                         av-menu-item-is-marked-selproto
                         *g-acro-view-hft*
                         +av-menu-item-is-marked-sel+)
;; line 643
(define-acrobat-function (av-menu-item-execute "AVMenuItemExecute")
                         *g-acro-view-version*
                         +acro-view-hft-version-2+
                         av-menu-item-execute-selproto
                         *g-acro-view-hft*
                         +av-menu-item-execute-sel+)
;; line 646
(define-acrobat-function (av-menu-item-get-parent-menu "AVMenuItemGetParentMenu")
                         *g-acro-view-version*
                         +acro-view-hft-version-2+
                         av-menu-item-get-parent-menu-selproto
                         *g-acro-view-hft*
                         +av-menu-item-get-parent-menu-sel+)
;; line 649
(define-acrobat-function (av-page-view-get-avdoc "AVPageViewGetAVDoc")
                         *g-acro-view-version*
                         +acro-view-hft-version-2+
                         av-page-view-get-avdoc-selproto
                         *g-acro-view-hft*
                         +av-page-view-get-avdoc-sel+)
;; line 655
(define-acrobat-function (av-page-view-get-page "AVPageViewGetPage")
                         *g-acro-view-version*
                         +acro-view-hft-version-2+
                         av-page-view-get-page-selproto
                         *g-acro-view-hft*
                         +av-page-view-get-page-sel+)
;; line 658
(define-acrobat-function (av-page-view-get-zoom "AVPageViewGetZoom")
                         *g-acro-view-version*
                         +acro-view-hft-version-2+
                         av-page-view-get-zoom-selproto
                         *g-acro-view-hft*
                         +av-page-view-get-zoom-sel+)
;; line 661
(define-acrobat-function (av-page-view-get-zoom-type "AVPageViewGetZoomType")
                         *g-acro-view-version*
                         +acro-view-hft-version-2+
                         av-page-view-get-zoom-type-selproto
                         *g-acro-view-hft*
                         +av-page-view-get-zoom-type-sel+)
;; line 664
(define-acrobat-function (av-page-view-get-page-num "AVPageViewGetPageNum")
                         *g-acro-view-version*
                         +acro-view-hft-version-2+
                         av-page-view-get-page-num-selproto
                         *g-acro-view-hft*
                         +av-page-view-get-page-num-sel+)
;; line 667
(define-acrobat-function (av-page-view-get-color "AVPageViewGetColor")
                         *g-acro-view-version*
                         +acro-view-hft-version-2+
                         av-page-view-get-color-selproto
                         *g-acro-view-hft*
                         +av-page-view-get-color-sel+)
;; line 670
(define-acrobat-function (av-page-view-set-color "AVPageViewSetColor")
                         *g-acro-view-version*
                         +acro-view-hft-version-2+
                         av-page-view-set-color-selproto
                         *g-acro-view-hft*
                         +av-page-view-set-color-sel+)
;; line 673
(define-acrobat-function (av-page-view-begin-operation "AVPageViewBeginOperation")
                         *g-acro-view-version*
                         +acro-view-hft-version-2+
                         av-page-view-begin-operation-selproto
                         *g-acro-view-hft*
                         +av-page-view-begin-operation-sel+)
;; line 676
(define-acrobat-function (av-page-view-end-operation "AVPageViewEndOperation")
                         *g-acro-view-version*
                         +acro-view-hft-version-2+
                         av-page-view-end-operation-selproto
                         *g-acro-view-hft*
                         +av-page-view-end-operation-sel+)
;; line 679
(define-acrobat-function (av-page-view-go-to "AVPageViewGoTo")
                         *g-acro-view-version*
                         +acro-view-hft-version-2+
                         av-page-view-go-to-selproto
                         *g-acro-view-hft*
                         +av-page-view-go-to-sel+)
;; line 682
(define-acrobat-function (av-page-view-zoom-to "AVPageViewZoomTo")
                         *g-acro-view-version*
                         +acro-view-hft-version-2+
                         av-page-view-zoom-to-selproto
                         *g-acro-view-hft*
                         +av-page-view-zoom-to-sel+)
;; line 691
(define-acrobat-function (av-page-view-read-page-up "AVPageViewReadPageUp")
                         *g-acro-view-version*
                         +acro-view-hft-version-2+
                         av-page-view-read-page-up-selproto
                         *g-acro-view-hft*
                         +av-page-view-read-page-up-sel+)
;; line 694
(define-acrobat-function (av-page-view-read-page-down "AVPageViewReadPageDown")
                         *g-acro-view-version*
                         +acro-view-hft-version-2+
                         av-page-view-read-page-down-selproto
                         *g-acro-view-hft*
                         +av-page-view-read-page-down-sel+)
;; line 697
(define-acrobat-function (av-page-view-go-back "AVPageViewGoBack")
                         *g-acro-view-version*
                         +acro-view-hft-version-2+
                         av-page-view-go-back-selproto
                         *g-acro-view-hft*
                         +av-page-view-go-back-sel+)
;; line 700
(define-acrobat-function (av-page-view-go-forward "AVPageViewGoForward")
                         *g-acro-view-version*
                         +acro-view-hft-version-2+
                         av-page-view-go-forward-selproto
                         *g-acro-view-hft*
                         +av-page-view-go-forward-sel+)
;; line 703
(define-acrobat-function (av-page-view-to-view-dest "AVPageViewToViewDest")
                         *g-acro-view-version*
                         +acro-view-hft-version-2+
                         av-page-view-to-view-dest-selproto
                         *g-acro-view-hft*
                         +av-page-view-to-view-dest-sel+)
;; line 709
(define-acrobat-function (av-page-view-draw-now "AVPageViewDrawNow")
                         *g-acro-view-version*
                         +acro-view-hft-version-2+
                         av-page-view-draw-now-selproto
                         *g-acro-view-hft*
                         +av-page-view-draw-now-sel+)
;; line 715
(define-acrobat-function (av-page-view-invert-rect-outline "AVPageViewInvertRectOutline")
                         *g-acro-view-version*
                         +acro-view-hft-version-2+
                         av-page-view-invert-rect-outline-selproto
                         *g-acro-view-hft*
                         +av-page-view-invert-rect-outline-sel+)
;; line 740
(define-acrobat-function (av-app-unregister-for-page-view-drawing-ex "AVAppUnregisterForPageViewDrawingEx")
                         *g-acro-view-version*
                         +acro-view-hft-version-6+
                         av-app-unregister-for-page-view-drawing-ex-selproto
                         *g-acro-view-hft*
                         +av-app-unregister-for-page-view-drawing-ex-sel+)
;; line 766
(define-acrobat-function (av-page-view-start-reading-thread "AVPageViewStartReadingThread")
                         *g-acro-view-version*
                         +acro-view-hft-version-2+
                         av-page-view-start-reading-thread-selproto
                         *g-acro-view-hft*
                         +av-page-view-start-reading-thread-sel+)
;; line 769
(define-acrobat-function (av-page-view-get-thread-index "AVPageViewGetThreadIndex")
                         *g-acro-view-version*
                         +acro-view-hft-version-2+
                         av-page-view-get-thread-index-selproto
                         *g-acro-view-hft*
                         +av-page-view-get-thread-index-sel+)
;; line 772
(define-acrobat-function (av-page-view-get-active-bead "AVPageViewGetActiveBead")
                         *g-acro-view-version*
                         +acro-view-hft-version-2+
                         av-page-view-get-active-bead-selproto
                         *g-acro-view-hft*
                         +av-page-view-get-active-bead-sel+)
;; line 788
(define-acrobat-function (av-page-view-get-page-to-dev-matrix "AVPageViewGetPageToDevMatrix")
                         *g-acro-view-version*
                         +acro-view-hft-version-2+
                         av-page-view-get-page-to-dev-matrix-selproto
                         *g-acro-view-hft*
                         +av-page-view-get-page-to-dev-matrix-sel+)
;; line 791
(define-acrobat-function (av-page-view-get-dev-to-page-matrix "AVPageViewGetDevToPageMatrix")
                         *g-acro-view-version*
                         +acro-view-hft-version-2+
                         av-page-view-get-dev-to-page-matrix-selproto
                         *g-acro-view-hft*
                         +av-page-view-get-dev-to-page-matrix-sel+)
;; line 806
(define-acrobat-function (av-sys-get-modifiers "AVSysGetModifiers")
                         *g-acro-view-version*
                         +acro-view-hft-version-2+
                         av-sys-get-modifiers-selproto
                         *g-acro-view-hft*
                         +av-sys-get-modifiers-sel+)
;; line 809
(define-acrobat-function (av-sys-mouse-is-still-down "AVSysMouseIsStillDown")
                         *g-acro-view-version*
                         +acro-view-hft-version-2+
                         av-sys-mouse-is-still-down-selproto
                         *g-acro-view-hft*
                         +av-sys-mouse-is-still-down-sel+)
;; line 812
(define-acrobat-function (av-sys-beep "AVSysBeep")
                         *g-acro-view-version*
                         +acro-view-hft-version-2+
                         av-sys-beep-selproto
                         *g-acro-view-hft*
                         +av-sys-beep-sel+)
;; line 815
(define-acrobat-function (av-sys-get-standard-cursor "AVSysGetStandardCursor")
                         *g-acro-view-version*
                         +acro-view-hft-version-2+
                         av-sys-get-standard-cursor-selproto
                         *g-acro-view-hft*
                         +av-sys-get-standard-cursor-sel+)
;; line 818
(define-acrobat-function (av-sys-set-cursor "AVSysSetCursor")
                         *g-acro-view-version*
                         +acro-view-hft-version-2+
                         av-sys-set-cursor-selproto
                         *g-acro-view-hft*
                         +av-sys-set-cursor-sel+)
;; line 821
(define-acrobat-function (av-sys-get-cursor "AVSysGetCursor")
                         *g-acro-view-version*
                         +acro-view-hft-version-2+
                         av-sys-get-cursor-selproto
                         *g-acro-view-hft*
                         +av-sys-get-cursor-sel+)
;; line 826
(define-acrobat-function (av-tool-get-type "AVToolGetType")
                         *g-acro-view-version*
                         +acro-view-hft-version-2+
                         av-tool-get-type-selproto
                         *g-acro-view-hft*
                         +av-tool-get-type-sel+)
;; line 829
(define-acrobat-function (av-tool-is-persistent "AVToolIsPersistent")
                         *g-acro-view-version*
                         +acro-view-hft-version-2+
                         av-tool-is-persistent-selproto
                         *g-acro-view-hft*
                         +av-tool-is-persistent-sel+)
;; line 838
(define-acrobat-function (av-window-destroy "AVWindowDestroy")
                         *g-acro-view-version*
                         +acro-view-hft-version-2+
                         av-window-destroy-selproto
                         *g-acro-view-hft*
                         +av-window-destroy-sel+)
;; line 841
(define-acrobat-function (av-window-user-close "AVWindowUserClose")
                         *g-acro-view-version*
                         +acro-view-hft-version-2+
                         av-window-user-close-selproto
                         *g-acro-view-hft*
                         +av-window-user-close-sel+)
;; line 844
(define-acrobat-function (av-window-maximize "AVWindowMaximize")
                         *g-acro-view-version*
                         +acro-view-hft-version-2+
                         av-window-maximize-selproto
                         *g-acro-view-hft*
                         +av-window-maximize-sel+)
;; line 847
(define-acrobat-function (av-window-show "AVWindowShow")
                         *g-acro-view-version*
                         +acro-view-hft-version-2+
                         av-window-show-selproto
                         *g-acro-view-hft*
                         +av-window-show-sel+)
;; line 850
(define-acrobat-function (av-window-hide "AVWindowHide")
                         *g-acro-view-version*
                         +acro-view-hft-version-2+
                         av-window-hide-selproto
                         *g-acro-view-hft*
                         +av-window-hide-sel+)
;; line 853
(define-acrobat-function (av-window-is-visible "AVWindowIsVisible")
                         *g-acro-view-version*
                         +acro-view-hft-version-2+
                         av-window-is-visible-selproto
                         *g-acro-view-hft*
                         +av-window-is-visible-sel+)
;; line 856
(define-acrobat-function (av-window-get-platform-thing "AVWindowGetPlatformThing")
                         *g-acro-view-version*
                         +acro-view-hft-version-2+
                         av-window-get-platform-thing-selproto
                         *g-acro-view-hft*
                         +av-window-get-platform-thing-sel+)
;; line 859
(define-acrobat-function (av-window-get-owner-data "AVWindowGetOwnerData")
                         *g-acro-view-version*
                         +acro-view-hft-version-2+
                         av-window-get-owner-data-selproto
                         *g-acro-view-hft*
                         +av-window-get-owner-data-sel+)
;; line 862
(define-acrobat-function (av-window-set-owner-data "AVWindowSetOwnerData")
                         *g-acro-view-version*
                         +acro-view-hft-version-2+
                         av-window-set-owner-data-selproto
                         *g-acro-view-hft*
                         +av-window-set-owner-data-sel+)
;; line 880
(define-acrobat-function (av-window-bring-to-front "AVWindowBringToFront")
                         *g-acro-view-version*
                         +acro-view-hft-version-2+
                         av-window-bring-to-front-selproto
                         *g-acro-view-hft*
                         +av-window-bring-to-front-sel+)
;; line 886
(define-acrobat-function (av-window-draw-now "AVWindowDrawNow")
                         *g-acro-view-version*
                         +acro-view-hft-version-2+
                         av-window-draw-now-selproto
                         *g-acro-view-hft*
                         +av-window-draw-now-sel+)
;; line 889
(define-acrobat-function (av-window-set-wants-key "AVWindowSetWantsKey")
                         *g-acro-view-version*
                         +acro-view-hft-version-2+
                         av-window-set-wants-key-selproto
                         *g-acro-view-hft*
                         +av-window-set-wants-key-sel+)
;; line 892
(define-acrobat-function (av-window-is-key "AVWindowIsKey")
                         *g-acro-view-version*
                         +acro-view-hft-version-2+
                         av-window-is-key-selproto
                         *g-acro-view-hft*
                         +av-window-is-key-sel+)
;; line 895
(define-acrobat-function (av-window-become-key "AVWindowBecomeKey")
                         *g-acro-view-version*
                         +acro-view-hft-version-2+
                         av-window-become-key-selproto
                         *g-acro-view-hft*
                         +av-window-become-key-sel+)
;; line 898
(define-acrobat-function (av-window-resign-key "AVWindowResignKey")
                         *g-acro-view-version*
                         +acro-view-hft-version-2+
                         av-window-resign-key-selproto
                         *g-acro-view-hft*
                         +av-window-resign-key-sel+)
;; line 901
(define-acrobat-function (av-graf-select-create "AVGrafSelectCreate")
                         *g-acro-view-version*
                         +acro-view-hft-version-2+
                         av-graf-select-create-selproto
                         *g-acro-view-hft*
                         +av-graf-select-create-sel+)
;; line 904
(define-acrobat-function (av-graf-select-destroy "AVGrafSelectDestroy")
                         *g-acro-view-version*
                         +acro-view-hft-version-2+
                         av-graf-select-destroy-selproto
                         *g-acro-view-hft*
                         +av-graf-select-destroy-sel+)
;; line 907
(define-acrobat-function (av-graf-select-get-bounding-rect "AVGrafSelectGetBoundingRect")
                         *g-acro-view-version*
                         +acro-view-hft-version-2+
                         av-graf-select-get-bounding-rect-selproto
                         *g-acro-view-hft*
                         +av-graf-select-get-bounding-rect-sel+)
;; line 910
(define-acrobat-function (av-crypt-do-std-security "AVCryptDoStdSecurity")
                         *g-acro-view-version*
                         +acro-view-hft-version-2+
                         av-crypt-do-std-security-selproto
                         *g-acro-view-hft*
                         +av-crypt-do-std-security-sel+)
;; line 913
(define-acrobat-function (av-crypt-get-password "AVCryptGetPassword")
                         *g-acro-view-version*
                         +acro-view-hft-version-2+
                         av-crypt-get-password-selproto
                         *g-acro-view-hft*
                         +av-crypt-get-password-sel+)
;; line 916
(define-acrobat-function (av-doc-do-save "AVDocDoSave")
                         *g-acro-view-version*
                         +acro-view-hft-version-2+
                         av-doc-do-save-selproto
                         *g-acro-view-hft*
                         +av-doc-do-save-sel+)
;; line 925
(define-acrobat-function (av-doc-get-client-name "AVDocGetClientName")
                         *g-acro-view-version*
                         +acro-view-hft-version-2-1+
                         av-doc-get-client-name-selproto
                         *g-acro-view-hft*
                         +av-doc-get-client-name-sel+)
;; line 928
(define-acrobat-function (av-doc-set-client-name "AVDocSetClientName")
                         *g-acro-view-version*
                         +acro-view-hft-version-2-1+
                         av-doc-set-client-name-selproto
                         *g-acro-view-hft*
                         +av-doc-set-client-name-sel+)
;; line 931
(define-acrobat-function (av-doc-get-page-text "AVDocGetPageText")
                         *g-acro-view-version*
                         +acro-view-hft-version-2-1+
                         av-doc-get-page-text-selproto
                         *g-acro-view-hft*
                         +av-doc-get-page-text-sel+)
;; line 942
(define-acrobat-function (av-app-get-tool-bar-by-name "AVAppGetToolBarByName")
                         *g-acro-view-version*
                         +acro-view-hft-version-5+
                         av-app-get-legacy-tool-bar-by-name-selproto
                         *g-acro-view-hft*
                         +av-app-get-legacy-tool-bar-by-name-sel+)
;; line 943
(define-acrobat-function (av-app-get-tool-bar "AVAppGetToolBar")
                         *g-acro-view-version*
                         +acro-view-hft-version-2+
                         av-app-get-legacy-tool-bar-selproto
                         *g-acro-view-hft*
                         +av-app-get-legacy-tool-bar-sel+)
;; line 947
(define-acrobat-function (av-tool-bar-get-frame "AVToolBarGetFrame")
                         *g-acro-view-version*
                         +acro-view-hft-version-2+
                         old-avlegacy-tool-bar-get-frame-selproto
                         *g-acro-view-hft*
                         +old-avlegacy-tool-bar-get-frame-sel+)
;; line 950
(define-acrobat-function (av-tool-bar-get-button-by-name "AVToolBarGetButtonByName")
                         *g-acro-view-version*
                         +acro-view-hft-version-2+
                         av-legacy-tool-bar-get-button-by-name-selproto
                         *g-acro-view-hft*
                         +av-legacy-tool-bar-get-button-by-name-sel+)
;; line 953
(define-acrobat-function (av-tool-bar-enum-buttons "AVToolBarEnumButtons")
                         *g-acro-view-version*
                         +acro-view-hft-version-2+
                         av-legacy-tool-bar-enum-buttons-selproto
                         *g-acro-view-hft*
                         +av-legacy-tool-bar-enum-buttons-sel+)
;; line 956
(define-acrobat-function (av-tool-bar-add-button "AVToolBarAddButton")
                         *g-acro-view-version*
                         +acro-view-hft-version-2+
                         av-legacy-tool-bar-add-button-selproto
                         *g-acro-view-hft*
                         +av-legacy-tool-bar-add-button-sel+)
;; line 959
(define-acrobat-function (av-tool-bar-get-num-buttons "AVToolBarGetNumButtons")
                         *g-acro-view-version*
                         +acro-view-hft-version-2+
                         av-legacy-tool-bar-get-num-buttons-selproto
                         *g-acro-view-hft*
                         +av-legacy-tool-bar-get-num-buttons-sel+)
;; line 962
(define-acrobat-function (av-tool-bar-is-room-for "AVToolBarIsRoomFor")
                         *g-acro-view-version*
                         +acro-view-hft-version-2+
                         av-legacy-tool-bar-is-room-for-selproto
                         *g-acro-view-hft*
                         +av-legacy-tool-bar-is-room-for-sel+)
;; line 965
(define-acrobat-function (av-tool-bar-update-button-states "AVToolBarUpdateButtonStates")
                         *g-acro-view-version*
                         +acro-view-hft-version-2+
                         av-legacy-tool-bar-update-button-states-selproto
                         *g-acro-view-hft*
                         +av-legacy-tool-bar-update-button-states-sel+)
;; line 968
(define-acrobat-function (av-tool-button-new "AVToolButtonNew")
                         *g-acro-view-version*
                         +acro-view-hft-version-2+
                         av-legacy-tool-button-new-selproto
                         *g-acro-view-hft*
                         +av-legacy-tool-button-new-sel+)
;; line 971
(define-acrobat-function (av-tool-button-destroy "AVToolButtonDestroy")
                         *g-acro-view-version*
                         +acro-view-hft-version-2+
                         av-legacy-tool-button-destroy-selproto
                         *g-acro-view-hft*
                         +av-legacy-tool-button-destroy-sel+)
;; line 974
(define-acrobat-function (av-tool-button-remove "AVToolButtonRemove")
                         *g-acro-view-version*
                         +acro-view-hft-version-2+
                         av-legacy-tool-button-remove-selproto
                         *g-acro-view-hft*
                         +av-legacy-tool-button-remove-sel+)
;; line 977
(define-acrobat-function (av-tool-button-is-separator "AVToolButtonIsSeparator")
                         *g-acro-view-version*
                         +acro-view-hft-version-2+
                         av-legacy-tool-button-is-separator-selproto
                         *g-acro-view-hft*
                         +av-legacy-tool-button-is-separator-sel+)
;; line 980
(define-acrobat-function (av-tool-button-get-name "AVToolButtonGetName")
                         *g-acro-view-version*
                         +acro-view-hft-version-2+
                         av-legacy-tool-button-get-name-selproto
                         *g-acro-view-hft*
                         +av-legacy-tool-button-get-name-sel+)
;; line 983
(define-acrobat-function (av-tool-button-execute "AVToolButtonExecute")
                         *g-acro-view-version*
                         +acro-view-hft-version-2+
                         av-legacy-tool-button-execute-selproto
                         *g-acro-view-hft*
                         +av-legacy-tool-button-execute-sel+)
;; line 986
(define-acrobat-function (av-tool-button-set-execute-proc "AVToolButtonSetExecuteProc")
                         *g-acro-view-version*
                         +acro-view-hft-version-2+
                         av-legacy-tool-button-set-execute-proc-selproto
                         *g-acro-view-hft*
                         +av-legacy-tool-button-set-execute-proc-sel+)
;; line 989
(define-acrobat-function (av-tool-button-set-compute-enabled-proc "AVToolButtonSetComputeEnabledProc")
                         *g-acro-view-version*
                         +acro-view-hft-version-2+
                         av-legacy-tool-button-set-compute-enabled-proc-selproto
                         *g-acro-view-hft*
                         +av-legacy-tool-button-set-compute-enabled-proc-sel+)
;; line 992
(define-acrobat-function (av-tool-button-set-compute-marked-proc "AVToolButtonSetComputeMarkedProc")
                         *g-acro-view-version*
                         +acro-view-hft-version-2+
                         av-legacy-tool-button-set-compute-marked-proc-selproto
                         *g-acro-view-hft*
                         +av-legacy-tool-button-set-compute-marked-proc-sel+)
;; line 995
(define-acrobat-function (av-tool-button-is-enabled "AVToolButtonIsEnabled")
                         *g-acro-view-version*
                         +acro-view-hft-version-2+
                         av-legacy-tool-button-is-enabled-selproto
                         *g-acro-view-hft*
                         +av-legacy-tool-button-is-enabled-sel+)
;; line 998
(define-acrobat-function (av-tool-button-is-marked "AVToolButtonIsMarked")
                         *g-acro-view-version*
                         +acro-view-hft-version-2+
                         av-legacy-tool-button-is-marked-selproto
                         *g-acro-view-hft*
                         +av-legacy-tool-button-is-marked-sel+)
;; line 1000
(define-acrobat-function (av-tool-button-set-help-text "AVToolButtonSetHelpText")
                         *g-acro-view-version*
                         +acro-view-hft-version-2-2+
                         av-legacy-tool-button-set-help-text-selproto
                         *g-acro-view-hft*
                         +av-legacy-tool-button-set-help-text-sel+)
;; line 1001
(define-acrobat-function (av-tool-button-set-help-text-with-as-text "AVToolButtonSetHelpTextWithASText")
                         *g-acro-view-version*
                         +acro-view-hft-version-10+
                         av-legacy-tool-button-set-help-text-with-as-text-selproto
                         *g-acro-view-hft*
                         +av-legacy-tool-button-set-help-text-with-as-text-sel+)
;; line 1003
(define-acrobat-function (av-tool-button-set-external "AVToolButtonSetExternal")
                         *g-acro-view-version*
                         +acro-view-hft-version-2-2+
                         av-legacy-tool-button-set-external-selproto
                         *g-acro-view-hft*
                         +av-legacy-tool-button-set-external-sel+)
;; line 1004
(define-acrobat-function (av-tool-bar-new-flyout "AVToolBarNewFlyout")
                         *g-acro-view-version*
                         +acro-view-hft-version-4+
                         av-legacy-tool-bar-new-flyout-selproto
                         *g-acro-view-hft*
                         +av-legacy-tool-bar-new-flyout-sel+)
;; line 1005
(define-acrobat-function (av-tool-button-set-flyout "AVToolButtonSetFlyout")
                         *g-acro-view-version*
                         +acro-view-hft-version-4+
                         av-legacy-tool-button-set-flyout-selproto
                         *g-acro-view-hft*
                         +av-legacy-tool-button-set-flyout-sel+)
;; line 1006
(define-acrobat-function (av-tool-button-get-flyout "AVToolButtonGetFlyout")
                         *g-acro-view-version*
                         +acro-view-hft-version-4+
                         av-legacy-tool-button-get-flyout-selproto
                         *g-acro-view-hft*
                         +av-legacy-tool-button-get-flyout-sel+)
;; line 1008
(define-acrobat-function (av-tool-button-set-menu "AVToolButtonSetMenu")
                         *g-acro-view-version*
                         +acro-view-hft-version-4+
                         av-legacy-tool-button-set-menu-selproto
                         *g-acro-view-hft*
                         +av-legacy-tool-button-set-menu-sel+)
;; line 1009
(define-acrobat-function (av-tool-button-get-menu "AVToolButtonGetMenu")
                         *g-acro-view-version*
                         +acro-view-hft-version-4+
                         av-legacy-tool-button-get-menu-selproto
                         *g-acro-view-hft*
                         +av-legacy-tool-button-get-menu-sel+)
;; line 1011
(define-acrobat-function (av-tool-button-set-icon "AVToolButtonSetIcon")
                         *g-acro-view-version*
                         +acro-view-hft-version-4+
                         av-legacy-tool-button-set-icon-selproto
                         *g-acro-view-hft*
                         +av-legacy-tool-button-set-icon-sel+)
;; line 1012
(define-acrobat-function (av-tool-button-get-icon "AVToolButtonGetIcon")
                         *g-acro-view-version*
                         +acro-view-hft-version-4+
                         av-legacy-tool-button-get-icon-selproto
                         *g-acro-view-hft*
                         +av-legacy-tool-button-get-icon-sel+)
;; line 1015
(define-acrobat-function (av-tool-button-add-animation-icon "AVToolButtonAddAnimationIcon")
                         *g-acro-view-version*
                         +acro-view-hft-version-6+
                         av-legacy-tool-button-add-animation-icon-selproto
                         *g-acro-view-hft*
                         +av-legacy-tool-button-add-animation-icon-sel+)
;; line 1016
(define-acrobat-function (av-tool-button-get-animation-icon-count "AVToolButtonGetAnimationIconCount")
                         *g-acro-view-version*
                         +acro-view-hft-version-6+
                         av-legacy-tool-button-get-animation-icon-count-selproto
                         *g-acro-view-hft*
                         +av-legacy-tool-button-get-animation-icon-count-sel+)
;; line 1017
(define-acrobat-function (av-tool-button-start-animation "AVToolButtonStartAnimation")
                         *g-acro-view-version*
                         +acro-view-hft-version-6+
                         av-legacy-tool-button-start-animation-selproto
                         *g-acro-view-hft*
                         +av-legacy-tool-button-start-animation-sel+)
;; line 1018
(define-acrobat-function (av-tool-button-stop-animation "AVToolButtonStopAnimation")
                         *g-acro-view-version*
                         +acro-view-hft-version-6+
                         av-legacy-tool-button-stop-animation-selproto
                         *g-acro-view-hft*
                         +av-legacy-tool-button-stop-animation-sel+)
;; line 1019
(define-acrobat-function (av-tool-button-is-animation-running "AVToolButtonIsAnimationRunning")
                         *g-acro-view-version*
                         +acro-view-hft-version-6+
                         av-legacy-tool-button-is-animation-running-selproto
                         *g-acro-view-hft*
                         +av-legacy-tool-button-is-animation-running-sel+)
;; line 1020
(define-acrobat-function (av-tool-button-set-animation-period "AVToolButtonSetAnimationPeriod")
                         *g-acro-view-version*
                         +acro-view-hft-version-6+
                         av-legacy-tool-button-set-animation-period-selproto
                         *g-acro-view-hft*
                         +av-legacy-tool-button-set-animation-period-sel+)
;; line 1021
(define-acrobat-function (av-tool-button-get-animation-period "AVToolButtonGetAnimationPeriod")
                         *g-acro-view-version*
                         +acro-view-hft-version-6+
                         av-legacy-tool-button-get-animation-period-selproto
                         *g-acro-view-hft*
                         +av-legacy-tool-button-get-animation-period-sel+)
;; line 1022
(define-acrobat-function (av-tool-button-remove-animation-icons "AVToolButtonRemoveAnimationIcons")
                         *g-acro-view-version*
                         +acro-view-hft-version-6+
                         av-legacy-tool-button-remove-animation-icons-selproto
                         *g-acro-view-hft*
                         +av-legacy-tool-button-remove-animation-icons-sel+)
;; line 1025
(define-acrobat-function (av-tool-button-set-compute-tooltip-proc "AVToolButtonSetComputeTooltipProc")
                         *g-acro-view-version*
                         +acro-view-hft-version-6+
                         av-legacy-tool-button-set-compute-tooltip-proc-selproto
                         *g-acro-view-hft*
                         +av-legacy-tool-button-set-compute-tooltip-proc-sel+)
;; line 1027
(define-acrobat-function (av-tool-button-set-notify-tooltip-proc "AVToolButtonSetNotifyTooltipProc")
                         *g-acro-view-version*
                         +acro-view-hft-version-6+
                         av-legacy-tool-button-set-notify-tooltip-proc-selproto
                         *g-acro-view-hft*
                         +av-legacy-tool-button-set-notify-tooltip-proc-sel+)
;; line 1029
(define-acrobat-function (av-tool-button-set-label-text "AVToolButtonSetLabelText")
                         *g-acro-view-version*
                         +acro-view-hft-version-6+
                         av-legacy-tool-button-set-label-text-selproto
                         *g-acro-view-hft*
                         +av-legacy-tool-button-set-label-text-sel+)
;; line 1030
(define-acrobat-function (av-tool-button-get-label-text "AVToolButtonGetLabelText")
                         *g-acro-view-version*
                         +acro-view-hft-version-6+
                         av-legacy-tool-button-get-label-text-selproto
                         *g-acro-view-hft*
                         +av-legacy-tool-button-get-label-text-sel+)
;; line 1032
(define-acrobat-function (av-tool-button-set-compute-visible-proc "AVToolButtonSetComputeVisibleProc")
                         *g-acro-view-version*
                         +acro-view-hft-version-6+
                         av-legacy-tool-button-set-compute-visible-proc-selproto
                         *g-acro-view-hft*
                         +av-legacy-tool-button-set-compute-visible-proc-sel+)
;; line 1033
(define-acrobat-function (av-tool-button-set-menu-icon "AVToolButtonSetMenuIcon")
                         *g-acro-view-version*
                         +acro-view-hft-version-8+
                         av-legacy-tool-button-set-menu-icon-selproto
                         *g-acro-view-hft*
                         +av-legacy-tool-button-set-menu-icon-sel+)
;; line 1034
(define-acrobat-function (av-tool-bar-add-button-ex "AVToolBarAddButtonEx")
                         *g-acro-view-version*
                         +acro-view-hft-version-9+
                         av-legacy-tool-bar-add-button-ex-selproto
                         *g-acro-view-hft*
                         +av-legacy-tool-bar-add-button-ex-sel+)
;; line 1035
(define-acrobat-function (av-tool-bar-new "AVToolBarNew")
                         *g-acro-view-version*
                         +acro-view-hft-version-5+
                         av-legacy-tool-bar-new-selproto
                         *g-acro-view-hft*
                         +av-legacy-tool-bar-new-sel+)
;; line 1036
(define-acrobat-function (av-tool-bar-new-with-as-text "AVToolBarNewWithASText")
                         *g-acro-view-version*
                         +acro-view-hft-version-10+
                         av-legacy-tool-bar-new-with-as-text-selproto
                         *g-acro-view-hft*
                         +av-legacy-tool-bar-new-with-as-text-sel+)
;; line 1042
(define-acrobat-function (av-page-view-highlight-text "AVPageViewHighlightText")
                         *g-acro-view-version*
                         +acro-view-hft-version-2-2+
                         av-page-view-highlight-text-selproto
                         *g-acro-view-hft*
                         +av-page-view-highlight-text-sel+)
;; line 1044
(define-acrobat-function (av-page-view-invalidate-text "AVPageViewInvalidateText")
                         *g-acro-view-version*
                         +acro-view-hft-version-2-2+
                         av-page-view-invalidate-text-selproto
                         *g-acro-view-hft*
                         +av-page-view-invalidate-text-sel+)
;; line 1049
(define-acrobat-function (av-page-view-get-first-visible-page-num "AVPageViewGetFirstVisiblePageNum")
                         *g-acro-view-version*
                         +acro-view-hft-version-2-2+
                         av-page-view-get-first-visible-page-num-selproto
                         *g-acro-view-hft*
                         +av-page-view-get-first-visible-page-num-sel+)
;; line 1051
(define-acrobat-function (av-page-view-get-last-visible-page-num "AVPageViewGetLastVisiblePageNum")
                         *g-acro-view-version*
                         +acro-view-hft-version-2-2+
                         av-page-view-get-last-visible-page-num-selproto
                         *g-acro-view-hft*
                         +av-page-view-get-last-visible-page-num-sel+)
;; line 1053
(define-acrobat-function (av-page-view-page-num-is-visible "AVPageViewPageNumIsVisible")
                         *g-acro-view-version*
                         +acro-view-hft-version-2-2+
                         av-page-view-page-num-is-visible-selproto
                         *g-acro-view-hft*
                         +av-page-view-page-num-is-visible-sel+)
;; line 1055
(define-acrobat-function (av-page-view-set-page-num "AVPageViewSetPageNum")
                         *g-acro-view-version*
                         +acro-view-hft-version-2-2+
                         av-page-view-set-page-num-selproto
                         *g-acro-view-hft*
                         +av-page-view-set-page-num-sel+)
;; line 1057
(define-acrobat-function (av-page-view-get-selected-annot-page-num "AVPageViewGetSelectedAnnotPageNum")
                         *g-acro-view-version*
                         +acro-view-hft-version-2-2+
                         av-page-view-get-selected-annot-page-num-selproto
                         *g-acro-view-hft*
                         +av-page-view-get-selected-annot-page-num-sel+)
;; line 1059
(define-acrobat-function (av-doc-send-aux-data "AVDocSendAuxData")
                         *g-acro-view-version*
                         +acro-view-hft-version-2-2+
                         av-doc-send-aux-data-selproto
                         *g-acro-view-hft*
                         +av-doc-send-aux-data-sel+)
;; line 1061
(define-acrobat-function (av-has-aux-data-handler "AVHasAuxDataHandler")
                         *g-acro-view-version*
                         +acro-view-hft-version-2-2+
                         av-has-aux-data-handler-selproto
                         *g-acro-view-hft*
                         +av-has-aux-data-handler-sel+)
;; line 1064
(define-acrobat-function (av-register-aux-data-handler "AVRegisterAuxDataHandler")
                         *g-acro-view-version*
                         +acro-view-hft-version-9+
                         av-register-aux-data-handler-selproto
                         *g-acro-view-hft*
                         +av-register-aux-data-handler-sel+)
;; line 1069
(define-acrobat-function (av-unregister-aux-data-handler "AVUnregisterAuxDataHandler")
                         *g-acro-view-version*
                         +acro-view-hft-version-2-2+
                         av-unregister-aux-data-handler-selproto
                         *g-acro-view-hft*
                         +av-unregister-aux-data-handler-sel+)
;; line 1075
(define-acrobat-function (av-doc-set-dead "AVDocSetDead")
                         *g-acro-view-version*
                         +acro-view-hft-version-2-2+
                         av-doc-set-dead-selproto
                         *g-acro-view-hft*
                         +av-doc-set-dead-sel+)
;; line 1077
(define-acrobat-function (av-app-is-idle "AVAppIsIdle")
                         *g-acro-view-version*
                         +acro-view-hft-version-2-2+
                         av-app-is-idle-selproto
                         *g-acro-view-hft*
                         +av-app-is-idle-sel+)
;; line 1081
(define-acrobat-function (av-page-view-get-next-view "AVPageViewGetNextView")
                         *g-acro-view-version*
                         +acro-view-hft-version-2-2+
                         av-page-view-get-next-view-selproto
                         *g-acro-view-hft*
                         +av-page-view-get-next-view-sel+)
;; line 1087
(define-acrobat-function (av-window-handle-platform-event "AVWindowHandlePlatformEvent")
                         *g-acro-view-version*
                         +acro-view-hft-version-2-2+
                         av-window-handle-platform-event-selproto
                         *g-acro-view-hft*
                         +av-window-handle-platform-event-sel+)
;; line 1089
(define-acrobat-function (av-window-get-cursor-at-point "AVWindowGetCursorAtPoint")
                         *g-acro-view-version*
                         +acro-view-hft-version-2-2+
                         av-window-get-cursor-at-point-selproto
                         *g-acro-view-hft*
                         +av-window-get-cursor-at-point-sel+)
;; line 1091
(define-acrobat-function (av-doc-do-action-props-dialog "AVDocDoActionPropsDialog")
                         *g-acro-view-version*
                         +acro-view-hft-version-2-2+
                         av-doc-do-action-props-dialog-selproto
                         *g-acro-view-hft*
                         +av-doc-do-action-props-dialog-sel+)
;; line 1093
(define-acrobat-function (av-app-get-trans-handler-by-type "AVAppGetTransHandlerByType")
                         *g-acro-view-version*
                         +acro-view-hft-version-2-2+
                         av-app-get-trans-handler-by-type-selproto
                         *g-acro-view-hft*
                         +av-app-get-trans-handler-by-type-sel+)
;; line 1095
(define-acrobat-function (av-app-enum-trans-handlers "AVAppEnumTransHandlers")
                         *g-acro-view-version*
                         +acro-view-hft-version-2-2+
                         av-app-enum-trans-handlers-selproto
                         *g-acro-view-hft*
                         +av-app-enum-trans-handlers-sel+)
;; line 1097
(define-acrobat-function (av-app-register-trans-handler "AVAppRegisterTransHandler")
                         *g-acro-view-version*
                         +acro-view-hft-version-2-2+
                         av-app-register-trans-handler-selproto
                         *g-acro-view-hft*
                         +av-app-register-trans-handler-sel+)
;; line 1099
(define-acrobat-function (av-doc-do-save-as "AVDocDoSaveAs")
                         *g-acro-view-version*
                         +acro-view-hft-version-2-2+
                         av-doc-do-save-as-selproto
                         *g-acro-view-hft*
                         +av-doc-do-save-as-sel+)
;; line 1101
(define-acrobat-function (av-page-view-set-layout-mode "AVPageViewSetLayoutMode")
                         *g-acro-view-version*
                         +acro-view-hft-version-2-2+
                         av-page-view-set-layout-mode-selproto
                         *g-acro-view-hft*
                         +av-page-view-set-layout-mode-sel+)
;; line 1103
(define-acrobat-function (av-page-view-get-layout-mode "AVPageViewGetLayoutMode")
                         *g-acro-view-version*
                         +acro-view-hft-version-2-2+
                         av-page-view-get-layout-mode-selproto
                         *g-acro-view-hft*
                         +av-page-view-get-layout-mode-sel+)
;; line 1107
(define-acrobat-function (av-doc-is-external "AVDocIsExternal")
                         *g-acro-view-version*
                         +acro-view-hft-version-2-2+
                         av-doc-is-external-selproto
                         *g-acro-view-hft*
                         +av-doc-is-external-sel+)
;; line 1109
(define-acrobat-function (av-page-view-use-this-destination "AVPageViewUseThisDestination")
                         *g-acro-view-version*
                         +acro-view-hft-version-2-2+
                         av-page-view-use-this-destination-selproto
                         *g-acro-view-hft*
                         +av-page-view-use-this-destination-sel+)
;; line 1111
(define-acrobat-function (av-auth-open "AVAuthOpen")
                         *g-acro-view-version*
                         +acro-view-hft-version-2-2+
                         av-auth-open-selproto
                         *g-acro-view-hft*
                         +av-auth-open-sel+)
;; line 1120
(define-acrobat-function (av-doc-copy-annot "AVDocCopyAnnot")
                         *g-acro-view-version*
                         +acro-view-hft-version-2-3+
                         av-doc-copy-annot-selproto
                         *g-acro-view-hft*
                         +av-doc-copy-annot-sel+)
;; line 1122
(define-acrobat-function (av-doc-copy-annot-common "AVDocCopyAnnotCommon")
                         *g-acro-view-version*
                         +acro-view-hft-version-2-3+
                         av-doc-copy-annot-common-selproto
                         *g-acro-view-hft*
                         +av-doc-copy-annot-common-sel+)
;; line 1124
(define-acrobat-function (av-doc-copy-action "AVDocCopyAction")
                         *g-acro-view-version*
                         +acro-view-hft-version-2-3+
                         av-doc-copy-action-selproto
                         *g-acro-view-hft*
                         +av-doc-copy-action-sel+)
;; line 1126
(define-acrobat-function (av-doc-copy-action-common "AVDocCopyActionCommon")
                         *g-acro-view-version*
                         +acro-view-hft-version-2-3+
                         av-doc-copy-action-common-selproto
                         *g-acro-view-hft*
                         +av-doc-copy-action-common-sel+)
;; line 1128
(define-acrobat-function (av-doc-copy-additional-actions "AVDocCopyAdditionalActions")
                         *g-acro-view-version*
                         +acro-view-hft-version-2-3+
                         av-doc-copy-additional-actions-selproto
                         *g-acro-view-hft*
                         +av-doc-copy-additional-actions-sel+)
;; line 1133
(define-acrobat-function (av-page-view-to-dest-info "AVPageViewToDestInfo")
                         *g-acro-view-version*
                         +acro-view-hft-version-2-3+
                         av-page-view-to-dest-info-selproto
                         *g-acro-view-hft*
                         +av-page-view-to-dest-info-sel+)
;; line 1136
(define-acrobat-function (av-page-view-use-dest-info "AVPageViewUseDestInfo")
                         *g-acro-view-version*
                         +acro-view-hft-version-2-3+
                         av-page-view-use-dest-info-selproto
                         *g-acro-view-hft*
                         +av-page-view-use-dest-info-sel+)
;; line 1139
(define-acrobat-function (av-dest-info-destroy "AVDestInfoDestroy")
                         *g-acro-view-version*
                         +acro-view-hft-version-2-3+
                         av-dest-info-destroy-selproto
                         *g-acro-view-hft*
                         +av-dest-info-destroy-sel+)
;; line 1153
(define-acrobat-function (av-doc-do-print "AVDocDoPrint")
                         *g-acro-view-version*
                         +acro-view-hft-version-4+
                         av-doc-do-print-selproto
                         *g-acro-view-hft*
                         +av-doc-do-print-sel+)
;; line 1156
(define-acrobat-function (av-doc-do-save-as-with-params "AVDocDoSaveAsWithParams")
                         *g-acro-view-version*
                         +acro-view-hft-version-4+
                         av-doc-do-save-as-with-params-selproto
                         *g-acro-view-hft*
                         +av-doc-do-save-as-with-params-sel+)
;; line 1158
(define-acrobat-function (av-annot-handler-get-info "AVAnnotHandlerGetInfo")
                         *g-acro-view-version*
                         +acro-view-hft-version-4+
                         av-annot-handler-get-info-selproto
                         *g-acro-view-hft*
                         +av-annot-handler-get-info-sel+)
;; line 1159
(define-acrobat-function (av-annot-handler-delete-info "AVAnnotHandlerDeleteInfo")
                         *g-acro-view-version*
                         +acro-view-hft-version-4+
                         av-annot-handler-delete-info-selproto
                         *g-acro-view-hft*
                         +av-annot-handler-delete-info-sel+)
;; line 1160
(define-acrobat-function (av-annot-handler-get-annot-info "AVAnnotHandlerGetAnnotInfo")
                         *g-acro-view-version*
                         +acro-view-hft-version-4+
                         av-annot-handler-get-annot-info-selproto
                         *g-acro-view-hft*
                         +av-annot-handler-get-annot-info-sel+)
;; line 1161
(define-acrobat-function (av-annot-handler-delete-annot-info "AVAnnotHandlerDeleteAnnotInfo")
                         *g-acro-view-version*
                         +acro-view-hft-version-4+
                         av-annot-handler-delete-annot-info-selproto
                         *g-acro-view-hft*
                         +av-annot-handler-delete-annot-info-sel+)
;; line 1165
(define-acrobat-function (av-page-view-transform-rect-rz "AVPageViewTransformRectRZ")
                         *g-acro-view-version*
                         +acro-view-hft-version-4+
                         av-page-view-transform-rect-rz-selproto
                         *g-acro-view-hft*
                         +av-page-view-transform-rect-rz-sel+)
;; line 1166
(define-acrobat-function (av-page-view-appearance-get-avmatrix "AVPageViewAppearanceGetAVMatrix")
                         *g-acro-view-version*
                         +acro-view-hft-version-4+
                         av-page-view-appearance-get-avmatrix-selproto
                         *g-acro-view-hft*
                         +av-page-view-appearance-get-avmatrix-sel+)
;; line 1169
(define-acrobat-function (av-page-view-get-visible-annot-page "AVPageViewGetVisibleAnnotPage")
                         *g-acro-view-version*
                         +acro-view-hft-version-4+
                         av-page-view-get-visible-annot-page-selproto
                         *g-acro-view-hft*
                         +av-page-view-get-visible-annot-page-sel+)
;; line 1175
(define-acrobat-function (av-sys-alloc-time-string-from-time-rec "AVSysAllocTimeStringFromTimeRec")
                         *g-acro-view-version*
                         +acro-view-hft-version-4+
                         av-sys-alloc-time-string-from-time-rec-selproto
                         *g-acro-view-hft*
                         +av-sys-alloc-time-string-from-time-rec-sel+)
;; line 1179
(define-acrobat-function (av-app-handle-platform-event "AVAppHandlePlatformEvent")
                         *g-acro-view-version*
                         +acro-view-hft-version-4+
                         av-app-handle-platform-event-selproto
                         *g-acro-view-hft*
                         +av-app-handle-platform-event-sel+)
;; line 1182
(define-acrobat-function (av-doc-set-read-only "AVDocSetReadOnly")
                         *g-acro-view-version*
                         +acro-view-hft-version-4+
                         av-doc-set-read-only-selproto
                         *g-acro-view-hft*
                         +av-doc-set-read-only-sel+)
;; line 1185
(define-acrobat-function (av-doc-is-read-only "AVDocIsReadOnly")
                         *g-acro-view-version*
                         +acro-view-hft-version-4+
                         av-doc-is-read-only-selproto
                         *g-acro-view-hft*
                         +av-doc-is-read-only-sel+)
;; line 1188
(define-acrobat-function (av-page-view-show-control "AVPageViewShowControl")
                         *g-acro-view-version*
                         +acro-view-hft-version-4+
                         av-page-view-show-control-selproto
                         *g-acro-view-hft*
                         +av-page-view-show-control-sel+)
;; line 1193
(define-acrobat-function (av-doc-alert "AVDocAlert")
                         *g-acro-view-version*
                         +acro-view-hft-version-4+
                         av-doc-alert-selproto
                         *g-acro-view-hft*
                         +av-doc-alert-sel+)
;; line 1194
(define-acrobat-function (av-doc-alert-note "AVDocAlertNote")
                         *g-acro-view-version*
                         +acro-view-hft-version-4+
                         av-doc-alert-note-selproto
                         *g-acro-view-hft*
                         +av-doc-alert-note-sel+)
;; line 1195
(define-acrobat-function (av-doc-alert-confirm "AVDocAlertConfirm")
                         *g-acro-view-version*
                         +acro-view-hft-version-4+
                         av-doc-alert-confirm-selproto
                         *g-acro-view-hft*
                         +av-doc-alert-confirm-sel+)
;; line 1196
(define-acrobat-function (av-doc-alert-yes-no "AVDocAlertYesNo")
                         *g-acro-view-version*
                         +acro-view-hft-version-4+
                         av-doc-alert-yes-no-selproto
                         *g-acro-view-hft*
                         +av-doc-alert-yes-no-sel+)
;; line 1198
(define-acrobat-function (av-menubar-add-hidden-menu "AVMenubarAddHiddenMenu")
                         *g-acro-view-version*
                         +acro-view-hft-version-4+
                         av-menubar-add-hidden-menu-selproto
                         *g-acro-view-hft*
                         +av-menubar-add-hidden-menu-sel+)
;; line 1199
(define-acrobat-function (av-menu-is-hidden-on-menubar "AVMenuIsHiddenOnMenubar")
                         *g-acro-view-version*
                         +acro-view-hft-version-4+
                         av-menu-is-hidden-on-menubar-selproto
                         *g-acro-view-hft*
                         +av-menu-is-hidden-on-menubar-sel+)
;; line 1201
(define-acrobat-function (av-app-open-help-file "AVAppOpenHelpFile")
                         *g-acro-view-version*
                         +acro-view-hft-version-4+
                         av-app-open-help-file-selproto
                         *g-acro-view-hft*
                         +av-app-open-help-file-sel+)
;; line 1202
(define-acrobat-function (av-app-open-help-file-with-params "AVAppOpenHelpFileWithParams")
                         *g-acro-view-version*
                         +acro-view-hft-version-6+
                         av-app-open-help-file-with-params-selproto
                         *g-acro-view-hft*
                         +av-app-open-help-file-with-params-sel+)
;; line 1203
(define-acrobat-function (av-app-help-show-contents "AVAppHelpShowContents")
                         *g-acro-view-version*
                         +acro-view-hft-version-6+
                         av-app-help-show-contents-selproto
                         *g-acro-view-hft*
                         +av-app-help-show-contents-sel+)
;; line 1204
(define-acrobat-function (av-app-help-search "AVAppHelpSearch")
                         *g-acro-view-version*
                         +acro-view-hft-version-6+
                         av-app-help-search-selproto
                         *g-acro-view-hft*
                         +av-app-help-search-sel+)
;; line 1205
(define-acrobat-function (av-app-help-show-index "AVAppHelpShowIndex")
                         *g-acro-view-version*
                         +acro-view-hft-version-6+
                         av-app-help-show-index-selproto
                         *g-acro-view-hft*
                         +av-app-help-show-index-sel+)
;; line 1208
(define-acrobat-function (av-doc-selection-enum-page-ranges "AVDocSelectionEnumPageRanges")
                         *g-acro-view-version*
                         +acro-view-hft-version-4+
                         av-doc-selection-enum-page-ranges-selproto
                         *g-acro-view-hft*
                         +av-doc-selection-enum-page-ranges-sel+)
;; line 1210
(define-acrobat-function (av-doc-do-copy-as "AVDocDoCopyAs")
                         *g-acro-view-version*
                         +acro-view-hft-version-4+
                         av-doc-do-copy-as-selproto
                         *g-acro-view-hft*
                         +av-doc-do-copy-as-sel+)
;; line 1227
(define-acrobat-function (av-app-register-for-page-view-key-down "AVAppRegisterForPageViewKeyDown")
                         *g-acro-view-version*
                         +acro-view-hft-version-4-5+
                         av-app-register-for-page-view-key-down-selproto
                         *g-acro-view-hft*
                         +av-app-register-for-page-view-key-down-sel+)
;; line 1230
(define-acrobat-function (av-app-unregister-for-page-view-key-down "AVAppUnregisterForPageViewKeyDown")
                         *g-acro-view-version*
                         +acro-view-hft-version-4-5+
                         av-app-unregister-for-page-view-key-down-selproto
                         *g-acro-view-hft*
                         +av-app-unregister-for-page-view-key-down-sel+)
;; line 1239
(define-acrobat-function (av-app-register-to-pdf-handler "AVAppRegisterToPDFHandler")
                         *g-acro-view-version*
                         +acro-view-hft-version-5+
                         av-app-register-to-pdf-handler-selproto
                         *g-acro-view-hft*
                         +av-app-register-to-pdf-handler-sel+)
;; line 1240
(define-acrobat-function (av-app-register-from-pdf-handler "AVAppRegisterFromPDFHandler")
                         *g-acro-view-version*
                         +acro-view-hft-version-5+
                         av-app-register-from-pdf-handler-selproto
                         *g-acro-view-hft*
                         +av-app-register-from-pdf-handler-sel+)
;; line 1241
(define-acrobat-function (av-conversion-enum-to-pdf-converters "AVConversionEnumToPDFConverters")
                         *g-acro-view-version*
                         +acro-view-hft-version-5+
                         av-conversion-enum-to-pdf-converters-selproto
                         *g-acro-view-hft*
                         +av-conversion-enum-to-pdf-converters-sel+)
;; line 1242
(define-acrobat-function (av-conversion-enum-from-pdf-converters "AVConversionEnumFromPDFConverters")
                         *g-acro-view-version*
                         +acro-view-hft-version-5+
                         av-conversion-enum-from-pdf-converters-selproto
                         *g-acro-view-hft*
                         +av-conversion-enum-from-pdf-converters-sel+)
;; line 1243
(define-acrobat-function (av-conversion-convert-to-pdf-with-handler "AVConversionConvertToPDFWithHandler")
                         *g-acro-view-version*
                         +acro-view-hft-version-5+
                         av-conversion-convert-to-pdf-with-handler-selproto
                         *g-acro-view-hft*
                         +av-conversion-convert-to-pdf-with-handler-sel+)
;; line 1244
(define-acrobat-function (av-conversion-convert-from-pdf-with-handler "AVConversionConvertFromPDFWithHandler")
                         *g-acro-view-version*
                         +acro-view-hft-version-5+
                         av-conversion-convert-from-pdf-with-handler-selproto
                         *g-acro-view-hft*
                         +av-conversion-convert-from-pdf-with-handler-sel+)
;; line 1245
(define-acrobat-function (av-conversion-convert-to-pdf "AVConversionConvertToPDF")
                         *g-acro-view-version*
                         +acro-view-hft-version-5+
                         av-conversion-convert-to-pdf-selproto
                         *g-acro-view-hft*
                         +av-conversion-convert-to-pdf-sel+)
;; line 1247
(define-acrobat-function (av-command-new "AVCommandNew")
                         *g-acro-view-version*
                         +acro-view-hft-version-5+
                         av-command-new-selproto
                         *g-acro-view-hft*
                         +av-command-new-sel+)
;; line 1249
(define-acrobat-function (av-command-destroy "AVCommandDestroy")
                         *g-acro-view-version*
                         +acro-view-hft-version-5+
                         av-command-destroy-selproto
                         *g-acro-view-hft*
                         +av-command-destroy-sel+)
;; line 1251
(define-acrobat-function (av-command-get-name "AVCommandGetName")
                         *g-acro-view-version*
                         +acro-view-hft-version-5+
                         av-command-get-name-selproto
                         *g-acro-view-hft*
                         +av-command-get-name-sel+)
;; line 1253
(define-acrobat-function (av-command-get-status "AVCommandGetStatus")
                         *g-acro-view-version*
                         +acro-view-hft-version-5+
                         av-command-get-status-selproto
                         *g-acro-view-hft*
                         +av-command-get-status-sel+)
;; line 1255
(define-acrobat-function (av-command-get-cab "AVCommandGetCab")
                         *g-acro-view-version*
                         +acro-view-hft-version-5+
                         av-command-get-cab-selproto
                         *g-acro-view-hft*
                         +av-command-get-cab-sel+)
;; line 1257
(define-acrobat-function (av-command-put-cab "AVCommandPutCab")
                         *g-acro-view-version*
                         +acro-view-hft-version-5+
                         av-command-put-cab-selproto
                         *g-acro-view-hft*
                         +av-command-put-cab-sel+)
;; line 1259
(define-acrobat-function (av-command-set-params "AVCommandSetParams")
                         *g-acro-view-version*
                         +acro-view-hft-version-5+
                         av-command-set-params-selproto
                         *g-acro-view-hft*
                         +av-command-set-params-sel+)
;; line 1261
(define-acrobat-function (av-command-get-params "AVCommandGetParams")
                         *g-acro-view-version*
                         +acro-view-hft-version-5+
                         av-command-get-params-selproto
                         *g-acro-view-hft*
                         +av-command-get-params-sel+)
;; line 1263
(define-acrobat-function (av-command-set-config "AVCommandSetConfig")
                         *g-acro-view-version*
                         +acro-view-hft-version-5+
                         av-command-set-config-selproto
                         *g-acro-view-hft*
                         +av-command-set-config-sel+)
;; line 1265
(define-acrobat-function (av-command-get-config "AVCommandGetConfig")
                         *g-acro-view-version*
                         +acro-view-hft-version-5+
                         av-command-get-config-selproto
                         *g-acro-view-hft*
                         +av-command-get-config-sel+)
;; line 1267
(define-acrobat-function (av-command-get-props "AVCommandGetProps")
                         *g-acro-view-version*
                         +acro-view-hft-version-5+
                         av-command-get-props-selproto
                         *g-acro-view-hft*
                         +av-command-get-props-sel+)
;; line 1269
(define-acrobat-function (av-command-set-inputs "AVCommandSetInputs")
                         *g-acro-view-version*
                         +acro-view-hft-version-5+
                         av-command-set-inputs-selproto
                         *g-acro-view-hft*
                         +av-command-set-inputs-sel+)
;; line 1271
(define-acrobat-function (av-command-get-inputs "AVCommandGetInputs")
                         *g-acro-view-version*
                         +acro-view-hft-version-5+
                         av-command-get-inputs-selproto
                         *g-acro-view-hft*
                         +av-command-get-inputs-sel+)
;; line 1273
(define-acrobat-function (av-command-show-dialog "AVCommandShowDialog")
                         *g-acro-view-version*
                         +acro-view-hft-version-5+
                         av-command-show-dialog-selproto
                         *g-acro-view-hft*
                         +av-command-show-dialog-sel+)
;; line 1275
(define-acrobat-function (av-command-work "AVCommandWork")
                         *g-acro-view-version*
                         +acro-view-hft-version-5+
                         av-command-work-selproto
                         *g-acro-view-hft*
                         +av-command-work-sel+)
;; line 1277
(define-acrobat-function (av-command-cancel "AVCommandCancel")
                         *g-acro-view-version*
                         +acro-view-hft-version-5+
                         av-command-cancel-selproto
                         *g-acro-view-hft*
                         +av-command-cancel-sel+)
;; line 1279
(define-acrobat-function (av-command-reset "AVCommandReset")
                         *g-acro-view-version*
                         +acro-view-hft-version-5+
                         av-command-reset-selproto
                         *g-acro-view-hft*
                         +av-command-reset-sel+)
;; line 1281
(define-acrobat-function (av-command-get-uipolicy "AVCommandGetUIPolicy")
                         *g-acro-view-version*
                         +acro-view-hft-version-5+
                         av-command-get-uipolicy-selproto
                         *g-acro-view-hft*
                         +av-command-get-uipolicy-sel+)
;; line 1283
(define-acrobat-function (av-command-get-avdoc "AVCommandGetAVDoc")
                         *g-acro-view-version*
                         +acro-view-hft-version-5+
                         av-command-get-avdoc-selproto
                         *g-acro-view-hft*
                         +av-command-get-avdoc-sel+)
;; line 1285
(define-acrobat-function (av-command-get-pddoc "AVCommandGetPDDoc")
                         *g-acro-view-version*
                         +acro-view-hft-version-5+
                         av-command-get-pddoc-selproto
                         *g-acro-view-hft*
                         +av-command-get-pddoc-sel+)
;; line 1287
(define-acrobat-function (av-command-get-report-proc "AVCommandGetReportProc")
                         *g-acro-view-version*
                         +acro-view-hft-version-5+
                         av-command-get-report-proc-selproto
                         *g-acro-view-hft*
                         +av-command-get-report-proc-sel+)
;; line 1289
(define-acrobat-function (av-command-get-progress-monitor "AVCommandGetProgressMonitor")
                         *g-acro-view-version*
                         +acro-view-hft-version-5+
                         av-command-get-progress-monitor-selproto
                         *g-acro-view-hft*
                         +av-command-get-progress-monitor-sel+)
;; line 1291
(define-acrobat-function (av-command-get-cancel-proc "AVCommandGetCancelProc")
                         *g-acro-view-version*
                         +acro-view-hft-version-5+
                         av-command-get-cancel-proc-selproto
                         *g-acro-view-hft*
                         +av-command-get-cancel-proc-sel+)
;; line 1293
(define-acrobat-function (av-app-register-command-handler "AVAppRegisterCommandHandler")
                         *g-acro-view-version*
                         +acro-view-hft-version-5+
                         av-app-register-command-handler-selproto
                         *g-acro-view-hft*
                         +av-app-register-command-handler-sel+)
;; line 1295
(define-acrobat-function (av-app-find-command-handler-by-name "AVAppFindCommandHandlerByName")
                         *g-acro-view-version*
                         +acro-view-hft-version-5+
                         av-app-find-command-handler-by-name-selproto
                         *g-acro-view-hft*
                         +av-app-find-command-handler-by-name-sel+)
;; line 1297
(define-acrobat-function (av-app-register-global-command "AVAppRegisterGlobalCommand")
                         *g-acro-view-version*
                         +acro-view-hft-version-5+
                         av-app-register-global-command-selproto
                         *g-acro-view-hft*
                         +av-app-register-global-command-sel+)
;; line 1299
(define-acrobat-function (av-app-find-global-command-by-name "AVAppFindGlobalCommandByName")
                         *g-acro-view-version*
                         +acro-view-hft-version-5+
                         av-app-find-global-command-by-name-selproto
                         *g-acro-view-hft*
                         +av-app-find-global-command-by-name-sel+)
;; line 1301
(define-acrobat-function (av-app-unregister-global-command "AVAppUnregisterGlobalCommand")
                         *g-acro-view-version*
                         +acro-view-hft-version-5+
                         av-app-unregister-global-command-selproto
                         *g-acro-view-hft*
                         +av-app-unregister-global-command-sel+)
;; line 1303
(define-acrobat-function (av-command-execute "AVCommandExecute")
                         *g-acro-view-version*
                         +acro-view-hft-version-5+
                         av-command-execute-selproto
                         *g-acro-view-hft*
                         +av-command-execute-sel+)
;; line 1311
(define-acrobat-function (av-acquire-special-folder-path-name "AVAcquireSpecialFolderPathName")
                         *g-acro-view-version*
                         +acro-view-hft-version-5+
                         av-acquire-special-folder-path-name-selproto
                         *g-acro-view-hft*
                         +av-acquire-special-folder-path-name-sel+)
;; line 1313
(define-acrobat-function (av-acquire-special-file-path-name "AVAcquireSpecialFilePathName")
                         *g-acro-view-version*
                         +acro-view-hft-version-5+
                         av-acquire-special-file-path-name-selproto
                         *g-acro-view-hft*
                         +av-acquire-special-file-path-name-sel+)
;; line 1315
(define-acrobat-function (av-page-view-get-focus-annot "AVPageViewGetFocusAnnot")
                         *g-acro-view-version*
                         +acro-view-hft-version-5+
                         av-page-view-get-focus-annot-selproto
                         *g-acro-view-hft*
                         +av-page-view-get-focus-annot-sel+)
;; line 1317
(define-acrobat-function (av-page-view-set-focus-annot "AVPageViewSetFocusAnnot")
                         *g-acro-view-version*
                         +acro-view-hft-version-5+
                         av-page-view-set-focus-annot-selproto
                         *g-acro-view-hft*
                         +av-page-view-set-focus-annot-sel+)
;; line 1319
(define-acrobat-function (av-page-view-clear-focus-annot "AVPageViewClearFocusAnnot")
                         *g-acro-view-version*
                         +acro-view-hft-version-5+
                         av-page-view-clear-focus-annot-selproto
                         *g-acro-view-hft*
                         +av-page-view-clear-focus-annot-sel+)
;; line 1321
(define-acrobat-function (av-page-view-is-focus-annot "AVPageViewIsFocusAnnot")
                         *g-acro-view-version*
                         +acro-view-hft-version-5+
                         av-page-view-is-focus-annot-selproto
                         *g-acro-view-hft*
                         +av-page-view-is-focus-annot-sel+)
;; line 1323
(define-acrobat-function (av-util-get-base-name-and-extension-by-path-name "AVUtilGetBaseNameAndExtensionByPathName")
                         *g-acro-view-version*
                         +acro-view-hft-version-5+
                         av-util-get-base-name-and-extension-by-path-name-selproto
                         *g-acro-view-hft*
                         +av-util-get-base-name-and-extension-by-path-name-sel+)
;; line 1325
(define-acrobat-function (av-util-get-base-name-and-extension-by-string "AVUtilGetBaseNameAndExtensionByString")
                         *g-acro-view-version*
                         +acro-view-hft-version-5+
                         av-util-get-base-name-and-extension-by-string-selproto
                         *g-acro-view-hft*
                         +av-util-get-base-name-and-extension-by-string-sel+)
;; line 1327
(define-acrobat-function (av-identity-get-text "AVIdentityGetText")
                         *g-acro-view-version*
                         +acro-view-hft-version-5+
                         av-identity-get-text-selproto
                         *g-acro-view-hft*
                         +av-identity-get-text-sel+)
;; line 1329
(define-acrobat-function (av-identity-set-text "AVIdentitySetText")
                         *g-acro-view-version*
                         +acro-view-hft-version-5+
                         av-identity-set-text-selproto
                         *g-acro-view-hft*
                         +av-identity-set-text-sel+)
;; line 1331
(define-acrobat-function (av-page-view-focus-annot-perform-op "AVPageViewFocusAnnotPerformOp")
                         *g-acro-view-version*
                         +acro-view-hft-version-5+
                         av-page-view-focus-annot-perform-op-selproto
                         *g-acro-view-hft*
                         +av-page-view-focus-annot-perform-op-sel+)
;; line 1333
(define-acrobat-function (av-page-view-filter-key-down-for-focus-annot "AVPageViewFilterKeyDownForFocusAnnot")
                         *g-acro-view-version*
                         +acro-view-hft-version-5+
                         av-page-view-filter-key-down-for-focus-annot-selproto
                         *g-acro-view-hft*
                         +av-page-view-filter-key-down-for-focus-annot-sel+)
;; line 1339
(define-acrobat-function (av-page-view-snap-point-ex "AVPageViewSnapPointEx")
                         *g-acro-view-version*
                         +acro-view-hft-version-6+
                         av-page-view-snap-point-ex-selproto
                         *g-acro-view-hft*
                         +av-page-view-snap-point-ex-sel+)
;; line 1347
(define-acrobat-function (av-page-view-drag-rect-snapped-ex "AVPageViewDragRectSnappedEx")
                         *g-acro-view-version*
                         +acro-view-hft-version-6+
                         av-page-view-drag-rect-snapped-ex-selproto
                         *g-acro-view-hft*
                         +av-page-view-drag-rect-snapped-ex-sel+)
;; line 1355
(define-acrobat-function (av-window-center "AVWindowCenter")
                         *g-acro-view-version*
                         +acro-view-hft-version-5+
                         av-window-center-selproto
                         *g-acro-view-hft*
                         +av-window-center-sel+)
;; line 1357
(define-acrobat-function (av-doc-from-pddoc "AVDocFromPDDoc")
                         *g-acro-view-version*
                         +acro-view-hft-version-5+
                         av-doc-from-pddoc-selproto
                         *g-acro-view-hft*
                         +av-doc-from-pddoc-sel+)
;; line 1361
(define-acrobat-function (av-app-get-report-proc "AVAppGetReportProc")
                         *g-acro-view-version*
                         +acro-view-hft-version-5+
                         av-app-get-report-proc-selproto
                         *g-acro-view-hft*
                         +av-app-get-report-proc-sel+)
;; line 1363
(define-acrobat-function (av-doc-is-dead "AVDocIsDead")
                         *g-acro-view-version*
                         +acro-view-hft-version-5+
                         av-doc-is-dead-selproto
                         *g-acro-view-hft*
                         +av-doc-is-dead-sel+)
;; line 1365
(define-acrobat-function (av-app-get-pref-bool "AVAppGetPrefBool")
                         *g-acro-view-version*
                         +acro-view-hft-version-5+
                         av-app-get-pref-bool-selproto
                         *g-acro-view-hft*
                         +av-app-get-pref-bool-sel+)
;; line 1367
(define-acrobat-function (av-app-get-pref-int "AVAppGetPrefInt")
                         *g-acro-view-version*
                         +acro-view-hft-version-5+
                         av-app-get-pref-int-selproto
                         *g-acro-view-hft*
                         +av-app-get-pref-int-sel+)
;; line 1369
(define-acrobat-function (av-app-get-pref-atom "AVAppGetPrefAtom")
                         *g-acro-view-version*
                         +acro-view-hft-version-5+
                         av-app-get-pref-atom-selproto
                         *g-acro-view-hft*
                         +av-app-get-pref-atom-sel+)
;; line 1371
(define-acrobat-function (av-app-get-pref-double "AVAppGetPrefDouble")
                         *g-acro-view-version*
                         +acro-view-hft-version-5+
                         av-app-get-pref-double-selproto
                         *g-acro-view-hft*
                         +av-app-get-pref-double-sel+)
;; line 1373
(define-acrobat-function (av-app-get-pref-string "AVAppGetPrefString")
                         *g-acro-view-version*
                         +acro-view-hft-version-5+
                         av-app-get-pref-string-selproto
                         *g-acro-view-hft*
                         +av-app-get-pref-string-sel+)
;; line 1375
(define-acrobat-function (av-app-get-pref-text "AVAppGetPrefText")
                         *g-acro-view-version*
                         +acro-view-hft-version-5+
                         av-app-get-pref-text-selproto
                         *g-acro-view-hft*
                         +av-app-get-pref-text-sel+)
;; line 1377
(define-acrobat-function (av-app-get-pref-cab "AVAppGetPrefCab")
                         *g-acro-view-version*
                         +acro-view-hft-version-5+
                         av-app-get-pref-cab-selproto
                         *g-acro-view-hft*
                         +av-app-get-pref-cab-sel+)
;; line 1379
(define-acrobat-function (av-app-get-pref-path-name "AVAppGetPrefPathName")
                         *g-acro-view-version*
                         +acro-view-hft-version-5+
                         av-app-get-pref-path-name-selproto
                         *g-acro-view-hft*
                         +av-app-get-pref-path-name-sel+)
;; line 1381
(define-acrobat-function (av-alert-with-params "AVAlertWithParams")
                         *g-acro-view-version*
                         +acro-view-hft-version-5+
                         av-alert-with-params-selproto
                         *g-acro-view-hft*
                         +av-alert-with-params-sel+)
;; line 1383
(define-acrobat-function (av-doc-perform-action-ex "AVDocPerformActionEx")
                         *g-acro-view-version*
                         +acro-view-hft-version-5+
                         av-doc-perform-action-ex-selproto
                         *g-acro-view-hft*
                         +av-doc-perform-action-ex-sel+)
;; line 1385
(define-acrobat-function (av-extension-get-num-plug-ins "AVExtensionGetNumPlugIns")
                         *g-acro-view-version*
                         +acro-view-hft-version-5+
                         av-extension-get-num-plug-ins-selproto
                         *g-acro-view-hft*
                         +av-extension-get-num-plug-ins-sel+)
;; line 1387
(define-acrobat-function (av-extension-acquire-info "AVExtensionAcquireInfo")
                         *g-acro-view-version*
                         +acro-view-hft-version-5+
                         av-extension-acquire-info-selproto
                         *g-acro-view-hft*
                         +av-extension-acquire-info-sel+)
;; line 1389
(define-acrobat-function (av-extension-release-info "AVExtensionReleaseInfo")
                         *g-acro-view-version*
                         +acro-view-hft-version-5+
                         av-extension-release-info-selproto
                         *g-acro-view-hft*
                         +av-extension-release-info-sel+)
;; line 1391
(define-acrobat-function (av-page-view-device-to-info "AVPageViewDeviceToInfo")
                         *g-acro-view-version*
                         +acro-view-hft-version-5+
                         av-page-view-device-to-info-selproto
                         *g-acro-view-hft*
                         +av-page-view-device-to-info-sel+)
;; line 1393
(define-acrobat-function (av-page-view-info-to-device "AVPageViewInfoToDevice")
                         *g-acro-view-version*
                         +acro-view-hft-version-5+
                         av-page-view-info-to-device-selproto
                         *g-acro-view-hft*
                         +av-page-view-info-to-device-sel+)
;; line 1395
(define-acrobat-function (av-page-view-point-to-info "AVPageViewPointToInfo")
                         *g-acro-view-version*
                         +acro-view-hft-version-5+
                         av-page-view-point-to-info-selproto
                         *g-acro-view-hft*
                         +av-page-view-point-to-info-sel+)
;; line 1397
(define-acrobat-function (av-page-view-info-to-point "AVPageViewInfoToPoint")
                         *g-acro-view-version*
                         +acro-view-hft-version-5+
                         av-page-view-info-to-point-selproto
                         *g-acro-view-hft*
                         +av-page-view-info-to-point-sel+)
;; line 1399
(define-acrobat-function (av-page-view-update-info-panel "AVPageViewUpdateInfoPanel")
                         *g-acro-view-version*
                         +acro-view-hft-version-5+
                         av-page-view-update-info-panel-selproto
                         *g-acro-view-hft*
                         +av-page-view-update-info-panel-sel+)
;; line 1401
(define-acrobat-function (av-app-get-language-encoding "AVAppGetLanguageEncoding")
                         *g-acro-view-version*
                         +acro-view-hft-version-5+
                         av-app-get-language-encoding-selproto
                         *g-acro-view-hft*
                         +av-app-get-language-encoding-sel+)
;; line 1403
(define-acrobat-function (av-alert-reset-prefs "AVAlertResetPrefs")
                         *g-acro-view-version*
                         +acro-view-hft-version-5+
                         av-alert-reset-prefs-selproto
                         *g-acro-view-hft*
                         +av-alert-reset-prefs-sel+)
;; line 1405
(define-acrobat-function (av-alert-set-pref "AVAlertSetPref")
                         *g-acro-view-version*
                         +acro-view-hft-version-5+
                         av-alert-set-pref-selproto
                         *g-acro-view-hft*
                         +av-alert-set-pref-sel+)
;; line 1407
(define-acrobat-function (av-alert-get-pref "AVAlertGetPref")
                         *g-acro-view-version*
                         +acro-view-hft-version-5+
                         av-alert-get-pref-selproto
                         *g-acro-view-hft*
                         +av-alert-get-pref-sel+)
;; line 1409
(define-acrobat-function (av-page-view-scroll-to-annot "AVPageViewScrollToAnnot")
                         *g-acro-view-version*
                         +acro-view-hft-version-5+
                         av-page-view-scroll-to-annot-selproto
                         *g-acro-view-hft*
                         +av-page-view-scroll-to-annot-sel+)
;; line 1411
(define-acrobat-function (av-sys-set-wait-cursor "AVSysSetWaitCursor")
                         *g-acro-view-version*
                         +acro-view-hft-version-5+
                         av-sys-set-wait-cursor-selproto
                         *g-acro-view-hft*
                         +av-sys-set-wait-cursor-sel+)
;; line 1413
(define-acrobat-function (av-doc-perm-request "AVDocPermRequest")
                         *g-acro-view-version*
                         +acro-view-hft-version-5+
                         av-doc-perm-request-selproto
                         *g-acro-view-hft*
                         +av-doc-perm-request-sel+)
;; line 1415
(define-acrobat-function (av-page-view-suspend-offscreen-drawing "AVPageViewSuspendOffscreenDrawing")
                         *g-acro-view-version*
                         +acro-view-hft-version-5+
                         av-page-view-suspend-offscreen-drawing-selproto
                         *g-acro-view-hft*
                         +av-page-view-suspend-offscreen-drawing-sel+)
;; line 1417
(define-acrobat-function (av-page-view-resume-offscreen-drawing "AVPageViewResumeOffscreenDrawing")
                         *g-acro-view-version*
                         +acro-view-hft-version-5+
                         av-page-view-resume-offscreen-drawing-selproto
                         *g-acro-view-hft*
                         +av-page-view-resume-offscreen-drawing-sel+)
;; line 1419
(define-acrobat-function (av-app-did-or-will-switch-for-dialog "AVAppDidOrWillSwitchForDialog")
                         *g-acro-view-version*
                         +acro-view-hft-version-5+
                         av-app-did-or-will-switch-for-dialog-selproto
                         *g-acro-view-hft*
                         +av-app-did-or-will-switch-for-dialog-sel+)
;; line 1421
(define-acrobat-function (av-app-yield-to-other-apps "AVAppYieldToOtherApps")
                         *g-acro-view-version*
                         +acro-view-hft-version-5+
                         av-app-yield-to-other-apps-selproto
                         *g-acro-view-hft*
                         +av-app-yield-to-other-apps-sel+)
;; line 1423
(define-acrobat-function (av-window-ensure-in-bounds "AVWindowEnsureInBounds")
                         *g-acro-view-version*
                         +acro-view-hft-version-5+
                         av-window-ensure-in-bounds-selproto
                         *g-acro-view-hft*
                         +av-window-ensure-in-bounds-sel+)
;; line 1434
(define-acrobat-function (av-menu-clone "AVMenuClone")
                         *g-acro-view-version*
                         +acro-view-hft-version-5-1+
                         av-menu-clone-selproto
                         *g-acro-view-hft*
                         +av-menu-clone-sel+)
;; line 1444
(define-acrobat-function (av-app-get-uuid "AVAppGetUUID")
                         *g-acro-view-version*
                         +acro-view-hft-version-6+
                         av-app-get-uuid-selproto
                         *g-acro-view-hft*
                         +av-app-get-uuid-sel+)
;; line 1446
(define-acrobat-function (av-sys-get-icon-from-filename "AVSysGetIconFromFilename")
                         *g-acro-view-version*
                         +acro-view-hft-version-6+
                         av-sys-get-icon-from-filename-selproto
                         *g-acro-view-hft*
                         +av-sys-get-icon-from-filename-sel+)
;; line 1447
(define-acrobat-function (av-sys-get-icon-from-mime-type "AVSysGetIconFromMimeType")
                         *g-acro-view-version*
                         +acro-view-hft-version-6+
                         av-sys-get-icon-from-mime-type-selproto
                         *g-acro-view-hft*
                         +av-sys-get-icon-from-mime-type-sel+)
;; line 1448
(define-acrobat-function (av-sys-get-icon-from-type-and-creator "AVSysGetIconFromTypeAndCreator")
                         *g-acro-view-version*
                         +acro-view-hft-version-6+
                         av-sys-get-icon-from-type-and-creator-selproto
                         *g-acro-view-hft*
                         +av-sys-get-icon-from-type-and-creator-sel+)
;; line 1450
(define-acrobat-function (av-conversion-convert-stream-to-pdf-with-handler "AVConversionConvertStreamToPDFWithHandler")
                         *g-acro-view-version*
                         +acro-view-hft-version-6+
                         av-conversion-convert-stream-to-pdf-with-handler-selproto
                         *g-acro-view-hft*
                         +av-conversion-convert-stream-to-pdf-with-handler-sel+)
;; line 1451
(define-acrobat-function (av-conversion-convert-stream-from-pdf-with-handler "AVConversionConvertStreamFromPDFWithHandler")
                         *g-acro-view-version*
                         +acro-view-hft-version-6+
                         av-conversion-convert-stream-from-pdf-with-handler-selproto
                         *g-acro-view-hft*
                         +av-conversion-convert-stream-from-pdf-with-handler-sel+)
;; line 1452
(define-acrobat-function (av-conversion-convert-stream-from-struct-node-with-handler "AVConversionConvertStreamFromStructNodeWithHandler")
                         *g-acro-view-version*
                         +acro-view-hft-version-6+
                         av-conversion-convert-stream-from-struct-node-with-handler-selproto
                         *g-acro-view-hft*
                         +av-conversion-convert-stream-from-struct-node-with-handler-sel+)
;; line 1453
(define-acrobat-function (av-conversion-convert-stream-to-pdf "AVConversionConvertStreamToPDF")
                         *g-acro-view-version*
                         +acro-view-hft-version-6+
                         av-conversion-convert-stream-to-pdf-selproto
                         *g-acro-view-hft*
                         +av-conversion-convert-stream-to-pdf-sel+)
;; line 1456
(define-acrobat-function (av-menu-do-pop-up "AVMenuDoPopUp")
                         *g-acro-view-version*
                         +acro-view-hft-version-6+
                         av-menu-do-pop-up-selproto
                         *g-acro-view-hft*
                         +av-menu-do-pop-up-sel+)
;; line 1458
(define-acrobat-function (av-doc-get-num-page-views "AVDocGetNumPageViews")
                         *g-acro-view-version*
                         +acro-view-hft-version-6+
                         av-doc-get-num-page-views-selproto
                         *g-acro-view-hft*
                         +av-doc-get-num-page-views-sel+)
;; line 1462
(define-acrobat-function (av-menu-new-with-as-text "AVMenuNewWithASText")
                         *g-acro-view-version*
                         +acro-view-hft-version-6+
                         av-menu-new-with-as-text-selproto
                         *g-acro-view-hft*
                         +av-menu-new-with-as-text-sel+)
;; line 1463
(define-acrobat-function (av-menu-get-title-as-as-text "AVMenuGetTitleAsASText")
                         *g-acro-view-version*
                         +acro-view-hft-version-6+
                         av-menu-get-title-as-as-text-selproto
                         *g-acro-view-hft*
                         +av-menu-get-title-as-as-text-sel+)
;; line 1464
(define-acrobat-function (av-menu-item-new-with-as-text "AVMenuItemNewWithASText")
                         *g-acro-view-version*
                         +acro-view-hft-version-6+
                         av-menu-item-new-with-as-text-selproto
                         *g-acro-view-hft*
                         +av-menu-item-new-with-as-text-sel+)
;; line 1465
(define-acrobat-function (av-menu-item-get-title-as-as-text "AVMenuItemGetTitleAsASText")
                         *g-acro-view-version*
                         +acro-view-hft-version-6+
                         av-menu-item-get-title-as-as-text-selproto
                         *g-acro-view-hft*
                         +av-menu-item-get-title-as-as-text-sel+)
;; line 1466
(define-acrobat-function (av-menu-item-set-title-with-as-text "AVMenuItemSetTitleWithASText")
                         *g-acro-view-version*
                         +acro-view-hft-version-6+
                         av-menu-item-set-title-with-as-text-selproto
                         *g-acro-view-hft*
                         +av-menu-item-set-title-with-as-text-sel+)
;; line 1468
(define-acrobat-function (av-util-get-base-name-and-extension-ex "AVUtilGetBaseNameAndExtensionEx")
                         *g-acro-view-version*
                         +acro-view-hft-version-6+
                         av-util-get-base-name-and-extension-ex-selproto
                         *g-acro-view-hft*
                         +av-util-get-base-name-and-extension-ex-sel+)
;; line 1470
(define-acrobat-function (av-acquire-special-file-path-name-with-as-text "AVAcquireSpecialFilePathNameWithASText")
                         *g-acro-view-version*
                         +acro-view-hft-version-6+
                         av-acquire-special-file-path-name-with-as-text-selproto
                         *g-acro-view-hft*
                         +av-acquire-special-file-path-name-with-as-text-sel+)
;; line 1472
(define-acrobat-function (av-page-view-set-visible-inks "AVPageViewSetVisibleInks")
                         *g-acro-view-version*
                         +acro-view-hft-version-6+
                         av-page-view-set-visible-inks-selproto
                         *g-acro-view-hft*
                         +av-page-view-set-visible-inks-sel+)
;; line 1473
(define-acrobat-function (av-page-view-set-ink-preview "AVPageViewSetInkPreview")
                         *g-acro-view-version*
                         +acro-view-hft-version-6+
                         av-page-view-set-ink-preview-selproto
                         *g-acro-view-hft*
                         +av-page-view-set-ink-preview-sel+)
;; line 1474
(define-acrobat-function (av-page-view-get-num-visible-inks "AVPageViewGetNumVisibleInks")
                         *g-acro-view-version*
                         +acro-view-hft-version-6+
                         av-page-view-get-num-visible-inks-selproto
                         *g-acro-view-hft*
                         +av-page-view-get-num-visible-inks-sel+)
;; line 1475
(define-acrobat-function (av-page-view-get-visible-inks "AVPageViewGetVisibleInks")
                         *g-acro-view-version*
                         +acro-view-hft-version-6+
                         av-page-view-get-visible-inks-selproto
                         *g-acro-view-hft*
                         +av-page-view-get-visible-inks-sel+)
;; line 1476
(define-acrobat-function (av-page-view-get-pixel-information-at-point "AVPageViewGetPixelInformationAtPoint")
                         *g-acro-view-version*
                         +acro-view-hft-version-6+
                         av-page-view-get-pixel-information-at-point-selproto
                         *g-acro-view-hft*
                         +av-page-view-get-pixel-information-at-point-sel+)
;; line 1479
(define-acrobat-function (av-undo-new "AVUndoNew")
                         *g-acro-view-version*
                         +acro-view-hft-version-6+
                         av-undo-new-selproto
                         *g-acro-view-hft*
                         +av-undo-new-sel+)
;; line 1480
(define-acrobat-function (av-undo-set-data "AVUndoSetData")
                         *g-acro-view-version*
                         +acro-view-hft-version-6+
                         av-undo-set-data-selproto
                         *g-acro-view-hft*
                         +av-undo-set-data-sel+)
;; line 1481
(define-acrobat-function (av-undo-get-data "AVUndoGetData")
                         *g-acro-view-version*
                         +acro-view-hft-version-6+
                         av-undo-get-data-selproto
                         *g-acro-view-hft*
                         +av-undo-get-data-sel+)
;; line 1482
(define-acrobat-function (av-undo-get-avdoc "AVUndoGetAVDoc")
                         *g-acro-view-version*
                         +acro-view-hft-version-6+
                         av-undo-get-avdoc-selproto
                         *g-acro-view-hft*
                         +av-undo-get-avdoc-sel+)
;; line 1483
(define-acrobat-function (av-undo-get-type "AVUndoGetType")
                         *g-acro-view-version*
                         +acro-view-hft-version-6+
                         av-undo-get-type-selproto
                         *g-acro-view-hft*
                         +av-undo-get-type-sel+)
;; line 1484
(define-acrobat-function (av-doc-clear-undos "AVDocClearUndos")
                         *g-acro-view-version*
                         +acro-view-hft-version-6+
                         av-doc-clear-undos-selproto
                         *g-acro-view-hft*
                         +av-doc-clear-undos-sel+)
;; line 1485
(define-acrobat-function (av-doc-get-top-undo "AVDocGetTopUndo")
                         *g-acro-view-version*
                         +acro-view-hft-version-6+
                         av-doc-get-top-undo-selproto
                         *g-acro-view-hft*
                         +av-doc-get-top-undo-sel+)
;; line 1486
(define-acrobat-function (av-doc-get-top-undo-and-redo "AVDocGetTopUndoAndRedo")
                         *g-acro-view-version*
                         +acro-view-hft-version-6+
                         av-doc-get-top-undo-and-redo-selproto
                         *g-acro-view-hft*
                         +av-doc-get-top-undo-and-redo-sel+)
;; line 1487
(define-acrobat-function (av-doc-begin-undo-operation "AVDocBeginUndoOperation")
                         *g-acro-view-version*
                         +acro-view-hft-version-6+
                         av-doc-begin-undo-operation-selproto
                         *g-acro-view-hft*
                         +av-doc-begin-undo-operation-sel+)
;; line 1488
(define-acrobat-function (av-doc-end-undo-operation "AVDocEndUndoOperation")
                         *g-acro-view-version*
                         +acro-view-hft-version-6+
                         av-doc-end-undo-operation-selproto
                         *g-acro-view-hft*
                         +av-doc-end-undo-operation-sel+)
;; line 1491
(define-acrobat-function (av-page-view-draw-now-with-transition "AVPageViewDrawNowWithTransition")
                         *g-acro-view-version*
                         +acro-view-hft-version-6+
                         av-page-view-draw-now-with-transition-selproto
                         *g-acro-view-hft*
                         +av-page-view-draw-now-with-transition-sel+)
;; line 1493
(define-acrobat-function (av-doc-print-separations "AVDocPrintSeparations")
                         *g-acro-view-version*
                         +acro-view-hft-version-6+
                         av-doc-print-separations-selproto
                         *g-acro-view-hft*
                         +av-doc-print-separations-sel+)
;; line 1494
(define-acrobat-function (av-window-do-modal "AVWindowDoModal")
                         *g-acro-view-version*
                         +acro-view-hft-version-6+
                         av-window-do-modal-selproto
                         *g-acro-view-hft*
                         +av-window-do-modal-sel+)
;; line 1495
(define-acrobat-function (av-window-end-modal "AVWindowEndModal")
                         *g-acro-view-version*
                         +acro-view-hft-version-6+
                         av-window-end-modal-selproto
                         *g-acro-view-hft*
                         +av-window-end-modal-sel+)
;; line 1496
(define-acrobat-function (av-sys-get-use-pen-for-input "AVSysGetUsePenForInput")
                         *g-acro-view-version*
                         +acro-view-hft-version-6+
                         av-sys-get-use-pen-for-input-selproto
                         *g-acro-view-hft*
                         +av-sys-get-use-pen-for-input-sel+)
;; line 1499
(define-acrobat-function (av-doc-get-view-def-ex "AVDocGetViewDefEx")
                         *g-acro-view-version*
                         +acro-view-hft-version-6+
                         av-doc-get-view-def-ex-selproto
                         *g-acro-view-hft*
                         +av-doc-get-view-def-ex-sel+)
;; line 1500
(define-acrobat-function (av-doc-set-view-def-ex "AVDocSetViewDefEx")
                         *g-acro-view-version*
                         +acro-view-hft-version-6+
                         av-doc-set-view-def-ex-selproto
                         *g-acro-view-hft*
                         +av-doc-set-view-def-ex-sel+)
;; line 1501
(define-acrobat-function (av-doc-use-view-def-ex "AVDocUseViewDefEx")
                         *g-acro-view-version*
                         +acro-view-hft-version-6+
                         av-doc-use-view-def-ex-selproto
                         *g-acro-view-hft*
                         +av-doc-use-view-def-ex-sel+)
;; line 1504
(define-acrobat-function (av-menu-item-clone "AVMenuItemClone")
                         *g-acro-view-version*
                         +acro-view-hft-version-6+
                         av-menu-item-clone-selproto
                         *g-acro-view-hft*
                         +av-menu-item-clone-sel+)
;; line 1507
(define-acrobat-function (av-app-get-language-with-params "AVAppGetLanguageWithParams")
                         *g-acro-view-version*
                         +acro-view-hft-version-6+
                         av-app-get-language-with-params-selproto
                         *g-acro-view-hft*
                         +av-app-get-language-with-params-sel+)
;; line 1510
(define-acrobat-function (av-app-create-icon-bundle6 "AVAppCreateIconBundle6")
                         *g-acro-view-version*
                         +acro-view-hft-version-6+
                         av-app-create-icon-bundle6-selproto
                         *g-acro-view-hft*
                         +av-app-create-icon-bundle6-sel+)
;; line 1513
(define-acrobat-function (av-window-get-border-widths "AVWindowGetBorderWidths")
                         *g-acro-view-version*
                         +acro-view-hft-version-6+
                         av-window-get-border-widths-selproto
                         *g-acro-view-hft*
                         +av-window-get-border-widths-sel+)
;; line 1516
(define-acrobat-function (av-page-view-draw-polygon "AVPageViewDrawPolygon")
                         *g-acro-view-version*
                         +acro-view-hft-version-6+
                         av-page-view-draw-polygon-selproto
                         *g-acro-view-hft*
                         +av-page-view-draw-polygon-sel+)
;; line 1519
(define-acrobat-function (av-page-view-draw-polygon-outline "AVPageViewDrawPolygonOutline")
                         *g-acro-view-version*
                         +acro-view-hft-version-6+
                         av-page-view-draw-polygon-outline-selproto
                         *g-acro-view-hft*
                         +av-page-view-draw-polygon-outline-sel+)
;; line 1522
(define-acrobat-function (av-app-register-how-to-panel "AVAppRegisterHowToPanel")
                         *g-acro-view-version*
                         +acro-view-hft-version-6+
                         av-app-register-how-to-panel-selproto
                         *g-acro-view-hft*
                         +av-app-register-how-to-panel-sel+)
;; line 1525
(define-acrobat-function (av-app-set-how-to-panel-auto-show-text "AVAppSetHowToPanelAutoShowText")
                         *g-acro-view-version*
                         +acro-view-hft-version-6+
                         av-app-set-how-to-panel-auto-show-text-selproto
                         *g-acro-view-hft*
                         +av-app-set-how-to-panel-auto-show-text-sel+)
;; line 1528
(define-acrobat-function (av-app-get-how-to-panel-auto-show "AVAppGetHowToPanelAutoShow")
                         *g-acro-view-version*
                         +acro-view-hft-version-6+
                         av-app-get-how-to-panel-auto-show-selproto
                         *g-acro-view-hft*
                         +av-app-get-how-to-panel-auto-show-sel+)
;; line 1531
(define-acrobat-function (av-app-set-how-to-panel-auto-show "AVAppSetHowToPanelAutoShow")
                         *g-acro-view-version*
                         +acro-view-hft-version-6+
                         av-app-set-how-to-panel-auto-show-selproto
                         *g-acro-view-hft*
                         +av-app-set-how-to-panel-auto-show-sel+)
;; line 1534
(define-acrobat-function (av-app-auto-show-how-to-panel "AVAppAutoShowHowToPanel")
                         *g-acro-view-version*
                         +acro-view-hft-version-6+
                         av-app-auto-show-how-to-panel-selproto
                         *g-acro-view-hft*
                         +av-app-auto-show-how-to-panel-sel+)
;; line 1537
(define-acrobat-function (av-menu-item-set-compute-visible-proc "AVMenuItemSetComputeVisibleProc")
                         *g-acro-view-version*
                         +acro-view-hft-version-6+
                         av-menu-item-set-compute-visible-proc-selproto
                         *g-acro-view-hft*
                         +av-menu-item-set-compute-visible-proc-sel+)
;; line 1540
(define-acrobat-function (av-menu-item-is-visible "AVMenuItemIsVisible")
                         *g-acro-view-version*
                         +acro-view-hft-version-6+
                         av-menu-item-is-visible-selproto
                         *g-acro-view-hft*
                         +av-menu-item-is-visible-sel+)
;; line 1543
(define-acrobat-function (av-app-set-how-to-panel-compute-visible-proc "AVAppSetHowToPanelComputeVisibleProc")
                         *g-acro-view-version*
                         +acro-view-hft-version-6+
                         av-app-set-how-to-panel-compute-visible-proc-selproto
                         *g-acro-view-hft*
                         +av-app-set-how-to-panel-compute-visible-proc-sel+)
;; line 1546
(define-acrobat-function (av-app-register-for-context-menu-addition "AVAppRegisterForContextMenuAddition")
                         *g-acro-view-version*
                         +acro-view-hft-version-6+
                         av-app-register-for-context-menu-addition-selproto
                         *g-acro-view-hft*
                         +av-app-register-for-context-menu-addition-sel+)
;; line 1549
(define-acrobat-function (av-page-view-get-page-to-dev-scaling "AVPageViewGetPageToDevScaling")
                         *g-acro-view-version*
                         +acro-view-hft-version-6+
                         av-page-view-get-page-to-dev-scaling-selproto
                         *g-acro-view-hft*
                         +av-page-view-get-page-to-dev-scaling-sel+)
;; line 1552
(define-acrobat-function (av-doc-get-active-tool "AVDocGetActiveTool")
                         *g-acro-view-version*
                         +acro-view-hft-version-6+
                         av-doc-get-active-tool-selproto
                         *g-acro-view-hft*
                         +av-doc-get-active-tool-sel+)
;; line 1555
(define-acrobat-function (av-doc-set-active-tool "AVDocSetActiveTool")
                         *g-acro-view-version*
                         +acro-view-hft-version-6+
                         av-doc-set-active-tool-selproto
                         *g-acro-view-hft*
                         +av-doc-set-active-tool-sel+)
;; line 1558
(define-acrobat-function (av-app-register-for-page-view-right-clicks "AVAppRegisterForPageViewRightClicks")
                         *g-acro-view-version*
                         +acro-view-hft-version-6+
                         av-app-register-for-page-view-right-clicks-selproto
                         *g-acro-view-hft*
                         +av-app-register-for-page-view-right-clicks-sel+)
;; line 1562
(define-acrobat-function (av-app-unregister-for-page-view-right-clicks "AVAppUnregisterForPageViewRightClicks")
                         *g-acro-view-version*
                         +acro-view-hft-version-6+
                         av-app-unregister-for-page-view-right-clicks-selproto
                         *g-acro-view-hft*
                         +av-app-unregister-for-page-view-right-clicks-sel+)
;; line 1565
(define-acrobat-function (av-doc-is-slow "AVDocIsSlow")
                         *g-acro-view-version*
                         +acro-view-hft-version-6+
                         av-doc-is-slow-selproto
                         *g-acro-view-hft*
                         +av-doc-is-slow-sel+)
;; line 1568
(define-acrobat-function (av-window-get-desktop-bounds "AVWindowGetDesktopBounds")
                         *g-acro-view-version*
                         +acro-view-hft-version-6+
                         av-window-get-desktop-bounds-selproto
                         *g-acro-view-hft*
                         +av-window-get-desktop-bounds-sel+)
;; line 1571
(define-acrobat-function (av-doc-get-server-type "AVDocGetServerType")
                         *g-acro-view-version*
                         +acro-view-hft-version-6+
                         av-doc-get-server-type-selproto
                         *g-acro-view-hft*
                         +av-doc-get-server-type-sel+)
;; line 1574
(define-acrobat-function (av-page-view-set-wireframe-drawing "AVPageViewSetWireframeDrawing")
                         *g-acro-view-version*
                         +acro-view-hft-version-7+
                         av-page-view-set-wireframe-drawing-selproto
                         *g-acro-view-hft*
                         +av-page-view-set-wireframe-drawing-sel+)
;; line 1577
(define-acrobat-function (av-page-view-get-wireframe-drawing "AVPageViewGetWireframeDrawing")
                         *g-acro-view-version*
                         +acro-view-hft-version-7+
                         av-page-view-get-wireframe-drawing-selproto
                         *g-acro-view-hft*
                         +av-page-view-get-wireframe-drawing-sel+)
;; line 1580
(define-acrobat-function (av-app-should-key-delete-object "AVAppShouldKeyDeleteObject")
                         *g-acro-view-version*
                         +acro-view-hft-version-7+
                         av-app-should-key-delete-object-selproto
                         *g-acro-view-hft*
                         +av-app-should-key-delete-object-sel+)
;; line 1586
(define-acrobat-function (av-app-register-late-init-proc "AVAppRegisterLateInitProc")
                         *g-acro-view-version*
                         +acro-view-hft-version-7+
                         av-app-register-late-init-proc-selproto
                         *g-acro-view-hft*
                         +av-app-register-late-init-proc-sel+)
;; line 1590
(define-acrobat-function (av-doc-get-bookmarks "AVDocGetBookmarks")
                         *g-acro-view-version*
                         +acro-view-hft-version-7+
                         av-doc-get-bookmarks-selproto
                         *g-acro-view-hft*
                         +av-doc-get-bookmarks-sel+)
;; line 1592
(define-acrobat-function (av-doc-get-last-active-tool "AVDocGetLastActiveTool")
                         *g-acro-view-version*
                         +acro-view-hft-version-7+
                         av-doc-get-last-active-tool-selproto
                         *g-acro-view-hft*
                         +av-doc-get-last-active-tool-sel+)
;; line 1611
(define-acrobat-function (av-menu-item-is-scriptable "AVMenuItemIsScriptable")
                         *g-acro-view-version*
                         +acro-view-hft-version-8+
                         av-menu-item-is-scriptable-selproto
                         *g-acro-view-hft*
                         +av-menu-item-is-scriptable-sel+)
;; line 1613
(define-acrobat-function (av-doc-apply-redactions "AVDocApplyRedactions")
                         *g-acro-view-version*
                         +acro-view-hft-version-9+
                         av-doc-apply-redactions-selproto
                         *g-acro-view-hft*
                         +av-doc-apply-redactions-sel+)
;; line 1614
(define-acrobat-function (av-listen-for-custom-notification "AVListenForCustomNotification")
                         *g-acro-view-version*
                         +acro-view-hft-version-9+
                         av-listen-for-custom-notification-selproto
                         *g-acro-view-hft*
                         +av-listen-for-custom-notification-sel+)
;; line 1616
(define-acrobat-function (av-unlisten-for-custom-notification "AVUnlistenForCustomNotification")
                         *g-acro-view-version*
                         +acro-view-hft-version-9+
                         av-unlisten-for-custom-notification-selproto
                         *g-acro-view-hft*
                         +av-unlisten-for-custom-notification-sel+)
;; line 1618
(define-acrobat-function (av-broadcast-custom-notification "AVBroadcastCustomNotification")
                         *g-acro-view-version*
                         +acro-view-hft-version-9+
                         av-broadcast-custom-notification-selproto
                         *g-acro-view-hft*
                         +av-broadcast-custom-notification-sel+)
;; line 1631
(define-acrobat-function (av-app-begin-save "AVAppBeginSave")
                         *g-acro-view-version*
                         +acro-view-hft-version-9+
                         av-app-begin-save-selproto
                         *g-acro-view-hft*
                         +av-app-begin-save-sel+)
;; line 1632
(define-acrobat-function (av-app-end-save "AVAppEndSave")
                         *g-acro-view-version*
                         +acro-view-hft-version-9+
                         av-app-end-save-selproto
                         *g-acro-view-hft*
                         +av-app-end-save-sel+)
;; line 1633
(define-acrobat-function (av-app-cancel-save "AVAppCancelSave")
                         *g-acro-view-version*
                         +acro-view-hft-version-9+
                         av-app-cancel-save-selproto
                         *g-acro-view-hft*
                         +av-app-cancel-save-sel+)
;; line 1634
(define-acrobat-function (av-page-view-get-ink-preview "AVPageViewGetInkPreview")
                         *g-acro-view-version*
                         +acro-view-hft-version-9+
                         av-page-view-get-ink-preview-selproto
                         *g-acro-view-hft*
                         +av-page-view-get-ink-preview-sel+)
;; line 1637
(define-acrobat-function (av-page-view-acquire-draw-context "AVPageViewAcquireDrawContext")
                         *g-acro-view-version*
                         +acro-view-hft-version-10+
                         av-page-view-acquire-draw-context-selproto
                         *g-acro-view-hft*
                         +av-page-view-acquire-draw-context-sel+)
;; line 1638
(define-acrobat-function (av-page-view-release-draw-context "AVPageViewReleaseDrawContext")
                         *g-acro-view-version*
                         +acro-view-hft-version-10+
                         av-page-view-release-draw-context-selproto
                         *g-acro-view-hft*
                         +av-page-view-release-draw-context-sel+)
;; line 1640
(define-acrobat-function (av-conversion-append-to-pdf-with-handler "AVConversionAppendToPDFWithHandler")
                         *g-acro-view-version*
                         +acro-view-hft-version-11+
                         av-conversion-append-to-pdf-with-handler-selproto
                         *g-acro-view-hft*
                         +av-conversion-append-to-pdf-with-handler-sel+)
;; line 1641
(define-acrobat-function (av-conversion-get-conversion-queue-status-with-handler "AVConversionGetConversionQueueStatusWithHandler")
                         *g-acro-view-version*
                         +acro-view-hft-version-11+
                         av-conversion-get-conversion-queue-status-with-handler-selproto
                         *g-acro-view-hft*
                         +av-conversion-get-conversion-queue-status-with-handler-sel+)
;; line 1642
(define-acrobat-function (av-conversion-to-pdf-set-settings "AVConversionToPDFSetSettings")
                         *g-acro-view-version*
                         +acro-view-hft-version-11+
                         av-conversion-to-pdf-set-settings-selproto
                         *g-acro-view-hft*
                         +av-conversion-to-pdf-set-settings-sel+)
;; line 1644
(define-acrobat-function (av-doc-is-in-protected-view "AVDocIsInProtectedView")
                         *g-acro-view-version*
                         +acro-view-hft-version-11+
                         av-doc-is-in-protected-view-selproto
                         *g-acro-view-hft*
                         +av-doc-is-in-protected-view-sel+)
;; line 1647
(define-acrobat-function (av-app-register-idle-proc-with-name "AVAppRegisterIdleProcWithName")
                         *g-acro-view-version*
                         +acro-view-hft-version-11-6+
                         av-app-register-idle-proc-with-name-selproto
                         *g-acro-view-hft*
                         +av-app-register-idle-proc-with-name-sel+)
;; line 1649
(define-acrobat-function (av-app-register-late-init-proc-with-name "AVAppRegisterLateInitProcWithName")
                         *g-acro-view-version*
                         +acro-view-hft-version-11-6+
                         av-app-register-late-init-proc-with-name-selproto
                         *g-acro-view-hft*
                         +av-app-register-late-init-proc-with-name-sel+)
;; line 1653
(define-acrobat-function (av-app-save-dialog-ex "AVAppSaveDialogEx")
                         *g-acro-view-version*
                         +acro-view-hft-version-12+
                         av-app-save-dialog-ex-selproto
                         *g-acro-view-hft*
                         +av-app-save-dialog-ex-sel+)
;; line 1655
(define-acrobat-function (av-app-begin-save-ex "AVAppBeginSaveEx")
                         *g-acro-view-version*
                         +acro-view-hft-version-12+
                         av-app-begin-save-ex-selproto
                         *g-acro-view-hft*
                         +av-app-begin-save-ex-sel+)
;; line 1657
(define-acrobat-function (av-app-register-idle-proc-ex-with-name "AVAppRegisterIdleProcExWithName")
                         *g-acro-view-version*
                         +acro-view-hft-version-12+
                         av-app-register-idle-proc-ex-with-name-selproto
                         *g-acro-view-hft*
                         +av-app-register-idle-proc-ex-with-name-sel+)
;; line 1659
(define-acrobat-function (av-app-get-version-ex "AVAppGetVersionEx")
                         *g-acro-view-version*
                         +acro-view-hft-version-12+
                         av-app-get-version-ex-selproto
                         *g-acro-view-hft*
                         +av-app-get-version-ex-sel+)
;; line 1661
(define-acrobat-function (av-extension-acquire-info-ex "AVExtensionAcquireInfoEx")
                         *g-acro-view-version*
                         +acro-view-hft-version-12-3+
                         av-extension-acquire-info-ex-selproto
                         *g-acro-view-hft*
                         +av-extension-acquire-info-ex-sel+)
;; line 1663
(define-acrobat-function (av-extension-release-info-ex "AVExtensionReleaseInfoEx")
                         *g-acro-view-version*
                         +acro-view-hft-version-12-3+
                         av-extension-release-info-ex-selproto
                         *g-acro-view-hft*
                         +av-extension-release-info-ex-sel+)
;; line 1665
(define-acrobat-function (av-doc-bring-to-front "AVDocBringToFront")
                         *g-acro-view-version*
                         +acro-view-hft-version-12-3+
                         av-doc-bring-to-front-selproto
                         *g-acro-view-hft*
                         +av-doc-bring-to-front-sel+)
;; line 1667
(define-acrobat-function (av-doc-get-display-title "AVDocGetDisplayTitle")
                         *g-acro-view-version*
                         +acro-view-hft-version-12-3+
                         av-doc-get-display-title-selproto
                         *g-acro-view-hft*
                         +av-doc-get-display-title-sel+)
;; line 1669
(define-acrobat-function (av-icon-create-from-pdf "AVIconCreateFromPDF")
                         *g-acro-view-version*
                         +acro-view-hft-version-12-3+
                         av-icon-create-from-pdf-selproto
                         *g-acro-view-hft*
                         +av-icon-create-from-pdf-sel+)
;; line 1671
(define-acrobat-function (av-tool-bar-set-icon "AVToolBarSetIcon")
                         *g-acro-view-version*
                         +acro-view-hft-version-12-3+
                         av-tool-bar-set-icon-selproto
                         *g-acro-view-hft*
                         +av-tool-bar-set-icon-sel+)
;; line 1673
(define-acrobat-function (av-storage-register-new-storage "AVStorageRegisterNewStorage")
                         *g-acro-view-version*
                         +acro-view-hft-version-12-3+
                         av-storage-register-new-storage-selproto
                         *g-acro-view-hft*
                         +av-storage-register-new-storage-sel+)
;; line 1675
(define-acrobat-function (av-storage-register-account "AVStorageRegisterAccount")
                         *g-acro-view-version*
                         +acro-view-hft-version-12-3+
                         av-storage-register-account-selproto
                         *g-acro-view-hft*
                         +av-storage-register-account-sel+)
;; line 1677
(define-acrobat-function (av-storage-get-account-info "AVStorageGetAccountInfo")
                         *g-acro-view-version*
                         +acro-view-hft-version-12-3+
                         av-storage-get-account-info-selproto
                         *g-acro-view-hft*
                         +av-storage-get-account-info-sel+)
;; line 1679
(define-acrobat-function (av-storage-perform-oauth2authentication "AVStoragePerformOAuth2Authentication")
                         *g-acro-view-version*
                         +acro-view-hft-version-12-3+
                         av-storage-perform-oauth2authentication-selproto
                         *g-acro-view-hft*
                         +av-storage-perform-oauth2authentication-sel+)
;; line 1681
(define-acrobat-function (av-make-web-services-request "AVMakeWebServicesRequest")
                         *g-acro-view-version*
                         +acro-view-hft-version-12-3+
                         av-make-web-services-request-selproto
                         *g-acro-view-hft*
                         +av-make-web-services-request-sel+)
;; line 1684
(define-acrobat-function (av-page-view-draw-now-optimized "AVPageViewDrawNowOptimized")
                         *g-acro-view-version*
                         +acro-view-hft-version-12-3+
                         av-page-view-draw-now-optimized-selproto
                         *g-acro-view-hft*
                         +av-page-view-draw-now-optimized-sel+)
;; line 1688
(define-acrobat-function (av-make-acrobat-default "AVMakeAcrobatDefault")
                         *g-acro-view-version*
                         +acro-view-hft-version-12-3+
                         av-make-acrobat-default-selproto
                         *g-acro-view-hft*
                         +av-make-acrobat-default-sel+)
;; line 1692
(define-acrobat-function (av-window-get-platform-thing-ex "AVWindowGetPlatformThingEx")
                         *g-acro-view-version*
                         +acro-view-hft-version-12-3+
                         av-window-get-platform-thing-ex-selproto
                         *g-acro-view-hft*
                         +av-window-get-platform-thing-ex-sel+)
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-bad-selector+ 0))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +av-num-selectorsplus-one+ 1))
