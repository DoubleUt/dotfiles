;; Load Packages
(load-file "~/.emacs.d/pkg.el")

(setq init-loader-show-log-after-init nil)
(init-loader-load "~/.emacs.d/inits")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; basic
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(require 'cl)
(set-language-environment 'Japanese)
(prefer-coding-system 'utf-8)

(setq inhibit-startup-message t)
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

;; helm
(global-set-key (kbd "M-x") 'helm-M-x)
(helm-mode t)

;; anzu
(global-anzu-mode t)

;; sart-newline
(smart-newline-mode t)
(global-set-key (kbd "<RET>") 'smart-newline)

; ciel
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
