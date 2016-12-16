;; 패키지 초기화
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)
;(add-to-list 'package-archives
;             '("marmalade" . "http://marmalade-repo.org/packages/") t)
(package-initialize)

;; use-package 설치
(when (not (package-installed-p 'use-package))
  (package-refresh-contents)
  (package-install 'use-package))

;; packages
; markdown
(use-package markdown-mode
  :ensure t
  :commands (markdown-mode gfm-mode)
  :mode (("README\\.md\\'" . gfm-mode)
         ("\\.md\\'" . markdown-mode)
         ("\\.markdown\\'" . markdown-mode))
  :init (setq markdown-command "multimarkdown"))

; mediawiki
(use-package mediawiki
  :ensure t)

; distraction-free
(use-package writeroom-mode
  :ensure t)

; powerline
(use-package powerline
  :ensure t
  :config
  (powerline-default-theme))

; theme
(use-package afternoon-theme
  :ensure t)
(use-package color-theme-sanityinc-tomorrow
  :ensure t)
(use-package zenburn-theme
  :ensure t)

(load-theme 'zenburn t)
