;;; config.el obsoke's config file for Doom emacs -*- lexical-binding: t; -*-

;;
;; define helper functions
;;

;; taken from spacemacs & adjusted for my own needs
(defun obsoke/ediff-dotfile-and-template ()
  "ediff the current `dotfile' with the template"
  (interactive)
  (ediff-files
   "~/.doom.d/init.el"
   "~/.emacs.d/init.example.el"))

;;
;; package config
;;
(def-package! prettier-js
  :init (setq-default prettier-js-command "/usr/bin/prettier"
                      prettier-js-args '("--single-quote"))
  :hook ((web-mode . prettier-js-mode)
         (js2-mode . prettier-js-mode)
         (typescript-mode . prettier-js-mode)
         (tide-mode . prettier-js-mode)))
(def-package! deft
  :init (setq-default deft-directory "~/documents/Dropbox/Apps/Orgzly"
                      deft-extensions '("org")
                      deft-use-filename-as-title nil
                      deft-use-filter-string-for-filename t
                      deft-file-naming-rules '((noslash . "-")
                                               (nospace . "_")
                                               (case-fn . downcase))
                      deft-org-mode-title-prefix t))
(def-package! anki-editor)
(def-package! ox-hugo)
(def-package! org-super-agenda
  :after org-agenda
  :config
  (org-super-agenda-mode))

;; org mode fix for making line wrapping work the way i want
;; TODO: don't be uggo
(remove-hook 'org-mode-hook #'auto-fill-mode)
(add-hook 'org-mode-hook #'visual-line-mode)
;; allow new bullets to be auto-created within lists when hitting 'o'/'O' in normal mode
(add-to-list 'evil-org-special-o/O 'item)


;;
;; setting defaults
;;
(setq-default
 ;; indent levels
 tab-width 2
 js-indent-level 2
 js2-basic-offset 2
 typescript-indent-level 2
 css-indent-offset 2
 web-mode-markup-indent-offset 2
 web-mode-css-indent-offset 2
 web-mode-code-indent-offset 2
 web-mode-attr-indent-offset 2

 ;; company
 company-idle-delay 0.2
 company-minimum-prefix-length 2

 ;; Reduce the delay time for when SPC (which-key) brings up list of keys
 which-key-idle-delay 0.25

 ;; typescript
 tide-tsserver-executable "/usr/bin/tsserver"

 ;; rust
 rust-format-on-save t
 rust-rustfmt-bin "/usr/bin/rustfmt"

 ;; org
 org-directory "~/org"
 org-agenda-files (list "/home/dale/documents/Dropbox/Apps/Orgzly/")
 )

;;
;; key bindings
;;
(map!
 (:leader
   :desc "Diff dotfiles"          :nv "d" #'obsoke/ediff-dotfile-and-template
   (:desc "file" :prefix "f"
     :desc "Find File"            :n "f" #'counsel-find-file
     :desc "Save buffer"          :n "s" #'save-buffer)
   (:desc "project" :prefix "p"
     :desc "Find File in Project" :n "f" #'projectile-find-file)
   (:desc "window" :prefix "w"
     :desc "close window"         :n "d" #'+workspace/close-window-or-workspace
     :desc "split vert"           :n "-" #'split-window-vertically
     :desc "split horiz"          :n "/" #'split-window-horizontally)
   (:desc "git" :prefix "g"
     :desc "Git status"           :n  "s" #'magit-status
     :desc "Git stage hunk"       :n  "S" #'git-gutter:stage-hunk
     :desc "Git checkout"         :n  "c" #'magit-branch-checkout
     :desc "merge-conflict"       :n  "m" #'+hydra-smerge/body
     :desc "List gists"           :n  "g" #'+gist:list)
   (:desc "open" :prefix "o"
     :desc "Eshell"               :n  "e" #'+eshell/open-popup
     :desc "Neotree"              :n  "n" #'neotree-find
     :desc "APP: Deft"            :n  "D" #'deft)
   (:desc "eval" :prefix "e"
     :desc "Eval buffer"          :n "b" #'eval-buffer
     :desc "Eval region"          :n "r" #'eval-region)
   )
 (:map org-mode-map
   :localleader
   :desc "Insert heading above"          :n "O" #'org-insert-heading
   :desc "Insert heading below"          :n "o" #'org-insert-heading-after-current
   :desc "Insert subheading"             :n "s" #'org-insert-subheading
   (:desc "anki" :prefix "a"
     :desc "Insert new deck"           :n "d" #'anki-editor-insert-deck
     :desc "Insert new note"           :n "n" #'anki-editor-insert-note
     :desc "Submit buffer to Anki"     :n "s" #'anki-editor-push-notes
     )
   )
 )

(provide 'config)
;;; config.el ends here

