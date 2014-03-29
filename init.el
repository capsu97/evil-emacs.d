(when (string= system-name "VDI056-PRD")
  (setq url-proxy-services '(("http" . "proxy.eno.dom:8080"))))

(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)

;(add-to-list 'package-archives
;    '("marmalade" .
;      "http://marmalade-repo.org/packages/"))

(package-initialize)

(when (not package-archive-contents)
  (package-refresh-contents))

;; Add in your own as you wish:
(defvar my-packages '(starter-kit starter-kit-lisp starter-kit-bindings starter-kit-js
                                  ido-ubiquitous undo-tree helm ag ido-vertical-mode company ido-select-window
                                  clojure-mode clojure-test-mode clojure-cheatsheet ace-jump-mode
                                  latest-clojure-libraries clj-refactor clojure-snippets datomic-snippets
                                  paredit paredit-menu cider company-cider
                                  markdown-mode markdown-mode+ 
                                  evil evil-leader evil-numbers evil-paredit evil-matchit evil-indent-textobject
                                  linum-relative rainbow-delimiters highlight-parentheses surround smartparens
                                  color-theme org-jira
                                  magit diff-hl git-rebase-mode gitattributes-mode git-commit-mode gitconfig-mode gitignore-mode
                                  helm-git gist
                                  emmet-mode skewer-mode js2-mode web-mode sass-mode
                                  projectile helm-projectile helm-themes
                                  molokai-theme yasnippet
                                  browse-kill-ring dired+ expand-region helm-dash helm-swoop swoop helm-ag
                                  persp-mode sublime-themes mark-multiple)
  "A list of packages to ensure are installed at launch.")

(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))

;(add-to-list 'default-frame-alist '(height . 50))
;(add-to-list 'default-frame-alist '(width . 140))

(add-to-list 'load-path "~/.emacs.d/config/")

(add-to-list 'auto-mode-alist '("\.cljs$" . clojure-mode))

(add-hook 'sgml-mode-hook 'zencoding-mode) ;; Auto-start on any markup modes

;; highlight surrounding parentheses
(add-hook 'prog-mode-hook 'highlight-parentheses-mode)

(defun indent-whole-buffer ()
  "indent whole buffer"
  (interactive)
  (delete-trailing-whitespace)
  (indent-region (point-min) (point-max) nil)
  (untabify (point-min) (point-max)))

(require 'web-mode-settings)
(require 'ui-settings)
(require 'basic-settings)
(require 'rainbow-delimiters-settings)
(require 'emacs-keybindings)
(require 'cider-settings)
(require 'ace-jump-settings)
(require 'powerline-settings)
(require 'evil-settings)
(require 'evil-keybindings)
(require 'projectile-settings)
(require 'auto-complete-settings)
(require 'yasnippet-settings)
(require 'magit-settings)
(require 'helm-settings)
(require 'ag-settings)
;(require 'nrepl-inspect-settings)
;(server-start)

;; diff-hl
(global-diff-hl-mode)

;; relative linum
;(require 'linum-relative)
;(global-linum-mode)
;(linum-relative-toggle)

;; Emmet mode
(add-hook 'sgml-mode-hook 'emmet-mode) ;; Auto-start on any markup modes
(add-hook 'css-mode-hook  'emmet-mode) ;; enable Emmet's css
;; abbreviation
(setq emmet-move-cursor-between-quotes t) ;; default nil

;; Paredit menu
(require 'paredit-menu)

;; persp-mode
(persp-mode t)
(setq wg-morph-on nil)

(global-auto-revert-mode t)

(require 'ido-vertical-mode)
(ido-vertical-mode 1)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes (quote ("0e121ff9bef6937edad8dfcff7d88ac9219b5b4f1570fd1702e546a80dba0832" "e26780280b5248eb9b2d02a237d9941956fc94972443b0f7aeec12b5c15db9f3" "33c5a452a4095f7e4f6746b66f322ef6da0e770b76c0ed98a438e76c497040bb" "90b5269aefee2c5f4029a6a039fb53803725af6f5c96036dee5dc029ff4dff60" default))))
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
