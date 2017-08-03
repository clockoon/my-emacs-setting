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
;;; to use use-package you should install use-package without
(when (not (package-installed-p 'use-package))
  (condition-case nil
      (package-install 'use-package)
    (error
     (package-refresh-contents)
     (package-install 'use-package))))

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
(use-package winner
  :defer t
  :config (winner-mode))

;;; Helm
(use-package helm
  :diminish helm-mode
  :config
  (progn
    (require 'helm-config)
    (setq helm-candidate-number-limit 100)
    ;;;; ref: https://gist.github.com/antifuchs/9238468
    (setq helm-idle-delay 0.0 ; update fast sources immediately (doesn't).
          helm-input-idle-delay 0.01  ; this actually updates things
                                        ; reeeelatively quickly.
          helm-yas-display-key-on-candidate t
          helm-quick-update t
          helm-M-x-requires-pattern nil
          helm-ff-skip-boring-files t)
    (helm-mode))
  :bind (("M-x" . helm-M-x)
	 ("C-c h" . helm-mini)
	 ("C-x b" . helm-buffers-list)
	 ("C-h a" . helm-apropos)
	 ("C-x C-f" . helm-find-files)))

;; 2) writing-related
;;; org-mode
(use-package org
  :defer t)
;;;; exporting
(use-package ox-mediawiki
  )

;;; writeroom-mode
(use-package writeroom-mode
  )

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
  (pdf-tools-install)
  (cond ;;; OS check: setting epdfinfo setting depends on OS
   ((eq system-type 'windows-nt)
    (setenv "PATH" (concat "C:\\msys64\\mingw64\\bin;" (getenv "PATH"))))
   )
  )

;; 5) appearance-related
;;; theme
(use-package gruvbox-theme
  :config
  (load-theme 'gruvbox t))

;;; powerline
(use-package powerline
  :config
  (powerline-center-theme))

;;; word count
(use-package wc-mode
  :config
  (setq wc-modeline-format
	(concat "[%tw" (if wc-word-goal "/%gw") "w %tc" (if wc-char-goal "/%gc") "c]")))
