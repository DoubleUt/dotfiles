;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; package.el
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(require 'package)
(setq package-user-dir "~/.emacs.d/elisp/elpa/")
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)

(package-initialize)

(package-install 'anzu)
(package-install 'ace-jump-mode)
(package-install 'ciel)
(package-install 'company)
(package-install 'company-go)
(package-install 'fuzzy)
(package-install 'emmet-mode)
(package-install 'expand-region)
(package-install 'flycheck)
(package-install 'flymake)
(package-install 'flymake-go)
(package-install 'git-gutter+)
(package-install 'git-gutter-fringe+)
(package-install 'go-mode)
(package-install 'helm)
(package-install 'helm-swoop)
(package-install 'helm-c-yasnippet)
(package-install 'init-loader)
(package-install 'js2-mode)
(package-install 'json-mode)
(package-install 'magit)
(package-install 'markdown-mode)
(package-install 'multi-term)
(package-install 'multiple-cursors)
(package-install 'neotree)
(package-install 'popwin)
(package-install 'powerline)
(package-install 'rainbow-delimiters)
(package-install 'ruby-mode)
(package-install 'ruby-block)
(package-install 'ruby-end)
(package-install 'smartrep)
(package-install 'smart-newline)
(package-install 'tabbar)
(package-install 'tide)
(package-install 'typescript-mode)
(package-install 'undo-tree)
(package-install 'web-mode)
(package-install 'yasnippet)
(package-install 'hc-zenburn-theme)

(require 'init-loader)
(setq init-loader-show-log-after-init nil)
(init-loader-load "~/.emacs.d/inits")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; basic
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(require 'cl)
;; 言語設定
(set-language-environment 'Japanese)
(prefer-coding-system 'utf-8)

;; スタートアップメッセージを表示させない
(setq inhibit-startup-message t)

;; scratchの初期メッセージの消去
(setq initial-scratch-message "")

;; yes or no を y or n
(fset 'yes-or-no-p 'y-or-n-p)

;; TAB
(setq-default indent-tabs-mode nil)
(setq default-tab-width 2)

;; 閉じ括弧を挿入
(electric-pair-mode t)

;; バックアップファイルを作らない
(setq make-backup-files nil)
(setq auto-save-default nil)

;; ビープ音を消す
(setq ring-bell-function 'ignore)

;; 画像ファイルを表示
(auto-image-file-mode t)

(unless (eq window-system nil)
       (set-frame-position (selected-frame) 0 0)
       (set-frame-size (selected-frame) 150 40))

(load (setq custom-file
            (expand-file-name "custom.el" user-emacs-directory)))

;; マウススクロールを１行にする
(setq mouse-wheel-scroll-amount '(1 ((shift) . 1)))
(setq mouse-wheel-progressive-speed nil)
(setq mouse-wheel-follow-mouse 't)
(setq scroll-step 1)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; key bindinig
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; backspaceをC-hに割り当てる
(define-key key-translation-map (kbd "C-h") (kbd "<DEL>"))

;; ヘルプを別のキーバインドに割り当てる
(define-key global-map (kbd "C-x ?") 'help-command)

;; C-zをアンバインド
(global-unset-key (kbd "C-z"))

;; Macの場合は円マークをバックスラッシュに
(define-key global-map [?¥] [?\\])

(require 'helm)
(global-set-key (kbd "M-x") 'helm-M-x)
(helm-mode t)

(require 'anzu)
(global-anzu-mode t)

(require 'smart-newline)
(smart-newline-mode t)
(global-set-key (kbd "<RET>") 'smart-newline)

(require 'ace-jump-mode)
(global-set-key (kbd "C-c SPC") 'ace-jump-mode)

(require 'ciel)
(global-set-key (kbd "C-c i") 'ciel-ci)
(global-set-key (kbd "C-c o") 'ciel-co)

(require 'undo-tree)
(global-undo-tree-mode t)

(require 'neotree)
(global-set-key [f8] 'neotree-toggle)
(setq neo-window-width 28)

(require 'yasnippet)
(require 'helm-c-yasnippet)
(yas-global-mode t)
(setq yas-snippet-dirs '("~/.emacs.d/snippets"))
(setq helm-yas-space-maych-any-greedy t)
(global-set-key (kbd "C-c y") 'helm-yas-complete)

(require 'git-gutter+)
(require 'git-gutter-fringe+)
(global-git-gutter+-mode)

(require 'expand-region)
(global-set-key (kbd "C-=") 'er/expand-region)
(global-set-key (kbd "C-M-=") 'er/contract-region)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Language
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(require 'js2-mode)
(setq js-indent-level 2)
(add-to-list 'auto-mode-alist '("\\.js[x]?\\'" . js2-jsx-mode))

(require 'emmet-mode)
(add-hook 'sgml-mode-hook 'emmet-mode)
(add-hook 'css-mode-hook 'emmet-mode)
(add-hook 'web-mode-hook 'emmet-mode)
(add-hook 'js2-jsx-mode-hook 'emmet-mode)
(add-hook 'typescript-mode-hook 'emmet-mode)
