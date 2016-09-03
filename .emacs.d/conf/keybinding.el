;; backspaceをC-hに割り当てる
(define-key key-translation-map (kbd "C-h") (kbd "<DEL>"))

;; ヘルプを別のキーバインドに割り当てる
(define-key global-map (kbd "C-x ?") 'help-command)

;; C-kで行削除
(global-set-key (kbd "C-k") 'kill-whole-line)
