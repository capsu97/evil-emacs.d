;; Auto-complete
(add-hook 'after-init-hook 'global-company-mode)

(eval-after-load 'company '(add-to-list 'company-backends 'company-cider))

(provide 'auto-complete-settings)
