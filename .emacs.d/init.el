;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; package.el
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(require 'package)
(setq package-user-dir "~/.emacs.d/elisp/elpa/")
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)

(package-initialize)

(package-install 'ciel)
(package-install 'company)
(package-install 'company-go)
(package-install 'emmet-mode)
(package-install 'flycheck)
(package-install 'flymake)
(package-install 'flymake-go)
(package-install 'go-mode)
(package-install 'helm)
(package-install 'helm-swoop)
(package-install 'helm-c-yasnippet)
(package-install 'init-loader)
(package-install 'json-mode)
(package-install 'magit)
(package-install 'nyan-mode)
(package-install 'popwin)
(package-install 'web-mode)
(package-install 'yasnippet)
(package-install 'zenburn-theme)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; basic
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
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
(global-whitespace-mode t)

;; 行数を表示する
(global-linum-mode t)

;; Markに色を付ける
(setq transient-mark-mode t)

;; 対応する括弧を点灯させる
(show-paren-mode t)

;; 閉じ括弧を挿入
(setq electric-pair-mode t)

;; バックアップファイルを作らない
(setq make-backup-files nil)
(setq auto-save-default nil)

;; ビープ音を消す
(setq ring-bell-function 'ignore)

;; 画像ファイルを表示
(auto-image-file-mode t)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; key bindinig
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; backspaceをC-hに割り当てる
(define-key key-translation-map (kbd "C-h") (kbd "<DEL>"))

;; ヘルプを別のキーバインドに割り当てる
(define-key global-map (kbd "C-x ?") 'help-command)

;; C-zをアンバインド
(global-unset-key (kbd "C-z"))

(load (setq custom-file
            (expand-file-name "custom.el" user-emacs-directory)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; packages
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(require 'zenburn-theme)
(load-theme 'zenburn t)

(require 'ciel)
(global-set-key (kbd "C-c i") 'ciel-ci)
(global-set-key (kbd "C-c o") 'ciel-co)

(require 'nyan-mode)
(nyan-mode t)

(require 'company)
(global-company-mode t)
(setq company-minimum-prefix-length 1)
(setq company-idle-delay 0.2)
(setq company-selection-wrap-around t)
(setq company-dabbrev-downcase nil)
(define-key company-active-map (kbd "C-n") 'company-select-next)
(define-key company-active-map (kbd "C-p") 'company-select-previous)

(require 'yasnippet)
(require 'helm-c-yasnippet)
(yas-global-mode t)
(setq yas-snippet-dirs '("~/.emacs.d/snippets"))
(setq helm-yas-space-maych-any-greedy t)
(global-set-key (kbd "C-c y") 'helm-yas-complete)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Language
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.js\\'" . web-mode))
(setq web-mode-content-types-alist '(("jsx" . "\\.js[x]?\\'")))

(require 'emmet-mode)
(add-hook 'sgml-mode-hook 'emmet-mode)
(add-hook 'css-mode-hook 'emmet-mode)
(add-hook 'web-mode-hook 'emmet-mode)

(add-hook 'go-mode-hook 'company-mode)
(add-hook 'go-mode-hook 'flycheck-mode)
(add-hook 'go-mode-hook (lambda()
                          (add-hook 'before-save-hook' 'gofmt-before-save)
                          (local-set-key (kbd "M-.") 'godef-jump)
                          (set (make-local-variable 'company-backends)
                               '(company-go))
                          (setq company-go-insert-arguments nil)))
