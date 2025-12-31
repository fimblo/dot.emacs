;; Minimal config here. The rest will be in setup.org

(require 'org)           ; Load org so we can use babel

;; Make user-emacs-directory portable. Works for:
;; 1. GitHub CI/Testing
;; 2. Debugging (emacs -l path/to/init.el)
;; 3. Manual buffer evaluation (C-x C-e)
;; 4. And normal interactive startups
(setq user-emacs-directory
  (file-name-directory
   (or load-file-name (buffer-file-name))))

(defconst me/setup-org
  (concat user-emacs-directory "setup.org"))

(message "path to setup.org: %s" me/setup-org)
(org-babel-load-file me/setup-org)

;; EOF
