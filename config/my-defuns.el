;; -*- lexical-binding: t -*-

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

;; Based on Bodil Stokke's version
;; Only if you duplicate something at the start of a line it will also add a newline above
(defun ot/paredit-duplicate-after-point
    (&optional prefix)
  "Duplicates the content of the line that is after the point."
  (interactive "P")
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
  (exchange-point-and-mark)
  (when prefix
    (paredit-newline)))

(defun ot/join-line ()
  (interactive)
  (join-line -1))

(defun ot/evil-paredit-wrap-sexp (open close)
  (interactive)
  (paredit-wrap-sexp nil open close)
  (evil-insert-state)
  (unless (looking-at-p (string close))
    (save-excursion
      (insert " "))))

(defun ot/evil-paredit-wrap-round ()
  (interactive)
  (ot/evil-paredit-wrap-sexp ?( ?)))

(defun ot/evil-paredit-wrap-curly ()
  (interactive)
  (ot/evil-paredit-wrap-sexp ?{ ?}))

(defun ot/evil-paredit-wrap-square ()
  (interactive)
  (ot/evil-paredit-wrap-sexp ?[ ?]))

(defun ot/move-lines-down-from-point ()
  "Insert empty lines above the current line but move the cursor down with the rest of the text."
  (interactive)
  (save-excursion
    (move-beginning-of-line nil)
    (newline-and-indent)))

(defun ot/avy-goto-paren (&optional prefix)
  (interactive "P")
  (let (ch)
    (if prefix
        (setq ch ")")
      (setq ch "("))
    (avy--generic-jump ch nil 'pre)))

(provide 'my-defuns)
