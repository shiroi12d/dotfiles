;; =====
;; Theme
;; =====
(setq doom-theme 'doom-one)
(setq display-line-numbers-type t)

;; ======================
;; Org-mode Configuration
;; ======================
(setq org-directory "C:/Users/shiro/.org/")
(setq org-default-notes-file (expand-file-name "TODO.org" org-directory))
(setq org-agenda-files (directory-files-recursively org-directory "\\.org$"))
(setq org-agenda-skip-scheduled-if-done t
      org-agenda-skip-deadline-if-done t
      org-agenda-skip-timestamp-if-done t)

(after! org
  (setq org-capture-templates
        `(("t" "TODO" entry
           (file ,(expand-file-name "TODO.org" org-directory))
           "* TODO %?"))))

;; ======================
;; Org-roam Configuration
;; ======================
(use-package org-roam
  :ensure t
  :init
  (setq org-roam-directory (file-truename "C:/Users/shiro/.org/roam/"))
  :bind (("C-c n f" . org-roam-node-find)
         ("C-c n i" . org-roam-node-insert)
         ("C-c n c" . org-roam-capture))
  :config
  (org-roam-db-autosync-mode))

;; ==========================
;; Leader key map for SPC o c
;; ==========================
(map! :leader
      :prefix "o"
      :desc "Org Capture"
      "c" #'org-capture)

;; ============================
;; EVIL mode: jk to Normal mode 
;; ============================
(after! evil
  (general-define-key
   :states 'insert
   "j" (general-key-dispatch 'self-insert-command
         :timeout 0.5
         "k" #'evil-normal-state)))

;; ====
;; Font
;; ====
(setq doom-font (font-spec :family "Cascadia Code" :size 14))
