; hide toolbar
(tool-bar-mode -1)

; hide scrollbar
(set-scroll-bar-mode 'nil)

; line number
(global-linum-mode t)
(setq linum-format "%4d ")

; transparency
(if window-system (progn
                    (set-frame-parameter nil 'alpha 95)
                    ))

; kill startup screen
(setq inhibit-startup-message t)

; remove initial message on scratch
(setq initial-scratch-message "")
