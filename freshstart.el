;; freshstart.el --- 초기 패키지 설정

;; Copyright (c) Sungbin Jeon 2018

;; AUTHOR: Sungin Jeon <clockoon@gmail.com>
;; Created: 2018-06-02
;; Homepage: http://c20.kr

;; Description: 초기에 필요한 설치 과정을 진행


(setq package--init-file-ensured 't) ;; prevent writing (package-initialize) on init.el
(package-initialize)

;; adding package sources
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/") t))

;; refresh or fetching package list
(package-refresh-contents)

;; install org-mode
(package-install 'org)

;; NOW READY TO GO!
