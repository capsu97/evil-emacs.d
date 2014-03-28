;; Auto-complete
(add-hook 'after-init-hook 'global-company-mode)

(eval-after-load 'company '(add-to-list 'company-backends 'company-cider))
(setq company-idle-delay 0.3)
(setq company-tooltip-limit 20)
(setq company-minimum-prefix-length 2)
(setq company-echo-delay 0)
(setq company-auto-complete nil)

;; org-mode completions
(defun my-pcomplete-capf ()
  (add-hook 'completion-at-point-functions 'pcomplete-completions-at-point nil t))
(add-hook 'org-mode-hook #'my-pcomplete-capf)

(provide 'auto-complete-settings)
