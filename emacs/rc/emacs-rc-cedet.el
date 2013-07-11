;;; cedet

(add-to-list 'load-path "~/github/enviroment/emacs/elisp/cedet-1.1/common")
(load-file "~/github/enviroment/emacs/elisp/cedet-1.1/common/cedet.el")

;; cedet升到1.1后，报Symbol's function definition is void: "eieio-build-class-alist"。 加入配置(require 'eieio-opt) 后恢复正常
(require 'eieio-opt)
;; ecb-activate继续报错Symbol's value as variable is void: stack-trace-on-error 加入(setq stack-trace-on-error t) 恢复正常。
(setq stack-trace-on-error t)
 
;; 使函数体能够折叠或展开
;; Enable source code folding
(global-semantic-tag-folding-mode 1)

;; (semantic-load-enable-minimum-features)
;;; semantic-idle-scheduler-mode
;;; semanticdb-minor-mode
;;; semanicdb-load-ebrowse-caches

(semantic-load-enable-code-helpers)
;;; minimum features
;;; imenu (TAGS)
;;; semantic-idle-summary-mode (show prototype on minibuffer)
;;; senator-minor-mode (senator menu)
;;; semantic-mru-bookmark-mode

;; (semantic-load-enable-gaudy-code-helpers)
;;; include enable-code-helpers
;;; semantic-stikyfunc-mode (TODO: turn off this feature)
;;; semantic-decoration-mode
;;; semantic-idle-comletions-mode

;; (semantic-load-enable-excessive-code-helpers)
;;; all above
;;; semantic-highlight-func-mode
;;; semantic-idle-highlight-mode
;;; semantic-decoration-on-*-members
;;; which-func-mode

(if window-system
    (semantic-load-enable-semantic-debugging-helpers)
  (progn (global-semantic-show-unmatched-syntax-mode 1)
	 (global-semantic-show-parser-state-mode 1)))

(custom-set-variables
 '(semantic-idle-scheduler-idle-time 3)
 '(semantic-self-insert-show-completion-function (lambda nil (semantic-ia-complete-symbol-menu (point))))
 '(global-semantic-tag-folding-mode t nil (semantic-util-modes)))

(setq senator-minor-mode-name "SN")
(setq semantic-imenu-auto-rebuild-directory-indexes nil)
(global-srecode-minor-mode 1)
(global-semantic-mru-bookmark-mode 1)
(global-semantic-decoration-mode 1)

(require 'semantic-tag-folding nil 'noerror)
(global-semantic-tag-folding-mode 1)

(require 'semantic-decorate-include nil 'noerror)

;; smart complitions
(require 'semantic-ia)

(setq-mode-local c-mode semanticdb-find-default-throttle
                 '(project unloaded system recursive))
(setq-mode-local c++-mode semanticdb-find-default-throttle
                 '(project unloaded system recursive))
(setq-mode-local erlang-mode semanticdb-find-default-throttle
                 '(project unloaded system recursive))

;(ignore-errors (semantic-load-enable-primary-exuberent-ctags-support))

(require 'eassist)

;; customisation of modes
(defun alexott/cedet-hook ()
;  (local-set-key [(control return)] 'semantic-ia-complete-symbol-menu)
  (local-set-key "\M-n" 'semantic-ia-complete-symbol-menu)
  (local-set-key "\C-c?" 'semantic-ia-complete-symbol)
  ;;
  (local-set-key "\C-c>" 'semantic-complete-analyze-inline)
  (local-set-key "\C-c=" 'semantic-decoration-include-visit)

  (local-set-key "\C-cj" 'semantic-ia-fast-jump)
  (local-set-key "\C-cf" 'semantic-complete-jump)
  (local-set-key "\C-cq" 'semantic-ia-show-doc)
  (local-set-key "\C-cy" 'semantic-ia-show-summary)
  (local-set-key "\C-cp" 'semantic-analyze-proto-impl-toggle)
  (local-set-key (kbd "C-c -") 'semantic-tag-folding-fold-block)
  (local-set-key (kbd "C-c +") 'semantic-tag-folding-show-block)
  (local-set-key [f11]  'semantic-mrub-switch-tags)
  )

;; for gdb debug fringe switch, it will not work when folding mode is on
(global-set-key (kbd "C-?") 'global-semantic-tag-folding-mode)

;; (add-hook 'semantic-init-hooks 'alexott/cedet-hook)
(add-hook 'c-mode-common-hook 'alexott/cedet-hook)
(add-hook 'lisp-mode-hook 'alexott/cedet-hook)
(add-hook 'scheme-mode-hook 'alexott/cedet-hook)
(add-hook 'emacs-lisp-mode-hook 'alexott/cedet-hook)
(add-hook 'erlang-mode-hook 'alexott/cedet-hook)

(defun alexott/c-mode-cedet-hook ()
  ;; (local-set-key "." 'semantic-complete-self-insert)
  ;; (local-set-key ">" 'semantic-complete-self-insert)
  (local-set-key "\C-ct" 'eassist-switch-h-cpp)
  (local-set-key "\C-xt" 'eassist-switch-h-cpp)
  (local-set-key "\C-cm" 'eassist-list-methods)
  (local-set-key "\C-c\C-r" 'semantic-symref)
  )
(add-hook 'c-mode-common-hook 'alexott/c-mode-cedet-hook)

;; gnu global support
(when (cedet-gnu-global-version-check t)
  (require 'semanticdb-global)
  (semanticdb-enable-gnu-global-databases 'c-mode)
  (semanticdb-enable-gnu-global-databases 'c++-mode))

(setq semantic-symref-tool 'global)

;; ctags
(when (cedet-ectag-version-check t)
  (require 'semanticdb-ectag)
  (semantic-load-enable-primary-exuberent-ctags-support))

;; common includes for all projects
;; (semantic-add-system-include "~/exp/include" 'c++-mode)
;; (semantic-add-system-include "~/exp/include" 'c-mode)

(defun recur-list-files (dir re)
  "Returns list of files in directory matching to given regex"
  (when (file-accessible-directory-p dir)
    (let ((files (directory-files dir t))
          matched)
      (dolist (file files matched)
        (let ((fname (file-name-nondirectory file)))
          (cond
           ((or (string= fname ".")
                (string= fname "..")) nil)
           ((and (file-regular-p file)
                 (string-match re fname))
            (setq matched (cons file matched)))
           ((file-directory-p file)
            (let ((tfiles (recur-list-files file re)))
              (when tfiles (setq matched (append matched tfiles)))))))))))

;(defun c++-setup-boost (boost-root)
;  (when (file-accessible-directory-p boost-root)
;    (let ((cfiles (recur-list-files boost-root "\\(config\\|user\\)\\.hpp")))
;      (dolist (file cfiles)
;        (add-to-list 'semantic-lex-c-preprocessor-symbol-file file)))))

;;; ede customization
(require 'semantic-lex-spp)
(global-ede-mode t)
(ede-enable-generic-projects)
(require 'ede-linux)
(setq ede-locate-setup-options '(ede-locate-global ede-locate-base))

;
;(ede-cpp-root-project "Test"
;		      :name "Test Project"
;		      :file "~/work/project/CMakeLists.txt"
;		      :include-path '("/"
;				      "/Common"
;				      "/Interfaces"
;				      "/Libs"
;				      )
;		      :system-include-path '("~/exp/include")
;		      :spp-table '(("isUnix" . "")
;				   ("BOOST_TEST_DYN_LINK" . "")))
;


;; cpp-tests project definition
;(when (file-exists-p "~/projects/lang-exp/cpp/CMakeLists.txt")
;  (setq cpp-tests-project
;	(ede-cpp-root-project "cpp-tests"
;			      :file "~/projects/lang-exp/cpp/CMakeLists.txt"
;			      :system-include-path '("/home/ott/exp/include"
;						     boost-base-directory)
;			      :local-variables (list
;						(cons 'compile-command 'alexott/gen-cmake-debug-compile-string)
;						)
;			      )))

;(when (file-exists-p "~/work/emacs-head/README")
;  (setq emacs-project
;	(ede-emacs-project "emacs-head"
;			   :file "~/work/emacs-head/README")))

;;**********************        自动补全功能       **********************
;; 设置以下 hippie-expand 的补全方式。
;; 它是一个优先列表， hippie-expand 会优先使用表最前面的函数来补全，
;; 首先使用当前的buffer补全，如果找不到，就到别的可见的窗口里寻找，如还找不到，
;; 那么到所有打开的buffer去找，如果还……那么到kill-ring里，到文件名，到简称列表
;; 里，到list，当前使用的匹配方式会在 echo 区域显示。
;; 特别有意思的是 try-expand-line，它可以帮你补全整整一行文字。我很多时后有两行文字大致相
;; 同，只有几个字不一样，但是我懒得去拷贝粘贴以下。那么我就输入这行文字的前面几个字。然后
;; 多按几下 M-/ 就能得到那一行。

;;;;自动补齐策略
(defun my-indent-or-complete ()
   (interactive)
   (if (looking-at "//>")
          (hippie-expand nil)
          (indent-for-tab-command))
)

(global-set-key [(control tab)] 'my-indent-or-complete)

;; hippie的自动补齐策略，优先调用了senator的分析结果：
(autoload 'senator-try-expand-semantic "senator")

(global-set-key [(meta ?/)] 'hippie-expand)
(setq hippie-expand-try-functions-list
'(
    senator-try-expand-semantic    
    try-expand-line
    try-expand-line-all-buffers
    try-expand-list
    try-expand-list-all-buffers
    try-expand-dabbrev
    try-expand-dabbrev-visible
    try-expand-dabbrev-all-buffers
    try-expand-dabbrev-from-kill
    try-complete-file-name
    try-complete-file-name-partially
    try-complete-lisp-symbol
    try-complete-lisp-symbol-partially
    try-expand-whole-kill))

;;设置检索范围
(setq semanticdb-project-roots 
(list
    (expand-file-name "/")));;可以设置为项目的顶级目录

;;; 当输入"."或">"时，在另一个窗口中列出结构体或类的成员
(defun my-c-mode-cedet-hook ()
  (local-set-key "." 'semantic-complete-self-insert)
  (local-set-key ">" 'semantic-complete-self-insert))

(add-hook 'c-mode-common-hook 'my-c-mode-cedet-hook)

;;绑定按键,ctr+tab,以下三种,任意选择一个,我喜欢第二个
;;(global-set-key [(control tab)] 'senator-complete-symbol);
(global-set-key [(control tab)] ' senator-completion-menu-popup)
;; (global-set-key [(control tab)] 'semantic-ia-complete-symbol-menu)
;;**********************        End 自动补全       **********************


