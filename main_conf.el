
;; 한글 설정
(set-language-environment "Korean") ;; 내부 입력기 사용
(prefer-coding-system 'utf-8) ;; 인코딩 변경
(global-set-key (kbd "<S-kana>") 'toggle-input-method) ;; 한영변경 (Shift-space)
(global-set-key (kbd "<kana>") 'toggle-input-method) ;; 한영변경 (한/영키)

;; 패키지 설정
;; load external .el files
;; refs:
;; [1] http://y.tsutsumi.io/emacs-from-scratch-part-2-package-management.html
;; [2] use-package (http://ohyecloudy.com/emacsian/2016/11/20/package-use-package/)
(load-file (concat custom-file-path "/packages.el"))

;; Key-map
;; load external .el file
(load-file (concat custom-file-path "/keymap.el"))

;; 폰트 설정
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "D2Coding" :foundry "unknown" :slant normal :weight normal :height 128 :width normal))))
 '(mode-line ((t (:family "D2Coding" :foundry "unknown" :slant normal :weight normal :height 120 :width normal)))))

;; store backup files in .emacs.d/backups
(defconst emacs-backup-directory (concat custom-file-path "/.emacs.d/backups/")) ;; you MUST create the directory before use it
(setq backup-directory-alist `((".*" . ,emacs-backup-directory))
      auto-save-file-name-transforms `((".*" ,emacs-backup-directory t)))
