
;; C/C++ settings

;; tips
;; auto align variable definitions
;; select region, then `M-x align` or `M-x align-regexp`

;;;;ppindent config:indenting preprocessor statement
;; provide two funcitons: ppindent-c and ppindent-h
(require 'ppindent)

;; gtags
(load "~/github/enviroment/emacs/rc/emacs-rc-gtags.el")

;; xgtags
(load "~/github/enviroment/emacs/rc/emacs-rc-xgtags.el")

;;;; cc-mode configuration http://cc-mode.soureforge.net/
(c-set-offset 'inline-open 0)
(c-set-offset 'friend '-)
(c-set-offset 'substatement-open 0)

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

;;**********************        常用编程配置        **********************
;; 热键设置
(global-set-key [f4] 'kill-this-buffer)
;;(global-set-key [f5] 'compile)
;;(setq-default compile-command "make -k")

;; 启动窗口gdb    
(global-set-key [f10] 'gdb-many-windows)

