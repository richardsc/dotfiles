all:
	# backup
	cp ~/.emacs ~/.emacs.bak
	cp ~/.emacs-gnu.el ~/.emacs-gnu.el.bak
	cp ~/.emacs.d/custom.el ~/.emacs.d/custom.el.bak
	cp ~/.emacs.d/org-cgr.el ~/.emacs.d/org-cgr.el.bak
	cp ~/.profile ~/.profile.bak
	cp ~/.Rprofile ~/.Rprofile.bak
	cp ~/.gitconfig ~/.gitconfig.back
	cp ~/.latexmkrc ~/.latexmkrc.bak
	cp ~/.nbrc ~/.nbrc.bak

	# deploy new
	cp dotemacs ~/.emacs
	cp dotemacs-gnu.el ~/.emacs-gnu.el
	cp custom.el ~/.emacs.d/custom.el
	cp org-cgr.el ~/.emacs.d/org-cgr.el
	cp dotprofile ~/.profile
	cp dotRprofile ~/.Rprofile
	cp dotgitconfig ~/.gitconfig
	cp dotlatexmkrc ~/.latexmkrc
	cp dotnbrc ~/.nbrc
