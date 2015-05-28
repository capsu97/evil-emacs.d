;;;;;;;;;;;;;
;; Hydra's ;;
;;;;;;;;;;;;;

;; Hydra - Marking
(defhydra hydra-mark (:color blue
                             :hint nil
                             :idle 1.0)
  "Mark"
  ("d" er/mark-defun "Defun / Function")
  ("w" er/mark-word "Word")
  ("u" er/mark-url "Url")
  ("e" er/mark-email "Email")
  ("b" mark-whole-buffer "Buffer")
  ("p" er/mark-paragraph "Paragraph")
  ("s" er/mark-symbol "Symbol")
  ("S" er/mark-symbol-with-prefix "Prefixed symbol")
  ("q" er/mark-inside-quotes "Inside quotes")
  ("Q" er/mark-outside-quotes "Outside quotes")
  ("(" er/mark-inside-pairs "Inside pairs")
  (")" er/mark-outside-pairs "Outside pairs")
  ("t" er/mark-inner-tag "Inner tag")
  ("T" er/mark-outer-tag "Outer tag")
  ("c" er/mark-comment "Comment")
  ("a" er/mark-html-attribute "HTML attribute")
  )

(global-set-key (kbd "C-c m") 'hydra-mark/body)

;; Hydra - Yank
(defhydra hydra-yank-pop ()
  "yank"
  ("C-y" yank nil)
  ("y" (yank-pop 1) "next")
  ("Y" (yank-pop -1) "prev")
  ("l" helm-show-kill-ring "list" :color blue))   ; or browse-kill-ring

(global-set-key (kbd "C-y") #'hydra-yank-pop/yank)

;; Hydra - Goto line
(defhydra hydra-goto-line (goto-map ""
                                    :pre (linum-mode 1)
                                    :post (linum-mode -1))
  "goto-line"
  ("g" goto-line "go")
  ("m" set-mark-command "mark" :bind nil)
  ("q" nil "quit"))

;; Hydra - Projectile
(defhydra hydra-projectile-other-window (:color teal)
  "projectile-other-window"
  ("f"  projectile-find-file-other-window        "file")
  ("g"  projectile-find-file-dwim-other-window   "file dwim")
  ("d"  projectile-find-dir-other-window         "dir")
  ("b"  projectile-switch-to-buffer-other-window "buffer")
  ("q"  nil                                      "cancel" :color blue))

(defhydra hydra-projectile (:color teal
                                   :hint nil)
  "
     PROJECTILE: %(projectile-project-root)

     Find File            Search/Tags          Buffers                Cache
------------------------------------------------------------------------------------------
_s-f_: file            _a_: ag                _i_: Ibuffer           _c_: cache clear
 _ff_: file dwim       _g_: update gtags      _b_: switch to buffer  _x_: remove known project
 _fd_: file curr dir   _o_: multi-occur     _s-k_: Kill all buffers  _X_: cleanup non-existing
  _r_: recent file                                               ^^^^_z_: cache current
  _d_: dir

"
  ("a"   projectile-ag)
  ("b"   projectile-switch-to-buffer)
  ("c"   projectile-invalidate-cache)
  ("d"   projectile-find-dir)
  ("s-f" projectile-find-file)
  ("ff"  projectile-find-file-dwim)
  ("fd"  projectile-find-file-in-directory)
  ("g"   ggtags-update-tags)
  ("s-g" ggtags-update-tags)
  ("i"   projectile-ibuffer)
  ("K"   projectile-kill-buffers)
  ("s-k" projectile-kill-buffers)
  ("m"   projectile-multi-occur)
  ("o"   projectile-multi-occur)
  ("s-p" projectile-switch-project "switch project")
  ("p"   projectile-switch-project)
  ("s"   projectile-switch-project)
  ("r"   projectile-recentf)
  ("x"   projectile-remove-known-project)
  ("X"   projectile-cleanup-known-projects)
  ("z"   projectile-cache-current-file)
  ("`"   hydra-projectile-other-window/body "other window")
  ("q"   nil "cancel" :color blue))

;; Hydra - Multiple cursors
(defhydra multiple-cursors-hydra (:hint nil)
  "
     ^Up^            ^Down^        ^Miscellaneous^
----------------------------------------------
[_p_]   Next    [_n_]   Next    [_l_] Edit lines
[_P_]   Skip    [_N_]   Skip    [_a_] Mark all
[_M-p_] Unmark  [_M-n_] Unmark  [_q_] Quit"
  ("l" mc/edit-lines :exit t)
  ("a" mc/mark-all-like-this :exit t)
  ("n" mc/mark-next-like-this)
  ("N" mc/skip-to-next-like-this)
  ("M-n" mc/unmark-next-like-this)
  ("p" mc/mark-previous-like-this)
  ("P" mc/skip-to-previous-like-this)
  ("M-p" mc/unmark-previous-like-this)
  ("q" nil))



;;;;;;;;;;;;;;;;
;; Key chords ;;
;;;;;;;;;;;;;;;;
(key-chord-define-global ",x" 'smex)
(key-chord-define-global ",l" 'ido-switch-buffer)
(key-chord-define-global ",t" 'projectile-find-file-in-known-projects) ; TODO create hydra for projectile
(key-chord-define-global ",f" 'projectile-find-file)
(key-chord-define-global ",s" 'projectile-switch-project)
;;(key-chord-define-global ",d" 'ot/duplicate-current-line-or-region)
(key-chord-define-global ",w" 'save-buffer)

;;;;;;;;;;;;;;;;;;;;;;;
;; Other keybindings ;;
;;;;;;;;;;;;;;;;;;;;;;;

(define-key paredit-mode-map [H-backspace] 'paredit-forward-delete)
(define-key paredit-mode-map (kbd "C-d") 'ot/paredit-duplicate-after-point)

(global-set-key (kbd "C-d") 'ot/duplicate-current-line-or-region)

(global-set-key [H-backspace] 'delete-char)


(define-key isearch-mode-map (kbd "C-'") 'avy-isearch)

;; Activate occur easily inside isearch
(define-key isearch-mode-map (kbd "C-o")
  (lambda () (interactive)
    (let ((case-fold-search isearch-case-fold-search))
      (occur (if isearch-regexp isearch-string (regexp-quote isearch-string))))))

(global-set-key (kbd "<M-return>") 'ot/open-line-below)

;; (evil-global-set-key 'normal "\\d" 'ot/duplicate-current-line-or-region)

;; org-mode keybindings
;; (global-set-key (kbd "C-c a") 'org-agenda)

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

;; company-mode
(with-eval-after-load 'company
  (define-key company-active-map (kbd "C-j") 'company-select-next)
  (define-key company-active-map (kbd "C-k") 'company-select-previous)
  (define-key company-active-map (kbd "C-/") 'company-search-candidates)
  (define-key company-active-map (kbd "C-M-/") 'company-filter-candidates)
  (define-key company-active-map (kbd "C-d") 'company-show-doc-buffer))

;; Helm
;;(global-set-key (kbd "M-y") 'helm-show-kill-ring)

;; Move up and down like isearch
(define-key helm-swoop-map (kbd "C-k") 'helm-previous-line)
(define-key helm-swoop-map (kbd "C-j") 'helm-next-line)
(define-key helm-multi-swoop-map (kbd "C-k") 'helm-previous-line)
(define-key helm-multi-swoop-map (kbd "C-j") 'helm-next-line)

;; From helm-swoop to helm-multi-swoop-all
(define-key helm-swoop-map (kbd "M-i") 'helm-multi-swoop-all-from-helm-swoop)

;; using C-u for up already
(global-set-key (kbd "C-M-u") 'universal-argument)

(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "C-x C-i") 'idomenu)
(global-set-key (kbd "C-x C-b") 'ibuffer)
;; (define-key evil-visual-state-map ",x" 'smex)
;; (define-key evil-visual-state-map ",X" 'smex-major-mode-commands)
;; (define-key evil-normal-state-map ",l" 'ido-switch-buffer)
;; (define-key evil-normal-state-map ",ut" 'undo-tree-visualize)

;; (define-key evil-normal-state-map "\\rb" 'ot/indent-whole-buffer)

;; Help should search more than just commands
(define-key 'help-command "a" 'apropos)

;; Comments
;; (define-key evil-normal-state-map ",;" 'evilnc-comment-or-uncomment-lines)
;; (define-key evil-visual-state-map ",;" 'comment-or-uncomment-region)

;; Lisp
(define-key read-expression-map (kbd "TAB") 'lisp-complete-symbol)
(define-key lisp-mode-shared-map (kbd "RET") 'reindent-then-newline-and-indent)

;; Windows
(global-set-key (kbd "C-x o") 'ido-select-window)

;;; esc quits

(define-key minibuffer-local-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-ns-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-completion-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-must-match-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-isearch-map [escape] 'minibuffer-keyboard-quit)

;;(define-key evil-insert-state-map (kbd "C-SPC") 'avy-goto-char)
;;(define-key evil-insert-state-map (kbd "C-x") 'evil-execute-in-normal-state)

;; Normal
;;(define-key evil-normal-state-map " m" 'evil-jump-item)

;; Projectile
;; (define-key evil-normal-state-map ",t" 'projectile-find-file-in-known-projects)
;; (define-key evil-normal-state-map ",pf" 'projectile-find-file)
;; (define-key evil-normal-state-map ",f" 'projectile-find-file)
;; (define-key evil-normal-state-map ",ps" 'projectile-switch-project)
;; (define-key evil-normal-state-map ",s" 'projectile-switch-project)
;; (define-key evil-normal-state-map ",prs" 'projectile-replace)
;; (define-key evil-normal-state-map ",pk" 'projectile-kill-buffers)
;; (define-key evil-normal-state-map ",pd" 'projectile-dired)
;; (define-key evil-normal-state-map ",prf" 'projectile-recentf)
;; (define-key evil-normal-state-map ",pi" 'projectile-invalidate-cache)
;; (define-key evil-normal-state-map ",pc" 'projectile-cache-current-file)
;; (define-key evil-normal-state-map ",pb" 'projectile-switch-to-buffer)
;; (define-key evil-normal-state-map ",b" 'projectile-switch-to-buffer)
;; (define-key evil-normal-state-map ",po" 'projectile-multi-occur)
;; (define-key evil-normal-state-map ",pa" 'projectile-ack)
;; (define-key evil-normal-state-map ",prt" 'projectile-regenerate-tags)
;; (define-key evil-normal-state-map ",pt" 'projectile-find-tag)
;; (define-key evil-normal-state-map ",pg" 'projectile-grep)

;;Make evil-mode up/down operate in screen lines instead of logical lines
;; (define-key evil-normal-state-map (kbd "j") 'evil-next-visual-line)
;; (define-key evil-normal-state-map (kbd "k") 'evil-previous-visual-line)
;; (define-key evil-visual-state-map (kbd "j") 'evil-next-visual-line)
;; (define-key evil-visual-state-map (kbd "k") 'evil-previous-visual-line)

;; Make the current definition and/or comment visible.
;;(define-key evil-normal-state-map "zf" 'reposition-window)

;; Paredit / Paxedit
;; (evil-define-key 'normal paredit-mode-map "\\q" '(lambda () (kill-buffer "*nREPL error*")))
;; (evil-define-key 'normal paredit-mode-map "\\fd" 'paredit-focus-on-defun)
;; (evil-define-key 'normal paredit-mode-map "\\wr" 'ot/evil-paredit-wrap-round)
;; (evil-define-key 'normal paredit-mode-map "\(" 'ot/evil-paredit-wrap-round)
;; (evil-define-key 'normal paredit-mode-map "\\ws" 'paredit-wrap-square)
;; (evil-define-key 'normal paredit-mode-map "\\W" 'paredit-wrap-square)
;; (evil-define-key 'normal paredit-mode-map "\\w[" 'paredit-wrap-square)
;; (evil-define-key 'normal paredit-mode-map "\\[" 'paredit-wrap-square)
;; (evil-define-key 'normal paredit-mode-map "\\]" 'paredit-wrap-square)
;; (evil-define-key 'normal paredit-mode-map "\\wc" 'paredit-wrap-curly)
;; (evil-define-key 'normal paredit-mode-map "\\w{" 'paredit-wrap-curly)
;; (evil-define-key 'normal paredit-mode-map "\\{" 'paredit-wrap-curly)
;; (evil-define-key 'normal paredit-mode-map "\\}" 'paredit-wrap-curly)
;; (evil-define-key 'normal paredit-mode-map "\\d" 'ot/paredit-duplicate-after-point)
;; (evil-define-key 'normal paredit-mode-map "\\S" 'paredit-split-sexp)
;; (evil-define-key 'normal paredit-mode-map "\\s" 'paredit-splice-sexp)
;; (evil-define-key 'normal paredit-mode-map "\\fs" 'paredit-splice-sexp-killing-forward)
;; (evil-define-key 'normal paredit-mode-map "\\bs" 'paredit-splice-sexp-killing-backward)
;; (evil-define-key 'normal paredit-mode-map (kbd "<backspace>") 'paredit-splice-sexp-killing-backward)
;; (evil-define-key 'insert paredit-mode-map (kbd "<C-backspace>") 'paredit-splice-sexp-killing-backward)
;; (evil-define-key 'normal paredit-mode-map "\\j" 'paredit-join-sexps)
;; (evil-define-key 'normal paredit-mode-map "\\rf" 'paredit-reindent-defun)

;; (evil-define-key 'normal paredit-mode-map "\\R" 'paxedit-raise-sexp)
;; (evil-define-key 'normal paredit-mode-map "\\c" 'paxedit-copy)
;; (evil-define-key 'normal paredit-mode-map "\\tb" 'paxedit-transpose-backward)
;; (evil-define-key 'normal paredit-mode-map "\\tf" 'paxedit-transpose-forward)
;; (evil-define-key 'normal paredit-mode-map (kbd "M-<right>") 'paxedit-transpose-forward)
;; (evil-define-key 'insert paredit-mode-map (kbd "M-<right>") 'paxedit-transpose-forward)
;; (evil-define-key 'normal paredit-mode-map (kbd "M-<left>") 'paxedit-transpose-backward)
;; (evil-define-key 'insert paredit-mode-map (kbd "M-<left>") 'paxedit-transpose-backward)

;; (evil-define-key 'normal paredit-mode-map (kbd "M->") 'paredit-forward-slurp-sexp)
;; (evil-define-key 'normal paredit-mode-map (kbd "M-<") 'paredit-forward-barf-sexp)
;; (evil-define-key 'normal paredit-mode-map (kbd "C-<") 'paredit-backward-slurp-sexp)
;; (evil-define-key 'normal paredit-mode-map (kbd "C->") 'paredit-backward-barf-sexp)

;; (evil-define-key 'normal paredit-mode-map (kbd "M-;") 'ot/evil-paredit-comment-dwim)

;; (evil-define-key 'visual paredit-mode-map "[" 'paredit-wrap-square)
;; (evil-define-key 'visual paredit-mode-map "]" 'paredit-wrap-square)
;; (evil-define-key 'visual paredit-mode-map "{" 'paredit-wrap-curly)
;; (evil-define-key 'visual paredit-mode-map "}" 'paredit-wrap-curly)

;; (evil-define-key 'visual paredit-mode-map "(" 'ot/evil-paredit-wrap-round)
;; (evil-define-key 'visual paredit-mode-map ")" 'paredit-wrap-round)
;; (evil-define-key 'normal paredit-mode-map "(" 'ot/evil-paredit-wrap-round)
;; (evil-define-key 'normal paredit-mode-map ")" 'paredit-wrap-round)

;; Clojure / Cider
;; (evil-define-key 'normal clojure-mode-map ",ch" 'ot/helm-clojure-headlines)
;; (evil-define-key 'normal clojure-mode-map (kbd "<C-return>") 'cider-eval-defun-at-point)
;; (evil-define-key 'insert clojure-mode-map (kbd "<C-return>") 'cider-eval-defun-at-point)
;; (evil-define-key 'visual clojure-mode-map (kbd "<C-return>") 'cider-eval-region)
;; (evil-define-key 'normal clojure-mode-map "\\es" 'cider-eval-last-sexp)
;; (evil-define-key 'normal clojure-mode-map "\\en" 'cider-eval-ns-form)
;; (evil-define-key 'normal clojure-mode-map "\\eb" 'cider-load-buffer)
;; (evil-define-key 'normal clojure-mode-map ",cb" 'cider-repl-clear-buffer)
;; (evil-define-key 'normal clojure-mode-map ",cc" 'cider-connect)
;; (evil-define-key 'normal clojure-mode-map ",cj" 'cider-jack-in)
;; (evil-define-key 'normal clojure-mode-map (kbd "M-.") 'cider-jump-to-var)
;; (evil-define-key 'normal clojure-mode-map (kbd "M-,") 'cider-jump-back)
;; (evil-define-key 'normal clojure-mode-map "\\i" 'cider-inspect)
;; (evil-define-key 'normal clojure-mode-map "\\t" 'cider-toggle-trace)
;; (evil-define-key 'normal clojure-mode-map "\\D" 'cider-doc)
;; (evil-define-key 'normal clojure-mode-map "\\a" 'cider-apropos)
;; (evil-define-key 'normal clojure-mode-map "\\A" 'cider-apropos-documentation)
;; (evil-define-key 'normal clojure-mode-map ",je" 'cider-jump-to-compilation-error)
;; (evil-define-key 'normal clojure-mode-map ",jr" 'cider-jump-to-resource)

;; neotree
;;(add-hook 'neotree-mode-hook
;;          (lambda ()
;;            (define-key evil-normal-state-local-map (kbd "TAB") 'neotree-enter)
;;            (define-key evil-normal-state-local-map (kbd "SPC") 'neotree-enter)
;;            (define-key evil-normal-state-local-map (kbd "q") 'neotree-hide)
;;            (define-key evil-normal-state-local-map (kbd "RET") 'neotree-enter)))

(provide 'custom-keybindings)
