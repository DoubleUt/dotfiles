;; backspaceをC-hに割り当てる
(define-key key-translation-map (kbd "C-h") (kbd "<DEL>"))

;; ヘルプを別のキーバインドに割り当てる
(define-key global-map (kbd "C-x ?") 'help-command)

;; C-zをアンバインド
(global-unset-key (kbd "C-z"))

;; C-kで行削除
(global-set-key (kbd "C-k") 'kill-whole-line)

;; ciel
(global-set-key (kbd "C-c i") 'ciel-ci)
(global-set-key (kbd "C-c o") 'ciel-co)

;; helm-yasnippet
(global-set-key (kbd "C-c y") 'helm-yas-complete)
