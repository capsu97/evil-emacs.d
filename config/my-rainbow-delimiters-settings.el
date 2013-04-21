;;; Rainbow Delimiters
(require 'rainbow-delimiters)
;(add-hook 'clojure-mode-hook 'rainbow-delimiters-mode) ; only for Clojure
(add-hook 'prog-mode-hook 'rainbow-delimiters-mode) ; all programming modes
; (global-rainbow-delimiters-mode) ; globally

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(rainbow-delimiters-depth-1-face ((t (:foreground "Grey55"))))
 '(rainbow-delimiters-depth-2-face ((t (:foreground "Green"))))
 '(rainbow-delimiters-depth-3-face ((t (:foreground "Magenta"))))
 '(rainbow-delimiters-depth-4-face ((t (:foreground "Cyan"))))
 '(rainbow-delimiters-depth-5-face ((t (:foreground "Red"))))
 '(rainbow-delimiters-depth-6-face ((t (:foreground "Blue")))))


(provide 'my-rainbow-delimiters-settings)