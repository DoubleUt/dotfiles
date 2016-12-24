;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; packages
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(require 'package)
(setq package-user-dir "~/.emacs.d/elisp/elpa/")
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)

(package-initialize)
;; (package-refresh-contents)

(load-file "~/.emacs.d/dependencies.el")

(load (setq custom-file
            (expand-file-name "custom.el" user-emacs-directory)))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; common
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(require 'cl)
(set-language-environment 'Japanese)
(prefer-coding-system 'utf-8)

(setq inhibit-startup-message t)
(setq initial-scratch-message "")

(fset 'yes-or-no-p 'y-or-n-p)

(tool-bar-mode -1)
(set-scroll-bar-mode nil)

;; バックアップファイルを作らない
(setq make-backup-files nil)
(setq auto-save-default nil)

(setq transient-mark-mode t)
(setq ring-bell-function 'ignore)

;; マウススクロールを１行にする
(setq mouse-wheel-scroll-amount '(1 ((shift) . 1)))
(setq mouse-wheel-progressive-speed nil)
(setq mouse-wheel-follow-mouse 't)
(setq scroll-step 1)

;; TAB
(setq-default indent-tabs-mode nil)
(setq default-tab-width 2)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; miner-modes
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(auto-image-file-mode t)
(show-paren-mode t)
(abbrev-mode t)
(global-linum-mode t)
(global-whitespace-mode t)

(electric-pair-mode t)
(electric-indent-mode t)
(electric-layout-mode t)

(helm-mode t)
(global-company-mode t)
(global-anzu-mode t)
(smart-newline-mode t)
(global-undo-tree-mode t)
(yas-global-mode t)
(global-git-gutter+-mode)
(tabbar-mode t)
(tabbar-mwheel-mode nil)
(require 'ruby-block)
(ruby-block-mode t)

(defun my-tabbar-buffer-list ()
  (delq nil (mapcar #'(lambda (b)
                        (cond
                         ((eq (current-buffer) b) b)
                         ((buffer-file-name b) b)
                         ((char-equal ?\ (aref (buffer-name b) 0)) nil)
                         ((char-equal ?* (aref (buffer-name b) 0)) nil)
                         ((buffer-live-p b) b)))
                    (buffer-list))))

(dolist (btn '(tabbar-buffer-home-button
               tabbar-scroll-left-button
               tabbar-scroll-right-button))
  (set btn (cons (cons "" nil) (cons "" nil))))

(setq tabbar-buffer-list-function 'my-tabbar-buffer-list)
(setq company-minimum-prefix-length 1)
(setq company-idle-delay 0.2)
(setq company-selection-wrap-around t)
(setq company-dabbrev-downcase nil)
(setq company-tooltip-align-annotations t)
(setq neo-window-width 28)
(setq yas-snippet-dirs '("~/.emacs.d/snippets"))
(setq helm-yas-space-maych-any-greedy t)
(setq tabbar-buffer-groups-function nil)
(setq tabbar-separator '(2.0))

(setq js-indent-level 2)
(setq ruby-indent-level 2)
(setq typescript-indent-level 2)
(setq web-mode-markup-indent-offset 2)

(setq markdown-command "marked")
(setq ruby-deep-indent-paren-style nil)
(setq ruby-block-highlight-toggle t)

(add-to-list 'auto-mode-alist '("\\.html?$'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.jsp$'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb$" . web-mode))
(add-to-list 'auto-mode-alist '("\\.js[x]?\\'" . js2-jsx-mode))
(add-to-list 'auto-mode-alist '("\\.ts[x]?\\'" . typescript-mode))
(add-to-list 'auto-mode-alist '("\\.json\\'" . json-mode))
(add-to-list 'auto-mode-alist '("\\.babelrc$" . json-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.txt\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("README\\.md\\'" . gfm-mode))
(add-to-list 'auto-mode-alist '("\\.rb$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Capfiles" . ruby-mode))
(add-to-list 'auto-mode-alist '("Gemfiles" . ruby-mode))

(add-hook 'sgml-mode-hook 'emmet-mode)
(add-hook 'css-mode-hook 'emmet-mode)
(add-hook 'web-mode-hook 'emmet-mode)
(add-hook 'js2-jsx-mode-hook 'emmet-mode)
(add-hook 'typescript-mode-hook 'emmet-mode)
(add-hook 'go-mode-hook 'company-mode)
(add-hook 'go-mode-hook 'flycheck-mode)
(add-hook 'go-mode-hook 'go-setting)
(add-hook 'before-save-hook 'tide-format-before-save)
(add-hook 'typescript-mode-hook #'setup-tide-mode)

(defun setup-tide-mode ()
  (interactive)
  (tide-setup)
  (flycheck-mode t)
  (setq flycheck-check-syntax-automatically '(save mode-enabled))
  (eldoc-mode t)
  (tide-hl-identifier-mode t)
  (company-mode t))

(defun go-settings ()
  (add-hook 'before-save-hook' 'gofmt-before-save)
  (local-set-key (kbd "M-.") 'godef-jump)
  (set (make-local-variable 'company-backends) '(company-go))
  (setq company-go-insert-arguments nil))

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
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Face
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; display size
(unless (eq window-system nil)
       (set-frame-position (selected-frame) 0 0)
       (set-frame-size (selected-frame) 150 40))

(setq ns-use-srgb-colorspace nil)
(load-theme 'hc-zenburn t)
(powerline-default-theme)
(set-face-attribute 'mode-line nil
                    :foreground "#fff"
                    :background "SpringGreen4"
                    :box nil)
(set-face-attribute 'whitespace-space nil
                    :background nil
                    :foreground "gray50")
(set-face-attribute 'whitespace-tab nil
                    :background nil
                    :foreground "gray50")
(set-face-attribute 'tabbar-default nil
                    :family "Monaco"
                    :background "#606060"
                    :foreground "gray72"
                    :height 1.0)
(set-face-attribute 'tabbar-unselected nil
                    :background "#606060"
                    :foreground "grey72"
                    :box nil)
(set-face-attribute 'tabbar-selected nil
                    :background "#606060"
                    :foreground "yellow"
                    :box nil)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; KeyBinding
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(require 'smartrep)
(global-unset-key (kbd "C-z"))
(define-key key-translation-map (kbd "C-h") (kbd "<DEL>"))
(define-key global-map (kbd "C-x ?") 'help-command)
(define-key global-map [?¥] [?\\])
(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "<RET>") 'smart-newline)
(global-set-key (kbd "C-c i") 'ciel-ci)
(global-set-key (kbd "C-c o") 'ciel-co)
(global-set-key [f8] 'neotree-toggle)
(global-set-key (kbd "C-c y") 'helm-yas-complete)
(global-set-key (kbd "C-=") 'er/expand-region)
(global-set-key (kbd "C-M-=") 'er/contract-region)
(global-set-key (kbd "<C-tab>") 'tabbar-forward-tab)
(global-set-key (kbd "<C-S-tab>") 'tabbar-backward-tab)
(define-key company-active-map (kbd "C-n") 'company-select-next)
(define-key company-active-map (kbd "C-p") 'company-select-previous)
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
