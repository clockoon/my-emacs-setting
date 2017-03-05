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

;; Additional macros
; Youtube
; ref: http://endlessparentheses.com/embedding-youtube-videos-with-org-mode-links.html
; Usage: [[yt:"YoutubeID"]]

(defvar yt-iframe-format
  ;; You may want to change your width and height.
  (concat "<iframe width=\"440\""
          " height=\"335\""
          " src=\"https://www.youtube.com/embed/%s\""
          " frameborder=\"0\""
          " allowfullscreen>%s</iframe>"))

(org-add-link-type
 "yt"
 (lambda (handle)
   (browse-url
    (concat "https://www.youtube.com/embed/"
            handle)))
 (lambda (path desc backend)
   (cl-case backend
     (html (format yt-iframe-format
                   path (or desc "")))
     (latex (format "\href{%s}{%s}"
                    path (or desc "video"))))))
