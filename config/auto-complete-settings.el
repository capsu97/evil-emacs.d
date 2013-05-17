;; Auto-complete
(require 'auto-complete-config)
(ac-config-default)

(define-key ac-completing-map "\t" 'ac-complete)

;; Turn off enter/return
;; (define-key ac-completing-map "\r" nil)
;; (define-key ac-completing-map (kbd "RET") nil)
;; (define-key ac-completing-map [return] nil)

;; Do use RET when menu is shown
(setq ac-use-menu-map t)
(define-key ac-menu-map (kbd "RET") 'ac-complete)

;; (setq ac-auto-start nil)
;; (define-key ac-mode-map (kbd "M-TAB") 'auto-complete)
;; (global-set-key "\M-/" 'auto-complete)

;;(setq ac-auto-show-menu nil)

;; Show 1.0 seconds later
;; (setq ac-auto-show-menu 1.0)

(provide 'auto-complete-settings)