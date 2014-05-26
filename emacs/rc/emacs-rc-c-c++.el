
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

