;; (add-hook 'find-file-hook 'flymake-find-file-hook)


;; Has been replaced by sort-A-records, written in elisp
;; ;; runs sort-ips-in-hosts.pl on region
;; (defun sort-ips-in-zonefile (startPos endPos)
;;   "Sorts all A-posts in region.
;;    This function makes use of an external perl script, sort-ips-in-hosts.pl.
;;    You can find this script in https://svn/sysadmin/trunk/personal/fimblo/dns/sort-ips-in-hosts.pl"
;;   (interactive "r")
;;   (let (scriptName)
;;     (setq scriptName (concat (getenv "HOME") "/bin/sort-ips-in-hosts.pl" ) )
;;     (if (file-exists-p scriptName)
;;         (shell-command-on-region startPos endPos scriptName "*sorted-ips*" nil nil t)
;;       (message "File '%s' not found!" scriptName))
;;     ))

;;--------------------------------------------------
;; Customize-emacs options
;;--------------------------------------------------

;; (custom-set-faces
;;  ;; custom-set-faces was added by Custom -- don't edit or cut/paste it!
;;  ;; Your init file should contain only one such instance.
;;  )

;; '(default-frame-alist (quote ((font . "-*-terminus-*-r-*-*-14-*-*-*-*-*-iso8859-*") (menu-bar-lines . 1) (tool-bar-lines . 0) (vertical-scroll-bars) (left-fringe . 0) (right-fringe . 0) (background-color . "#3f3f3f") (background-mode . dark) (border-color . "#3f3f3f") (foreground-color . "#dcdccc") (mouse-color . "#dcdccc") (cursor-color . "#8faf9f"))))




;; ; I dont use this piece of advice, and it doesnt work anyway.
;; (defadvice previous-line
;;   (before next-line-at-end
;;           (&optional arg try-vscroll))
;;   "Insert new line when running previousline
;;    at first line of file"
;;   (if (and next-line-add-newlines
;;            (save-excursion (beginning-of-line)
;;                            (bobp)))
;;       (progn (beginning-of-line)
;;              (newline))))

