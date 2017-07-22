;; modified init.el for my Emacs setting
;; 02. packages
;; AUTHOR: Sungbin Jeon

;; DESC: this file lists and installs (with basic configurations) the required packages
;;; NOTE:
;;; 1) my configurations uses use-package for installing and setting packages
;;; 2) specific configurations would be placed on pkgcfg directory
;;; 3) CONTINUOUSLY check: which package the :defer option should be placed

;; Start with initiallization
(setq package--init-file-ensured 't) ;; prevent writing (package-initilize) on init.el
(package-initialize)

;;; adding package sources
(when (not (assoc-default "melpa" package-archives))
  (add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t))
(when (not (assoc-default "org" package-archives))
  (add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/") t))
;;; note: if package install-related error occurs, excute (package-refresh-contents)

;;; install use-package
;;; to use use-package you should install use-package without use-package
(when (not (package-installed-p 'use-package))
  (package-install 'use-package))

;;; use-package setting
(setq use-package-verbose t) ;;; print the messages about packages with slow loading
(setq use-package-always-ensure t) ;;; always check whether the package is installed or not (if not it automatically install)

;; Let's start install

;; 1) system-related
;;; auto-compile
(use-package auto-compile
  :config (auto-compile-on-load-mode))
(setq load-prefer-newer t)

;;; winner-mode: undo / redo windows layouts
(use-package winner)


;; 2) writing-related
;;; org-mode
(use-package org
  :defer t)

;; 3) coding-related
;;; smartparens
(use-package smartparens
  :config
  (progn
    (require 'smartparens-config)))

;; 4) reading-related
;;; pdf-tools
(use-package pdf-tools
  :config
  (pdf-tools-install))

;; 5) appearance-related
;;; theme
(use-package gruvbox-theme
  :config
  (load-theme 'gruvbox t))
