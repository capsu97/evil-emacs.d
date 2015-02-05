(require 'evil)

(define-key evil-insert-state-map "\C-e" nil)
(define-key evil-insert-state-map "\C-y" nil)

(global-set-key (kbd "<M-return>") 'open-line-below)

(evil-global-set-key 'normal "\\d" 'duplicate-current-line-or-region)

;; org-mode keybindings
(global-set-key (kbd "C-c a") 'org-agenda)

;; use company-mode instead of abbrev
(global-set-key (kbd "M-/") 'company-complete)

;; use regexp search by default
(global-set-key (kbd "C-s") 'isearch-forward-regexp)
(global-set-key (kbd "C-r") 'isearch-backward-regexp)
(global-set-key (kbd "C-M-s") 'isearch-forward)
(global-set-key (kbd "C-M-r") 'isearch-backward)

;; popup for yasnippet
(define-key popup-menu-keymap (kbd "M-n") 'popup-next)
(define-key popup-menu-keymap (kbd "TAB") 'popup-next)
(define-key popup-menu-keymap (kbd "<tab>") 'popup-next)
(define-key popup-menu-keymap (kbd "<backtab>") 'popup-previous)
(define-key popup-menu-keymap (kbd "M-p") 'popup-previous)
(define-key yas-minor-mode-map (kbd "C-'") 'yas-expand)

;; Web mode
(evil-define-key 'normal web-mode-map (kbd "M-l") 'web-mode-element-end)
(evil-define-key 'insert web-mode-map (kbd "M-l") 'web-mode-element-end)
(evil-define-key 'normal web-mode-map (kbd "M-h") 'web-mode-element-beginning)
(evil-define-key 'insert web-mode-map (kbd "M-h") 'web-mode-element-beginning)
(evil-define-key 'normal web-mode-map (kbd "M-k") 'my-web-mode-element-inside-previous)
(evil-define-key 'insert web-mode-map (kbd "M-k") 'my-web-mode-element-inside-previous)
(evil-define-key 'normal web-mode-map (kbd "M-j") 'my-web-mode-element-inside-next)
(evil-define-key 'insert web-mode-map (kbd "M-j") 'my-web-mode-element-inside-next)
(evil-define-key 'normal web-mode-map (kbd "C-k") 'web-mode-element-kill)
(evil-define-key 'insert web-mode-map (kbd "C-k") 'web-mode-element-kill)
(evil-define-key 'normal web-mode-map (kbd "C-c /") 'web-mode-element-close)
(evil-define-key 'insert web-mode-map (kbd "C-c /") 'web-mode-element-close)
(evil-define-key 'normal web-mode-map "\\p" 'web-mode-element-parent)
(evil-define-key 'normal web-mode-map "\\w" 'web-mode-element-wrap)
(evil-define-key 'normal web-mode-map "\\d" 'web-mode-element-clone)
(evil-define-key 'visual web-mode-map "\\d" 'duplicate-current-line-or-region)
(evil-define-key 'normal web-mode-map "\\re" 'web-mode-element-rename)
(evil-define-key 'normal web-mode-map "\\se" 'web-mode-element-select)
(evil-define-key 'insert web-mode-map (kbd "C-M-d") 'web-mode-element-clone)
(evil-define-key 'normal web-mode-map (kbd "C-M-d") 'web-mode-element-clone)
(evil-define-key 'normal web-mode-map (kbd "C-=") 'er/mark-outer-tag)
(evil-define-key 'normal web-mode-map (kbd "M-<right>") 'my-web-mode-element-inside-next)
(evil-define-key 'insert web-mode-map (kbd "M-<right>") 'my-web-mode-element-inside-next)
(evil-define-key 'normal web-mode-map (kbd "M-<left>") 'my-web-mode-element-inside-previous)
(evil-define-key 'insert web-mode-map (kbd "M-<left>") 'my-web-mode-element-inside-previous)

;; using C-u for up already
(global-set-key (kbd "C-M-u") 'universal-argument)

(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "C-x C-i") 'idomenu)
(global-set-key (kbd "C-x C-b") 'ibuffer)
(define-key evil-visual-state-map ",x" 'smex)
(define-key evil-normal-state-map ",l" 'ido-switch-buffer)
(define-key evil-normal-state-map ",ut" 'undo-tree-visualize)
(define-key evil-normal-state-map ",x" 'smex)
(define-key evil-normal-state-map ",n" 'neotree-toggle)
(define-key evil-normal-state-map ",m" 'magit-status)
(define-key evil-normal-state-map ",g" 'helm-imenu)
(define-key evil-normal-state-map ",bs" 'mark-whole-buffer)
(define-key evil-normal-state-map "\\rb" 'indent-whole-buffer)

(define-key global-map (kbd "C-+") 'text-scale-increase)
(define-key global-map (kbd "C--") 'text-scale-decrease)

(global-set-key (kbd "C-c r") 'revert-buffer)

(define-key evil-normal-state-map "\\ew" 'delete-other-windows) ; expand window

;; Help should search more than just commands
(define-key 'help-command "a" 'apropos)

;; Web beautify
(evil-define-key 'normal web-mode-map "\\b" 'web-beautify-html)

;; Comments
(define-key evil-normal-state-map ",;" 'evilnc-comment-or-uncomment-lines)
(define-key evil-normal-state-map ",cc" 'evilnc-copy-and-comment-lines)
(define-key evil-visual-state-map ",cc" 'evilnc-copy-and-comment-lines)
(define-key evil-normal-state-map ",cp" 'evilnc-comment-or-uncomment-paragraphs)
(define-key evil-normal-state-map ",cr" 'comment-or-uncomment-region)
(define-key evil-visual-state-map ",cr" 'comment-or-uncomment-region)

;; Lisp
(define-key read-expression-map (kbd "TAB") 'lisp-complete-symbol)
(define-key lisp-mode-shared-map (kbd "RET") 'reindent-then-newline-and-indent)

(global-set-key (kbd "C-=") 'ot-mark-outside-pairs)
(global-set-key (kbd "M-=") 'er/expand-region)
(global-set-key (kbd "M--") 'er/contract-region)

(global-set-key (kbd "C-x o") 'ido-select-window)

;;; esc quits

(define-key evil-normal-state-map [escape] 'keyboard-quit)
(define-key evil-visual-state-map [escape] 'keyboard-quit)
(define-key minibuffer-local-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-ns-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-completion-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-must-match-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-isearch-map [escape] 'minibuffer-keyboard-quit)

;; Use tab to move between links in help mode.
(evil-define-key 'motion help-mode-map (read-kbd-macro "TAB") 'forward-button)

;; Motion
(define-key evil-normal-state-map "s" nil) ; remove default binding so I can override it
(define-key evil-operator-state-map "s" nil)
(define-key evil-normal-state-map "S" nil) ; remove default binding so I can override it
(define-key evil-operator-state-map "S" nil)

(define-key evil-motion-state-map "\\" nil)
(define-key evil-motion-state-map " " nil)
(define-key evil-motion-state-map "  " 'evil-ace-jump-char-mode)
(define-key evil-motion-state-map "S" 'evil-ace-jump-word-mode)
(define-key evil-motion-state-map "s" 'evil-ace-jump-char-mode)
(define-key evil-motion-state-map " c" 'evil-ace-jump-char-mode)
(define-key evil-motion-state-map " t" 'evil-ace-jump-char-to-mode)
(define-key evil-motion-state-map " l" 'evil-ace-jump-line-mode)

;; Operator
(define-key evil-operator-state-map " " nil)      ; similar to f
(define-key evil-operator-state-map "  " 'evil-ace-jump-char-mode)      ; similar to f
(define-key evil-operator-state-map " t" 'evil-ace-jump-char-to-mode) ; similar to t

;; Insert
(define-key evil-insert-state-map (kbd "M-h") 'evil-backward-char)
(define-key evil-insert-state-map (kbd "M-j") 'evil-next-line)
(define-key evil-insert-state-map (kbd "M-k") 'evil-previous-line)
(define-key evil-insert-state-map (kbd "M-l") 'evil-forward-char)

(define-key evil-insert-state-map (kbd "M-H") 'evil-backward-word-begin)
(define-key evil-insert-state-map (kbd "M-J") 'evil-forward-section-begin)
(define-key evil-insert-state-map (kbd "M-K") 'evil-backward-section-begin)
(define-key evil-insert-state-map (kbd "M-L") 'evil-forward-word-begin)

(define-key evil-insert-state-map (kbd "C-SPC") 'evil-ace-jump-word-mode)
;;(define-key evil-insert-state-map (kbd "C-x") 'evil-execute-in-normal-state)

;; Normal
;;(define-key evil-normal-state-map " m" 'evil-jump-item)

(define-key evil-normal-state-map (kbd "M-H") 'evil-backward-word-begin)
(define-key evil-normal-state-map (kbd "M-J") 'evil-forward-section-begin)
(define-key evil-normal-state-map (kbd "M-K") 'evil-backward-section-begin)
(define-key evil-normal-state-map (kbd "M-L") 'evil-forward-word-begin)

;; Projectile
(define-key evil-normal-state-map ",t" 'projectile-find-file-in-known-projects)
(define-key evil-normal-state-map ",pf" 'projectile-find-file)
(define-key evil-normal-state-map ",f" 'projectile-find-file)
(define-key evil-normal-state-map ",ps" 'projectile-switch-project)
(define-key evil-normal-state-map ",s" 'projectile-switch-project)
(define-key evil-normal-state-map ",prs" 'projectile-replace)
(define-key evil-normal-state-map ",pk" 'projectile-kill-buffers)
(define-key evil-normal-state-map ",pd" 'projectile-dired)
(define-key evil-normal-state-map ",prf" 'projectile-recentf)
(define-key evil-normal-state-map ",pi" 'projectile-invalidate-cache)
(define-key evil-normal-state-map ",pc" 'projectile-cache-current-file)
(define-key evil-normal-state-map ",pb" 'projectile-switch-to-buffer)
(define-key evil-normal-state-map ",b" 'projectile-switch-to-buffer)
(define-key evil-normal-state-map ",po" 'projectile-multi-occur)
(define-key evil-normal-state-map ",pa" 'projectile-ack)
(define-key evil-normal-state-map ",pt" 'projectile-regenerate-tags)
(define-key evil-normal-state-map ",pg" 'projectile-grep)

;;Make evil-mode up/down operate in screen lines instead of logical lines
(define-key evil-normal-state-map (kbd "j") 'evil-next-visual-line)
(define-key evil-normal-state-map (kbd "k") 'evil-previous-visual-line)

;; Paredit / Paxedit
(evil-define-key 'normal paredit-mode-map "\\q" '(lambda () (kill-buffer "*nREPL error*")))
(evil-define-key 'normal paredit-mode-map "\\fd" 'paredit-focus-on-defun)
(evil-define-key 'normal paredit-mode-map "\\wr" 'paredit-wrap-round)
(evil-define-key 'normal paredit-mode-map "\(" 'paredit-wrap-round)
(evil-define-key 'normal paredit-mode-map "\\ws" 'paredit-wrap-square)
(evil-define-key 'normal paredit-mode-map "\\W" 'paredit-wrap-square)
(evil-define-key 'normal paredit-mode-map "\\w[" 'paredit-wrap-square)
(evil-define-key 'normal paredit-mode-map "\\[" 'paredit-wrap-square)
(evil-define-key 'normal paredit-mode-map "\\]" 'paredit-wrap-square)
(evil-define-key 'normal paredit-mode-map "\\wc" 'paredit-wrap-curly)
(evil-define-key 'normal paredit-mode-map "\\w{" 'paredit-wrap-curly)
(evil-define-key 'normal paredit-mode-map "\\{" 'paredit-wrap-curly)
(evil-define-key 'normal paredit-mode-map "\\}" 'paredit-wrap-curly)
(evil-define-key 'normal paredit-mode-map "\\d" 'paredit-duplicate-after-point)
(evil-define-key 'normal paredit-mode-map "\\S" 'paredit-split-sexp)
(evil-define-key 'normal paredit-mode-map "\\s" 'paredit-splice-sexp)
(evil-define-key 'normal paredit-mode-map "\\fs" 'paredit-splice-sexp-killing-forward)
(evil-define-key 'normal paredit-mode-map "\\bs" 'paredit-splice-sexp-killing-backward)
(evil-define-key 'normal paredit-mode-map "\\j" 'paredit-join-sexps)
(evil-define-key 'normal paredit-mode-map "\\rf" 'paredit-reindent-defun)

(evil-define-key 'normal paredit-mode-map "\\R" 'paxedit-raise-sexp)
(evil-define-key 'normal paredit-mode-map "\\c" 'paxedit-copy)
(evil-define-key 'normal paredit-mode-map "\\tb" 'paxedit-transpose-backward)
(evil-define-key 'normal paredit-mode-map "\\tf" 'paxedit-transpose-forward)
(evil-define-key 'normal paredit-mode-map (kbd "M-<right>") 'paxedit-transpose-forward)
(evil-define-key 'normal paredit-mode-map (kbd "M-<right>") 'paxedit-transpose-forward)
(evil-define-key 'insert paredit-mode-map (kbd "M-<left>") 'paxedit-transpose-backward)
(evil-define-key 'insert paredit-mode-map (kbd "M-<left>") 'paxedit-transpose-backward)

;;(evil-define-key 'normal paredit-mode-map "x" 'paredit-forward-delete)
(evil-define-key 'normal paredit-mode-map "X" 'paredit-backward-delete)
(evil-define-key 'normal paredit-mode-map "D" 'paredit-kill)

(evil-define-key 'normal paredit-mode-map (kbd "C-S-k") 'paxedit-kill)
(evil-define-key 'insert paredit-mode-map (kbd "C-S-k") 'paxedit-kill)

(evil-define-key 'normal paredit-mode-map (kbd "M->") 'paredit-forward-slurp-sexp)
(evil-define-key 'normal paredit-mode-map (kbd "M-<") 'paredit-forward-barf-sexp)
(evil-define-key 'normal paredit-mode-map (kbd "C-<") 'paredit-backward-slurp-sexp)
(evil-define-key 'normal paredit-mode-map (kbd "C->") 'paredit-backward-barf-sexp)

(evil-define-key 'insert paredit-mode-map (kbd "M->") 'paredit-forward-slurp-sexp)
(evil-define-key 'insert paredit-mode-map (kbd "M-<") 'paredit-forward-barf-sexp)
(evil-define-key 'insert paredit-mode-map (kbd "C-<") 'paredit-backward-slurp-sexp)
(evil-define-key 'insert paredit-mode-map (kbd "C->") 'paredit-backward-barf-sexp)

(evil-define-key 'normal paredit-mode-map (kbd "M-;") 'evil-paredit-comment-dwim)

(evil-define-key 'visual paredit-mode-map "[" 'paredit-wrap-square)
(evil-define-key 'visual paredit-mode-map "]" 'paredit-wrap-square)
(evil-define-key 'visual paredit-mode-map "{" 'paredit-wrap-curly)
(evil-define-key 'visual paredit-mode-map "}" 'paredit-wrap-curly)
(evil-define-key 'visual paredit-mode-map "(" 'paredit-wrap-round)
(evil-define-key 'visual paredit-mode-map ")" 'paredit-wrap-round)

;; Clojure / Cider
(evil-define-key 'normal clojure-mode-map ",ch" 'helm-clojure-headlines)
(evil-define-key 'normal clojure-mode-map (kbd "<C-return>") 'cider-eval-defun-at-point)
(evil-define-key 'insert clojure-mode-map (kbd "<C-return>") 'cider-eval-defun-at-point)
(evil-define-key 'visual clojure-mode-map (kbd "<C-return>") 'cider-eval-region)
(evil-define-key 'normal clojure-mode-map "\\es" 'cider-eval-last-sexp)
(evil-define-key 'normal clojure-mode-map "\\en" 'cider-eval-ns-form)
(evil-define-key 'normal clojure-mode-map "\\eb" 'cider-load-buffer)
(evil-define-key 'normal clojure-mode-map ",cb" 'cider-repl-clear-buffer)
(evil-define-key 'normal clojure-mode-map ",cc" 'cider-connect)
(evil-define-key 'normal clojure-mode-map ",cj" 'cider-jack-in)
(evil-define-key 'normal clojure-mode-map (kbd "M-.") 'cider-jump-to-var)
(evil-define-key 'normal clojure-mode-map (kbd "M-,") 'cider-jump-back)

;; Other modes
;;(evil-declare-key 'normal org-mode-map "T" 'org-todo)
;;(evil-declare-key 'normal org-mode-map "-" 'org-cycle-list-bullet)

;; Evil window movements
(global-set-key "\C-w" 'evil-window-map)

;; neotree
(add-hook 'neotree-mode-hook
          (lambda ()
            (define-key evil-normal-state-local-map (kbd "TAB") 'neotree-enter)
            (define-key evil-normal-state-local-map (kbd "SPC") 'neotree-enter)
            (define-key evil-normal-state-local-map (kbd "q") 'neotree-hide)
            (define-key evil-normal-state-local-map (kbd "RET") 'neotree-enter)))

(provide 'custom-keybindings)
