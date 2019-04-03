;; This is so that I can keep GNU emacs and Aquamacs separate. Check
;; to see if it's Aqaumacs calling, and if so, ignore everything
;; (Aquamacs preferences and customizations are in
;; `~/Library/Preferences/Aquamacs Emacs/`)
(unless (boundp 'aquamacs-version)
  (load-file "~/.emacs-gnu.el"))
(put 'narrow-to-page 'disabled nil)
