;; backspaceをC-hに割り当てる
(define-key key-translation-map (kbd "C-h") (kbd "<DEL>"))

;; ヘルプを別のキーバインドに割り当てる
(define-key global-map (kbd "C-x ?") 'help-command)

;; Markに色を付ける
(setq transient-mark-mode t)

;; バックアップファイルを作らない
(setq make-backup-files nil)

;; Setting Cask
(require 'cask "~/.cask/cask.el")
(cask-initialize)

(nyan-mode 1)
(nyan-start-animation)
