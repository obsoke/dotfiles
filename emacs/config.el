;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

(setq user-full-name "Dale Karp"
      user-mail-address "obsoke@obsoke.com")

;; appearance
(setq doom-font (font-spec :family "monospace" :size 20))
(setq doom-theme 'doom-dracula)
(setq display-line-numbers-type t)

;; general config
(setq-default
 ;; company
 company-idle-delay 0.2
 company-minimum-prefix-length 2

 ;; Reduce the delay time for when SPC (which-key) brings up list of keys
 which-key-idle-delay 0.25)
(setq org-directory "~/documents/Dropbox/org")
(setq org-agenda-skip-scheduled-if-done t
      org-agenda-skip-deadline-if-done t
      org-agenda-include-deadlines t
      org-agenda-block-separator nil
      org-agenda-tags-column 100 ;; from testing this seems to be a good value
      org-agenda-compact-blocks t)
(setq org-capture-templates
      `(("i" "inbox" entry (file ,(concat org-directory "/" "inbox.org"))
         "* TODO %?")
        ))
(setq org-agenda-custom-commands
      '(("o" "Overview"
         ((agenda "" ((org-agenda-span 'day)
                      (org-super-agenda-groups
                       '((:name "Today"
                          :time-grid t
                          :date today
                          :todo "TODAY"
                          :scheduled today
                          :order 1)))))
          (alltodo "" ((org-agenda-overriding-header "")
                       (org-super-agenda-groups
                        '((:name "Next to do"
                           :todo "NEXT"
                           :order 1)
                          (:name "Important"
                           :tag "Important"
                           :priority "A"
                           :order 6)
                          (:name "Due Today"
                           :deadline today
                           :order 2)
                          (:name "Due Soon"
                           :deadline future
                           :order 8)
                          (:name "Overdue"
                           :deadline past
                           :face error
                           :order 7)
                          (:name "Emacs"
                           :tag "Emacs"
                           :order 13)
                          (:name "Projects"
                           :tag "Project"
                           :order 14)
                          (:name "To read"
                           :tag "Read"
                           :order 30)
                          (:name "Waiting"
                           :todo "WAITING"
                           :order 20)
                          (:name "Trivial"
                           :priority<= "E"
                           :tag ("Trivial" "Unimportant")
                           :todo ("SOMEDAY" )
                           :order 90)
                          (:discard (:tag ("Chore" "Routine" "Daily")))))))))))
;; stolen from https://github.com/psamim/dotfiles/blob/master/doom/config.el
(setq org-agenda-category-icon-alist
 `(
   ("todo", (list (all-the-icons-material "check_box" :height 1.2)) nil nil :ascent center)
   ("work", (list (all-the-icons-material "work" :height 1.2)) nil nil :ascent center)
   ("chore", "~/.dotfiles/icons/loop.svg" nil nil :ascent center)
   ("events", "~/.dotfiles/icons/calendar.svg" nil nil :ascent center)
   ("walk", "~/.dotfiles/icons/walk.svg" nil nil :ascent center)
   ("solution", "~/.dotfiles/icons/solution.svg" nil nil :ascent center)
   ))
(setq org-agenda-block-separator (string-to-char " "))
(setq org-agenda-custom-commands
      '(("o" "My Agenda"
         ((todo "TODO" (
                        (org-agenda-overriding-header "\n⚡ Do Today:\n⎺⎺⎺⎺⎺⎺⎺⎺⎺")
                        (org-agenda-remove-tags t)
                        (org-agenda-prefix-format " %-2i %-15b")
                        (org-agenda-todo-keyword-format "")
                        ))
          (agenda "" (
                      (org-agenda-start-day "+0d")
                      (org-agenda-span 5)
                      (org-agenda-overriding-header "⚡ Schedule:\n⎺⎺⎺⎺⎺⎺⎺⎺⎺")
                      (org-agenda-repeating-timestamp-show-all nil)
                      (org-agenda-remove-tags t)
                      (org-agenda-prefix-format   "  %-3i  %-15b %t%s")
                      (org-agenda-todo-keyword-format " ☐ ")
                      (org-agenda-current-time-string "⮜┈┈┈┈┈┈┈ now")
                      (org-agenda-scheduled-leaders '("" ""))
                      (org-agenda-time-grid (quote ((daily today remove-match)
                                                    (0900 1200 1500 1800 2100)
                                                    "      " "┈┈┈┈┈┈┈┈┈┈┈┈┈")))
                      ))
          ))))
;; package config
(use-package! deft
  :config (setq deft-directory "~/documents/Dropbox/org"
                deft-extensions '("org")
                deft-use-filename-as-title nil
                deft-use-filter-string-for-filename t
                deft-file-naming-rules '((noslash . "-")
                                         (nospace . "_")
                                         (case-fn . downcase))
                deft-org-mode-title-prefix t))
(use-package! org-chef
  :commands (org-chef-insert-recipe org-chef-get-recipe-from-url))
(use-package! org-super-agenda
  :commands (org-super-agenda-mode))
(after! org-agenda
  (org-super-agenda-mode))
(after! org-superstar
  (setq org-superstar-headline-bullets-list '("◉" "○" "✸" "✿" "✤" "✜" "◆" "▶")
        ;; org-superstar-headline-bullets-list '("Ⅰ" "Ⅱ" "Ⅲ" "Ⅳ" "Ⅴ" "Ⅵ" "Ⅶ" "Ⅷ" "Ⅸ" "Ⅹ")
        org-superstar-prettify-item-bullets t ))
(after! org
  (setq org-ellipsis " ▾ "
        org-startup-folded t
        ;; The below two lines allow source code in src blocks to be aligned
        org-src-preserve-indentation nil
        org-edit-src-content-indentation 0
        org-priority-highest ?A
        org-priority-lowest ?E
        org-priority-faces
        '((?A . 'all-the-icons-red)
          (?B . 'all-the-icons-orange)
          (?C . 'all-the-icons-yellow)
          (?D . 'all-the-icons-green)
          (?E . 'all-the-icons-blue))))
(setq rustic-lsp-server 'rust-analyzer)

(setq org-roam-directory "/home/dale/documents/Dropbox/org/roam"
      org-roam-completion-anywhere t)

;; custom functions
(defun obsoke/ediff-dotfile-and-template ()
  "ediff the current `dotfile' with the template"
  (interactive)
  (ediff-files
   "~/.doom.d/init.el"
   "~/.emacs.d/init.example.el"))
