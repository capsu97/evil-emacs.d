(setq org-log-done t) ; log completed items. adds timestamp and lets org-agenda mark it
(setq org-todo-keywords
      '((sequence "TODO" "INPROGRESS" "DONE")))
(setq org-todo-keyword-faces
      '(("INPROGRESS" . (:foreground "blue" :weight bold)))) ; add inprogress keyword
;;(setq org-agenda-files (list "~/Dropbox/org/personal.org")) ; set default agenda file

;; make it possible to embed clojure code in org documents with org-babel
(require 'ob)

(org-babel-do-load-languages
 'org-babel-load-languages
 '((sh . t)))

(add-to-list 'org-babel-tangle-lang-exts '("clojure" . "clj"))

(defvar org-babel-default-header-args:clojure
  '((:results . "silent") (:tangle . "yes")))

(defun org-babel-execute:clojure (body params)
  (lisp-eval-string body)
  "Done!")

(setq org-src-fontify-natively t)
(setq org-confirm-babel-evaluate nil)

(provide 'org-mode-settings)
