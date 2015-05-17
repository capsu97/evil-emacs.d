(defun ot/web-mode-element-inside-previous ()
  (interactive)
  (web-mode-element-parent)
  (web-mode-element-previous)
  (web-mode-tag-end))

(defun ot/web-mode-element-inside-next ()
  (interactive)
  (web-mode-element-next)
  (web-mode-tag-end))

(defun ot/cider-eval-count-defun-at-point ()
  (interactive)
  (cider-interactive-eval
   (format "(count %s)"
           (cider-eval-defun-at-point))))

(defun ot/cider-nth-from-defun-at-point (n)
  (interactive "p")
  (cider-interactive-eval
   (format "(count %s %s)"
           (cider-eval-defun-at-point) n)))

(defun ot/cider-benchmark-defun-at-point ()
  (interactive)
  (cider-interactive-eval
   (format "(require 'criterium.core)
            (criterium.core/quick-benchmark %s)"
           (cider-eval-defun-at-point))))

(defun ot/evil-sp-wrap-with-round ()
  (interactive)
  (sp-wrap-with-pair "(")
  (evil-change-state 'insert)
  (insert " ")
  (backward-char 1))

(defun ot/evil-sp-wrap-with-curly ()
  (interactive)
  (sp-wrap-with-pair "{")
  (evil-change-state 'insert)
  (insert " ")
  (backward-char 1))

(defun ot/evil-sp-wrap-with-square ()
  (interactive)
  (sp-wrap-with-pair "[")
  (evil-change-state 'insert)
  (insert " ")
  (backward-char 1))

(defun ot/mark-outside-pairs ()
  (interactive)
  (er/expand-region 1)
  (er/mark-outside-pairs))

(defun ot/goto-match-beginning ()
  (when (and isearch-forward isearch-other-end (not isearch-mode-end-hook-quit))
    (goto-char isearch-other-end)))

(defun ot/paredit-duplicate-after-point
    ()
  "Duplicates the content of the line that is after the point."
  (interactive)
  ;; skips to the next sexp
  (while (looking-at " ")
    (forward-char))
  (set-mark-command nil)
  ;; while we find sexps we move forward on the line
  (while (and (bounds-of-thing-at-point 'sexp)
              (<= (point) (car (bounds-of-thing-at-point 'sexp)))
              (not (= (point) (line-end-position))))
    (forward-sexp)
    (while (looking-at " ")
      (forward-char)))
  (kill-ring-save (mark) (point))
  ;; go to the next line and copy the sexprs we encountered
  (paredit-newline)
  (yank)
  (exchange-point-and-mark))

(provide 'my-defuns)
