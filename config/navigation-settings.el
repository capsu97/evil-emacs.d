;; Ace-jump-mode
;(require 'ace-jump-mode)
(autoload 'ace-jump-mode "ace-jump-mode" "ace-jump-mode" t)

(eval-after-load "ace-jump-mode"
  '(progn
     ;;(setq ace-jump-mode-scope 'window)
     (setq ace-jump-mode-case-fold nil)
     ))

;; Ace-window
(setq aw-ignore-current t)

;; Avy
(setq avy-keys (number-sequence ?a ?z))
(setq avy-all-windows 'all-frames)
(setq avy-style 'at-full)

(provide 'navigation-settings)
