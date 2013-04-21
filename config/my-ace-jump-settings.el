;; Ace-jump-mode
;(require 'ace-jump-mode)
(autoload 'ace-jump-mode "ace-jump-mode" "ace-jump-mode" t)

(eval-after-load "ace-jump-mode"
  '(progn
        (setq ace-jump-mode-scope 'window)
        (setq ace-jump-mode-case-fold nil)
     ))

(provide 'my-ace-jump-settings)