;; -*- coding: utf-8 -*-
;;; init.el --- 한국어 사용자를 위한 GNU Emacs 설정

;; Copyright (c) Sungbin Jeon 2018

;; AUTHOR: Sungin Jeon <clockoon@gmail.com>
;; Created: 2018-06-02
;; Homepage: http://c20.kr

;; Description: 한국어 사용자를 위해, 속도, 가독성 및 사용성을 확보한 Emacs 설정
;; this is a minimal init file: it just loads other el files

;; set custom file and open: disable writing on  init.el
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(unless (file-exists-p custom-file)
  (write-region "" nil custom-file))
(load custom-file)

;; Faster startup: use converted .el file from .org, it exists
;; it automatically syncs by using 'emacs-sync' package: explained in config.org
(if (file-exists-p (expand-file-name "config.el" user-emacs-directory))
    (load-file (expand-file-name "config.el" user-emacs-directory))
  (org-babel-load-file (expand-file-name "config.org" user-emacs-directory)))
