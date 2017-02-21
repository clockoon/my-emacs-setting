;; custom settings for org-mode

;; set org folders
; by default, the folders are set in Dropbox folder
; you must modify the exact folder of the org files
(setq org-path (concat dropbox-path "/orgs"))

;; Capture templates
(setq org-capture-templates
  '(("m" "Journal-music" entry (file+datetree (concat org-path "/journal-music.org"))
          "* %? \n %U\n")
   ("j" "Journal-general" entry (file+datetree "~/org/journal.org")
        "* %?\nEntered on %U\n %i\n %a")))
