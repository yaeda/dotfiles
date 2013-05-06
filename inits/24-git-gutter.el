; git-gutter (syohex/emacs-git-gutter @ github)
(require 'git-gutter)
(global-git-gutter-mode t)
(global-set-key (kbd "C-x C-g") 'git-gutter:toggle)
;; (global-set-key (kbd "C-x v =") 'git-gutter:popup-hunk)
;; ; Jump to next/previouts hunk
;; (global-set-key (kbd "C-x p") 'git-gutter:previous-hunk)
;; (global-set-key (kbd "C-x n") 'git-gutter:next-hunk)
;; ; Revert current hunk
;; (global-set-key (kbd "C-x r") 'git-gutter:revert-hunk)
