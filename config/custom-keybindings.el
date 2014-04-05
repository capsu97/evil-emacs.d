(require 'evil)

;; use hippie expand instead of abbrev
(global-set-key (kbd "M-/") 'hippie-expand)

;; use regexp search by default
(global-set-key (kbd "C-s") 'isearch-forward-regexp)
(global-set-key (kbd "C-r") 'isearch-backward-regexp)
(global-set-key (kbd "C-M-s") 'isearch-forward)
(global-set-key (kbd "C-M-r") 'isearch-backward)

;; using C-u for up already 
(global-set-key (kbd "C-M-u") 'universal-argument)

(global-set-key (kbd "M-x") 'smex)
(global-set-key "\C-x\C-m" 'smex)
(global-set-key "\C-c\C-m" 'smex-major-mode-commands)
(global-set-key (kbd "C-x C-i") 'idomenu)
(global-set-key (kbd "C-x C-b") 'ibuffer)

(define-key global-map (kbd "C-+") 'text-scale-increase)
(define-key global-map (kbd "C--") 'text-scale-decrease)

(global-set-key (kbd "C-c r") 'revert-buffer)

;; Help should search more than just commands
(define-key 'help-command "a" 'apropos)

;; Lisp
(define-key read-expression-map (kbd "TAB") 'lisp-complete-symbol)
(define-key lisp-mode-shared-map (kbd "RET") 'reindent-then-newline-and-indent)

;; Use helm for opening files
;;(global-set-key "\C-x\C-f" 'helm-mini)

(global-set-key (kbd "C-=") 'ot-mark-outside-pairs)
(global-set-key (kbd "M-=") 'er/expand-region)

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
(define-key evil-motion-state-map "\\" nil)
(define-key evil-motion-state-map (kbd "SPC") 'evil-ace-jump-char-mode)
(define-key evil-motion-state-map (kbd "C-SPC") 'evil-ace-jump-char-to-mode)
(define-key evil-motion-state-map (kbd "M-i") 'helm-swoop-from-evil-search)

;; Operator
(define-key evil-operator-state-map (kbd "SPC") 'evil-ace-jump-char-mode)      ; similar to f
;(define-key evil-operator-state-map (kbd "C-SPC") 'evil-ace-jump-char-to-mode) ; similar to t

;; Insert
(define-key evil-insert-state-map "\C-e" nil)
(define-key evil-insert-state-map "\C-y" nil)

(define-key evil-insert-state-map (kbd "C-k") nil)

(define-key evil-insert-state-map (kbd "M-h") 'evil-backward-char)
(define-key evil-insert-state-map (kbd "M-j") 'evil-next-line)
(define-key evil-insert-state-map (kbd "M-k") 'evil-previous-line)
(define-key evil-insert-state-map (kbd "M-l") 'evil-forward-char)

(define-key evil-insert-state-map (kbd "M-H") 'evil-backward-word-begin)
(define-key evil-insert-state-map (kbd "M-J") 'evil-forward-section-begin)
(define-key evil-insert-state-map (kbd "M-K") 'evil-backward-section-begin)
(define-key evil-insert-state-map (kbd "M-L") 'evil-forward-word-begin)

(define-key evil-insert-state-map (kbd "S-SPC") 'evil-ace-jump-char-mode)
(define-key evil-insert-state-map (kbd "M-SPC") 'evil-ace-jump-line-mode)

;(define-key evil-insert-state-map (kbd "C-x") 'evil-execute-in-normal-state)

;; Normal
(define-key evil-normal-state-map (kbd "M-H") 'evil-backward-word-begin)
(define-key evil-normal-state-map (kbd "M-J") 'evil-forward-section-begin)
(define-key evil-normal-state-map (kbd "M-K") 'evil-backward-section-begin)
(define-key evil-normal-state-map (kbd "M-L") 'evil-forward-word-begin)

(define-key evil-normal-state-map (kbd "M-.") 'cider-jump)
(define-key evil-normal-state-map (kbd "M-,") 'cider-jump-back)

(define-key evil-normal-state-map ",t" 'projectile-find-file)
(define-key evil-normal-state-map ",pff" 'projectile-find-file)
(define-key evil-normal-state-map ",pft" 'projectile-find-test-file)
(define-key evil-normal-state-map ",ptt" 'projectile-toggle-between-implementation-and-test)
(define-key evil-normal-state-map ",prt" 'projectile-regenerate-tags)
(define-key evil-normal-state-map ",ptp" 'projectile-test-project)
(define-key evil-normal-state-map ",psp" 'projectile-switch-project)
(define-key evil-normal-state-map ",prs" 'projectile-replace)
(define-key evil-normal-state-map ",pkb" 'projectile-kill-buffers)
(define-key evil-normal-state-map ",pd" 'projectile-dired)
(define-key evil-normal-state-map ",prf" 'projectile-recentf)
(define-key evil-normal-state-map ",pi" 'projectile-invalidate-cache)
(define-key evil-normal-state-map ",pc" 'projectile-cache-current-file)
(define-key evil-normal-state-map ",pb" 'projectile-switch-to-buffer)
(define-key evil-normal-state-map ",po" 'projectile-multi-occur)
(define-key evil-normal-state-map ",pa" 'projectile-ack)
(define-key evil-normal-state-map ",pg" 'projectile-grep)
(define-key evil-normal-state-map ",h" 'helm-mini)
(define-key evil-normal-state-map ",rf" 'recentf-open-files)
(define-key evil-normal-state-map ",l" 'ido-switch-buffer)
(define-key evil-normal-state-map ",cc" 'cider-connect)
(define-key evil-normal-state-map ",cj" 'cider-jack-in)
(define-key evil-normal-state-map ",ut" 'undo-tree-visualize)
(define-key evil-normal-state-map ",c" 'helm-clojure-headlines)
(define-key evil-normal-state-map ",x" 'smex)
(define-key evil-normal-state-map ",g" 'helm-imenu)

;;Make evil-mode up/down operate in screen lines instead of logical lines
(define-key evil-normal-state-map (kbd "j") 'evil-next-visual-line)
(define-key evil-normal-state-map (kbd "k") 'evil-previous-visual-line)

(define-key evil-normal-state-map ", " 'evil-ace-jump-line-mode)
;(define-key evil-normal-state-map (kbd "M-SPC") 'evil-ace-jump-line-mode)
;(define-key evil-normal-state-map (kbd "SPC") 'evil-ace-jump-char-mode)

(define-key evil-normal-state-map "\\q" '(lambda () (kill-buffer "*nREPL error*")))
(define-key evil-normal-state-map "\\wr" 'paredit-wrap-round)
(define-key evil-normal-state-map "\\ws" 'paredit-wrap-square)
(define-key evil-normal-state-map "\\wc" 'paredit-wrap-curly)
(define-key evil-normal-state-map "\\d" 'paredit-duplicate-after-point)
(define-key evil-normal-state-map "\\S" 'paredit-split-sexp)
(define-key evil-normal-state-map "\\s" 'paredit-splice-sexp)
(define-key evil-normal-state-map "\\fs" 'paredit-splice-sexp-killing-forward)
(define-key evil-normal-state-map "\\bs" 'paredit-splice-sexp-killing-backward)
(define-key evil-normal-state-map "\\j" 'paredit-join-sexps)
(define-key evil-normal-state-map "\\rf" 'paredit-reindent-defun)
(define-key evil-normal-state-map "\\rb" 'indent-whole-buffer)
(define-key evil-normal-state-map "\\ef" 'cider-eval-expression-at-point)
(evil-define-key 'normal clojure-mode-map (kbd "<C-return>") 'cider-eval-defun-at-point)
(evil-define-key 'insert clojure-mode-map (kbd "<C-return>") 'cider-eval-defun-at-point)
(evil-define-key 'visual clojure-mode-map (kbd "<C-return>") 'cider-eval-region)
(define-key evil-normal-state-map "\\es" 'cider-eval-last-sexp)
(define-key evil-normal-state-map "\\en" 'cider-eval-ns-form)
(define-key evil-normal-state-map "\\eb" 'cider-load-current-buffer)

(define-key evil-normal-state-map "\\ew" 'delete-other-windows) ; expand window

(define-key evil-normal-state-map (kbd "M->") 'paredit-forward-slurp-sexp)
(define-key evil-normal-state-map (kbd "M-<") 'paredit-forward-barf-sexp)
(define-key evil-normal-state-map (kbd "C-<") 'paredit-backward-slurp-sexp)
(define-key evil-normal-state-map (kbd "C->") 'paredit-backward-barf-sexp)

(define-key evil-insert-state-map (kbd "M->") 'paredit-forward-slurp-sexp)
(define-key evil-insert-state-map (kbd "M-<") 'paredit-forward-barf-sexp)
(define-key evil-insert-state-map (kbd "C-<") 'paredit-backward-slurp-sexp)
(define-key evil-insert-state-map (kbd "C->") 'paredit-backward-barf-sexp)

(define-key evil-normal-state-map (kbd "M-;") 'evil-paredit-comment-dwim)

;; Visual
(define-key evil-visual-state-map "\\W" 'paredit-wrap-round)

;; Other modes
;(evil-declare-key 'normal org-mode-map "T" 'org-todo)
;(evil-declare-key 'normal org-mode-map "-" 'org-cycle-list-bullet)

;; Evil window movements
(global-set-key "\C-w" 'evil-window-map)

(provide 'custom-keybindings)
