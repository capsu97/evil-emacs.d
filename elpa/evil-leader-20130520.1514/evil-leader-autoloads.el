;;; evil-leader-autoloads.el --- automatically extracted autoloads
;;
;;; Code:


;;;### (autoloads (evil-leader/set-key-for-mode evil-leader/set-key
;;;;;;  global-evil-leader-mode evil-leader-mode) "evil-leader" "evil-leader.el"
;;;;;;  (20890 45604 0 0))
;;; Generated autoloads from evil-leader.el

(autoload 'evil-leader-mode "evil-leader" "\
Minor mode to enable <leader> support.

\(fn &optional ARG)" t nil)

(defvar global-evil-leader-mode nil "\
Non-nil if Global-Evil-Leader mode is enabled.
See the command `global-evil-leader-mode' for a description of this minor mode.
Setting this variable directly does not take effect;
either customize it (see the info node `Easy Customization')
or call the function `global-evil-leader-mode'.")

(custom-autoload 'global-evil-leader-mode "evil-leader" nil)

(autoload 'global-evil-leader-mode "evil-leader" "\
Toggle Evil-Leader mode in all buffers.
With prefix ARG, enable Global-Evil-Leader mode if ARG is positive;
otherwise, disable it.  If called from Lisp, enable the mode if
ARG is omitted or nil.

Evil-Leader mode is enabled in all buffers where
`(lambda nil (when evil-local-mode (evil-leader-mode)))' would do it.
See `evil-leader-mode' for more information on Evil-Leader mode.

\(fn &optional ARG)" t nil)

(autoload 'evil-leader/set-key "evil-leader" "\
Bind `key' to command `def' in `evil-leader/default-map'.

Key has to be readable by `read-kbd-macro' and `def' a command.
Accepts further `key' `def' pairs.

\(fn KEY DEF &rest BINDINGS)" t nil)

(autoload 'evil-leader/set-key-for-mode "evil-leader" "\
Create keybindings for major-mode `mode' with `key' bound to command `def'.

See `evil-leader/set-key'.

\(fn MODE KEY DEF &rest BINDINGS)" t nil)

;;;***

;;;### (autoloads nil nil ("evil-leader-pkg.el") (20890 45604 944600
;;;;;;  0))

;;;***

(provide 'evil-leader-autoloads)
;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; evil-leader-autoloads.el ends here
