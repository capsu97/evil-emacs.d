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

(eval-after-load 'diff-mode
  '(progn
     (set-face-foreground 'diff-added "green4")
     (set-face-foreground 'diff-removed "red3")))

(eval-after-load 'magit
  '(progn
     (set-face-foreground 'magit-diff-add "green4")
     (set-face-foreground 'magit-diff-del "red3")))

;; POWERLINE

(add-to-list 'load-path "~/.emacs.d/vendor/powerline")
(require 'powerline)

;(powerline-evil-theme)
(defun custom-evil-theme ()
  "Setup the default mode-line."
  (interactive)
  (setq-default
   mode-line-format
   '("%e"
     (:eval
      (let* ((active (powerline-selected-window-active))
             (mode-line (if active 'mode-line 'mode-line-inactive))
             (face1 (if active 'powerline-active1 'powerline-inactive1))
             (face2 (if active 'powerline-active2 'powerline-inactive2))
             (face3 (if active 'powerline-active3 'powerline-inactive2))
             (separator-left (intern (format "powerline-%s-%s"
                                             powerline-default-separator
                                             (car powerline-default-separator-dir))))
             (separator-right (intern (format "powerline-%s-%s"
                                              powerline-default-separator
                                              (cdr powerline-default-separator-dir))))
             (lhs
              (append
               (let ((evil-face (powerline-evil-face active)))
                 (list 
                  (powerline-raw (powerline-evil-tag) evil-face)
                  (funcall separator-left evil-face face3)))
               (list (powerline-raw " " face3)
                     (powerline-raw mode-line-mule-info face3 'l)
                     (powerline-client face3)
                     (powerline-remote face3)
                     (powerline-frame-id face3)
                     (powerline-buffer-id face3 'l)
                     (powerline-raw " " face3)
                     (funcall separator-left face3 face2)
                     (powerline-raw mode-line-modified face2 'l)
                     (powerline-raw " " face2)
                     (funcall separator-left face2 face1)
                     (when (boundp 'erc-modified-channels-object)
                       (powerline-raw erc-modified-channels-object face1 'l))
                     (powerline-raw " " face1)
                     (powerline-raw
                      (if (and (boundp 'mode-line-debug-mode) mode-line-debug-mode)
                          (mode-line-debug-control)
                        " ")
                      face1)
                     (powerline-recursive-left face1)
                     (powerline-major-mode face1)
                     (powerline-process face1)
                     (powerline-minor-modes face1 'l)
                     (powerline-narrow face1 'l)
                     (powerline-recursive-right face1)
                     (powerline-raw " " face1)
                     (funcall separator-left face1 face2)
                     (powerline-vc face2 'r))))
             (rhs
              (append
               (when (and (boundp 'which-function-mode) which-function-mode)
                 (list
                  (powerline-raw "[" face2)
                  (powerline-which-func)
                  (powerline-raw "]" face2)))
               (list
                (when (and (boundp 'wc-mode) wc-mode)
                  (powerline-wc-mode face2 'r))
                (funcall separator-right face2 face1)
                (powerline-raw "  " face1)
                (powerline-raw global-mode-string face1 'r)
                (powerline-raw " " face1)
                (funcall separator-right face1 face2)
                (powerline-position face2 'r)
                (powerline-hud face2 face1)))))
        (concat (powerline-render lhs)
                (powerline-fill face2 (powerline-width rhs))
                (powerline-render rhs)))))))

(custom-evil-theme)

(provide 'ui-settings)
