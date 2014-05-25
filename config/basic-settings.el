;; go to beginning of match after search, not the end (not needed with evil)
;;(add-hook 'isearch-mode-end-hook 'my-goto-match-beginning)

;; Remove all backup files
(setq make-backup-files nil)
(setq backup-inhibited t)
(setq auto-save-default nil)

;; warn when opening files bigger than 100MB
(setq large-file-warning-threshold 100000000)

;; allow undo/redo of window layout
(winner-mode 1)

;; Remove useless whitespaces before saving a file
(add-hook 'before-save-hook 'whitespace-cleanup)
(add-hook 'before-save-hook (lambda() (delete-trailing-whitespace)))

;; General programming hooks
(add-hook 'prog-mode-hook 'pretty-lambdas)
(add-hook 'prog-mode-hook 'esk-add-watchwords)
;;(add-hook 'prog-mode-hook 'idle-highlight-mode)

;; SmartParens
;;(require 'smartparens-config)
;;(add-hook 'prog-mode-hook 'smartparens-strict-mode)

;; make colon part of word (for example :keyword)
(add-hook 'clojure-mode-hook (lambda () (modify-syntax-entry ?: "w")))
(add-hook 'prog-mode-hook (lambda () (modify-syntax-entry ?- "w")))

;; Turn off auto-fill
(auto-fill-mode -1)
(remove-hook 'text-mode-hook 'turn-on-auto-fill)
(remove-hook 'org-mode-hook 'turn-on-auto-fill)

;; default to utf8
(set-language-environment 'utf-8)
(setq locale-coding-system 'utf-8)
(prefer-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(setq-default buffer-file-coding-system 'utf-8)
(set-selection-coding-system 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)

;; Treat clipboard input as UTF-8 string first; compound text next, etc.
(setq x-select-request-type '(UTF8_STRING COMPOUND_TEXT TEXT STRING))

;; Turn on column numbering in modeline
(setq column-number-mode t)

;; Default to org-mode for txt files as well
(add-to-list 'auto-mode-alist '("\\.\\(org\\|org_archive\\|txt\\)$" . org-mode))

;; diff-hl
(global-diff-hl-mode)

;; abbreviation
(setq emmet-move-cursor-between-quotes t) ;; default nil

;; smex
(setq smex-save-file (concat user-emacs-directory ".smex-items"))
(smex-initialize)

;; Truncate lines
(set-default 'truncate-lines t)

;; Smooth scrolling
(setq scroll-step 1)
(setq scroll-conservatively 10000)
(setq auto-window-vscroll nil)
(setq scroll-margin 2)

;; Highlight selected text - Ctrl-Space
(transient-mark-mode t)

;; Column numbering in modeline
(setq column-number-mode t)

;; Delete selected/highlighted text
(delete-selection-mode t)

;; Go back to the cursor location where you were the last time you opened the file
(setq
 save-place-file (concat user-emacs-directory "places")
 save-place-mode t)

(mouse-wheel-mode t)
(blink-cursor-mode -1) ; no blinking cursor

(setq
 inhibit-startup-message   t   ; Don't want any startup message
 echo-keystrokes 0.1
 use-dialog-box nil           ; use no dialog boxes, just use the echo area / mini-buffer
 gc-cons-threshold 20000000
 redisplay-dont-pause t
 ns-pop-up-frames nil         ; don't open a new frame when using Open with... for instance
 search-highlight           t ; Highlight search object
 query-replace-highlight    t ; Highlight query object
 mouse-sel-retain-highlight t ; Keep mouse high-lightening
 read-file-name-completion-ignore-case t
 x-select-enable-clipboard t
 x-select-enable-primary t
 ;;save-interprogram-paste-before-kill t ; has problems with evil-mode in osx!!
 next-line-add-newlines t
 apropos-do-all t
 scroll-error-top-bottom t ; move to farthest point when not able to move up or down enough lines
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
 diff-switches "-u"
 frame-title-format '("%b %+%+ %f"))

(add-to-list 'safe-local-variable-values '(lexical-binding . t))
(add-to-list 'safe-local-variable-values '(whitespace-line-column . 80))

(setq browse-url-browser-function 'browse-url-firefox)

(if (fboundp 'tool-bar-mode) (tool-bar-mode -1)) ; turn off the toolbar
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1)) ; turn off the menubar
(size-indication-mode 1) ; show the size of the buffer
(global-superword-mode 1)
(set-default 'indicate-empty-lines nil) ; don't indicate empty lines

(fset 'yes-or-no-p 'y-or-n-p)

(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)

(put 'set-goal-column 'disabled nil) ; handy for moving down a column (always goes to the same position when set)

;; Recent files
(recentf-mode 1)
(setq recentf-max-menu-items 25)

;; Highlight matching parentheses when the point is on them.
(show-paren-mode)
(setq show-paren-delay 0)
;;(show-smartparens-global-mode t)

;; Macbook, make fn function as meta
(setq-default mac-function-modifier 'meta)
(setq-default mac-command-modifier 'meta)
(setq-default mac-option-modifier 'meta)

;; Allow replacement of selected region or deletion of selected region by typing or using DEL
(delete-selection-mode 1)

;; ido-mode is like magic pixie dust!
(setq ido-enable-prefix nil
      ido-enable-flex-matching t
      ido-case-fold  t                 ; be case-insensitive
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
      ido-ignore-extensions t
      ido-max-prospects 10
      ido-use-faces nil ;; disable ido faces to see flx highlights
      flx-ido-use-faces t ;; enable flx highlights
      ido-vertical-define-keys 'C-n-C-p-up-down-left-right
      )

;; Always allow narrowing, don't ask questions
(put 'narrow-to-defun  'disabled nil)
(put 'narrow-to-page   'disabled nil)
(put 'narrow-to-region 'disabled nil)

;;;; ido customization
(require 'flx-ido)
(ido-mode t)
(ido-ubiquitous-mode)
(flx-ido-mode 1)

(require 'ido-vertical-mode)
(ido-vertical-mode 1)

(set-default 'indent-tabs-mode nil) ; use spaces for indenting, not tabs

(set-default 'imenu-auto-rescan t) ; automatically rescan for changes for imenu

(defalias 'auto-tail-revert-mode 'tail-mode)

(random t) ;; Seed the random-number generator

;; Auto refresh buffers
(global-auto-revert-mode t)

;; Also auto refresh dired (the directory editor), but be quiet about it
(setq global-auto-revert-non-file-buffers t)
(setq auto-revert-verbose nil)

;; persp-mode, turned off because of bad startup performance
;;(persp-mode t)
;;(setq wg-morph-on nil)

;; highlight surrounding parentheses
(add-hook 'prog-mode-hook 'highlight-parentheses-mode)

;; disable highlighting the current line
(global-hl-line-mode 0)

(provide 'basic-settings)
