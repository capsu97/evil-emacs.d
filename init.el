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
                                     clojure-mode clojure-test-mode clojure-cheatsheet clj-refactor ; clojure
                                     latest-clojure-libraries cider company-cider cider-tracing ; clojure
                                     ace-jump-mode ; move quickly around buffers (see vim EasyMotion as well)
                                     markdown-mode markdown-mode+ ; markdown
                                     evil evil-leader evil-numbers evil-paredit evil-matchit evil-indent-textobject surround evil-visualstar ; evil vim emulation
                                     rainbow-delimiters highlight-parentheses smartparens paredit paredit-menu ; working with parens / delimiters
                                     noctilux-theme soothe-theme gruber-darker-theme sublime-themes monokai-theme molokai-theme color-theme-sanityinc-tomorrow ; color themes
                                     git-rebase-mode gitattributes-mode git-commit-mode gitconfig-mode gitignore-mode ; git file modes
                                     gist magit diff-hl ; git integration
                                     emmet-mode skewer-mode js2-mode js2-refactor web-mode sass-mode ; web development
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
;(server-start)

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

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(company-scrollbar-bg ((t (:background "#333638"))))
 '(company-scrollbar-fg ((t (:background "#333638"))))
 '(company-tooltip ((t (:inherit default :background "#333638"))))
 '(company-tooltip-common ((t (:inherit font-lock-constant-face))))
 '(company-tooltip-selection ((t (:inherit font-lock-function-name-face :background "#27292b"))))
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
