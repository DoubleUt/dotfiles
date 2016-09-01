;; Setting Cask
(require 'cask "~/.cask/cask.el")
(cask-initialize)

;; helm
(helm-mode 1)
(global-set-key (kbd "M-x") 'helm-M-x)

;; backspaceをC-hに割り当てる
(define-key key-translation-map (kbd "C-h") (kbd "<DEL>"))

;; ヘルプを別のキーバインドに割り当てる
(define-key global-map (kbd "C-x ?") 'help-command)

;; Markに色を付ける
(setq transient-mark-mode t)

;; バックアップファイルを作らない
(setq make-backup-files nil)
;; js2-jsx-mode
(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-jsx-mode))
;; flycheck
(require 'flycheck)
(flycheck-add-mode 'javascript-eslint 'js2-jsx-mode)
(add-hook 'js2-jsx-mode-hook 'flycheck-mode)

;; auto-complete
(add-hook 'eamcs-lisp-mode-hook '(lamda ()
					(require 'auto-complete)
					(auto-complete-mode t)
					))
(require 'auto-complete-config)
(ac-config-default)
(add-to-list 'ac-modes 'js2-jsx-mode)

;; nyan-mode
(nyan-mode)
(nyan-start-animation)

;; emmet-mode
(add-hook 'sgml-mode-hook 'emmet-mode)
(add-hook 'css-mode-hook 'emmet-mode)

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
