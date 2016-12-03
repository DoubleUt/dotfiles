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
