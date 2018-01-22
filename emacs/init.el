(package-initialize)

(add-to-list 'load-path "~/.emacs.d/lisp/")

(require 'init-ui)
(require 'init-better-default)


;; 变量设置
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(column-number-mode t)
 '(custom-enabled-themes (quote (dichromacy)))
 '(display-time-mode t)
 '(line-number-mode nil)
 '(scroll-bar-mode nil)
 '(size-indication-mode t)
 '(tool-bar-mode nil))

;; 界面设置
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Noto Mono" :foundry "monotype" :slant normal :weight normal :height 128 :width normal)))))
(put 'erase-buffer 'disabled nil)

;; 将配置文件绑定到F2上
(defun open-init-file()
  (interactive)
  (find-file "~/.emacs.d/init.el"))
(global-set-key (kbd "<f2>") 'open-init-file)
