(global-company-mode t)
(setq company-minimum-prefix-length 1)
(setq company-idle-delay 0.2)
(setq company-selection-wrap-around t)

(setq company-dabbrev-downcase nil)

; keybinding
(define-key company-active-map (kbd "C-n") 'company-select-next)
(define-key company-active-map (kbd "C-p") 'company-select-previous)
