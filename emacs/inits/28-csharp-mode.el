(autoload 'csharp-mode "csharp-mode"
  "Major mode for editing C# code" t)

(add-to-list 'auto-mode-alist '("\\.cs\\'" . csharp-mode))

(add-hook 'csharp-mode-hook
          '(lambda()
             (setq comment-column 40)
             (setq c-basic-offset 4)
             (font-lock-add-magic-number)
             ;; offset arrange
             (c-set-offset 'substatement-open 0)
             (c-set-offset 'case-label '+)
             (c-set-offset 'arglist-intro '+)
             (c-set-offset 'arglist-close 0)
             )
          )
