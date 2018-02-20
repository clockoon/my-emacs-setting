;; modified dotfiles for my Emacs setting
;; 99. customized functions
;; AUTHOR: Sungbin Jeon


;; select fonts
;;; ref: https://github.com/syl20bnr/spacemacs/issues/9445
(defun select-kr-font (opt)
  (when window-system
   (if (> (x-display-pixel-width) 1600)
	(setq x-font-height 16)
      (setq x-font-height 12)))
  (cond
   ((string= opt "c") ;; "c" means "codding"
    (set-face-attribute 'default nil :font
			(format "%s:pixelsize=%d" "D2Coding" x-font-height)))
   ((string= opt "s") ;; "s" means serif
      (set-face-attribute 'default nil :font
			(format "%s:pixelsize=%d" "Noto Serif KR" (- x-font-height 2))))
   ((string= opt "ss") ;; "ss" means san-serif
   (set-face-attribute 'default nil :font
			(format "%s:pixelsize=%d" "Noto Sans CJK KR" (- x-font-height 2))))
   )
   (set-face-attribute 'mode-line nil :font
			(format "%s:pixelsize=%d" "D2Coding" (- x-font-height 1))))
    
