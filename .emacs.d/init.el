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
(package-install 'nyan-mode)
(package-install 'popwin)
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

;; ツールバーを表示しない
(tool-bar-mode -1)

;; scroll bar を非表示
(set-scroll-bar-mode nil)

;; yes or no を y or n
(fset 'yes-or-no-p 'y-or-n-p)

;; TAB
(setq-default indent-tabs-mode nil)
(setq default-tab-width 2)

;; SPACE, TAB, RETを表示する
(global-whitespace-mode t)

;; 行数を表示する
(global-linum-mode t)

;; Markに色を付ける
(setq transient-mark-mode t)

;; 対応する括弧を点灯させる
(show-paren-mode t)

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

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; packages
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(require 'hc-zenburn-theme)
(load-theme 'hc-zenburn t)

(require 'helm)
(global-set-key (kbd "M-x") 'helm-M-x)
(helm-mode t)

(require 'anzu)
(global-anzu-mode t)

(require 'tabbar)
(tabbar-mode t)
(tabbar-mwheel-mode nil)
(setq tabbar-buffer-groups-function nil)
;; key binding
(global-set-key (kbd "<C-tab>") 'tabbar-forward-tab)
(global-set-key (kbd "<C-S-tab>") 'tabbar-backward-tab)

(dolist (btn '(tabbar-buffer-home-button
               tabbar-scroll-left-button
               tabbar-scroll-right-button))
  (set btn (cons (cons "" nil)
                 (cons "" nil))))

(setq tabbar-separator '(2.0))

(defvar my-tabbar-bg-color "#606060")
(set-face-attribute
 'tabbar-default nil
 :family "Monaco"
 :background my-tabbar-bg-color
 :foreground "gray72"
 :height 1.0)
(set-face-attribute
 'tabbar-unselected nil
 :background my-tabbar-bg-color
 :foreground "grey72"
 :box nil)
(set-face-attribute
 'tabbar-selected nil
 :background my-tabbar-bg-color
 :foreground "yellow"
 :box nil)

(defun my-tabbar-buffer-list ()
  (delq nil
        (mapcar #'(lambda (b)
                    (cond
                     ((eq (current-buffer) b) b)
                     ((buffer-file-name b) b)
                     ((char-equal ?\ (aref (buffer-name b) 0)) nil)
                     ((equal "*scratch*" (buffer-name b)) b)
                     ((equal "*eshell*" (buffer-name b)) b)
                     ((string-match "\\*terminal.*\\'" (buffer-name b)) b)
                     ((char-equal ?* (aref (buffer-name b) 0)) nil)
                     ((buffer-live-p b) b)))
                (buffer-list))))
(setq tabbar-buffer-list-function 'my-tabbar-buffer-list)

(require 'smart-newline)
(smart-newline-mode t)
(global-set-key (kbd "<RET>") 'smart-newline)

(require 'rainbow-delimiters)
(rainbow-delimiters-mode t)

(require 'ace-jump-mode)
(global-set-key (kbd "C-c SPC") 'ace-jump-mode)

(require 'ciel)
(global-set-key (kbd "C-c i") 'ciel-ci)
(global-set-key (kbd "C-c o") 'ciel-co)

(require 'undo-tree)
(global-undo-tree-mode t)

(require 'nyan-mode)
(nyan-mode t)
(nyan-start-animation)

(require 'company)
(global-company-mode t)
(setq company-minimum-prefix-length 1)
(setq company-idle-delay 0.2)
(setq company-selection-wrap-around t)
(setq company-dabbrev-downcase nil)
(setq company-tooltip-align-annotations t)
(define-key company-active-map (kbd "C-n") 'company-select-next)
(define-key company-active-map (kbd "C-p") 'company-select-previous)

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

(require 'multiple-cursors)
(require 'smartrep)
(declare-function smartrep-define-key "smartrep")
(global-set-key (kbd "C-M-c") 'mc/edit-lines)
(global-set-key (kbd "C-M-r") 'mc/mark-all-in-region)
(global-unset-key "\C-t")
(smartrep-define-key global-map "C-t"
  '(("C-t"      . 'mc/mark-next-like-this)
    ("n"        . 'mc/mark-next-like-this)
    ("p"        . 'mc/mark-previous-like-this)
    ("m"        . 'mc/mark-more-like-this-extended)
    ("u"        . 'mc/unmark-next-like-this)
    ("U"        . 'mc/unmark-previous-like-this)
    ("s"        . 'mc/skip-to-next-like-this)
    ("S"        . 'mc/skip-to-previous-like-this)
    ("*"        . 'mc/mark-all-like-this)
    ("d"        . 'mc/mark-all-like-this-dwim)
    ("i"        . 'mc/insert-numbers)
    ("o"        . 'mc/sort-regions)
    ("O"        . 'mc/reverse-regions)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Language
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(require 'markdown-mode)
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.txt\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("README\\.md\\'" . gfm-mode))
(setq markdown-command "marked")

(require 'json-mode)
(add-to-list 'auto-mode-alist '("\\.json\\'" . json-mode))
(add-to-list 'auto-mode-alist '("\\.babelrc$" . json-mode))
(add-hook 'json-mode-hook
          (lambda ()
            (make-local-variable 'js-indent-level)
            (setq js-indent-level 2)))

(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.html?$'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.jsp$'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb$" . web-mode))

(require 'js2-mode)
(setq js-indent-level 2)
(add-to-list 'auto-mode-alist '("\\.js[x]?\\'" . js2-jsx-mode))

(require 'typescript-mode)
(add-to-list 'auto-mode-alist '("\\.ts[x]?\\'" . typescript-mode))
(setq typescript-indent-level 2)

(require 'tide)
(defun setup-tide-mode ()
  (interactive)
  (tide-setup)
  (flycheck-mode t)
  (setq flycheck-check-syntax-automatically '(save mode-enabled))
  (eldoc-mode t)
  (tide-hl-identifier-mode t)
  (company-mode t))

(add-hook 'before-save-hook 'tide-format-before-save)
(add-hook 'typescript-mode-hook #'setup-tide-mode)

(require 'emmet-mode)
(add-hook 'sgml-mode-hook 'emmet-mode)
(add-hook 'css-mode-hook 'emmet-mode)
(add-hook 'web-mode-hook 'emmet-mode)
(add-hook 'js2-jsx-mode-hook 'emmet-mode)
(add-hook 'typescript-mode-hook 'emmet-mode)

(require 'go-mode)
(require 'company-go)
(require 'flycheck)
(require 'flymake)
(require 'flymake-go)
(add-hook 'go-mode-hook 'company-mode)
(add-hook 'go-mode-hook 'flycheck-mode)
(add-hook 'go-mode-hook
          '(lambda()
             (add-hook 'before-save-hook' 'gofmt-before-save)
             (local-set-key (kbd "M-.") 'godef-jump)
             (set (make-local-variable 'company-backends)
                  '(company-go)) (setq company-go-insert-arguments nil)))

(require 'ruby-mode)
(add-to-list 'auto-mode-alist '("\\.rb$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Capfiles" . ruby-mode))
(add-to-list 'auto-mode-alist '("Gemfiles" . ruby-mode))
(add-hook 'ruby-mode-hook
          '(lambda ()
             (setq tab-width 2)
             (setq ruby-indent-level tab-width)
             (setq ruby-deep-indent-paren-style nil)))

;; improve indent of ruby-mode
(setq ruby-deep-indent-paren-style nil)
(defadvice ruby-indent-line (after unindent-closing-paren activate)
  (let ((column (current-column))
        indent offset)
    (save-excursion
      (back-to-indentation)
      (let ((state (syntax-ppss)))
        (setq offset (- column (current-column)))
        (when (and (eq (char-after) ?\))
                   (not (zerop (car state))))
          (goto-char (cadr state))
          (setq indent (current-indentation)))))
    (when indent
      (indent-line-to indent)
      (when (> offset 0) (forward-char offset)))))

(require 'ruby-end)
(add-hook 'ruby-mode-hook
          '(lambda ()
             (abbrev-mode t)
             (electric-pair-mode t)
             (electric-indent-mode t)
             (electric-layout-mode t)))

(require 'ruby-block)
(ruby-block-mode t)
(setq ruby-block-highlight-toggle t)
