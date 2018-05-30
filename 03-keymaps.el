;; modified init.el for my Emacs setting
;; 03. keymaps
;; AUTHOR: Sungbin Jeon

;; DESC: this file collects the keymaps for custmization
;; NOTE: basically, my setting basically uses default keybindings offered by Emacs and packages as possible. Only for conflict keymaps, or (VERY) uncomfortable keymaps will be re-arragnged.

;; (left) windows key as super
(setq w32-lwindow-modifier 'super)

;; Package-related setting

;;; wc-mode
(global-set-key "\C-cw" 'wc-mode)
