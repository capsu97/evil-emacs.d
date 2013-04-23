(global-set-key "\C-x\C-m" 'execute-extended-command)
(global-set-key "\C-c\C-m" 'execute-extended-command)
;; Use helm for opening files
;;(global-set-key "\C-x\C-f" 'helm-mini)

(defun ot-mark-outside-pairs ()
    (interactive)
    (er/expand-region 1)
    (er/mark-outside-pairs))

(global-set-key (kbd "C-=") 'ot-mark-outside-pairs)

;(global-set-key (kbd "C-l") 'forward-char)
;(global-set-key (kbd "C-h") 'backward-char)
;(global-set-key (kbd "C-j") 'next-line)
;(global-set-key (kbd "C-k") 'previous-line)
;(global-set-key (kbd "M-l") 'forward-word)
;(global-set-key (kbd "M-h") 'backward-word)
;(global-set-key (kbd "M-k") 'beginning-of-buffer)
;(global-set-key (kbd "M-j") 'end-of-buffer)
;(global-set-key (kbd "C-f") 'scroll-up-command)
;(global-set-key (kbd "C-b") 'scroll-down-command)


(defalias 'qrr 'query-replace-regexp)

(provide 'my-emacs-keybindings)