;; 패키지 초기화
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/"))
;(add-to-list 'package-archives
;             '("marmalade" . "http://marmalade-repo.org/packages/") t)
(package-initialize)

;; use-package 설치
(when (not (package-installed-p 'use-package))
  (package-refresh-contents)
  (package-install 'use-package))


;;;;;; packages

;;; 1) System-wise

;; helm
(use-package helm
  :ensure t
  :after evil
  :config
  (helm-mode 1))
  

;; evil (and dependancies)
(use-package evil
  :ensure t
  :config
  (evil-mode 1))
(use-package undo-tree
  :ensure t)
(use-package goto-chg
  :ensure t)

;;; 2) Syntax
;; markdown
(use-package markdown-mode
  :ensure t
  :commands (markdown-mode gfm-mode)
  :mode (("README\\.md\\'" . gfm-mode)
         ("\\.md\\'" . markdown-mode)
         ("\\.markdown\\'" . markdown-mode))
  :init (setq markdown-command "multimarkdown"))

;; Haskell
(use-package haskell-mode
  :ensure t)

; org-mode
(use-package org
  :ensure t
  :config
  (load-file (concat custom-file-path "/usr/orgmode.el")))

;;; 3) for wrIting - AppearancE
;; Distraction-free
(use-package writeroom-mode
  :ensure t
  :config
  (global-visual-line-mode 1)) ; enable word wrap

;; powerline
(use-package powerline
  :ensure t
  :config
  (powerline-default-theme))

;; word count
(use-package wc-mode
  :ensure t
  :init
  (setq wc-modeline-format "[Words: %tw, Chars: %tc]"))
  
;; theme
(use-package afternoon-theme
  :ensure t)
(use-package color-theme-sanityinc-tomorrow
  :ensure t)
(use-package zenburn-theme
  :ensure t)

(load-theme 'sanityinc-tomorrow-night t)

;;; 4) For coding
;; encoding detection
;; To detect the encoding, we will use unicad (https://code.google.com/archive/p/unicad/) and include the source file directly
;; ref: http://blog.kaisyu.com/2011/01/emacs-encoding-unicad.html
(load-file (concat custom-file-path "/inc/unicad.el"))
(require 'unicad)

;; Git
(use-package magit
  :ensure t)
