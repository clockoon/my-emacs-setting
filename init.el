;; -*- coding: utf-8 -*-
;;; init.el --- 한국어 사용자를 위한 GNU Emacs 설정

;; Copyright (c) Sungbin Jeon 2018

;; AUTHOR: Sungin Jeon <clockoon@gmail.com>
;; Created: 2018-06-02
;; Homepage: http://c20.kr

;; Description: 한국어 사용자를 위해, 속도, 가독성 및 사용성을 확보한 Emacs 설정

;; Faster startup: reducing the frequency of garbage collection
;; REF: https://github.com/rememberYou/.emacs.d/
(setq gc-cons-threshold (* 50 1000 1000))

(setq package--init-file-ensured 't) ;; prevent writing (package-initilize) on init.el

;; 초기 설정: org-mode가 설치되어 있지 않을 경우 'freshstart.el' 파일을 불러들여 진행
(when (not (package-installed-p 'org))
  (load-file (expand-file-name "freshstart.el" user-emacs-directory)))

;; Faster startup: use converted .el file from .org, it exists
;; it automatically syncs by using 'emacs-sync' package: explained in config.org
(if (file-exists-p (expand-file-name "config.el" user-emacs-directory))
    (load-file (expand-file-name "config.el" user-emacs-directory))
  (org-babel-load-file (expand-file-name "config.org" user-emacs-directory)))

;; Make gc pauses faster by decreasing the threshold.
(setq gc-cons-threshold (* 2 1000 1000))

;; set custom file and open: disable writing on  init.el
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(load custom-file)
