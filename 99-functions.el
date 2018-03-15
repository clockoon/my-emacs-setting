;; modified dotfiles for my Emacs setting
;; 99. customized functions
;; AUTHOR: Sungbin Jeon


;; select fonts
;;; refs: [1] https://github.com/syl20bnr/spacemacs/issues/9445
;;;       [2] https://emacs.stackexchange.com/questions/28390/quickly-adjusting-text-to-dpi-changes
(defun select-kr-font (opt)
  (when window-system
    (let* ((attrs (car (display-monitor-attributes-list)))
         (size (assoc 'mm-size attrs))
         (sizex (cadr size))
         (res (cdr (assoc 'geometry attrs)))
         (resx (- (cadr (cdr res)) (car res)))
         (dpi (* (/ (float resx) sizex) 25.4)))
    (cond
     ((< dpi 110)
      (setq x-font-height 16))
     ((< dpi 130)
      (setq x-font-height 18))
     ((< dpi 160)
      (setq x-font-height 20))
      (t (setq x-font-height 22)))))
	 
;   (if (> (x-display-pixel-width) 1600)
;	(setq x-font-height 16)
;      (setq x-font-height 12)))
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
    
