; shell-pop
(require 'shell-pop)
;; (shell-pop-set-internal-mode "ansi-term")
(shell-pop-set-internal-mode-shell "/bin/zsh")
(global-set-key "\C-t" 'shell-pop)
