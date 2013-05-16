;; time the loading of the .emacs
;; keep this on top of your .emacs
(defvar *emacs-load-start* (current-time))
(defun anarcat/time-to-ms (time)
  (+ (* (+ (* (car time) (expt 2 16)) (car (cdr time))) 1000000) (car (cdr (cdr time)))))
(defun anarcat/display-timing ()
  (message ".emacs loaded in %fms" (/ (- (anarcat/time-to-ms (current-time)) (anarcat/time-to-ms *emacs-load-start*)) 1000000.0)))
(add-hook 'after-init-hook 'anarcat/display-timing t)

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
;; TODO add smartparens (melpa couldn't find it for some reason)
(defvar my-packages '(starter-kit starter-kit-lisp starter-kit-bindings clojure-mode ace-jump-mode starter-kit-js paredit nrepl nrepl-ritz markdown-mode clojure-test-mode evil ac-nrepl color-theme
    evil-leader evil-numbers evil-paredit groovy-mode magit markdown-mode+ nrepl-eval-sexp-fu zencoding-mode surround linum-relative ido-ubiquitous rainbow-delimiters undo-tree helm
    projectile helm-projectile git-commit-mode gitconfig-mode gitignore-mode helm-git coffee-mode zenburn-theme solarized-theme birds-of-paradise-plus-theme color-theme-sanityinc-tomorrow
    color-theme-sanityinc-solarized helm-themes molokai-theme skewer-mode js2-mode auto-complete web-mode ac-js2 yasnippet clojure-snippets lein mmm-mode sass-mode workgroups browse-kill-ring dired+ expand-region
    smartparens midje-mode multi-eshell multi-term)
  "A list of packages to ensure are installed at launch.")

(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))

;(add-to-list 'default-frame-alist '(height . 50))
;(add-to-list 'default-frame-alist '(width . 140))

(add-to-list 'load-path "~/.emacs.d/config/")

(add-to-list 'auto-mode-alist '("\.cljs$" . clojure-mode))
(require 'midje-mode)
(add-hook 'clojure-mode-hook 'midje-mode)

(add-hook 'sgml-mode-hook 'zencoding-mode) ;; Auto-start on any markup modes

(defun indent-whole-buffer ()
  "indent whole buffer"
  (interactive)
  (delete-trailing-whitespace)
  (indent-region (point-min) (point-max) nil)
  (untabify (point-min) (point-max)))

(require 'my-ui-settings)
(require 'my-basic-settings)
(require 'my-rainbow-delimiters-settings)
(require 'my-emacs-keybindings)
(require 'my-nrepl-settings)
(require 'my-ace-jump-settings)
(require 'my-powerline-settings)
(require 'my-evil-settings)
(require 'my-evil-keybindings)
(require 'my-projectile-settings)
(require 'my-auto-complete-settings)
(require 'my-yasnippet-settings)
(require 'my-magit-settings)
;(server-start)

(global-auto-revert-mode t)

(add-to-list 'default-frame-alist '(height . 50))
(add-to-list 'default-frame-alist '(width . 180))

(defun hide-eol ()
  "Do not show ^M in files containing mixed UNIX and DOS line endings."
  (interactive)
  (setq buffer-display-table (make-display-table))
  (aset buffer-display-table ?\^M []))

(add-hook 'nrepl-mode-hook 'hide-eol)
