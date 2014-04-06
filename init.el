(when (string= system-name "VDI056-PRD")
  (setq url-proxy-services '(("http" . "proxy.eno.dom:8080"))))

(require 'package)
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
(defvar my-packages '(ido-ubiquitous ido-vertical-mode ido-select-window flx-ido idomenu helm ; mini-buffer on steroids (fuzzy completion etc)
                                     undo-tree ; visualize undo as a tree (extremely handy)
                                     company ; autocomplete
                                     ag helm-swoop swoop helm-ag ; search / grep
                                     clojure-mode clojure-test-mode clojure-cheatsheet clj-refactor ; clojure
                                     latest-clojure-libraries cider company-cider ; clojure
                                     ace-jump-mode ; move quickly around buffers (see vim EasyMotion as well)
                                     markdown-mode markdown-mode+ ; markdown
                                     evil evil-leader evil-numbers evil-paredit evil-matchit evil-indent-textobject surround ; evil vim emulation
                                     rainbow-delimiters highlight-parentheses smartparens paredit paredit-menu ; working with parens / delimiters
                                     color-theme sublime-themes molokai-theme helm-themes ; color themes
                                     git-rebase-mode gitattributes-mode git-commit-mode gitconfig-mode gitignore-mode ; git file modes
                                     helm-git gist magit diff-hl ; git integration
                                     helm-emmet emmet-mode skewer-mode js2-mode js2-refactor web-mode sass-mode ; web development
                                     projectile helm-projectile ; moving around in projects
                                     yasnippet clojure-snippets datomic-snippets ; snippets
                                     helm-dash ; search docs with Dash (MacOSX)
                                     zeal-at-point ; search docs with Zeal (linux)
                                     browse-kill-ring ; list / select / insert previously killed text
                                     dired+ ; directory editor addon
                                     expand-region ; easily select regions around point
                                     persp-mode ; per project window config
                                     multiple-cursors ; multiple cursors a la Sublime Text
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
(require 'helm-settings)
(require 'ag-settings)
(require 'custom-keybindings)
;(server-start)

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
