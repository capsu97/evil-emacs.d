;;; nRepl config
;(require 'nrepl)

(autoload 'nrepl-repl-mode "nrepl-mode" "nrepl mode" t)

(setq nrepl-hide-special-buffers t)
;(setq nrepl-popup-stacktraces-in-repl t)

(eval-after-load "nrepl"
  '(progn
        (setq nrepl-popup-stacktraces nil) ;Stop the error buffer from popping up while working in the REPL buffer
        (add-to-list 'same-window-buffer-names "*nrepl*") ;Make C-c C-z switch to the *nrepl* buffer in the current window
     ))

(add-hook 'nrepl-interaction-mode-hook
  'nrepl-turn-on-eldoc-mode) ; Enable eldoc in clojure buffers
(add-hook 'nrepl-repl-mode-hook 'subword-mode) ;Enabling CamelCase support for editing commands(like forward-word, backward-word, etc) in nREPL
(add-hook 'nrepl-repl-mode-hook 'paredit-mode) ;Enable paredit in nRepl buffer
(add-hook 'nrepl-repl-mode-hook 'rainbow-delimiters-mode) ; rainbow delimiters
(add-hook 'nrepl-repl-mode-hook '(lambda () (linum-mode 0)))
(add-hook 'nrepl-tmp-mode-hook '(lambda () (linum-mode 0)))

(defun my-nrepl-mode-setup ()
  (require 'nrepl-ritz))

;; turned off because of autocomplete not fully functional. have to
;check this out
(add-hook 'nrepl-interaction-mode-hook 'my-nrepl-mode-setup)

;; Clojure mode
(add-hook 'clojure-mode-hook 'nrepl-interaction-mode)

;; Autocomplete
(require 'ac-nrepl)
(add-hook 'nrepl-repl-mode-hook 'ac-nrepl-setup)
(add-hook 'nrepl-interaction-mode-hook 'ac-nrepl-setup)
(eval-after-load "auto-complete"
 '(add-to-list 'ac-modes 'nrepl-repl-mode))

;;If you want to trigger auto-complete using TAB in nrepl buffers, you may want to put auto-complete into your completion-at-point-functions:
(defun set-auto-complete-as-completion-at-point-function ()
  (setq completion-at-point-functions '(auto-complete)))
(add-hook 'auto-complete-mode-hook 'set-auto-complete-as-completion-at-point-function)

(add-hook 'nrepl-repl-mode-hook 'set-auto-complete-as-completion-at-point-function)
(add-hook 'nrepl-interaction-mode-hook 'set-auto-complete-as-completion-at-point-function)

;; You might consider using ac-nrepl's popup documentation in place of nrepl-doc:
(define-key nrepl-interaction-mode-map (kbd "C-c C-d") 'ac-nrepl-popup-doc)

(provide 'nrepl-settings)
