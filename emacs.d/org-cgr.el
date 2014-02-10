;; Org mode configurations

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
