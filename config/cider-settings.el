;;; nRepl config
;(require 'nrepl)

;(autoload 'cider-repl-mode "nrepl-mode" "nrepl mode" t)

(defun hide-eol ()
  "Do not show ^M in files containing mixed UNIX and DOS line endings."
  (interactive)
  (setq buffer-display-table (make-display-table))
  (aset buffer-display-table ?\^M []))

(add-hook 'cider-repl-mode-hook 'hide-eol)
(add-hook 'cider-popup-buffer-mode-hook 'hide-eol)

(setq nrepl-hide-special-buffers t)
;(setq nrepl-popup-stacktraces-in-repl t)

(eval-after-load "cider"
  '(progn
        (setq cider-popup-stacktraces nil) ;Stop the error buffer from popping up while working in the REPL buffer
        (add-to-list 'same-window-buffer-names "*nrepl*") ;Make C-c C-z switch to the *nrepl* buffer in the current window
     ))

(add-hook 'cider-mode-hook
  'cider-turn-on-eldoc-mode) ; Enable eldoc in clojure buffers
(add-hook 'cider-repl-mode-hook 'subword-mode) ;Enabling CamelCase support for editing commands(like forward-word, backward-word, etc) in nREPL
(add-hook 'cider-repl-mode-hook 'paredit-mode) ;Enable paredit in nRepl buffer
(add-hook 'cider-repl-mode-hook 'rainbow-delimiters-mode) ; rainbow delimiters
(add-hook 'cider-repl-mode-hook '(lambda () (linum-mode 0)))
;(add-hook 'nrepl-tmp-mode-hook '(lambda () (linum-mode 0)))

;(defun my-nrepl-mode-setup ()
;  (require 'nrepl-ritz))

;; turned off because of autocomplete not fully functional. have to
;check this out
;(add-hook 'cider-mode-hook 'my-nrepl-mode-setup)

;; Clojure mode
(add-hook 'clojure-mode-hook 'cider-mode)

;; Autocomplete
(require 'ac-nrepl)
(add-hook 'cider-repl-mode-hook 'ac-nrepl-setup)
(add-hook 'cider-mode-hook 'ac-nrepl-setup)
(eval-after-load "auto-complete"
 '(add-to-list 'ac-modes 'cider-repl-mode))

;;If you want to trigger auto-complete using TAB in nrepl buffers, you may want to put auto-complete into your completion-at-point-functions:
(defun set-auto-complete-as-completion-at-point-function ()
  (setq completion-at-point-functions '(auto-complete)))
(add-hook 'auto-complete-mode-hook 'set-auto-complete-as-completion-at-point-function)

(add-hook 'cider-repl-mode-hook 'set-auto-complete-as-completion-at-point-function)
(add-hook 'cider-mode-hook 'set-auto-complete-as-completion-at-point-function)

;; You might consider using ac-nrepl's popup documentation in place of nrepl-doc:
(define-key cider-mode-map (kbd "C-c C-d") 'ac-nrepl-popup-doc)

(provide 'cider-settings)
