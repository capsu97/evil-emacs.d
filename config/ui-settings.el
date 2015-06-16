(add-to-list 'load-path "~/.emacs.d/themes/")

(global-font-lock-mode t)

;;(set-default-font "Meslo LG S DZ for Powerline-12")

(if (string= (symbol-name system-type) "windows-nt")
    (setq default-frame-alist '((font . "Consolas-11")))
  (modify-frame-parameters nil '((wait-for-wm . nil))))

(if (string= (symbol-name system-type) "darwin")
    (setq default-frame-alist '((font . "Menlo-14")))
  (modify-frame-parameters nil '((wait-for-wm . nil))))

;; Emacs 24
;;(load-theme 'birds-of-paradise-plus t)
;;(load-theme 'molokai t)
;;(load-theme 'sanityinc-tomorrow-day t)
;;(load-theme 'monokai t)
;; (load-theme 'smyx t)
(load-theme 'flatui t)
;; (load-theme 'solarized-light t)
;;(load-theme 'odersky t)

;; Flat modeline
(set-face-attribute 'mode-line nil :box nil)
(set-face-attribute 'mode-line-inactive nil :box nil)

(eval-after-load 'diff-mode
  '(progn
     (set-face-foreground 'diff-added "green4")
     (set-face-foreground 'diff-removed "red3")))

(eval-after-load 'magit
  '(progn
     (set-face-foreground 'magit-diff-add "green4")
     (set-face-foreground 'magit-diff-del "red3")))

;; POWERLINE

;;(add-to-list 'load-path "~/.emacs.d/vendor/powerline")
;;(require 'powerline)
;; (require 'powerline-evil)

;; (setq powerline-default-separator 'bar)
;; (setq powerline-evil-tag-style 'verbose)

;; (powerline-evil-center-color-theme)
;; (powerline-evil-vim-theme)

;; disable bold and underline faces
;; (mapc
;;  (lambda (face)
;;    (set-face-attribute face nil :weight 'normal :underline nil))
;;  (face-list))

(provide 'ui-settings)
