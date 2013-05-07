(require 'cl)

;;
;; install packages before init-loader-load
;;
(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(package-initialize)

(defvar installing-package-list
  '(
    init-loader
    package
    popwin
    auto-complete
    shell-pop
    git-gutter
    powerline
    markdown-mode
    google-c-style
    ))
(let ((not-installed (loop for x in installing-package-list
                           when (not (package-installed-p x))
                           collect x)))
  (when not-installed
    (package-refresh-contents)
    (dolist (pkg not-installed)
      (package-install pkg))))

;;
;; init-loader
;;
(require 'init-loader)
(setq init-loader-show-log-after-init nil)
(init-loader-load "~/.emacs.d/inits")
