(when (string= system-name "VDI056-PRD")
  (setq url-proxy-services '(("http" . "proxy.eno.dom:8080"))))

(require 'package)
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/") t)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)

                                        ;(add-to-list 'package-archives
                                        ;    '("marmalade" .
                                        ;      "http://marmalade-repo.org/packages/"))
(setq package-enable-at-startup t)
(package-initialize)

(when (not package-archive-contents)
  (package-refresh-contents))

;; Add in your own as you wish:
(defvar my-packages '(ido-ubiquitous ido-vertical-mode ido-select-window flx-ido idomenu smex helm ; mini-buffer on steroids (fuzzy completion etc)
                                     org-plus-contrib ; latest org-mode
                                     undo-tree ; visualize undo as a tree (extremely handy)
                                     company ; autocomplete
                                     idle-highlight-mode ; highlight all occurences of current symbol after a little while
                                     elisp-slime-nav ; extensions for elisp
                                     diminish ; don't clutter the modeline with minor mode names
                                     ag swoop ; search / grep
                                     buffer-move ; manage buffers
                                     clojure-mode clojure-test-mode clojure-cheatsheet clj-refactor ; clojure
                                     latest-clojure-libraries cider cider-tracing ; clojure
                                     ace-jump-mode ; move quickly around buffers (see vim EasyMotion as well)
                                     markdown-mode markdown-mode+ ; markdown
                                     evil evil-leader evil-numbers evil-paredit evil-matchit evil-indent-textobject surround evil-visualstar ; evil vim emulation
                                     rainbow-delimiters highlight-parentheses smartparens paredit paredit-menu ; working with parens / delimiters
                                     molokai-theme color-theme-sanityinc-tomorrow ; color themes
                                     git-rebase-mode gitattributes-mode git-commit-mode gitconfig-mode gitignore-mode ; git file modes
                                     gist magit diff-hl ; git integration
                                     emmet-mode skewer-mode js2-mode js2-refactor web-mode sass-mode rainbow-mode ; web development
                                     projectile ; moving around in projects
                                     yasnippet clojure-snippets datomic-snippets ; snippets
                                     browse-kill-ring ; list / select / insert previously killed text
                                     dired+ ; directory editor addon
                                     expand-region ; easily select regions around point
                                     persp-mode ; per project window config
                                     multiple-cursors ; multiple cursors a la Sublime Text
                                     visual-regexp visual-regexp-steroids ; visualize your typed regexp
                                     )
  "A list of packages to ensure are installed at launch.")

(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))

(add-to-list 'load-path "~/.emacs.d/config/")

(require 'expand-region)
(require 'misc)
(require 'uniquify)
(require 'custom-defuns)
(require 'basic-settings)
(require 'webdevelopment-settings)
(require 'ui-settings)
(require 'lisp-settings)
(require 'ace-jump-settings)
(require 'evil-settings)
(require 'projectile-settings)
(require 'auto-complete-settings)
(require 'yasnippet-settings)
(require 'magit-settings)
(require 'ag-settings)
(require 'org-mode-settings)
(require 'custom-keybindings)
;;(server-start)

;; Diminish modes so they don't show up in the modeline
(require 'diminish)
(when (require 'diminish nil 'noerror)
  (eval-after-load "company"
    '(diminish 'company-mode))
  (eval-after-load "highlight-parentheses"
    '(diminish 'highlight-parentheses-mode))
  (eval-after-load "undo-tree"
    '(diminish 'undo-tree-mode))
  (eval-after-load "cider"
    '(diminish 'cider-mode "C"))
  (eval-after-load "eldoc"
    '(diminish 'eldoc-mode))
  (eval-after-load "paredit"
    '(diminish 'paredit-mode "PE"))
  (eval-after-load "elisp-slime-nav"
    '(diminish 'elisp-slime-nav-mode))
  (eval-after-load "yasnippet"
    '(diminish 'yas-minor-mode)))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(initial-frame-alist (quote ((fullscreen . maximized))))
 '(ansi-color-faces-vector [default bold shadow italic underline bold bold-italic bold])
 '(ansi-color-names-vector (vector "#4d4d4c" "#c82829" "#718c00" "#eab700" "#4271ae" "#8959a8" "#3e999f" "#ffffff"))
 '(custom-safe-themes (quote ("bb08c73af94ee74453c90422485b29e5643b73b05e8de029a6909af6a3fb3f58" "0e121ff9bef6937edad8dfcff7d88ac9219b5b4f1570fd1702e546a80dba0832" default)))
 '(fci-rule-color "#efefef")
 '(vc-annotate-background nil)
 '(vc-annotate-color-map (quote ((20 . "#c82829") (40 . "#f5871f") (60 . "#eab700") (80 . "#718c00") (100 . "#3e999f") (120 . "#4271ae") (140 . "#8959a8") (160 . "#c82829") (180 . "#f5871f") (200 . "#eab700") (220 . "#718c00") (240 . "#3e999f") (260 . "#4271ae") (280 . "#8959a8") (300 . "#c82829") (320 . "#f5871f") (340 . "#eab700") (360 . "#718c00"))))
 '(vc-annotate-very-old-color nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(company-scrollbar-bg ((t (:background "#ffffff"))))
 '(company-scrollbar-fg ((t (:background "#ffffff"))))
 '(company-tooltip ((t (:inherit default :background "#f9f9f9"))))
 '(company-tooltip-common ((t (:inherit font-lock-constant-face))))
 '(company-tooltip-selection ((t (:inherit font-lock-function-name-face :background "#ffffff"))))
 '(ido-first-match ((t (:foreground "#ccff66"))))
 '(ido-incomplete-regexp ((t (:foreground "#ffffff"))))
 '(ido-indicator ((t (:foreground "#ffffff"))))
 '(ido-only-match ((t (:foreground "#ffcc33"))))
 '(ido-subdir ((t (:foreground "#66ff00"))))
 '(rainbow-delimiters-depth-1-face ((t (:foreground "Grey55"))))
 '(rainbow-delimiters-depth-2-face ((t (:foreground "Green"))))
 '(rainbow-delimiters-depth-3-face ((t (:foreground "Magenta"))))
 '(rainbow-delimiters-depth-4-face ((t (:foreground "Cyan"))))
 '(rainbow-delimiters-depth-5-face ((t (:foreground "Red"))))
 '(rainbow-delimiters-depth-6-face ((t (:foreground "Blue")))))
