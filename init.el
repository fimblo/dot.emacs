;; Minimal config here. The rest will be in setup.org
(package-initialize)     ; This needs to be early in config
(require 'org)           ; Load org so we can use babel

(org-babel-load-file     ; Load my setup file
 (expand-file-name (concat default-directory "setup.org")))
;; EOF
