;; This file is to set and load the customized Emacs confs. Please following the instruction:
;; 1) Change the variable "CONF_HOME" to the path you want to put the conf. files. This directory contains all the (customized) config files, backup files, etc..
;; 2) Copy this file into the HOME directory.

;;; SET directory

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(setq custom-file-path "~/.emacs.d")

(load-file (concat custom-file-path "/main_conf.el"))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(mediawiki-site-alist
   (quote
    (("Wikipedia" "https://en.wikipedia.org/w/" "username" "password" nil "Main Page")
     ("C20-wiki" "http://c20.kr/w/" "clockoon" "apex2win" nil "´ë¹®"))))
 '(mediawiki-site-default "C20-wiki")
 '(package-selected-packages
   (quote
    (mediawiki deft gruvbox-theme org-wiki magit zenburn-theme color-theme-sanityinc-tomorrow afternoon-theme wc-mode powerline writeroom-mode haskell-mode markdown-mode evil helm use-package))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "D2Coding" :foundry "unknown" :slant normal :weight normal :height 128 :width normal))))
 '(mode-line ((t (:family "D2Coding" :foundry "unknown" :slant normal :weight normal :height 120 :width normal)))))
