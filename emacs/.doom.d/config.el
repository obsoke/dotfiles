;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "Dale Karp"
      user-mail-address "obsoke@obsoke.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;;
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
;; (setq doom-font (font-spec :family "monospace" :size 12 :weight 'semi-light)
;;       doom-variable-pitch-font (font-spec :family "sans" :size 13))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-dracula)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/documents/Dropbox/org")

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)


;; Here are some additional functions/macros that could help you configure Doom:
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.

;; general config
(setq-default
 ;; general
 typescript-indent-level 2

 ;; company
 company-idle-delay 0.2
 company-minimum-prefix-length 2

 ;; Reduce the delay time for when SPC (which-key) brings up list of keys
 which-key-idle-delay 0.25)
(setenv "TSSERVER_LOG_FILE" "/tmp/tsserver.log")

(after! org
  (setq ;; The below two lines allow source code in src blocks to be aligned
   org-src-preserve-indentation nil
   org-edit-src-content-indentation 0
   org-cycle-include-plain-lists 'integrate

   org-hugo-base-dir "/home/dale/projects/obsoke.com"
   org-hugo-section "notes"))

(after! org-roam
  (setq
   org-roam-directory "/home/dale/documents/Dropbox/org/roam"
   org-roam-completion-anywhere t
   org-roam-dailies-capture-templates
   '(("d" "default" entry "* %<%I:%M %p>: %?"
      :if-new (file+head "%<%Y-%m-%d>.org" "#+title: %<%Y-%m-%d>\n")))
   org-roam-db-node-include-function (lambda ()
     (not (member "daily" (org-get-tags))))))

(use-package! websocket
    :after org-roam)

(use-package! org-roam-ui
    :after org-roam ;; or :after org
;;         normally we'd recommend hooking orui after org-roam, but since org-roam does not have
;;         a hookable mode anymore, you're advised to pick something yourself
;;         if you don't care about startup time, use
;;  :hook (after-init . org-roam-ui-mode)
    :config
    (setq org-roam-ui-sync-theme t
          org-roam-ui-follow t
          org-roam-ui-update-on-save t
          org-roam-ui-open-on-start t
          org-roam-completion-anywhere t))

(use-package! deft
  :config (setq deft-directory org-directory
                deft-extensions '("org")
                deft-use-filename-as-title nil
                deft-use-filter-string-for-filename t
                deft-file-naming-rules '((noslash . "-")
                                         (nospace . "_")
                                         (case-fn . downcase))
                deft-org-mode-title-prefix t))

(after! rustic
  (setq rustic-lsp-server 'rust-analyzer))

;; custom functions
(defun obsoke/ediff-dotfile-and-template ()
  "ediff the current `dotfile' with the template"
  (interactive)
  (ediff-files
   "~/.doom.d/init.el"
   "~/.emacs.d/templates/init.example.el"))

;; Override org-roam's "Find node" with one that filters out :daily: files
;; TEMP: in order to filter tags from org-roam files
(cl-defun my/org-roam-node--filter-by-tags (node &optional included-tags excluded-tags)
  "Filter org-roam-node by tags."
  (let* ((tags (org-roam-node-tags node))
         (file-path (org-roam-node-file node))
         (rel-file-path (f-relative file-path org-roam-directory))
         (parent-directories (butlast (f-split rel-file-path)))
         (tags (cl-union tags parent-directories)))
    (if (or
         ;; (and included-tags (cl-notevery (lambda (x) (cl-member x tags :test #'string=)) included-tags))
         (and included-tags (not (cl-intersection included-tags tags :test #'string=)))
         (and excluded-tags (cl-intersection excluded-tags tags :test #'string=))
         ) nil t)))
(cl-defun my/org-roam-node-find (included-tags excluded-tags)
  "Modded org-roam-node-find which filters nodes using tags."
  (interactive)
  (org-roam-node-find nil nil
                      (lambda (node) (my/org-roam-node--filter-by-tags node included-tags excluded-tags))))
(cl-defun my/org-roam-node-insert (included-tags excluded-tags)
  "Modded org-roam-node-insert which filters nodes using tags."
  (interactive)
  (org-roam-node-insert
   (lambda (node) (my/org-roam-node--filter-by-tags node included-tags excluded-tags))))

(map! :leader
      :prefix ("n" . "notes")
      (:prefix ("r" . "roam")
       :desc "Find node" "f" #'(lambda () (interactive) (my/org-roam-node-find nil '("daily" "captures")))))
