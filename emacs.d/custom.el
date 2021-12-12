(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(LaTeX-command "latex -synctex=1")
 '(TeX-PDF-mode t)
 '(TeX-view-program-list
   '(("Preview" "open -a Preview.app %o")
     ("Skim" "open -a Skim.app %o")))
 '(TeX-view-program-selection
   '(((output-dvi style-pstricks)
      "dvips and gv")
     (output-dvi "xdvi")
     (output-pdf "Skim")
     (output-html "xdg-open")))
 '(ansi-color-names-vector
   ["black" "#d55e00" "#009e73" "#f8ec59" "#0072b2" "#cc79a7" "#56b4e9" "white"])
 '(bm-repository-file "/Users/richardsc/Dropbox/emacs/bm-repository")
 '(column-number-mode t)
 '(custom-enabled-themes '(tsdh-dark))
 '(custom-safe-themes
   '("cd70962b469931807533f5ab78293e901253f5eeb133a46c2965359f23bfb2ea" default))
 '(ess-R-font-lock-keywords
   '((ess-R-fl-keyword:modifiers . t)
     (ess-R-fl-keyword:fun-defs . t)
     (ess-R-fl-keyword:keywords . t)
     (ess-R-fl-keyword:assign-ops . t)
     (ess-R-fl-keyword:constants . t)
     (ess-fl-keyword:fun-calls . t)
     (ess-fl-keyword:numbers)
     (ess-fl-keyword:operators)
     (ess-fl-keyword:delimiters . t)
     (ess-fl-keyword:= . t)
     (ess-R-fl-keyword:F&T)))
 '(ess-swv-pdflatex-commands '("pdflatex" "make" "texi2pdf"))
 '(ess-swv-processor 'knitr)
 '(inhibit-startup-screen t)
 '(matlab-auto-fill nil)
 '(matlab-comment-region-s "% ")
 '(matlab-fill-code nil)
 '(package-selected-packages
   '(ess julia-mode exec-path-from-shell pandoc-mode company-reftex company-bibtex company-auctex company poly-R poly-markdown poly-noweb poly-org zenburn-theme undo-tree sublimity powerline polymode matlab-mode markdown-mode lorem-ipsum ido-vertical-mode highlight-current-line bm auctex ac-octave ac-math))
 '(show-paren-mode t)
 '(text-mode-hook '(text-mode-hook-identify))
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "gray20" :foreground "white smoke" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 110 :width normal :foundry "apple" :family "Monaco"))))
 '(hl-line ((t (:inherit highlight :background "grey28")))))
