(setq doom-font (font-spec :family "FiraCode Nerd Font" :size 18 :weight `Regular)
      doom-variable-pitch-font (font-spec :family "FiraCode Nerd Font Med" :size 14))





;;



(use-package! org-super-agenda
  :after org-agenda
  :init
  (setq org-super-agenda-groups '((:name "Today"
                                        :time-grid t
                                        :scheduled today)
                                  (:name "Due today"
                                        :deadline today)
                                  (:name "Important"
                                        :priority "A")
                                  (:name "Overdue"
                                        :deadline past)
                                  (:name "Due soon"
                                        :deadline future)
                                  (:name "Big Outcomes"
                                        :tag "bo")))
  :config
  (org-super-agenda-mode))



;; KEYMAPS

(map! :ne "M-/" #'comment-or-uncomment-region)

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-old-hope)

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type :relative)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!

(setq org-directory "/mnt/d/notebooks/emacsNotes/")

(setq default-directory "/mnt/d/notebooks/DemacsNotes/")

(defun my-weebery-is-always-greater ()
  (let* ((banner '("░▒█▀▀▄░█▀▀▄░▒█▀▀▀█░▒█░▒█░▒█▀▀▄░▒█▀▀▀█░█▀▀▄░▒█▀▀▄░▒█▀▀▄"
                   "░▒█░▒█▒█▄▄█░░▀▀▀▄▄░▒█▀▀█░▒█▀▀▄░▒█░░▒█▒█▄▄█░▒█▄▄▀░▒█░▒█"
                   "░▒█▄▄█▒█░▒█░▒█▄▄▄█░▒█░▒█░▒█▄▄█░▒█▄▄▄█▒█░▒█░▒█░▒█░▒█▄▄█"))
         (longest-line (apply #'max (mapcar #'length banner))))
    (put-text-property
     (point)
     (dolist (line banner (point))
       (insert (+doom-dashboard--center
                +doom-dashboard--width
                (concat line (make-string (max 0 (- longest-line (length line))) 32)))
               "\n"))
     'face 'doom-dashboard-banner)))

(setq +doom-dashboard-ascii-banner-fn #'my-weebery-is-always-greater)

;; Whenever you reconfigure a package, make sure to wrap your config in an
;; `after!' block, otherwise Doom's defaults may override your settings. E.g.
;;
;;   (after! PACKAGE
;;     (setq x y))
;;
;; The exceptions to this rule:
;;
;;   - Setting file/directory variables (like `org-directory')
;;   - Setting variables which explicitly tell you to set them before their
;;     package is loaded (see 'C-h v VARIABLE' to look up their documentation).
;;   - Setting doom variables (which start with 'doom-' or '+').
;;
;; Here are some additional functions/macros that will help you configure Doom.
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
;; Alternatively, use `C-h o' to look up a symbol (functions, variables, faces,
;; etc).
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.
;;
(setq browse-url-browser-function 'browse-url-generic       browse-url-generic-program "/mnt/c/Program Files (x86)/Microsoft/Edge/Application/msedge.exe")


