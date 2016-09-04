(global-company-mode t)
(setq company-idle-delay 0.2)
(setq company-selection-wrap-around t)

; keybinding
(define-key company-active-map (kbd "C-n") 'company-select-next)
(define-key company-active-map (kbd "C-p") 'company-select-previous)
