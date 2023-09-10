(require 'telephone-line)
(setq telephone-line-lhs
      '(
        (accent . (telephone-line-vc-segment
                   telephone-line-erc-modified-channels-segment
                   telephone-line-process-segment))
        (nil    . (telephone-line-minor-mode-segment
                   telephone-line-buffer-segment))))
(setq telephone-line-rhs
      '((nil    . (telephone-line-misc-info-segment))
        (accent . (telephone-line-major-mode-segment))
        ))
(telephone-line-mode 1)
 -                                          ; for a slightly fancier theme
  +  ;; for a slightly fancier theme
     (spaceline-all-the-icons-theme)
  +  (spaceline-toggle-all-the-icons-time-off)
  +  (spaceline-toggle-minor-modes-on)
   
     ;; for a simpler but nice theme
  -  ;;(spaceline-emacs-theme)
  +;;  (spaceline-emacs-theme)
  +
