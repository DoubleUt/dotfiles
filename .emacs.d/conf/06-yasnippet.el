(require 'yasnippet)
(require 'helm-c-yasnippet)

(setq yas-snippet-dirs '("~/.emacs.d/snippets"))

(setq helm-yas-space-maych-any-greedy t)
(global-set-key (kbd "C-c y") 'helm-yas-complete)

(yas-global-mode t)
