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

;; Update the built-in user-emacs-directory to match the real
;; directory where the setup files are located.
(defconst user-emacs-directory
  (file-name-directory
   (or load-file-name (buffer-file-name))))


(org-babel-load-file
 (concat user-emacs-directory "setup.org"))

;; EOF
