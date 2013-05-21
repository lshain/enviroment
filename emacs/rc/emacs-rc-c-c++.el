
;; C/C++ settings

;; tips
;; auto align variable definitions
;; select region, then `M-x align` or `M-x align-regexp`

;;;;ppindent config:indenting preprocessor statement
;; provide two funcitons: ppindent-c and ppindent-h
(require 'ppindent)

;; gtags
(load "~/emacs/rc/emacs-rc-gtags.el")

;; xgtags
(load "~/emacs/rc/emacs-rc-xgtags.el")

;;;; cc-mode configuration http://cc-mode.soureforge.net/
(c-set-offset 'inline-open 0)
(c-set-offset 'friend '-)
(c-set-offset 'substatement-open 0)

;; assosiate .h files to cc-mode
;(add-to-list 'auto-mode-alist '("\\.h\\'" . c++-mode))

;; C++ mode configuration
(add-hook 'c++-mode-hook
	  '(lambda ()
	     (c-set-style "stroustrup")
	     (c-subword-mode 1)))

(defun my-symbol-complete ()
  (interactive)
  (let* (
	 (oldchar (char-before (point)))
	 (oldStr (string (char-before (1- (point)))  oldchar))
	 )
    (if (or (equal (char-equal oldchar ?.) (equal oldStr "->"))
	    (semantic-ia-complete-symbol-menu (point)))
	(self-insert-command 1)
    )
  ))

(add-hook 'shell-mode-hook 'mode-hook-func)
(add-hook 'gdb-mode-hook 'mode-hook-func)
(defun mode-hook-func ()
  (set-process-sentinel (get-buffer-process (current-buffer))
       #'kill-buffer-on-exit)
)

(defun kill-buffer-on-exit (process state)
  (message "%s" state)
  (if (or
       (string-match "exited abnormally with code.*" state)
       (string-match "finished" state))
      (kill-buffer (current-buffer))))

(autoload 'speedbar-frame-mode "speedbar" "Popup a speedbar frame" t)
(autoload 'speedbar-get-focus "speedbar" "Jump to speedbar frame" t)
(global-set-key [(f4)] 'speedbar-get-focus)

;(setq cscope-database-regexps
;      '(
;	( "^/home/lutts/src/linux-trees/linux-2.6"
;	  ("/home/lutts/src/linux-trees/cscope-db/linux-2.6")
;	  t
;	  )
;	( "^/home/lutts/src/linux-trees/v2.6/linux-source"
;	  ("/home/lutts/src/linux-trees/v2.6/cscope-db/linux-source")
;	  t
;	  )
;	( "^/home/lutts/src/linux-trees/v2.6/12"
;	  ("/home/lutts/src/linux-trees/v2.6/cscope-db/12")
;	  t
;	  )
;	( "^/home/lutts/src/linux-trees/v2.6/27.5"
;	  ("/home/lutts/src/linux-trees/v2.6/cscope-db/27.5")
;	  t
;	  )
;	))

(defun my-javadoc-return ()
  "Advanced C-m for Javadoc multiline comments.

Inserts `*' at the beggining of the new line if
unless return was pressed outside the comment"
  (interactive)

  (setq last (point))

  (setq is-inside
	(if (search-backward "*/" nil t)
	    ;; there are some comment endings - search forward
	    (if (search-forward "/*" last t)
		't
	      'nil)

	  ;; it's the only comment - search backward
	  (goto-char last)
	  (if (search-backward "/*" nil t)
	      't
	    'nil
	    )
	  )
	)

  ;; go to last char position
  (goto-char last)

  ;; the point is inside some comment, insert `*'
  (if is-inside
      (progn
	(insert "\n*")
	(indent-for-tab-command))

    ;; else insert only new-line
    (insert "\n"))

  )

;(add-hook 'c-mode-common-hook (lambda ()
;			   (local-set-key "\r" 'my-javadoc-return)
;			   ))

(add-hook 'c-mode-common-hook 'hs-minor-mode)
(add-hook 'c-mode-common-hook
	  '(lambda()
	     ;;preprocessor
	     (setq c-macro-prompt-flag t)
	     (setq c-basic-offset 4)
	     (setq tab-width 4 indent-tabs-mode t)
	     (setq fill-column 80)
	     (setq comment-column 30)
	     (highlight-parentheses-mode 1)
	     (tab-indents-region)
             ;;bind newline-and-indent to RET
	     (local-set-key (kbd "RET") 'newline-and-indent)
	     (local-set-key (kbd "C-c ;") 'comment-line)
	     (local-set-key (kbd "<C-tab>") 'tempo-forward-mark)
	     (c-toggle-hungry-state 1)
	     (delete-selection-mode t)
	     (setq show-trailing-whitespace t) ; can use M-x delete-trailing-whitespace <RET> to delete all trailing whitespace within cur buf
	     ;cscope configuration
	     (require 'xcscope)
	     (setq cscope-do-not-update-database t)
	     (gtags-mode 1)
	     (paren-toggle-open-paren-context 1)
	     (require 'ifdef)
	     (local-set-key (kbd "C-c I") 'ifdef-mark)
	     )
	  )

;; linux kernel codeing style
(defun c-lineup-arglist-tabs-only (ignored)
  "Line up argument lists by tabs, not spaces"
  (let* ((anchor (c-langelem-pos c-syntactic-element))
	 (column (c-langelem-2nd-pos c-syntactic-element))
	 (offset (- (1+ column) anchor))
	 (steps (floor offset c-basic-offset)))
    (* (max steps 1)
       c-basic-offset)))

(add-hook 'c-mode-common-hook
          (lambda ()
            ;; Add kernel style
            (c-add-style
             "linux-tabs-only"
             '("linux" (c-offsets-alist
                        (arglist-cont-nonempty
                         c-lineup-gcc-asm-reg
                         c-lineup-arglist-tabs-only))))))

(add-hook 'c-mode-hook
          (lambda ()
            (let ((filename (buffer-file-name)))
              ;; Enable kernel mode for the appropriate files
              (when (and filename
			 (string-match "linux" filename))
                (setq indent-tabs-mode t)
                (c-set-style "linux-tabs-only")))))

(defun progmodes-hooks ()
  "Hooks for programming modes"
  (add-hook 'before-save-hook 'progmodes-write-hooks))

(defun progmodes-write-hooks ()
  "Hooks which run on file write for programming modes"
  (prog1 nil
    (delete-trailing-whitespace)))

(add-hook 'c-mode-common-hook 'progmodes-hooks)


;; Setting Tab to indent region if anything i selected
(defun tab-indents-region ()
  (local-set-key (kbd "<tab>") 'fledermaus-maybe-tab)
  )

(defun fledermaus-maybe-tab ()
  (interactive)
  (if (and transient-mark-mode mark-active)
      (indent-region (region-beginning) (region-end) nil)
     (c-indent-command)))

(defun my-cc-mode-auto-pair ()
  (interactive)
  (make-local-variable 'skeleton-pair-alist)
  (setq skeleton-pair-alist '(
			      (?` ?` _ "''")
			      (?` -1 ?{ " " _ " " ?}?, >)
                  (?\" _ "\"")
				  (?\( _ ")" )
				  (?\[ _ "]" )
			      (?< _ ">")
			      (?{ > \n > _ \n ?} >)))
  (setq skeleton-pair t)
  (local-set-key (kbd "\"") 'skeleton-pair-insert-maybe)
  (local-set-key (kbd "`") 'skeleton-pair-insert-maybe)
  (local-set-key (kbd "(") 'skeleton-pair-insert-maybe)
  (local-set-key (kbd "{") 'skeleton-pair-insert-maybe)
  (local-set-key (kbd "[") 'skeleton-pair-insert-maybe)
  ;(local-set-key (kbd "<") 'skeleton-pair-insert-maybe)
)

(add-hook 'c-mode-common-hook 'my-cc-mode-auto-pair)

;; This is a way to hook tempo into cc-mode
(defvar c-tempo-tags nil
  "Tempo tags for C mode")

(defvar c++-tempo-tags nil
  "Tempo tags for C++ mode")

;;; C-Mode Templates and C++-Mode Templates (uses C-Mode Templates also)
(require 'tempo)
(setq tempo-interactive t)
(global-set-key (kbd "C-=") 'tempo-complete-tag)

(add-hook 'c-mode-common-hook '(lambda ()
			  (tempo-use-tag-list 'c-tempo-tags)
			  (imenu-add-menubar-index)
			  ))

(add-hook 'c++-mode-hook
	  '(lambda ()
	     (tempo-use-tag-list 'c-tempo-tags)
	     (tempo-use-tag-list 'c++-tempo-tags)
	     ))

(add-hook 'shell-script-mode-hook
	  '(lambda ()
	     (message "sdfdsf")
	     (tempo-use-tag-list 'bash-tempo-tags)
	     ))


;;; Preprocessor Templates (appended to c-tempo-tags)
(tempo-define-template "c-include"
		       '("include <" r ".h>" > n
			 )
		       "include"
		       "Insert a #include <> statement"
		       'c-tempo-tags)

(tempo-define-template "c-ifdef"
		       '("ifdef " (p "ifdef-clause: " clause) > n> p n
			 "#else /* !(" (s clause) ") */" n> p n
			 "#endif /* " (s clause)" */" n>
			 )
		       "ifdef"
		       "Insert a #ifdef #else #endif statement"
		       'c-tempo-tags)

(tempo-define-template "c-ifndef"
		       '("ifndef " (p "ifndef-clause: " clause) > n
			 "#define " (s clause) p n
			 "#endif /* " (s clause)" */" n>
			 )
		       "ifndef"
		       "Insert a #ifndef #define #endif statement"
		       'c-tempo-tags)

;;; C-Mode Templates

(tempo-define-template "c-if"
		       '(> "if(" (p "if-clause: " clause) ")"  n>
			 "{" > n> r n
			 "} /* end of if(" (s clause) ") */" > n>
			 )
		       "if"
		       "Insert a C if statement"
		       'c-tempo-tags)

(tempo-define-template "c-else"
		       '(> "else" n>
			 "{" > n> r n
			 "} /* end of else */" > n>
			 )
		       "else"
		       "Insert a C else statement"
		       'c-tempo-tags)

(tempo-define-template "c-if-else"
		       '(> "if(" (p "if-clause: " clause) ")"  n>
			 "{" > n> r n
			 "} /* end of if(" (s clause) ") */" > n>
			 > "else" n>
			 "{" > n> r n
			 "} /* end of if(" (s clause) ")else */" > n>
			 )
		       "ifelse"
		       "Insert a C if else statement"
		       'c-tempo-tags)

(tempo-define-template "c-else-if"
		       '(> "else if(" (p "if-clause: " clause) ")" n>
			   "{" > n> r n
			   "} /* end of else if(" (s clause) " */" > n>
			   )
		       "elseif"
		       "Insert a C else if statement"
		       'c-tempo-tags)

(tempo-define-template "c-while"
		       '(> "while(" (p "while-clause: " clause) ")" >  n>
			 "{" > n> r n
			 "} /* end of while(" (s clause) ") */" > n>
			 )
		       "while"
		       "Insert a C while statement"
		       'c-tempo-tags)

(tempo-define-template "c-for"
		       '(> "for(" (p "for-clause: " clause) ")" >  n>
			 "{" > n> r n
			 "} /* end of for(" (s clause) ") */" > n>
			 )
		       "for"
		       "Insert a C for statement"
		       'c-tempo-tags)

(tempo-define-template "c-for-i"
		       '(> "for(" (p "variable: " var) " = 0; " (s var)
			 " < "(p "upper bound: " ub)"; " (s var) "++)" >  n>
			 "{" > n> r n
			 "} /* end of for(" (s var) " = 0; "
			 (s var) " < " (s ub) "; " (s var) "++) */" > n>
			 )
		       "fori"
		       "Insert a C for loop: for(x = 0; x < ..; x++)"
		       'c-tempo-tags)

(tempo-define-template "c-main"
		       '(> "main(int argc, char *argv[])" >  n>
			 "{" > n> r n n>
			 "return 0;" n
			 "} /* end of main() */" > n>
			 )
		       "main"
		       "Insert a C main statement"
		       'c-tempo-tags)

(tempo-define-template "c-if-malloc"
		       '(> "if((" (p "variable: " var) " = ("
			 (p "type: " type) " *) malloc(sizeof(" (s type)
			 "))) == (" (s type) " *) NULL)" n>
			 "{" > n> r n
			 "} /* end of if((" (s var) " = (" (s type)
			 " *) malloc...) == NULL) */" > n>
			 )
		       "ifmalloc"
		       "Insert a C if(malloc...) statement"
		       'c-tempo-tags)

(tempo-define-template "c-switch"
		       '(> "switch(" (p "switch-condition: " clause) ")" >  n>
			 "{" > n
			 "case " (p "first value: ") ":" > n> p n
			 "break;" > n> p n
			 "default:" > n> p n
			 "break;" > n
			 "} /* end of switch(" (s clause) ") */" > n>
			 )
		       "switch"
		       "Insert a C switch statement"
		       'c-tempo-tags)

(tempo-define-template "c-case"
		       '(n "case " (p "value: ") ":" > n> p n
			   "break;" > n> p
			   )
		       "case"
		       "Insert a C case statement"
		       'c-tempo-tags)

(tempo-define-template "c-defun"
		       '((p "function name: " funcname)
			 "(" (p "arguments: " funcargs) ") {" n
			 > r n
			 (p "overload description: " overloaddesc t)
			 "}\t/* " (s funcname) "(" (s overloaddesc) ") */" > n
			 p)
		       "defun"
		       "Insert a c/c++ function definition. "
		       'c-tempo-tags)

;;;C++-Mode Templates

(tempo-define-template "c++-class"
		       '("class " (p "classname: " class) " {" n
			 "public:" n>
			 (s class) "();"
			 (progn (indent-for-comment) nil)
			 "the default constructor" n>
			 "virtual ~" (s class) "();"
			 (progn (indent-for-comment) nil)
			 "the destructor" n>
			 "// the default address-of operators" n>
			 "// " (s class) "* operator&() { return this; }" n>
			 "// const " (s class) "* operator&() const { return this; }" n
			 n> p n
			 "protected:" n> p n
			 "private:" n>
			 (s class) "(const " (s class) "&rhs);"
			 (progn (indent-for-comment) nil)
			 "the copy construtctor" n>
			 (s class) "& operator=(const " (s class) "&rhs);"
			 (progn (indent-for-comment) nil)
			 "the assignment operator" n>
			 p n
		         "};\t// end of class " (s class) n>
			 )
		       "class"
		       "Insert a class skeleton"
		       'c++-tempo-tags)

(require 'tempo-snippets)
(global-set-key (kbd "C-+") 'tempo-snippets-complete-tag)

(global-set-key (kbd "C-j") 'hippie-expand)

;;**********************        常用编程配置        **********************
;; 热键设置
(global-set-key [f4] 'kill-this-buffer)
(global-set-key [f5] 'compile)
(setq-default compile-command "make -k")

;; 启动窗口gdb    
(global-set-key [f10] 'gdb-many-windows)

