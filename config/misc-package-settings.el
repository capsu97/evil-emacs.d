;; Multiple Cursors
(require 'multiple-cursors)
(setq mc/unsupported-minor-modes '(company-mode auto-complete-mode flyspell-mode jedi-mode))

;; Indent Guide
(require 'indent-guide)

(indent-guide-global-mode)

(setq indent-guide-recursive t)
(setq indent-guide-delay 0.1)

(provide 'misc-package-settings)
