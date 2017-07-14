;; modified init.el for C20macs
;; 01. general configurations
;; AUTHOR: Sungbin Jeon

;; this file defines the configurations, including Korean environments

;; Korean-related setting

;;; change default encoding to UTF-8
;;;; test
;;;; ref: [1] http://wiki.nacyot.com/documents/emacs/#.WVyTxGSPJhE
;;;; [2]: https://stackoverflow.com/questions/2901541/which-coding-system-should-i-use-in-emacs
(setq utf-translate-cjk-mode nil) ; disable CJK coding/encoding (Chinese/Japanese/Korean characters)
(set-language-environment 'utf-8)
(set-keyboard-coding-system 'utf-8-mac) ; For old Carbon emacs on OS X only
(setq locale-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8)
(unless (eq system-type 'windows-nt)
(set-selection-coding-system 'utf-8))
(prefer-coding-system 'utf-8)

;;; IME setting
;;; using IME-Cycle between various Korean and Japanese input methods
;;; loading external .el file
(load-file (concat cfg-path "/inc/imecycle.el"))
