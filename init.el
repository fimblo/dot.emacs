;; Minimal config here. The rest will be in setup.org
;;(package-initialize)     ; This needs to be early in config
(require 'org)           ; Load org so we can use babel

;; Then we're running emacs in interactive mode (the normal way) and
;; we'll load the file 'setup.org' which resides next to the
;; init-file.
;;
;; If we can't find user-init-file, then we're running in batch-mode.
;; Then we use the variable `load-true-file-name` since that should
;; exist.

(defconst sys/emacs-root
  (expand-file-name
    (file-name-directory
     (if user-init-file user-init-file load-true-file-name))
    )
  "Points at the directory where the emacs configuration files reside."
  )

;; temporary fix: map the built-in user-emacs-directory to the value
;; of sys/emacs-root, and later (TODO) replace all mention of
;; sys/emacs-root with user-emacs-directory. This needs testing too.
(defconst user-emacs-directory
  (file-name-directory
   (or load-file-name (buffer-file-name))))

(message "sys/emacs-root        %s" sys/emacs-root)
(message "user-emacs-directory  %s" user-emacs-directory)




(org-babel-load-file
 (concat sys/emacs-root "setup.org"))

;; EOF
