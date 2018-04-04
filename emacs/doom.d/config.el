;;; config.el obsoke's config file for Doom emacs -*- lexical-binding: t; -*-

;;
;; define helper functions
;;

;; taken from spacemacs & adjusted
(defun obsoke/ediff-dotfile-and-template ()
  "ediff the current `dotfile' with the template"
  (interactive)
  (ediff-files
   "~/.doom.d/init.el"
   "~/.emacs.d/init.example.el"))

;;
;; package config
;;
(def-package! prettier-js)
(def-package! deft)
(def-package! anki-editor)

(add-hook 'web-mode-hook 'prettier-js-mode)
(add-hook 'js2-mode-hook 'prettier-js-mode)
(add-hook 'typescript-mode-hook 'prettier-js-mode)
(add-hook 'tide-mode-hook 'prettier-js-mode)

;; magit - window split should be horizontal, not vertical
;; taken from https://github.com/hlissner/doom-emacs/issues/475
(set! :popup "^.*magit" '((slot . -1) (side . right) (size . 80)) '((select . t)))
(set! :popup "^\\*magit.*popup\\*" '((slot . 0) (side . right)) '((select . t)))
(set! :popup "^.*magit-revision:.*" '((slot . 2) (side . right) (window-height . 0.6)) '((select . t)))
(set! :popup "^.*magit-diff:.*" '((slot . 2) (side . right) (window-height . 0.6)) '((select)))

;; activate company mode
(require 'company)

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
 tide-tsserver-executable "/home/dale/.node_modules/bin/tsserver"

 ;; rust
 rust-format-on-save t
 rust-rustfmt-bin "/home/dale/.cargo/bin/rustfmt"

 ;; org
 org-directory "~/org"

 ;; prettier
 prettier-js-command "/home/dale/.node_modules/bin/prettier"
 prettier-js-args '(
                    "--single-quote"
                    )

 ;; deft
 deft-directory "~/documents/Dropbox/Apps/Orgzly"
 deft-use-filename-as-title nil
 deft-use-filter-string-for-filename t
 deft-org-mode-title-prefix t
 )


;;
;; key bindings
;;
(map!
 (:leader
   :desc "toggle last buffer"     :nv "TAB" #'evil-switch-to-windows-last-buffer
   :desc "Diff dotfiles"          :nv "d" #'obsoke/ediff-dotfile-and-template
   (:desc "file" :prefix "f"
     :desc "Find File"            :n "f" #'counsel-find-file
     :desc "Save buffer"          :n "s" #'save-buffer)
   (:desc "project" :prefix "p"
     :desc "Find File in Project" :n "f" #'projectile-find-file)
   (:desc "window" :prefix "w"
     :desc "close window"         :n "d" #'+workspace/close-window-or-workspace
     :desc "split vert"           :n "-" #'split-window-vertically
     :desc "max-buffer"           :n "m" #'tees/max-buffer
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
     :desc "Submit buffer to Anki"     :n "s" #'anki-editor-submit
     )
   )
 )

(provide 'config)
;;; config.el ends here

