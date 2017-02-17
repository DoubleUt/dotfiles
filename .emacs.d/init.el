;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; packages
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(require 'package)
  (setq package-user-dir "~/.emacs.d/elisp/elpa/")
  (add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)

(package-initialize)

(package-install 'anzu)
(package-install 'ciel)
(package-install 'company)
(package-install 'company-go)
(package-install 'company-tern)
(package-install 'emojify)
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
(package-install 'helm-c-yasnippet)
(package-install 'js2-mode)
(package-install 'json-mode)
(package-install 'magit)
(package-install 'markdown-mode)
(package-install 'multi-term)
(package-install 'multiple-cursors)
(package-install 'neotree)
(package-install 'powerline)
(package-install 'ruby-mode)
(package-install 'ruby-block)
(package-install 'ruby-end)
(package-install 'rust-mode)
(package-install 'smartrep)
(package-install 'smart-newline)
(package-install 'tide)
(package-install 'typescript-mode)
(package-install 'undo-tree)
(package-install 'web-mode)
(package-install 'yasnippet)
(package-install 'hc-zenburn-theme)

(load (setq custom-file (expand-file-name "custom.el" user-emacs-directory)))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; common
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
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

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; miner-modes
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(auto-image-file-mode t)
(show-paren-mode t)
(abbrev-mode t)
(global-linum-mode t)
(global-whitespace-mode t)

(electric-pair-mode t)
(electric-indent-mode -1)
(electric-layout-mode -1)

(helm-mode t)
(global-company-mode t)
(global-anzu-mode t)
(smart-newline-mode t)
(global-undo-tree-mode t)
(yas-global-mode t)
(global-git-gutter+-mode)
(global-emojify-mode t)
(require 'ruby-block)
(ruby-block-mode t)

(setq company-minimum-prefix-length 1)
(setq company-idle-delay 0.2)
(setq company-selection-wrap-around t)
(setq company-dabbrev-downcase nil)
(setq company-tooltip-align-annotations t)
(setq neo-window-width 28)
(setq yas-snippet-dirs '("~/.emacs.d/snippets"))
(setq helm-yas-space-maych-any-greedy t)

(setq js-indent-level 2)
(setq ruby-indent-level 2)
(setq typescript-indent-level 2)
(setq web-mode-markup-indent-offset 2)
(setq python-indent-offset 4)

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
(add-to-list 'auto-mode-alist '("\\.py$" . python-mode))

(add-hook 'sgml-mode-hook 'emmet-mode)
(add-hook 'css-mode-hook 'emmet-mode)
(add-hook 'web-mode-hook 'emmet-mode)
(add-hook 'js2-jsx-mode-hook 'emmet-mode)
(add-hook 'js2-jsx-mode-hook 'tern-mode)
(add-hook 'js2-jsx-mode-hook 'my-js2-settings)
(add-hook 'typescript-mode-hook 'emmet-mode)
(add-hook 'go-mode-hook 'company-mode)
(add-hook 'go-mode-hook 'flycheck-mode)
(add-hook 'go-mode-hook 'go-setting)
(add-hook 'before-save-hook 'tide-format-before-save)
(add-hook 'typescript-mode-hook #'setup-tide-mode)


(defun my-js2-settings()
  (add-to-list 'company-backends '(company-tern :with company-dabbrev-code))
  (setq js2-include-browser-externs nil)
  (setq js2-mode-show-parse-errors nil)
  (setq js2-mode-show-strict-warnings nil)
  (setq js2-strict-trailing-comma-warning nil)
  (setq js2-highlight-external-variables nil)
  (setq js2-include-jslint-globals nil)
  (flycheck-mode t)
  (flycheck-add-mode 'javascript-eslint 'js2-mode))

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
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Face
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(set-frame-font (font-spec
                 :family "ricty diminished"
                 :size 13))

(unless (eq window-system nil)
  (set-frame-parameter nil 'fullscreen 'maximized)
  (load-theme 'hc-zenburn t))

(powerline-default-theme)
(set-face-attribute 'mode-line nil
                    :foreground "#fff"
                    :background "SpringGreen4"
                    :box nil)

(setq ns-use-srgb-colorspace nil)
(setq whitespace-line-column 200)
(set-face-attribute 'whitespace-space nil
                    :background nil
                    :foreground "gray50")
(set-face-attribute 'whitespace-tab nil
                    :background nil
                    :foreground "gray50")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; KeyBinding
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(require 'smartrep)
(global-unset-key (kbd "C-z"))
(define-key key-translation-map (kbd "C-h") (kbd "<DEL>"))
(define-key global-map (kbd "C-x ?") 'help-command)
(define-key global-map [?¥] [?\\])
(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "C-x C-f") 'helm-find-files)
(global-set-key (kbd "<RET>") 'smart-newline)
(global-set-key (kbd "C-c g") 'magit-status)
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
