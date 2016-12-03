(require 'hc-zenburn-theme)
(load-theme 'hc-zenburn t)

(require 'powerline)
(setq ns-use-srgb-colorspace nil)
(powerline-default-theme)

;; customize powerline color
(set-face-attribute 'mode-line nil
                    :foreground "#fff"
                    :background "SpringGreen4"
                    :box nil)
