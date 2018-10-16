;; --------------------------------------------------
;; Special stuff for Aquaemacs
(unless window-system                       ; in TTY (terminal) mode
  (normal-erase-is-backspace-mode nil)
  (set-face-inverse-video-p 'mode-line-inactive t)
  (define-key osx-key-mode-map "\C-z" 'suspend-emacs))

;; Persistency and modes:
(setq
 aquamacs-scratch-file nil                  ; do not save scratch
                                            ; file across sessions
 initial-major-mode 'org-mode               ; *scratch* shows up in
                                            ; org-mode
 aquamacs-default-major-mode 'org-mode      ; new buffers open in
                                            ; org-mode
 )

;; Frame and window management:
(tabbar-mode -1)                            ; no tabbar
(one-buffer-one-frame-mode -1)              ; no one-buffer-per-frame
(setq special-display-regexps nil)          ; do not open certain
                                            ; buffers in special
                                            ; windows/frames

;; Appearance
(aquamacs-autoface-mode -1)                 ; no mode-specific
                                            ; faces, everything
                                            ; in Monaco
(set-face-attribute 'mode-line nil
                    :inherit 'unspecified)  ; show modeline in
                                            ; Monaco
(set-face-attribute 'echo-area nil
                    :family 'unspecified)   ; show echo area in
                                            ; Monaco

;; Editing
(global-smart-spacing-mode -1)              ; not on by default
(remove-hook 'text-mode-hook
             'smart-spacing-mode)           ; do not use smart
                                            ; spacing in text
                                            ; modes
)

