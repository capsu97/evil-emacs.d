(add-to-list 'load-path "~/.emacs.d/themes/")

(global-font-lock-mode t)

(set-default-font "Meslo LG S DZ for Powerline-12")

(if (string= (symbol-name system-type) "windows-nt")
    (setq default-frame-alist '((font . "Consolas-11")))
    (modify-frame-parameters nil '((wait-for-wm . nil))))

(if (string= (symbol-name system-type) "darwin")
    (setq default-frame-alist '((font . "Menlo-14")))
    (modify-frame-parameters nil '((wait-for-wm . nil))))

;; Emacs 24
;(load-theme 'birds-of-paradise-plus t)
(load-theme 'molokai t)

(set-face-foreground 'show-paren-match-face "white")
(set-face-background 'show-paren-match-face "gray22")
; (set-face-background 'show-paren-match-face "dark slate gray")
(set-face-attribute 'show-paren-match-face nil
        :weight 'bold :underline nil :overline nil :slant 'normal)

(provide 'ui-settings)
