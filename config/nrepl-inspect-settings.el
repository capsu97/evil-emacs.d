(add-to-list 'load-path "~/.emacs.d/vendor/nrepl-inspect")
(require 'nrepl-inspect)

(define-key nrepl-interaction-mode-map (kbd "C-c C-i") 'nrepl-inspect)

(provide 'nrepl-inspect-settings)
