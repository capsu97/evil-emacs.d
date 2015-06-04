;; Multiple Cursors
(require 'multiple-cursors)
(setq mc/unsupported-minor-modes '(company-mode auto-complete-mode flyspell-mode jedi-mode))

;; Volatile Highlights
(require 'volatile-highlights)

;;(vhl/give-advice-to-make-vhl-on-changes evil-paste-after)
;;(vhl/give-advice-to-make-vhl-on-changes evil-paste-before)
;;(vhl/give-advice-to-make-vhl-on-changes evil-paste-pop)

(volatile-highlights-mode t)

;; Indent Guide
(require 'indent-guide)

(indent-guide-global-mode)

(setq indent-guide-recursive t)
(setq indent-guide-delay 0.1)

;; Key chords
(require 'key-chord)

(setq key-chord-two-keys-delay 0.1)

(key-chord-mode +1)

;; Redefine key-chord function so it only works when keypresses are in order. For instance ',x' works, 'x,' doesn't
;; Normally both work because it was meant for simultaneous key presses.
(defun key-chord-define (keymap keys command)
  (if (/= 2 (length keys))
      (error "Key-chord keys must have two elements"))
  (let ((key1 (logand 255 (aref keys 0)))
        (key2 (logand 255 (aref keys 1))))
    (if (eq key1 key2)
        (define-key keymap (vector 'key-chord key1 key2) command)
      (define-key keymap (vector 'key-chord key1 key2) command))))

(require 'whole-line-or-region)

(whole-line-or-region-mode 1)

;; Undo tree
;; Keep region when undoing in region
(defadvice undo-tree-undo (around keep-region activate)
  (if (use-region-p)
      (let ((m (set-marker (make-marker) (mark)))
            (p (set-marker (make-marker) (point))))
        ad-do-it
        (goto-char p)
        (set-mark m)
        (set-marker p nil)
        (set-marker m nil))
    ad-do-it))

;; Dired
;; Make dired less verbose
(require 'dired-details)
(setq-default dired-details-hidden-string "--- ")
(dired-details-install)

(provide 'misc-package-settings)
