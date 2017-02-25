;; IME-Cycle: cycle and toggle between deferent IMES
;; AUTHOR: Sungbin Jeon
;; Inspired by:
;;  - https://kldp.org/node/109184
;;  - https://stackoverflow.com/questions/34505209/lisp-cycle-through-functions/34505716#34505716

;; define IME list
(defvar usr-input-method-list 
  '("korean-hangul"
   "korean-hangul390"
   "korean-hangul3f"
   "japanese")) ;; add or modify any other IME you want
(setq default-input-method "korean-hangul")

;; Set key bindings
(global-set-key [?\C-\\] 'usr-input-index-cycle)
(global-set-key [?\S- ] 'usr-input-method-toggle)

;; define IME index
(defvar usr-input-method--index 1 "Index of input method. Default: 2벌식.")

(defun usr-input-index-cycle (&optional skip)
  "Update `use-input-method-inex' by adding SKIP (default 1) and
wrapping if necessary, then call the function at this index in
`use-input-ethod-list'."
  (interactive)
  (setq usr-input-method--index (+ usr-input-method--index (or skip 1)))
  ;; BUG: skips with an absolute value bigger than 1 don't wrap properly.
  (if (>= usr-input-method--index (length usr-input-method-list))
      (setq usr-input-method--index 0)
    (when (< usr-input-method--index 0)
      (setq usr-input-method--index (1- (length usr-input-method-list))) ))
  (set-input-method (nth usr-input-method--index usr-input-method-list))
  (message "Current IME: %S" (nth usr-input-method--index usr-input-method-list)) )

(defun usr-input-method-toggle ()
  (interactive)
  (if (eq current-input-method nil)
      (set-input-method (nth usr-input-method--index usr-input-method-list))
    (set-input-method nil)) )
