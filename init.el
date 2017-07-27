;; modified init.el for C20macs
;; AUTHOR: Sungbin Jeon

;; SET emacs config directory
;; if you want to put the config directories in different location, change the cfg-file-path to desired location, and save this file as "~/.emacs.d/init.el" or "~/.emacs" or any init file

(setq cfg-path "~/.emacs.d")

;; LET's load config files
(load-file (concat cfg-path "/00-variables.el")) ;; global variables
(load-file (concat cfg-path "/99-functions.el")) ;; customized functions
(load-file (concat cfg-path "/01-general.el")) ;; general configurations
(load-file (concat cfg-path "/02-packages.el")) ;; list and installation of packages
(load-file (concat cfg-path "/03-keymaps.el")) ;; collection of binding keymaps
