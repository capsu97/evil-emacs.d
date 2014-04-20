(eval-after-load "org"
	'(require 'ox-md nil t))

(setq org-log-done t) ; log completed items. adds timestamp and lets org-agenda mark it
(setq org-todo-keywords
      '((sequence "TODO" "INPROGRESS" "DONE")))
(setq org-todo-keyword-faces
      '(("INPROGRESS" . (:foreground "blue" :weight bold)))) ; add inprogress keyword
;;(setq org-agenda-files (list "~/Dropbox/org/personal.org")) ; set default agenda file

(setq org-log-done t) ; log completed items. adds timestamp and lets org-agenda mark it
(setq org-todo-keywords
      '((sequence "TODO" "INPROGRESS" "DONE")))
(setq org-todo-keyword-faces
      '(("INPROGRESS" . (:foreground "blue" :weight bold)))) ; add inprogress keyword
;;(setq org-agenda-files (list "~/Dropbox/org/personal.org")) ; set default agenda file

(setq org-confirm-babel-evaluate nil ; stop asking if you are sure you want to evaluate a src block
      org-src-fontify-natively t ; inside src block use the colors like the major mode of the src type
      org-src-tab-acts-natively t ; inside a src block let tab act like it was in major mode of the src type
      )

(require 'ob)

(org-babel-do-load-languages
 'org-babel-load-languages
 '((emacs-lisp . t)
   (sh . t)))

;; make it possible to embed clojure code in org documents with org-babel(setq org-confirm-babel-evaluate nil ; stop asking if you are sure you want to evaluate a src block
(require 'ob)

(org-babel-do-load-languages
 'org-babel-load-languages
 '((emacs-lisp . t)
   (sh . t)))

;; make it possible to embed clojure code in org documents with org-babel
(add-to-list 'org-babel-tangle-lang-exts '("clojure" . "clj"))

(defvar org-babel-default-header-args:clojure
  '((:results . "silent") (:tangle . "yes")))

(defun org-babel-execute:clojure (body params)
  (lisp-eval-string body)
  "Done!")

(provide 'org-mode-settings)
