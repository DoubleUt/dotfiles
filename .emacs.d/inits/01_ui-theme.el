;; ツールバーを表示しない
(tool-bar-mode -1)

;; scroll bar を非表示
(set-scroll-bar-mode nil)

;; Markに色を付ける
(setq transient-mark-mode t)

;; 対応する括弧を点灯させる
(show-paren-mode t)

;; 行数を表示する
(global-linum-mode t)

;; テーマを設定
(require 'hc-zenburn-theme)
(load-theme 'hc-zenburn t)

;; モードライン
(require 'powerline)
(setq ns-use-srgb-colorspace nil)
(powerline-default-theme)
(set-face-attribute 'mode-line nil
                    :foreground "#fff"
                    :background "SpringGreen4"
                    :box nil)

;; SPACE, TAB, RETを表示する
(require 'whitespace)
(global-whitespace-mode t)
(set-face-attribute 'whitespace-space nil :background nil :foreground "gray50")
(set-face-attribute 'whitespace-tab nil :background nil :foreground "gray50")
