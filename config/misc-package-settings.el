;; Multiple Cursors
(require 'multiple-cursors)
(setq mc/unsupported-minor-modes '(company-mode auto-complete-mode flyspell-mode jedi-mode))

;; Volatile Highlights
(require 'volatile-highlights)

(vhl/give-advice-to-make-vhl-on-changes evil-paste-after)
(vhl/give-advice-to-make-vhl-on-changes evil-paste-before)
(vhl/give-advice-to-make-vhl-on-changes evil-paste-pop)

(volatile-highlights-mode t)

;; Indent Guide
(require 'indent-guide)

(indent-guide-global-mode)

(setq indent-guide-recursive t)
(setq indent-guide-delay 0.1)

(provide 'misc-package-settings)
