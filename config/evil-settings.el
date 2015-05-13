;; lot of the variables need to be set BEFORE evil loads
(setq evil-move-cursor-back t
      evil-cross-lines t
      evil-want-fine-undo t
      evil-want-C-u-scroll t
      evil-want-C-w-in-emacs-state nil
      evil-want-C-w-delete t)

;; Evil VIM mode
(require 'evil)
(evil-mode 1)

(require 'evil-exchange)
;; change default key bindings (if you want) HERE
;; (setq evil-exchange-key (kbd "zx"))
(evil-exchange-install)

(setq evil-jumper-file (concat user-emacs-directory "evil-jumps")
            evil-jumper-auto-save-interval 3600)
      (evil-jumper-mode t)

;; Evil nerd commenter
(setq evilnc-hotkey-comment-operator ",,")
(require 'evil-nerd-commenter)

;; Evil surround
(require 'evil-surround)
(global-evil-surround-mode 1)
(add-to-list 'evil-surround-operator-alist
             '(evil-paredit-change . change))
(add-to-list 'evil-surround-operator-alist
             '(evil-paredit-delete . delete))

;; Abort company-mode when exiting insert mode
(defun abort-company-on-insert-state-exit ()
  (company-abort))
(add-hook 'evil-insert-state-exit-hook 'abort-company-on-insert-state-exit)

;; Initial states
(evil-set-initial-state 'nrepl-mode 'insert)

;; Hollow cursor
;;(setq evil-normal-state-cursor '("yellow" hollow))
(setq evil-normal-state-cursor '("orange" box))
(setq evil-insert-state-cursor '("orange" bar))

; Redefine function ("C-o o" wouldn't go back to insert mode for instance)
(defun evil-execute-in-normal-state ()
  "Execute the next command in Normal state."
  (interactive)
  (evil-delay '(not (memq this-command
                          '(evil-execute-in-normal-state
                            evil-use-register
                            digit-argument
                            negative-argument
                            universal-argument
                            universal-argument-minus
                            universal-argument-more
                            universal-argument-other-key)))
      `(progn
         (if (evil-insert-state-p)
             (let ((prev-state (cdr-safe (assoc 'normal evil-previous-state-alist))))
               (evil-change-state prev-state)
               (setq evil-previous-state 'normal))
           (evil-change-to-previous-state))
         (setq evil-move-cursor-back ',evil-move-cursor-back))
    'post-command-hook)
  (setq evil-move-cursor-back nil)
  (evil-normal-state)
  (evil-echo "Switched to Normal state for the next command ..."))

(global-vim-empty-lines-mode)

(provide 'evil-settings)
