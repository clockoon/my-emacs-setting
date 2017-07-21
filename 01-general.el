;; modified init.el for my Emacs setting
;; 01. general configurations
;; AUTHOR: Sungbin Jeon

;; DESC: this file defines the configurations about general settings (non-package-depended), including Korean environments

;; prevent emacs auto-write custom fields on my conf. files
(setq custom-file (concat cfg-path "/custom.el"))
(load custom-file :noerror)

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

;; General editor setting
;;; auto line wrapp
(global-visual-line-mode t)

;; Temp directories
;; including backups, autosave, histories
(setq backup-directory-alist `((".*" . ,(concat cfg-path "/backup/")))) ;; backups
(setq version-control t ;; enable VC
      vc-make-backup-files t ;; generate backup files
      kept-old-versions 0 ;; do not keep oldest versions 
      ketp-new-versions 10 ;; keep many newest versions
      delete-old-versions t) ;; automatically delete outdated backups
(setq auto-save-file-name-transforms `((".*" ,(concat cfg-path "/auto-save-list/") t))) ;; autosaves
(savehist-mode 1)
(setq savehist-file (concat cfg-path "/savehist"))

;;; font setting
(select-kr-font "c")

;; Miscellaneous
;;; display time
(setq display-time-format "%y%m%d %H:%M")
(display-time-mode 1)
;;; Sentences end with a single space
(setq sentence-end-double-space nil)
