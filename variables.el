;; GLOBAL VARIABLES
;; you may change the 

;; 1) paths
; custom-file-path: absolute path of the configurations folder

; dropbox-path: absolute path
; different path with OS, assuming default setting
(cond
 ((eq system-type 'windows-nt)
  (setq dropbox-path (substitute-in-file-name "$HOMEPATH/Dropbox")))
 ((eq system-type 'darwin)
  (setq dropbox-path "~/Dropbox"))
 ((eq system-type 'gnu/linux)
  (setq dropbox-path "~/Dropbox"))
 ((eq system-type 'cygwin)
  ())
 )
