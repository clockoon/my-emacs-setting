;; This file is to set and load the customized Emacs confs. Please following the instruction:
;; 1) Change the variable "CONF_HOME" to the path you want to put the conf. files. This directory contains all the (customized) config files, backup files, etc..
;; 2) Copy this file into the HOME directory.

;;; SET directory
(setq custom-file-path "CHANGE HERE")

(load-file (concat custom-file-path "/main_conf.el"))