;; (ad-enable-advice 'previous-line
;;                   'before
;;                   'next-line-at-end)
;; (ad-activate 'previous-line)



;; ;;;;;;;;;;
;; ;; emacs to gmail smtp bridge
;; (setq send-mail-function 'smtpmail-send-it
;;       message-send-mail-function 'smtpmail-send-it
;;       smtpmail-starttls-credentials
;;       '(("smtp.gmail.com" 587 nil nil))
;;       smtpmail-auth-credentials (expand-file-name "~/.authinfo")
;;       smtpmail-default-smtp-server "smtp.gmail.com"
;;       smtpmail-smtp-server "smtp.gmail.com"
;;       smtpmail-smtp-service 587
;;       smtpmail-debug-info t)
;; (require 'starttls)
;; (require 'smtpmail)
;; (setq starttls-use-gnutls nil)



;;;;;;;;;;;;;;

;; lots of lint

;; use shift and cursor keys for mark (conflicts with active conf)
;;(require 's-region)

;; zenirc testing
;;(setq zenirc-server-default "localhost")
;;(setq zenirc-nick-default "fimblo")
;;(setq zenirc-port-default 6667)


;;; added smtp support
;;(setq user-mail-address "fimblo@sunet.se")
;;(setq user-full-name "Mattias Jansson")
;;
;;; header setup
;;
;;(defun my-message-default-headers ()
;;  (setq message-default-headers
;;      (concat
;;       "X-Uname: " (shell-command-to-string "uname -a")
;;       "X-Uptime: " (shell-command-to-string "uptime")
;;       "X-Blap: Gryippp?"
;;       (format-time-string "%Y" (current-time))
;;       )))
;;
;;(defun my-message-default-mail-headers ()
;;  (setq message-default-mail-headers
;;      (concat
;;       "User-Agent: " (gnus-extended-version) "\n"
;;       (format "BCC: %s\n" user-mail-address))))
;;
;;(defun my-message-default-news-headers ()
;;  (setq message-default-news-headers
;;      (concat
;;       "Mail-Copies-To: always\n"
;;       "X-No-Archive: yes\n")))
;;
;;(defun my-message-header-setup-hook ()
;;  (my-message-default-headers)
;;  (my-message-default-mail-headers)
;;  (my-message-default-news-headers)
;;  )
;;
;;(add-hook 'message-mode-hook
;;        'my-message-header-setup-hook)
;;
;;(setq message-required-mail-headers
;;      '(From Subject Date (optional . In-Reply-To) Lines
;;           (optional . User-Agent)))
;;
;;
;;
;;(setq send-mail-function 'smtpmail-send-it)
;;(setq message-send-mail-function 'smtpmail-send-it)
;;(setq smtpmail-default-smtp-server "localhost")
;;
;;(setq gnus-treat-emphasize nil)
;;(setq gnus-treat-display-smileys nil)
;;


;;
;;(defun axels-mail-mode-hook ()
;;  (turn-on-auto-fill)     ;;; Auto-Fill is necessary for mails
;;  (turn-on-font-lock)     ;;; Font-Lock is always cool *g*
;;  (flush-lines "^\\(> \n\\)*> -- \n\\(\n?> .*\\)*")
;;                        ;;; Kills quoted sigs.
;;  (not-modified)          ;;; We haven't changed the buffer, haven't we? *g*
;;  (mail-text)             ;;; Jumps to the beginning of the mail text
;;  (setq make-backup-files nil) ;;; No backups necessary.
;;  )
;;(or (assoc "mutt-" auto-mode-alist)
;;    (setq auto-mode-alist (cons '("mutt-" . mail-mode) auto-mode-alist)))
;;(add-hook 'mail-mode-hook 'axels-mail-mode-hook)

;;(server-start) ;;; For use with emacsclient



;; this allows Emacs to load gzipped and bzipped files on the fly and then
;; recompress them before saving them.  Wow.
;; Add Vinicius' amazing printing utilities,
;;   http://www.cpqd.com.br/~vinicius/emacs/Emacs.html
;;(if (not (featurep 'xemacs))
;;    (progn
;;      (require 'jka-compr)))

;;(autoload 'ruby-mode "ruby-mode" "Ruby editing mode." t)
;;(add-to-list 'auto-mode-alist '("\.rb$" . ruby-mode))
;;(add-to-list 'interpreter-mode-alist '("ruby" . ruby-mode))

;;
;;
;; HTMLize buffer; convert (with your faces and colors) to HTML.  Wow.
;;    (http://mraz.iskon.hr/~hniksic/htmlize.el)
;;(autoload 'htmlize-buffer "htmlize" "~/.emacsDir/htmlize.elc - convert font-lock buffer to HTML"
;; t)
;;


;; ispell stuff
;; (setq ispell-dictionary "svenska")
;;(setq ispell-dictionary-alist
;;      '(("svenska"
;;        "[A-Za-z\345\344\366\305\304\366]"  "[^A-Za-z\345\344\366\305\304\366]"
;;       "[']" nil ("-d" "svenska") "~list"
;;      iso-latin-1)
;;   ("svenska8"
;;     "[A-Za-z\345\344\366\305\304\366]"  "[^A-Za-z\345\344\366\305\304\366]"
;;    "[']" nil ("-B" "-d" "svenska") "~list"
;;   iso-latin-1)
;;  ))
;;(setq ispell-change-dictionary "british")


;; ;; This function isnt really necessary anymore as of emacs23.
;; ;; My own c-x c-c hook. I dont want to exit emacs by mistake.
;;(global-set-key "\C-x\C-c" 'my-exit-emacs)
;; (defun my-exit-emacs ()
;;   "If we're running under gnuserv, ask user if he really wants
;;    to exit emacs first. Otherwise, just do it."
;;   (interactive)
;;   (if (boundp 'gnuserv-clients)         ; just took one of many
;;                                         ; gnuserv variables. If it is
;;                                         ; void, we are not running
;;                                         ; under gnuserv.
;;       (if (yes-or-no-p "This is a gnuserv emacs. Really quit? ")
;;           (save-buffers-kill-emacs))
;;     (save-buffers-kill-emacs)
;;     )
;;   )



;; spotify specific helper functions.
;; (defun on-work-computerp ()
;;   "Returns t if this function is called on a work computer."
;;   (or
;;    (string= (getenv "HOSTNAME") "kaki")
;;    (string= (getenv "HOSTNAME") "nashi")
;;    )
;; )


;; (defun at-workp ()
;;   "Return t if computer has an adress in the IP range of the office network.
;; As it is currently written, it works only on linux systems."
;;   (if (string=
;;        (chomp (shell-command-to-string (concat "ip addr show to 194.236.60.0/24")))
;;        "")
;;       nil
;;     1))

;; (defun on-kakip()
;;   "If this instance of emacs is running on kaki, return true. else nil"
;;   (interactive)
;;   (if (string= hostname "kaki" )
;;       1
;;     nil))

;; (defun start-irc-spotify ()
;;   "Connect to IRC."
;;   (interactive)
;;   (require 'erc)
;;   (erc-tls
;;    :server "irc.spotify.net"
;;    :port 7000
;;    :nick "fimblo_"
;;    :password (read-passwd "Irc password for spotify: ")
;;    :full-name "Mattias Jansson")
;;   (setq erc-autojoin-channels-alist '(("irc.spotify.net" "#spotify" "#operations")))
;; )


;; make tramp go through proxy when going into spotify. 
;; (setq tramp-default-proxies-alist '())
;; (unless (at-workp)
;;   (add-to-list
;;    'tramp-default-proxies-alist
;;    '( "\\spotify.net" nil "/ssh:jumphost.spotify.net.:"))
;;   )


(defvar command-history-hash
  nil
  "A hash table containing all manually entered commands in
the minibuffer and each command's hitrate")

;;(setq command-history-hash (make-hash-table :test 'equal))

;; (defadvice execute-extended-command-add-to-history (after execute-extended-command)
;;   ""
;;   (command-list-add-to-history))
;; (ad-activate 'execute-extended-command-add-to-history)
;; (ad-unadvise 'command-execute-add-to-history)

;; (defun command-list-add-to-history ()
;;   ""
;;   (interactive)
;;   (message "Ran command-list-add-to-history")
;;   (setq new-cmd (caar command-history))
;;   (setq cmd-hits (gethash new-cmd command-history-hash))
;;   (setq cmd-hits
;;         (if (null cmd-hits)
;;             1
;;           (+ cmd-hits 1)))
;;   (puthash new-cmd cmd-hits command-history-hash)
;;   )

(defadvice execute-extended-command-add-to-history (after execute-extended-command activate)
  ""
  (interactive)
  (message "Ran command-list-add-to-history")
  (if (null command-history-hash)
      (setq (make-hash-table :test 'equal)))


  (setq new-cmd (caar command-history))
  (setq cmd-hits (gethash new-cmd command-history-hash))
  (setq cmd-hits
        (if (null cmd-hits)
            1
          (+ cmd-hits 1)))
  (puthash new-cmd cmd-hits command-history-hash)
  )
                                        ;(ad-activate 'execute-extended-command-add-to-history)



                                        ;(command-list-add-to-history)
(command-list-show-history)




(defun command-list-show-history ()
  ""
  (interactive)
  (let (cmd-list)

    (maphash (lambda (kk vv)
               (setq cmd-list (cons (list kk vv) cmd-list)))
             command-history-hash)
    (setq cmd-list (sort cmd-list (lambda (a b) (> (cadr a) (cadr b)))))
    (while (not (null cmd-list))
      (let (pair)
        (setq pair (pop cmd-list))
        (if (not (null pair))
            (princ (format "%s\t%s\n" (car pair) (cadr pair)))
          )
        )
      )
    )
  )



;; (message "%s -> %s" "describe-function" cmd-hits)


