(package-initialize)
(require 'org)
(require 'ox)
(require 'ox-publish)

(setq user-full-name "obsoke")
(setq user-mail-address "dale@dale.io")

(setq org-publish-project-alist
      '(("whatidid"
         :base-directory "~/org/whatidid/"
         :publishing-directory "~/projects/web/obsoke.com/whatidid"
         :publishing-function org-twbs-publish-to-html
         :with-headline-numbers nil
         :html-head-extra "<style>h4 { font-weight: bold; }</style>"
         :table-of-contents 2)))


(org-mode)
(org-publish-project "whatidid")
