;; Org mode configurations
(require 'org-install)
(require 'ob-tangle)

;; Flyspell mode
(add-hook 'org-mode-hook 'flyspell-mode)

;; keybindings
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-cc" 'org-capture)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb)

;; Timestamps when closing TODOs
(setq org-log-done 'time)

(setq org-directory "~/Dropbox/org")
(setq org-agenda-files (quote ("~/Dropbox/org/")))

;; @note; !timestamp; enter/leave; leave triggered iff entered state doesn't log. 
(setq org-todo-keywords
      '((sequence "TODO(t@/@)" "INPROGRESS(i@/@)" "WAITING(w@/@)" 
		  "VERIFY(v@)" "SOMEDAY(s@/@)" "HOLD(h@/@)" "LOG(l@/@)" "|" 
		  "DONE(d@/@)" "DELEGATED(D@/@)" "CANCELED(c@/@)"
		  "NOTDONE(n@/@)" "LOGGED(L@/@)")))

;; Org babel
(org-babel-do-load-languages
 'org-babel-load-languages
 '((sh . t)
   (python . t)
   (emacs-lisp . t)   
   (octave . t)
   (R . t)
   ))
(setq org-confirm-babel-evaluate nil) ;; don't ask to eval code
(setq org-src-fontify-natively t)
(setq org-export-babel-evaluate nil)
(set-face-attribute 'org-block-background nil :background "black")
(setq org-image-actual-width 450)
