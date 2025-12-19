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

(org-babel-load-file
 (concat sys/emacs-root "setup.org"))

;; EOF
