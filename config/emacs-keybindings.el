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

(global-set-key (kbd "C-x o") 'ido-select-window)

(defalias 'qrr 'query-replace-regexp)

(provide 'emacs-keybindings)
