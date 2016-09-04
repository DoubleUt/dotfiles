(add-to-list 'auto-mode-alist '("\\.js\\'" . web-mode))

(defun web-mode-indent-level-hook ()
  "Hooks for web-mode"
  (setq web-mode-markup-indent-offset 4)
  (setq web-mode-css-indent-offset 4)
  (setq web-mode-script-indent-offset 4)
  (setq web-mode-php-indent-offset 4)
  (setq indent-tabs-mode nil)
  (setq tab-width 4))

(add-hook 'web-mode-hook 'web-mode-indent-level-hook)
