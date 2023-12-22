(setq doom-font (font-spec :family "FiraCode Nerd Font" :size 18 :weight `Regular)
      doom-variable-pitch-font (font-spec :family "FiraCode Nerd Font Med" :size 14))

  (setq mouse-wheel-scroll-amount '(1 ((shift) . 1))) ;; one line at a time
  (setq mouse-wheel-progressive-speed nil) ;; don't accelerate scrolling
  (setq mouse-wheel-follow-mouse 't) ;; scroll window under mouse
  (setq scroll-step 1) ;; keyboard scroll one line at a time
;;  (setq use-dialog-box nil)) ;; Disable dialog boxes since they weren't working in Mac OSX

;; Window frame startup size
(setq initial-frame-alist '((top . 1) (right . 1) (width . 114) (height . 46)))
;; (setq default-frame-alist '(alpha 50 50))

(map! :ne "M-/" #'comment-or-uncomment-region)

(setq which-key-idle-delay 0.1)

(setq doom-theme 'doom-old-hope)
(setq display-line-numbers-type 'relative)

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

(setq org-directory "/mnt/d/notebooks/emacsNotes/")

(setq default-directory "/mnt/d/notebooks/DemacsNotes/")

(setq org-roam-directory "/mnt/d/notebooks/roam/")

;; (setq emacsql-sqlite-executable "/usr/bin/sqlite3")

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

(setq browse-url-browser-function 'browse-url-generic       browse-url-generic-program "/mnt/c/Program Files (x86)/Microsoft/Edge/Application/msedge.exe")
