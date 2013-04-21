(add-to-list 'load-path "~/.emacs.d/themes/")

;(set-face-attribute 'default nil :family "Inconsolata" :height 180)

;(if (string= (symbol-name system-type) "windows-nt")
;    (set-default-font "-outline-Consolas-normal-normal-normal-mono-16-*-*-*-c-*-iso8859-1")
;  (modify-frame-parameters nil '((wait-for-wm . nil))))

;(if (string= (symbol-name system-type) "darwin")
;    (set-default-font "-outline-Menlo-normal-normal-normal-mono-14-*-*-*-c-*-iso8859-1")
;  (modify-frame-parameters nil '((wait-for-wm . nil))))

;(set-default-font "Menlo-14")
;(setq default-frame-alist '((font . "Inconsolata-dz-15")))

(if (string= (symbol-name system-type) "windows-nt")
    (setq default-frame-alist '((font . "Consolas-11")))
    (modify-frame-parameters nil '((wait-for-wm . nil))))

(if (string= (symbol-name system-type) "darwin")
    (setq default-frame-alist '((font . "Menlo-14")))
    (modify-frame-parameters nil '((wait-for-wm . nil))))

;(require 'color-theme)
;(load-file "~/.emacs.d/themes/color-theme-railscasts.el")
;(color-theme-railscasts)

;; Emacs 24
;(load-theme 'birds-of-paradise-plus t)
(load-theme 'molokai t)

(set-face-foreground 'show-paren-match-face "white")
(set-face-background 'show-paren-match-face "gray22")
; (set-face-background 'show-paren-match-face "dark slate gray")
(set-face-attribute 'show-paren-match-face nil
        :weight 'bold :underline nil :overline nil :slant 'normal)

(provide 'my-ui-settings)