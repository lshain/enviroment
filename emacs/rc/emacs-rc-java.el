;; java settings begin
(add-hook 'java-mode-hook
	  '(lambda()
	     (gtags-mode 1)
	     ))

(autoload 'smali-mode "smali-mode.el" "Major mode for editing smali files" t)
(setq auto-mode-alist
      (cons '("\\.smali" . smali-mode) auto-mode-alist))

;;add jdee cedet and jdee 
;; cedet aready load
;;(add-to-list 'load-path "~/github/enviroment/emacs/elisp/cedet-1.1/common")
;;(load-file "~/github/enviroment/emacs/elisp/cedet-1.1/common/cedet.el")
(add-to-list 'load-path "~/github/enviroment/emacs/elisp/jdee-2.4.0.1/lisp")
(add-to-list 'load-path (expand-file-name "~/github/enviroment/emacs/elisp/elib-1.0"))

(require 'jde)
;;we need some lisp to prevent fatal errors.
(defun screen-width nil -1)
(setq jde-check-version-flag nil)
(define-obsolete-function-alias 'make-local-hook 'ignore "21.1")
(unless (fboundp 'semantic-format-prototype-tag-java-mode)
(defalias 'semantic-format-prototype-tag-java-mode 'semantic-format-tag-prototype-java-mode))
(require 'hippie-exp)
;;we use something to  load JDEE for .java files :
(add-to-list 'load-path (format "%s/lisp" "~/github/enviroment/emacs/elisp/jdee-2.4.0.1" "Path to JDEE"))
(autoload 'jde-mode "jde" "JDE mode." t)
(setq auto-mode-alistwww.2cto.com
      (append '(("\\.java\\'" . jde-mode)) auto-mode-alist))

(setenv "JAVA_HOME" "$HOME/develop/Java/jdk1.6.0_37")
(custom-set-variables
 '(jde-global-classpath (quote (
                                "$HOME/develop/android/android-sdk-linux/platforms/android-11/android.jar"
                                "$HOME/develop/android/android-sdk-linux/platforms/android-12/android.jar"
                                "$HOME/develop/android/android-sdk-linux/platforms/android-13/android.jar"
                                "$HOME/develop/android/android-sdk-linux/platforms/android-14/android.jar"
                                "$HOME/develop/android/android-sdk-linux/platforms/android-15/android.jar"
                                "$HOME/develop/android/android-sdk-linux/platforms/android-16/android.jar"
                                "$HOME/develop/android/android-sdk-linux/platforms/android-17/android.jar"
                                "$HOME/develop/android/android-sdk-linux/platforms/android-18/android.jar"
                                "$HOME/develop/android/android-sdk-linux/platforms/android-19/android.jar"
                                ))))
