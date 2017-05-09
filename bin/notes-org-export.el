(package-initialize)
(require 'org)
(require 'ox)
(require 'ox-publish)

(setq user-full-name "obsoke")
(setq user-mail-address "dale@dale.io")

(setq org-publish-project-alist
      '(("notes"
         :base-directory "~/org/notes/"
         :publishing-directory "~/projects/web/obsoke.com/notes"
         :publishing-function org-twbs-publish-to-html
         :with-headline-numbers nil
         :table-of-contents 2)))


(org-mode)
(org-publish-project "notes")
