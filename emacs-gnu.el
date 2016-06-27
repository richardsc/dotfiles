;; detach customizations
(setq custom-file "~/.emacs.d/custom.el")
(load custom-file 'noerror)

(server-start)

;; initial window
(setq initial-frame-alist
      '(
        (width . 102) ; character
        (height . 52) ; lines
        ))

;; default/sebsequent window
(setq default-frame-alist
      '(
        (width . 102) ; character
        (height . 60) ; lines
        ))

;; Make R console smaller than 50% high
(add-to-list 'display-buffer-alist
             '("^\\*R\\*$"
               (display-buffer-reuse-window
                display-buffer-pop-up-window)
               (window-height . 20)))

;; =================================================
;; Melpa
;; =================================================
(require 'package)
(setq package-archives '(("melpa" . "http://melpa.milkbox.net/packages/")
			 ("melpa-stable" . "https://stable.melpa.org/packages/")
			 ("gnu" . "http://elpa.gnu.org/packages/")))
;; (add-to-list 'package-archives
;;              '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(package-initialize)

;; Highlight and visual line mode
(global-hl-line-mode 1)
(global-visual-line-mode 1)
(defun visual-line-line-range ()
  (save-excursion
    (cons (progn (vertical-motion 0) (point))
	  (progn (vertical-motion 1) (point)))))
(setq hl-line-range-function 'visual-line-line-range)

;; linum-mode
;; (global-linum-mode 1)

;; Powerline
;; https://emacs.stackexchange.com/questions/281/how-do-i-get-a-fancier-looking-mode-line
(add-to-list 'load-path "~/.emacs.d/elpa/powerline-20150319.533")
(require 'powerline)
(set-face-attribute 'mode-line nil
                    :foreground "Black"
                    :background "DarkOrange"
                    :box nil)
;; Included separators: alternate, arrow, arrow-fade, bar, box, brace, butt,
;; chamfer, contour, curve, rounded, roundstub, slant, wave, zigzag, and nil.
(setq powerline-default-separator 'slant)
(powerline-center-theme)

;; custom unwrap function from: http://sdpconfig.wordpress.com/2011/09/26/writing-a-function-to-unwrap-text-in-emacs/
(defun unfill-region-or-buffer ()
  "Unwrap hard-wrapped text in buffer or region."
  (interactive)
  (let ((fill-column most-positive-fixnum))
    (if (region-active-p)
        (fill-region (region-beginning) (region-end))
      (fill-region (point-min) (point-max)))))
(global-set-key [(control c)(f)] 'fill-region)
(global-set-key [(control c)(F)] 'unfill-region-or-buffer)


;; ======================================================================
;; undo tree mode
;; ======================================================================
(require 'undo-tree)
(global-undo-tree-mode)
(setq undo-tree-visualizer-timestamps t)
(setq undo-tree-visualizer-diff t)

;; ======================================================================
;; Org mode
;; ======================================================================
(load-file "~/.emacs.d/org-cgr.el")

;; Mac specific stuff
(setq mac-command-modifier 'meta)
(setq x-select-enable-clipboard t)

;; ======================================================================
;; Flyspell mode
;; ======================================================================
(setq ispell-program-name "/usr/local/bin/aspell")
(autoload 'flyspell-mode "flyspell" "On-the-fly spelling checker." t)
(global-set-key (kbd "C-c j") 'flyspell-check-previous-highlighted-word)

; set aspell to use the custom dictionary that has had words removed
(setq ispell-extra-args '("--master=custom"))

;; ======================================================================
;; Markdown mode
;; ======================================================================
(setq markdown-enable-math t)
(add-hook 'markdown-mode-hook 'flyspell-mode)

;; ======================================================================
;; Window width and height
;; ======================================================================
(set-frame-height (selected-frame) 55)
(set-frame-width (selected-frame) 80)

;; ======================================================================
;; Latex stuff
;; ======================================================================
(setq TeX-auto-save t)
(setq TeX-parse-self t)
(setq-default TeX-master nil)
(add-hook 'LaTeX-mode-hook 'LaTeX-math-mode)
(add-hook 'LaTeX-mode-hook 'turn-on-reftex)
(setq reftex-plug-into-AUCTeX t)
(setq reftex-cite-format 'natbib)
(add-hook 'LaTeX-mode-hook 'flyspell-mode)
(add-hook 'LaTeX-mode-hook 'turn-on-auto-fill)
(setq TeX-PDF-mode t)
(eval-after-load "tex"
  '(add-to-list 'TeX-command-list
		'("All" "latexmk -pdf %t" TeX-run-TeX nil 
		    (latex-mode doctex-mode)
		      :help "Run latexmk")))

;; use Skim as default pdf viewer
;; Skim's displayline is used for forward search (from .tex to .pdf)
;; option -b highlights the current line; option -g opens Skim in the background  
(setq TeX-view-program-selection '((output-pdf "PDF Viewer")))
(setq TeX-view-program-list
     '(("PDF Viewer" "/Applications/Skim.app/Contents/SharedSupport/displayline -b -g %n %o %b")))

;;Latex beamer new frame macro: FIXME doesn't work with GNU emacs
(fset 'beamer-insert-frame
   (lambda (&optional arg) "Keyboard macro." (interactive "p") (kmacro-exec-ring-item (quote ([92 98 101 103 105 110 123 102 114 97 109 101 125 123 125 return return return return 92 101 110 100 123 102 114 97 109 101 125 16 16] 0 "%d")) arg)))
(global-set-key (kbd "C-x C-k f") 'beamer-insert-frame)
(put 'narrow-to-region 'disabled nil)

;; =================================================
;; Polymode -- for editing Rmarkdown files
;; =================================================
;; (setq load-path
;;       (append '("~/git/polymode/"  "~/git/polymode/modes")
;;               load-path))
(require 'poly-R)
(require 'poly-markdown)
;;; MARKDOWN
(add-to-list 'auto-mode-alist '("\\.md" . poly-markdown-mode))

;;; R modes
(add-to-list 'auto-mode-alist '("\\.Snw" . poly-noweb+r-mode))
(add-to-list 'auto-mode-alist '("\\.Rnw" . poly-noweb+r-mode))
(add-to-list 'auto-mode-alist '("\\.Rmd" . poly-markdown+r-mode))

;; =================================================
;; ESS
;; =================================================
(require 'ess-site)
;;(setq ess-use-auto-complete t)
(ess-set-style 'RStudio)

;; =================================================
;; IDO mode
;; =================================================
(require 'ido)
(ido-mode t)
(setq ido-enable-flex-matching t) ; fuzzy matching is a must have

(require 'ido-vertical-mode)
(ido-vertical-mode)
(setq ido-vertical-define-keys 'C-n-and-C-p-only)
;; (setq ido-decorations (quote ("\n-> " "" "\n   " "\n   ..." "[" "]" " [No match]" " [Matched]" " [Not readable]" " [Too big]" " [Confirm]")))
;; (defun ido-disable-line-truncation () (set (make-local-variable 'truncate-lines) nil))
;; (add-hook 'ido-minibuffer-setup-hook 'ido-disable-line-truncation)
;; (defun ido-define-keys () ;; C-n/p is more intuitive in vertical layout
;;   (define-key ido-completion-map (kbd "C-n") 'ido-next-match)
;;   (define-key ido-completion-map (kbd "C-p") 'ido-prev-match))
;; (add-hook 'ido-setup-hook 'ido-define-keys)

;; =================================================
;; auto-complete
;; =================================================
(require 'auto-complete)
(require 'auto-complete-config)
(ac-config-default)

(require 'ac-math) 
(add-to-list 'ac-modes 'latex-mode)   ; make auto-complete aware of `latex-mode`

(defun ac-latex-mode-setup ()         ; add ac-sources to default ac-sources
  (setq ac-sources
     (append '(ac-source-math-latex ac-source-latex-commands)
               ac-sources)))
(add-hook 'LaTeX-mode-hook 'ac-latex-mode-setup)
(ac-flyspell-workaround)
;(global-auto-complete-mode t)
(setq ac-math-unicode-in-math-p nil)

;; =================================================
;; lorem-ipsum
;; =================================================
(autoload 'Lorem-ipsum-insert-paragraphs "lorem-ipsum" "" t)
(autoload 'Lorem-ipsum-insert-sentences "lorem-ipsum" "" t)
(autoload 'Lorem-ipsum-insert-list "lorem-ipsum" "" t)

;; =================================================
;; Visual bookmarks
;; =================================================
(setq bm-restore-repository-on-load t)
(require 'bm)
(global-set-key (kbd "C-c M-t") 'bm-toggle)
(global-set-key (kbd "C-c M-n") 'bm-next)
(global-set-key (kbd "C-c M-p") 'bm-previous)
;; make bookmarks persistent as default
(setq-default bm-buffer-persistence t)
 
;; Loading the repository from file when on start up.
(add-hook' after-init-hook 'bm-repository-load)
 
;; Restoring bookmarks when on file find.
(add-hook 'find-file-hooks 'bm-buffer-restore)
 
;; Saving bookmark data on killing a buffer
(add-hook 'kill-buffer-hook 'bm-buffer-save)
 
;; Saving the repository to file when on exit.
;; kill-buffer-hook is not called when emacs is killed, so we
;; must save all bookmarks first.
(add-hook 'kill-emacs-hook '(lambda nil
                              (bm-buffer-save-all)
                              (bm-repository-save)))

;; =====================================================
;; Octave mode stuff
;; =====================================================
(require 'ac-octave)
    (defun ac-octave-mode-setup ()
      (setq ac-sources '(ac-source-octave)))
      (add-hook 'octave-mode-hook
        '(lambda () (ac-octave-mode-setup)))

;; =====================================================
;; Matlab mode stuff
;; =====================================================
;; (add-to-list 'load-path "~/.emacs.d/elpa/matlab-mode-20141227.1244/")
(add-to-list 'load-path "~/.emacs.d/matlab-mode/")
(require 'matlab-load)
;; Enable CEDET feature support for MATLAB code. (Optional)
(matlab-cedet-setup)
(setq auto-mode-alist
    (cons
     '("\\.m$" . matlab-mode)
     auto-mode-alist))
;; auto-complete for matlab-mode
(add-hook 'matlab-mode-hook
	  (lambda ()
	    (auto-complete-mode 1)
	    (add-to-list 'ac-sources 'ac-source-dictionary)))
;; auto-complete for matlab-shell-mode
(add-hook 'matlab-shell-mode-hook
	  (lambda ()
	    (auto-complete-mode t)
	    (add-to-list 'ac-sources 'ac-source-dictionary)))
(add-to-list 'ac-modes 'matlab-mode)
(add-to-list 'ac-modes 'matlab-shell-mode)

;; =====================================================
;; Sublimity
;; =====================================================
(require 'sublimity)
;;(sublimity-global-mode)
;;(require 'sublimity-scroll)
;; (setq sublimity-scroll-weight 10
;;       sublimity-scroll-drift-length 5)
(require 'sublimity-map)
(sublimity-map-set-delay nil)

