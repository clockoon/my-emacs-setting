;; modified dotfiles for my Emacs setting
;; 99. customized functions
;; AUTHOR: Sungbin Jeon


;; select fonts
(defun select-kr-font (opt)
  (cond
   ((string= opt "c") ;; "c" means "codding"
    (custom-set-faces
     '(default ((t (:family "D2Coding" :foundry "unknown" :slant normal :weight normal :height 120 :width normal))))))
   ((string= opt "s") ;; "s" means serif
    (custom-set-faces
     '(default ((t (:family "Noto Serif KR" :foundry "unknown" :slant normal :weight normal :height 100 :width normal))))))
   ((string= opt "ss") ;; "ss" means san-serif
    (custom-set-faces
     '(default ((t (:family "Noto Sans CJK KR" :foundry "unknown" :slant normal :weight normal :height 100 :width normal))))))
   )
    (custom-set-faces
     '(mode-line ((t (:family "D2Coding" :foundry "unknown" :slant normal :weight normal :height 110 :width normal))))))
