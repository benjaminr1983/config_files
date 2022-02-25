;; setting up a project based package manager
(require 'package)
(setq package-user-dir (expand-file-name "./.packages"))
(setq package-archives '(("melpa" . "https://melpa.org/packages/")
			 ("elpa" . "https://elpa.gnu.org/packages/")))
;; initialize packaging system
(package-initialize)
(unless package-archive-contents
  (package-refresh-contents))
;; install dependencies
(package-install 'htmlize)
;; load the publishing system
(require 'ox-publish)
;; customize html-output
(setq org-html-validation-link nil                                                                            ;; remove validation link from html
      org-html-include-scripts nil                                                                             ;; use your own scripts
      org-html-head-include-default-style nil                                                            ;; use your own style  
      org-html-head "<link rel=\"css\" href=\"link_or_local_directory\" />")            ;; stylesheet loction
;; define the publishing project
(setq org-publish-project-alist
      (list
       (list "project_name"
	      :recursive t
	      :base-directory "./content"
	      :publishing-directory "./public"
	     :publishing-function 'org-html-publish-to-html
	     :with-author nil              ;; do not include the name of the author
	     :with-creator t               ;; include emacs/org versions in the footer
	     :with-toc t                     ;; include table of contents
	     :section-numbers nil       ;; do not include section numbers
	     :time-stamp-file nil)))     ;; do notinclude a time stamp in the file
;; generate the site output
(org-publish-all t)
(message "html is generated!")
