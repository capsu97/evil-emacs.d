;; Turn off hl-line-mode from starterkit
(remove-hook 'prog-mode-hook 'esk-turn-on-hl-line-mode)
;; Turn off highlighting words under cursor from starterkit
;(remove-hook 'prog-mode-hook 'idle-highlight-mode)

; Disable scroll jump
(setq scroll-step 1)

; Highlight selected text - Ctrl-Space
(transient-mark-mode t)

; Delete selected/highlighted text
(delete-selection-mode t)

(setq
    inhibit-startup-message   t   ; Don't want any startup message
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
    read-buffer-completion-ignore-case t
    completion-auto-help 'lazy
    isearch-resume-in-command-history t
    kill-read-only-ok t
    isearch-allow-scroll t
    visible-bell nil
    ;kill-do-not-save-duplicates t)
    ;require-final-newline t)
    frame-title-format '("%b %+%+ %f"))

(if (fboundp 'tool-bar-mode) (tool-bar-mode -1)) ; turn off the toolbar
(column-number-mode 1) ; show the column number
(size-indication-mode 1) ; show the size of the buffer
(auto-fill-mode 1)
;;(global-hl-line-mode t) ; highlighting the whole line
(global-subword-mode 1) ; moving cursor in CamelCaseWords
(blink-cursor-mode 0) ; blinking cursor
(set-default 'indicate-empty-lines nil) ; don't indicate empty lines
; (set-default 'cursor-type 'bar)
;; (set-default 'cursor-type '(bar . 2))

(fset 'yes-or-no-p 'y-or-n-p)

(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)

(put 'set-goal-column 'disabled nil) ; handy for moving down a column (always goes to the same position when set)

;; Line numbers
(global-linum-mode t)

;; Recent files
(recentf-mode 1)
(setq recentf-max-menu-items 25)

(setq show-paren-delay 0)
;(setq show-paren-style 'mixed)

;; Macbook, make fn function as meta
(setq-default mac-function-modifier 'meta)

;(setq show-paren-style 'expression) ; highlight all code inbetween

;; Allow replacement of selected region or deletion of selected region by typing or using DEL
(delete-selection-mode 1)

(provide 'basic-settings)