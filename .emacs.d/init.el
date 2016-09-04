;; Setting Cask
(require 'cask "~/.cask/cask.el")
(cask-initialize)

;; init-loader
(init-loader-load "~/.emacs.d/conf")

;; テーマ設定
(load-theme 'solarized t)

;; pallet-mode
(pallet-mode t)

;; nyan-mode
(nyan-mode)
(nyan-start-animation)

;; helm
(helm-mode t)
(global-set-key (kbd "M-x") 'helm-M-x)
