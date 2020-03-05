;; -*- coding: utf-8 -*-
;;; init.el --- 한국어 사용자를 위한 GNU Emacs 설정

;; Copyright (c) Sungbin Jeon 2018

;; AUTHOR: Sungin Jeon <clockoon@gmail.com>
;; Created: 2018-06-02
;; Homepage: http://c20.kr

;; Description: 한국어 사용자를 위해, 속도, 가독성 및 사용성을 확보한 Emacs 설정

;; Faster startup: adjusting the frequency of garbage collection
;; REF: https://bling.github.io/blog/2016/01/18/why-are-you-changing-gc-cons-threshold/
(defun my-minibuffer-setup-hook ()
  (setq gc-cons-threshold most-positive-fixnum))

(defun my-minibuffer-exit-hook ()
  (setq gc-cons-threshold 800000))

(add-hook 'minibuffer-setup-hook #'my-minibuffer-setup-hook)
(add-hook 'minibuffer-exit-hook #'my-minibuffer-exit-hook)

;;
;; This starts the Emacs server when .emacs gets loaded
;;
;; REF: https://www.emacswiki.org/emacs/WThirtyTwoServerMode 
(require 'server)
(if (not (server-running-p)) (server-start))

;; set user file and open: storing user setting e.g. proxy
(setq user-file (expand-file-name "user-setting.el" user-emacs-directory))
(unless (file-exists-p user-file)
  (write-region "" nil user-file))
(load user-file)

;; set custom file and open: disable writing on  init.el
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(unless (file-exists-p custom-file)
  (write-region "" nil custom-file))
(load custom-file)

(setq package--init-file-ensured 't) ;; prevent writing (package-initilize) on init.el
(package-initialize) ;; package-installed-p 때문에 초기화 필요

;; 초기 설정: org-mode가 설치되어 있지 않을 경우 'freshstart.el' 파일을 불러들여 진행
(when (not (package-installed-p 'org))
  (load-file (expand-file-name "freshstart.el" user-emacs-directory)))

;; Faster startup: use converted .el file from .org, it exists
;; it automatically syncs by using 'emacs-sync' package: explained in config.org
(if (file-exists-p (expand-file-name "config.el" user-emacs-directory))
    (load-file (expand-file-name "config.el" user-emacs-directory))
  (org-babel-load-file (expand-file-name "config.org" user-emacs-directory)))
