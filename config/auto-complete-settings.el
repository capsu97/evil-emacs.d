(require 'color)

(let ((bg (face-attribute 'default :background)))
  (custom-set-faces
   `(company-tooltip ((t (:inherit default :background ,(color-darken-name bg 2)))))
   `(company-scrollbar-bg ((t (:background ,(color-lighten-name bg 10)))))
   `(company-scrollbar-fg ((t (:background ,(color-lighten-name bg 10)))))
   `(company-tooltip-selection ((t (:inherit font-lock-function-name-face :background ,(color-lighten-name bg 5)))))
   `(company-tooltip-common ((t (:inherit font-lock-constant-face))))))

;; Auto-complete
(add-hook 'after-init-hook 'global-company-mode)

;;(eval-after-load 'company '(add-to-list 'company-backends 'company-elisp))
;;(eval-after-load 'company '(add-to-list 'company-backends 'company-capf))
;;(eval-after-load 'company '(add-to-list 'company-backends 'company-yasnippet))
;;(eval-after-load 'company '(add-to-list 'company-backends 'company-files))
(eval-after-load 'company '(add-to-list 'company-transformers 'company-sort-by-occurrence))

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
