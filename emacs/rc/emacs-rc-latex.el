;; ;;;;;;; latex start ;;;;;;;;
;; ;(add-to-list 'load-path "/usr/local/share/emacs/site-lisp")
;; (require 'tex-site)
;; (load "auctex.el" nil t t)
;; (load "preview-latex.el" nil t t)
;; ;; Preliminary setup for AUCTeX and ebib
;; ;(autoload 'ebib "ebib" "Ebib, a BibTeX database manager." t)
;; (setq TeX-auto-save t)
;; (setq TeX-parse-self t)
;; (setq-default TeX-master nil)           ;set up AUCTeX to deal with
;;                                         ;multiple file documents.
;; (add-hook 'LaTeX-mode-hook 'visual-line-mode)
;; (add-hook 'LaTeX-mode-hook 'flyspell-mode)
;; (add-hook 'LaTeX-mode-hook 'LaTeX-math-mode)
;; (add-hook 'LaTeX-mode-hook 'turn-on-reftex)
;; (setq reftex-plug-into-AUCTeX t)

;; (add-hook 'LaTeX-mode-hook (lambda ()
;;                                   (TeX-fold-mode 1))) ;turn on
;;                                                       ;tex-fold-mode
;;                                                       ;by default

;; (add-hook 'LaTeX-mode-hook 'TeX-PDF-mode) ;turn on pdf-mode.  AUCTeX
;;                                           ;will call pdflatex to
;;                                           ;compile instead of latex.

;; (add-hook 'LaTeX-mode-hook 'Mueller-TeX-mode) ;turn on Mueller-TeX
;;                                               ;mode by default.  See
;;                                               ;below for the
;;                                               ;definition of this
;;                                               ;minor mode

;; (setq reftex-label-alist
;;         '(("lemma"   ?a "lm:"  "~\\ref{%s}" t ("lemma"   "lm.") -2)
;;           ("corollary"  ?c "crl:" "~\\ref{%s}" t ("corollary"  "crl.") -3)
;;           ("definition" ?d "dfn:" "~\\ref{%s}" t ("definition" "dfn.") -3)
;;           ("remark" ?r "rm:" "~\\ref{%s}" t ("remark" "rm.") -2)
;;           ("theorem" ?h "thr:" "~\\ref{%s}" t   ("theorem" "th.") -3)))

;; (add-hook
;;  'LaTeX-mode-hook
;;  (lambda ()
;;    (smart-dnd-setup
;;     '(
;;       ("\\.tex\\'" . "\\input{%r}\n")
;;       ("\\.cls\\'" . "\\documentclass{%f}\n")
;;       ("\\.sty\\'" . "\\usepackage{%f}\n")
;;       ("\\.eps\\'" . "\\includegraphics[]{%r}\n")
;;       ("\\.ps\\'"  . "\\includegraphics[]{%r}\n")
;;       ("\\.pdf\\'" . "\\includegraphics[]{%r}\n")
;;       ("\\.jpg\\'" . "\\includegraphics[]{%r}\n")
;;       ("\\.png\\'" . "\\includegraphics[]{%n}\n")
;;       ("\\.mov\\'" .
;;        "\\includemovie[\n\tposter,\n\trepeat=1,\n\ttext=(%r)\n\t]{}{}{%r}\n")
;;       ("\\.avi\\'" .
;;        "\\includemovie[\n\tposter,\n\trepeat=1,\n\ttext=(%r)\n\t]{}{}{%r}\n")))))


;; ;; Set up skeletons (see below) in a menu in AUCTeX mode
;; (defvar LaTeX-mode-menu)
;; (add-hook 'LaTeX-mode-hook
;;           (lambda ()
;;             (easy-menu-add-item LaTeX-mode-menu
;;                                 nil ["Skeletons" nil t])
;;             (easy-menu-add-item LaTeX-mode-menu '("Skeletons")
;;                                 ["Letter" latex-letter-skeleton
;;                                 t])
;;             (easy-menu-add-item LaTeX-mode-menu '("Skeletons")
;;                                 ["Brief Article"
;;                                 latex-brief-article-skeleton t])
;;             (easy-menu-add-item LaTeX-mode-menu '("Skeletons")
;;                                 ["AMS Article"
;;                                 latex-AMS-article-skeleton t])
;;             (easy-menu-add-item LaTeX-mode-menu '("Skeletons")
;;                                 ["Foils" latex-foils-skeleton t])
;;             (easy-menu-add-item LaTeX-mode-menu '("Skeletons")
;;                                 ["Simple"
;;                                 latex-simple-text-skeleton t])))

;; ;; set the shell that is used to execute all the TeX commands by AUCTeX
;; (setq TeX-shell "/bin/bash")

;; ;; Set up TeX-output-view-style.  Note that for pdf viewing I have set
;; ;; a script repreview.  This is available in ~/bin/.
;; ;; It calls a shell script:
;; ;; ~/Library/Scripts/Reload Preview Document.scpt
;; ;;
;; ;; I found the script here:
;; ;; http://www.macosxhints.com/article.php?story=2006010200141989&lsrc=osxh

;; ;; I recently discovered TeXniscope.  It is much better.
;; ;; Auto-reloading once changes are made...and it plays well with Emacs
;; ;; (pdfsync)
;; ;;
;; ;; TeXniscope is no longer under active development and so I am back
;; ;; to using preview, but it seems to handle renewing in 10.5 better
;; ;; than in 10.4
;; (setq TeX-output-view-style
;;       (quote
;;        (
;;         ("^dvi$"
;;          ("^landscape$" "^pstricks$\\|^pst-\\|^psfrag$")
;;          "%(o?)dvips -t landscape %d -o && gv %f")
;;         ("^dvi$" "^pstricks$\\|^pst-\\|^psfrag$" "%(o?)dvips %d -o && gv %f")
;;         ("^dvi$"
;;          ("^a4\\(?:dutch\\|paper\\|wide\\)\\|sem-a4$" "^landscape$")
;;          "%(o?)xdvi %dS -paper a4r -s 0 %d")
;;         ("^dvi$" "^a4\\(?:dutch\\|paper\\|wide\\)\\|sem-a4$"
;;          "%(o?)xdvi %dS -paper a4 %d")
;;         ("^dvi$"
;;          ("^a5\\(?:comb\\|paper\\)$" "^landscape$")
;;          "%(o?)xdvi %dS -paper a5r -s 0 %d")
;;         ("^dvi$" "^a5\\(?:comb\\|paper\\)$" "%(o?)xdvi %dS -paper a5 %d")
;;         ("^dvi$" "^b5paper$" "%(o?)xdvi %dS -paper b5 %d")
;;         ("^dvi$" "^letterpaper$" "%(o?)xdvi %dS -paper us %d")
;;         ("^dvi$" "^legalpaper$" "%(o?)xdvi %dS -paper legal %d")
;;         ("^dvi$" "^executivepaper$" "%(o?)xdvi %dS -paper 7.25x10.5in %d")
;;         ("^dvi$" "." "%(o?)xdvi %dS %d")
;;         ("^pdf$" "." "open -a /Applications/Skim.app %o")
;;         ("^html?$" "." "netscape %o"))))
;; ;;;;;;;; latex end ;;;;;;;;;
