;; keymap.el
;; settings for GLOBAL key combinations for some commands

;; org-mode
;; ref: http://orgmode.org/orgguide.pdf
;; The following lines are always needed. Choose your own keys.
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cc" 'org-capture)
(global-set-key "\C-cb" 'org-iswitchb)

;; helm & evil
(with-eval-after-load 'helm
  (define-key evil-normal-state-map (kbd "SPC") 'helm-M-x))
