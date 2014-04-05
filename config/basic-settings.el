(add-hook 'prog-mode-hook 'esk-local-column-number-mode)
(add-hook 'prog-mode-hook 'esk-local-comment-auto-fill)
(add-hook 'prog-mode-hook 'esk-turn-on-save-place-mode)
(add-hook 'prog-mode-hook 'esk-pretty-lambdas)
(add-hook 'prog-mode-hook 'esk-add-watchwords)
(add-hook 'prog-mode-hook 'idle-highlight-mode)

;; diff-hl
(global-diff-hl-mode)

;; Emmet mode
(add-hook 'sgml-mode-hook 'emmet-mode) ;; Auto-start on any markup modes
(add-hook 'css-mode-hook  'emmet-mode) ;; enable Emmet's css
;; abbreviation
(setq emmet-move-cursor-between-quotes t) ;; default nil

;; smex
(setq smex-save-file (concat user-emacs-directory ".smex-items"))
(smex-initialize)

; Truncate lines
(set-default 'truncate-lines t)

; Smooth scrolling
(setq scroll-step 1)
(setq scroll-conservatively 10000)
(setq auto-window-vscroll nil)
(setq scroll-margin 2)

; Highlight selected text - Ctrl-Space
(transient-mark-mode t)

; Delete selected/highlighted text
(delete-selection-mode t)

(mouse-wheel-mode t)
(blink-cursor-mode -1)

(setq
    inhibit-startup-message   t   ; Don't want any startup message
    gc-cons-threshold 20000000
    make-backup-files         nil ; Don't want any backup files
    auto-save-list-file-name  nil ; Don't want any .saves files
    auto-save-default         nil ; Don't want any auto saving
    redisplay-dont-pause t
    ns-pop-up-frames nil         ; don't open a new frame when using Open with... for instance
    search-highlight           t ; Highlight search object
    query-replace-highlight    t ; Highlight query object
    mouse-sel-retain-highlight t ; Keep mouse high-lightening
    ;next-line-add-newlines     t
    read-file-name-completion-ignore-case t
    x-select-enable-clipboard t
    x-select-enable-primary t
    save-interprogram-paste-before-kill t
    apropos-do-all t
    read-buffer-completion-ignore-case t
    completion-auto-help 'lazy
    isearch-resume-in-command-history t
    kill-read-only-ok t
    isearch-allow-scroll t
    visible-bell nil
    color-theme-is-global t
    sentence-end-double-space nil
    shift-select-mode nil
    mouse-yank-at-point t
    uniquify-buffer-name-style 'forward
    whitespace-style '(face trailing lines-tail tabs)
    whitespace-line-column 80
    ediff-window-setup-function 'ediff-setup-windows-plain
    save-place-file (concat user-emacs-directory "places")
    diff-switches "-u"
    ;kill-do-not-save-duplicates t)
    ;require-final-newline t)
    frame-title-format '("%b %+%+ %f"))

(add-to-list 'safe-local-variable-values '(lexical-binding . t))
(add-to-list 'safe-local-variable-values '(whitespace-line-column . 80))

(setq browse-url-browser-function 'browse-url-firefox)

(if (fboundp 'tool-bar-mode) (tool-bar-mode -1)) ; turn off the toolbar
(column-number-mode 1) ; show the column number
(size-indication-mode 1) ; show the size of the buffer
(auto-fill-mode 1)
;;(global-hl-line-mode t) ; highlighting the whole line
(global-subword-mode 1) ; moving cursor in CamelCaseWords
(blink-cursor-mode 0) ; blinking cursor
(set-default 'indicate-empty-lines nil) ; don't indicate empty lines

(fset 'yes-or-no-p 'y-or-n-p)

(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)

(put 'set-goal-column 'disabled nil) ; handy for moving down a column (always goes to the same position when set)

;; Recent files
(recentf-mode 1)
(setq recentf-max-menu-items 25)

;; Highlight matching parentheses when the point is on them.
(show-paren-mode 1)

(setq show-paren-delay 0)
;(setq show-paren-style 'mixed)

;; Macbook, make fn function as meta
(setq-default mac-function-modifier 'meta)

;(setq show-paren-style 'expression) ; highlight all code inbetween

;; Allow replacement of selected region or deletion of selected region by typing or using DEL
(delete-selection-mode 1)

;; ido-mode is like magic pixie dust!
(setq ido-enable-prefix nil
      ido-enable-flex-matching t
      ido-auto-merge-work-directories-length nil
      ido-create-new-buffer 'always
      ido-use-filename-at-point 'guess
      ido-use-virtual-buffers t
      ido-enable-regexp nil
      ido-enable-last-directory-history nil
      ido-handle-duplicate-virtual-buffers 2
      confirm-nonexistent-file-or-buffer nil
      ido-file-extension-order '(".clj" ".cljs" ".el" ".org" ".txt")
      ido-ignore-buffers '("\\` " "^\*")
      ido-max-prospects 10
      ido-use-faces nil ;; disable ido faces to see flx highlights
      flx-ido-use-faces t ;; enable flx highlights
      )

(require 'flx-ido)
(ido-mode t)
(ido-ubiquitous-mode)
(flx-ido-mode 1)

(set-default 'indent-tabs-mode nil)
(set-default 'imenu-auto-rescan t)

(add-hook 'text-mode-hook 'turn-on-auto-fill)

(defalias 'auto-tail-revert-mode 'tail-mode)

(random t) ;; Seed the random-number generator

(require 'ido-vertical-mode)
(ido-vertical-mode 1)

(global-auto-revert-mode t)

;; persp-mode
(persp-mode t)
(setq wg-morph-on nil)

;; highlight surrounding parentheses
(add-hook 'prog-mode-hook 'highlight-parentheses-mode)

(provide 'basic-settings)
