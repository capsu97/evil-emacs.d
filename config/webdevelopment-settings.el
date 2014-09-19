(setq web-mode-enable-current-element-highlight t)

(require 'web-mode)

;; expand region
(require 'html-mode-expansions)

;; use emmet
(add-hook 'sgml-mode-hook 'emmet-mode) ;; Auto-start on any markup modes
(add-hook 'css-mode-hook  'emmet-mode) ;; enable Emmet's css
(add-hook 'web-mode-hook  'emmet-mode) ;; enable Emmet's css

(defun emmet-mode-hook-settings ()
  "Hook for Emmet"
  (setq emmet-preview-default nil)
  (setq emmet-indentation 2))

(add-hook 'emmet-mode-hook 'emmet-mode-hook-settings) ;; indent 2 spaces.

(add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.jsp\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))

(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))

(defun web-mode-hook-settings ()
  "Hooks for Web mode."
  (setq web-mode-markup-indent-offset 2)
  (setq web-mode-css-indent-offset 2)
  (setq web-mode-code-indent-offset 2)
  (setq web-mode-indent-style 2)
  (setq web-mode-enable-auto-pairing t)
  (setq web-mode-enable-css-colorization t)
  (idle-highlight-mode 0)
  ;;    (font-lock-mode 0)
  )

;;(set-face-foreground 'web-mode-html-tag-face "snow1")
;;(set-face-foreground 'web-mode-doctype-face "pink3")
;;(set-face-foreground 'web-mode-html-attr-name-face "medium purple")
;;(set-face-foreground 'web-mode-html-attr-value-face "pink3")
;;(set-face-foreground 'web-mode-css-rule-face "pink3")
;;(set-face-foreground 'web-mode-css-prop-face "pink3")
;;(set-face-foreground 'web-mode-css-pseudo-class-face "pink3")
;;(set-face-foreground 'web-mode-css-at-rule-face "pink3")
;;(set-face-foreground 'web-mode-preprocessor-face "pink3")
;;(set-face-foreground 'web-mode-string-face "pink3")
;;(set-face-foreground 'web-mode-comment-face "pink3")
;;(set-face-foreground 'web-mode-variable-name-face "pink3")
;;(set-face-foreground 'web-mode-function-name-face "pink3")
;;(set-face-foreground 'web-mode-constant-face "pink3")
;;(set-face-foreground 'web-mode-type-face "pink3")
;;(set-face-foreground 'web-mode-keyword-face "pink3")
;;(set-face-foreground 'web-mode-folded-face "pink3")
;;(set-face-foreground 'web-mode-server-face "pink3")
;;(set-face-foreground 'web-mode-css-face "pink3")
;;(set-face-foreground 'web-mode-javascript-face "pink3")


(add-hook 'web-mode-hook 'web-mode-hook-settings)
(add-hook 'web-mode-hook 'font-lock-mode)

;; ENHANCE JAVASCRIPT

;; use js mode for json files
(add-to-list 'auto-mode-alist '("\\.json$" . js-mode))

(eval-after-load 'js
  '(progn (define-key js-mode-map "{" 'paredit-open-curly)
          (define-key js-mode-map "}" 'paredit-close-curly-and-newline)
          (add-hook 'js-mode-hook 'esk-paredit-nonlisp)
          (setq js-indent-level 2)
          ;; fixes problem with pretty function font-lock
          (define-key js-mode-map (kbd ",") 'self-insert-command)
          (font-lock-add-keywords
           'js-mode `(("\\(function *\\)("
                       (0 (progn (compose-region (match-beginning 1)
                                                 (match-end 1) "\u0192")
                                 nil)))))))

;;-------------------------------------------------------

(provide 'webdevelopment-settings)
