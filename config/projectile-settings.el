;; Projectile
(setq projectile-mode-line-lighter "Project")
(setq projectile-mode-line '(:eval (format " P[%s]" (projectile-project-name))))

(projectile-global-mode)
;;(setq projectile-enable-caching t)
(setq projectile-enable-idle-timer t)

;;(setq projectile-switch-project-action 'neotree-projectile-action)

(provide 'projectile-settings)
