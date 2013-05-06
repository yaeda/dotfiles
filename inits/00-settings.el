;; filename uniqueness
(require 'uniquify)
(setq uniquify-buffer-name-style 'post-forward-angle-brackets)

; always revert
(global-auto-revert-mode 1)

;; disable backup files
(setq backup-inhibited t)
(setq auto-save-default t)

;; follow symlinks
(setq vc-follow-symlinks t)
(setq auto-revert-check-vc-info t)

;; yes or no => y or n
(fset 'yes-or-no-p 'y-or-n-p)

