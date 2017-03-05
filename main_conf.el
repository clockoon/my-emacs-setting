;; 전역 변수
(load-file (concat custom-file-path "/variables.el")) ; pre-defined

;; 한글 설정
(prefer-coding-system 'utf-8) ;; 인코딩 변경
(set-language-environment "Korean")
;; 입력기 설정
(load-file (concat custom-file-path "/inc/imecycle.el"))

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

;; mode-line 설정
(display-time-mode 1)
(display-battery-mode 1)

;; PDF 설정
; doc-view-mode 사용: pdf-tools는 안정화된 후 도입
; 외부 프로그램을 사용하는 것을 권장
(cond
 ((eq system-type 'darwin)
  (setq doc-view-ghostscript-program "gs"))
 ((eq system-type 'windows-nt)
  (setq doc-view-ghostscript-program "gswin64c"))
 ((eq system-type 'gnu/linux)
  ())
 ((eq system-type 'cygwin)
  ())
 )

;; 기타
; 괄호 매칭 모드
(show-paren-mode 1)
(setq show-paren-delay 0)

; Buffer list popup
; ref: https://coderwall.com/p/wsbdww/a-quick-easy-buffer-menu-for-emacs
;; used for quick menu switching between buffers
(defun menu-list-from-buffers () 
  (cons "PANE" (mapcar (lambda (e)  (list (buffer-name e) e)) (remove-if (lambda (e)  (string-match "\*.*\*" (buffer-name e))  )(buffer-list))))
)

(defun menu-switch ()
  (interactive)
  (set-window-buffer nil (car (x-popup-menu t (list "Switch To Buffer" (menu-list-from-buffers)))))
)

(global-set-key (kbd "C-M-z") 'menu-switch)
