;; load-pathの追加関数
(defun add-to-load-path (&rest paths)
  (let (path)
    (dolist (path paths paths)
      (let ((default-directory (expand-file-name (concat user-emacs-directory path))))
        (add-to-list 'load-path default-directory)
        (if (fboundp 'normal-top-level-add-subdirs-to-load-path)
            (normal-top-level-add-subdirs-to-load-path))))))

(add-to-load-path "conf")

(load "general")
(load "keybinding")
(load "init-js")

;; Setting Cask
(require 'cask "~/.cask/cask.el")
(cask-initialize)

;; テーマ設定
(load-theme 'solarized t)

;; helm
(helm-mode 1)
(global-set-key (kbd "M-x") 'helm-M-x)

;; auto-complete
(add-hook 'eamcs-lisp-mode-hook
          '(lamda ()
                  (require 'auto-complete)
                  (auto-complete-mode t)))

(require 'auto-complete-config)
(ac-config-default)

;; nyan-mode
(nyan-mode)
(nyan-start-animation)

;; emmet-mode
(add-hook 'sgml-mode-hook 'emmet-mode)
(add-hook 'css-mode-hook 'emmet-mode)
(add-hook 'web-mode-hook 'emmet-mode)

;; markdown-mode
(setq markdown-command "multimarkdown")
(defun eww-open-file-other-window (file)
  (if (one-window-p) (split-window))
  (other-window 1)
  (eww-open-file file))

(defun markdown-preview-eww ()
  (interactive)
  (message (buffer-file-name))
  (call-process "marked" nil nil nil "--gfm" "-o" "/tmp/marked.html" (buffer-file-name))
  (eww-open-file-other-window  "/tmp/marked.html"))

