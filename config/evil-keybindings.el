(require 'evil)

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

(define-key evil-insert-state-map (kbd "S-SPC") 'ace-jump-char-mode)
(define-key evil-insert-state-map (kbd "M-SPC") 'ace-jump-line-mode)

;(define-key evil-insert-state-map (kbd "C-x") 'evil-execute-in-normal-state)

;; Normal
(define-key evil-normal-state-map (kbd "M-H") 'evil-backward-word-begin)
(define-key evil-normal-state-map (kbd "M-J") 'evil-forward-section-begin)
(define-key evil-normal-state-map (kbd "M-K") 'evil-backward-section-begin)
(define-key evil-normal-state-map (kbd "M-L") 'evil-forward-word-begin)

(evil-declare-key 'normal nrepl-mode-map (kbd "M-.") 'nrepl-jump)
(evil-declare-key 'normal nrepl-mode-map (kbd "M-,") 'nrepl-jump-back)

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
(define-key evil-normal-state-map ",f" 'recentf-open-files)
(define-key evil-normal-state-map ",l" 'ido-switch-buffer)
(define-key evil-normal-state-map ",r" 'nrepl)
(define-key evil-normal-state-map ",,r" 'nrepl-jack-in)
(define-key evil-normal-state-map ",ut" 'undo-tree-visualize)

(define-key evil-normal-state-map ",g" 'ace-jump-line-mode)
(define-key evil-normal-state-map (kbd "M-SPC") 'ace-jump-line-mode)
(define-key evil-normal-state-map (kbd "SPC") 'ace-jump-char-mode)

(defun paredit-duplicate-after-point
  ()
  "Duplicates the content of the line that is after the point."
  (interactive)
  ;; skips to the next sexp
  (while (looking-at " ")
    (forward-char))
  (set-mark-command nil)
  ;; while we find sexps we move forward on the line
  (while (and (bounds-of-thing-at-point 'sexp)
              (<= (point) (car (bounds-of-thing-at-point 'sexp)))
              (not (= (point) (line-end-position))))
    (forward-sexp)
    (while (looking-at " ")
      (forward-char)))
  (kill-ring-save (mark) (point))
  ;; go to the next line and copy the sexprs we encountered
  (paredit-newline)
  (yank)
  (exchange-point-and-mark))

(evil-declare-key 'normal nrepl-mode-map "\\q" '(lambda () (kill-buffer "*nREPL error*")))
(evil-declare-key 'normal paredit-mode-map "\\wr" 'paredit-wrap-round)
(evil-declare-key 'normal paredit-mode-map "\\ws" 'paredit-wrap-square)
(evil-declare-key 'normal paredit-mode-map "\\wc" 'paredit-wrap-curly)
(evil-declare-key 'normal paredit-mode-map "\\d" 'paredit-duplicate-after-point)
(evil-declare-key 'normal paredit-mode-map "\\S" 'paredit-split-sexp)
(evil-declare-key 'normal paredit-mode-map "\\s" 'paredit-splice-sexp)
(evil-declare-key 'normal paredit-mode-map "\\fs" 'paredit-splice-sexp-killing-forward)
(evil-declare-key 'normal paredit-mode-map "\\bs" 'paredit-splice-sexp-killing-backward)
(evil-declare-key 'normal paredit-mode-map "\\j" 'paredit-join-sexps)
(evil-declare-key 'normal paredit-mode-map "\\rf" 'paredit-reindent-defun)
(evil-declare-key 'normal paredit-mode-map "\\rb" 'indent-whole-buffer)
(evil-declare-key 'normal nrepl-mode-map "\\ef" 'nrepl-eval-expression-at-point)
(evil-declare-key 'normal nrepl-mode-map (kbd "<C-return>") 'nrepl-eval-expression-at-point)
(evil-declare-key 'insert nrepl-mode-map (kbd "<C-return>") 'nrepl-eval-expression-at-point)
(evil-declare-key 'visual nrepl-mode-map (kbd "<C-return>") 'nrepl-eval-region)
(evil-declare-key 'normal nrepl-mode-map "\\es" 'nrepl-eval-last-expression)
(evil-declare-key 'normal nrepl-mode-map "\\en" 'nrepl-eval-ns-form)
(evil-declare-key 'normal nrepl-mode-map "\\eb" 'nrepl-load-current-buffer)

(define-key evil-normal-state-map "\\ew" 'delete-other-windows) ; expand window

(evil-declare-key 'normal paredit-mode-map (kbd "M->") 'paredit-forward-slurp-sexp)
(evil-declare-key 'normal paredit-mode-map (kbd "M-<") 'paredit-forward-barf-sexp)
(evil-declare-key 'normal paredit-mode-map (kbd "C-<") 'paredit-backward-slurp-sexp)
(evil-declare-key 'normal paredit-mode-map (kbd "C->") 'paredit-backward-barf-sexp)

(evil-declare-key 'insert paredit-mode-map (kbd "M->") 'paredit-forward-slurp-sexp)
(evil-declare-key 'insert paredit-mode-map (kbd "M-<") 'paredit-forward-barf-sexp)
(evil-declare-key 'insert paredit-mode-map (kbd "C-<") 'paredit-backward-slurp-sexp)
(evil-declare-key 'insert paredit-mode-map (kbd "C->") 'paredit-backward-barf-sexp)

(evil-declare-key 'normal paredit-mode-map (kbd "M-;") 'evil-paredit-comment-dwim)

;; Visual
(evil-declare-key 'visual paredit-mode-map "\\W" 'paredit-wrap-round)

;; Other modes
;(evil-declare-key 'normal org-mode-map "T" 'org-todo)
;(evil-declare-key 'normal org-mode-map "-" 'org-cycle-list-bullet)

(defun evil-paredit-comment-dwim ()
  (interactive)
  (progn
    (evil-change-state 'insert)
    (paredit-comment-dwim)))

;; Evil window movements
(global-set-key "\C-w" 'evil-window-map)

(provide 'evil-keybindings)