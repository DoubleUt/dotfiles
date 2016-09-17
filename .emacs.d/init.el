;; Setting Cask
(require 'cask "~/.cask/cask.el")
(cask-initialize)

;; init-loader
(require 'init-loader)
(setq init-loader-show-log-after-init nil)
(init-loader-load "~/.emacs.d/conf")

;; $PATHを通す
(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))

;; テーマ設定
(load-theme 'solarized t)

;; pallet
(require 'pallet)
(pallet-mode t)

;; nyan-mode
;; (require 'nyan-mode)
;; (nyan-mode)
;; (nyan-start-animation)

;; helm
(require 'helm)
(helm-mode t)
(global-set-key (kbd "M-x") 'helm-M-x)
