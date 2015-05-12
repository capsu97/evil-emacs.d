(when (string= system-name "VDI056-PRD")
  (setq url-proxy-services '(("http" . "proxy.eno.dom:8080"))))

(require 'package)
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/") t)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)

;;(add-to-list 'package-archives
;;    '("marmalade" .
;;      "http://marmalade-repo.org/packages/"))
(setq package-enable-at-startup t)
(package-initialize)

(when (not package-archive-contents)
  (package-refresh-contents))

;; Add in your own as you wish:
(defvar my-packages '(ido-ubiquitous ido-vertical-mode ido-select-window flx-ido idomenu smex ; mini-buffer on steroids (fuzzy completion etc)
                                     helm helm-flyspell helm-projectile helm-ag helm-swoop cljr-helm ; helm
                                     helm-descbinds helm-flycheck helm-emmet helm-css-scss ; helm
                                     helm-c-moccur ; helm
                                     dash-at-point helm-dash ; dash
                                     powerline ; better modeline
                                     volatile-highlights ; highlighting
                                     flyspell ; spell checking
                                     guide-key guide-key-tip ; keystroke help
                                     command-log-mode ; log all used keystrokes/commands to buffer
                                     esup ; emacs startup profiler
                                     cypher-mode ; neo4j cypher
                                     org-plus-contrib org-bullets org-pomodoro org-repo-todo ; latest org-mode
                                     neotree ; like NERDtree from vim
                                     undo-tree ; visualize undo as a tree (extremely handy)
                                     company company-quickhelp company-web helm-company ; autocomplete
                                     company-restclient restclient ; http rest client
                                     drag-stuff ; moving lines/regions up/down
                                     idle-highlight-mode ; highlight all occurences of current symbol after a little while
                                     elisp-slime-nav ; extensions for elisp
                                     diminish ; don't clutter the modeline with minor mode names
                                     ag ; search / grep
                                     buffer-move ; manage buffers
                                     clojure-mode clojure-mode-extra-font-locking clojure-cheatsheet clj-refactor align-cljlet ; clojure
                                     latest-clojure-libraries cider cider-eval-sexp-fu ; clojure
                                     ace-jump-mode ace-window avy ; move quickly around buffers (see vim EasyMotion as well)
                                     markdown-mode markdown-mode+ markdown-toc ; markdown
                                     evil evil-anzu evil-args evil-exchange evil-numbers evil-indent-textobject ; evil vim emulation
                                     evil-surround evil-visualstar evil-nerd-commenter evil-jumper ; evil vim emulation
                                     evil-lisp-state evil-iedit-state evil-matchit evil-easymotion evil-org; evil vim emulation
                                     rainbow-delimiters highlight-parentheses smartparens paredit paredit-menu paxedit ; working with parens / delimiters
                                     lush-theme sublime-themes monokai-theme molokai-theme color-theme-sanityinc-tomorrow ; color themes
                                     birds-of-paradise-plus-theme afternoon-theme noctilux-theme soft-morning-theme ; color themes
                                     subatomic256-theme tango-plus-theme zenburn-theme zonokai-theme ; color themes
                                     git-rebase-mode gitattributes-mode git-commit-mode gitconfig-mode gitignore-mode ; git file modes
                                     gist magit diff-hl ; git integration
                                     emmet-mode tagedit js2-mode js2-refactor json-mode web-mode ; web development
                                     scss-mode sass-mode rainbow-mode tern company-tern ; web development
                                     projectile ; moving around in projects
                                     yasnippet popup clojure-snippets datomic-snippets helm-c-yasnippet ; snippets
                                     browse-kill-ring ; list / select / insert previously killed text
                                     dired+ ; directory editor addon
                                     expand-region ; easily select regions around point
                                     persp-mode ; per project window config
                                     multiple-cursors iedit ; multiple cursors a la Sublime Text
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
 '(custom-safe-themes
   (quote
    ("d809ca3cef02087b48f3f94279b86feca896f544ae4a82b523fba823206b6040" "1ba463f6ac329a56b38ae6ac8ca67c8684c060e9a6ba05584c90c4bffc8046c3" "f5e9f66da69f504cb61aacedeb8284d8f38f2e6f835fd658cac5f0ad5d924549" "bf648fd77561aae6722f3d53965a9eb29b08658ed045207fe32ffed90433eb52" "a99e7c91236b2aba4cd374080c73f390c55173c5a1b4ac662eeb3172b60a9814" "c3fb7a13857e799bba450bb81b9101ef4960281c4d5908e05ecac9204c526c8a" "0c311fb22e6197daba9123f43da98f273d2bfaeeaeb653007ad1ee77f0003037" "7dd515d883520286fc8936ce32381fb01b978d0d7cfb6fe56f7f55d8accbf63a" "57072d797dc09fcf563051a85a29d6a51d6f2b1a602e029c35b05c30df319b2a" "f0ea6118d1414b24c2e4babdc8e252707727e7b4ff2e791129f240a2b3093e32" "c4e6fe8f5728a5d5fd0e92538f68c3b4e8b218bcfb5e07d8afff8731cc5f3df0" "9bcb8ee9ea34ec21272bb6a2044016902ad18646bd09fdd65abae1264d258d89" "0e121ff9bef6937edad8dfcff7d88ac9219b5b4f1570fd1702e546a80dba0832" "60f04e478dedc16397353fb9f33f0d895ea3dab4f581307fbf0aa2f07e658a40" default)))
 '(fci-rule-color "#efefef")
 '(vc-annotate-background nil)
 '(vc-annotate-very-old-color nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(flx-highlight-face ((t (:inherit font-lock-variable-name-face :foreground "#69D2E7"))))
 '(ido-first-match ((t (:foreground "#ccff66"))))
 '(ido-incomplete-regexp ((t (:foreground "#ffffff"))))
 '(ido-indicator ((t (:foreground "#ffffff"))))
 '(ido-only-match ((t (:foreground "#ffcc33"))))
 '(ido-subdir ((t (:foreground "#66ff00"))))
 '(web-mode-current-element-highlight-face ((t (:background "black"))))
 '(web-mode-html-attr-name-face ((t (:foreground "royal blue"))))
 '(web-mode-html-tag-bracket-face ((t (:foreground "dim gray"))))
 '(web-mode-html-tag-face ((t (:foreground "DarkOrange1")))))
