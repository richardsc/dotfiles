;; detach customizations
(setq custom-file "~/.emacs.d/custom.el")
(load custom-file 'noerror)

(server-start)
(global-hl-line-mode 1)
(global-visual-line-mode 1)
(defun visual-line-line-range ()
  (save-excursion
    (cons (progn (vertical-motion 0) (point))
	  (progn (vertical-motion 1) (point)))))
(setq hl-line-range-function 'visual-line-line-range)

;; linum-mode
(global-linum-mode 1)

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
;; Org mode
;; ======================================================================
(load-file "~/.emacs.d/org-cgr.el")

;; Mac specific stuff
(setq mac-command-modifier 'meta)
(setq x-select-enable-clipboard t)

;; ======================================================================
;; Flyspell mode
;; ======================================================================
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
(add-hook 'LaTeX-mode-hook 'flyspell-mode)
(add-hook 'LaTeX-mode-hook 'turn-on-auto-fill)
(eval-after-load "tex"
  '(add-to-list 'TeX-command-list
		'("All" "latexmk -pdf %t" TeX-run-TeX nil 
		    (latex-mode doctex-mode)
		      :help "Run latexmk")))

;;Latex beamer new frame macro: FIXME doesn't work with GNU emacs
(fset 'beamer-insert-frame
   (lambda (&optional arg) "Keyboard macro." (interactive "p") (kmacro-exec-ring-item (quote ([92 98 101 103 105 110 123 102 114 97 109 101 125 123 125 return return return return 92 101 110 100 123 102 114 97 109 101 125 16 16] 0 "%d")) arg)))
(global-set-key (kbd "C-x C-k f") 'beamer-new-frame)
(put 'narrow-to-region 'disabled nil)

;; =================================================
;; Melpa
;; =================================================
(require 'package)
(setq package-archives '(;("gnu" . "http://elpa.gnu.org/packages/")
                         ("melpa" . "http://melpa.milkbox.net/packages/")))
;; (add-to-list 'package-archives
;;              '("melpa" . "http://melpa.milkbox.net/packages/") t)
(package-initialize)

;; =================================================
;; Polymode -- for editing Rmarkdown files
;; =================================================
(setq load-path
      (append '("~/git/polymode/"  "~/git/polymode/modes")
              load-path))
(require 'poly-R)
(require 'poly-markdown)

;; =================================================
;; ESS
;; =================================================
(require 'ess-site)
;;(setq ess-use-auto-complete t)

;; =================================================
;; IDO mode
;; =================================================
(require 'ido)
(ido-mode t)
(setq ido-enable-flex-matching t) ; fuzzy matching is a must have

(require 'ido-vertical-mode)
(ido-vertical-mode)
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
     (append '(ac-source-math-unicode ac-source-math-latex ac-source-latex-commands)
               ac-sources)))
(add-hook 'LaTeX-mode-hook 'ac-latex-mode-setup)
(global-auto-complete-mode t)
(ac-flyspell-workaround)

;; =================================================
;; lorem-ipsum
;; =================================================
(autoload 'Lorem-ipsum-insert-paragraphs "lorem-ipsum" "" t)
(autoload 'Lorem-ipsum-insert-sentences "lorem-ipsum" "" t)
(autoload 'Lorem-ipsum-insert-list "lorem-ipsum" "" t)
