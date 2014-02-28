; hide toolbar
(tool-bar-mode -1)

; hide scrollbar
(set-scroll-bar-mode 'nil)

; line number
(global-linum-mode t)
(setq linum-format "%4d ")
(setq linum-delay t)
(defadvice linum-schedule (around my-linum-schedule () activate)
  (run-with-idle-timer 0.2 nil #'linum-update-current))

; cursor highlight
;; (defface hlline-face
;;   '((((class color)
;;       (background dark))
;;      (:background "dark slate gray"))
;;     (((class color)
;;       (background light))
;;      (:background  "#98FB98"))
;;     (t
;;      ()))
;;   "*Face used by hl-line.")
;; (setq hl-line-face 'hlline-face)
;; (global-hl-line-mode)

; transparency
;; (if window-system (progn
;;                     (set-frame-parameter nil 'alpha 95)
;;                     ))

; kill startup screen
(setq inhibit-startup-message t)

; remove initial message on scratch
(setq initial-scratch-message "")
