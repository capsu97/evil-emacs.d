(global-set-key "\C-x\C-m" 'smex)
(global-set-key "\C-c\C-m" 'smex-major-mode-commands)
;; Use helm for opening files
;;(global-set-key "\C-x\C-f" 'helm-mini)

(defun ot-mark-outside-pairs ()
    (interactive)
    (er/expand-region 1)
    (er/mark-outside-pairs))

(global-set-key (kbd "C-=") 'ot-mark-outside-pairs)
(global-set-key (kbd "M-=") 'er/expand-region)

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

(provide 'emacs-keybindings)
