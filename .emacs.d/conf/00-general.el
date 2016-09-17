;; 言語設定
(set-language-environment 'Japanese)
(prefer-coding-system 'utf-8)

;; スタートアップメッセージを表示させない
(setq inhibit-startup-message t)

;; ツールバーを表示しない
(tool-bar-mode -1)

;; yes or no を y or n
(fset 'yes-or-no-p 'y-or-n-p)

;; TAB
(setq-default indent-tabs-mode nil)
(setq default-tab-width 4)

;; SPACE, TAB, RETを表示する
;; (global-whitespace-mode t)

;; 行数を表示する
(global-linum-mode t)

;; Markに色を付ける
(setq transient-mark-mode t)

;; 対応する括弧を点灯させる
(show-paren-mode t)

;; バックアップファイルを作らない
(setq make-backup-files nil)
(setq auto-save-default nil)

;; ビープ音を消す
(setq ring-bell-function 'ignore)
