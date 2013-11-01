;;gdb-many-window
;;这个功能插件可以使emacs的调试界面像VC一样，有watch, stacktrace等窗口，真正实现图形化gdb.
;;在emacs中编译好程序，然后M-x gdb，连按两次ret，多窗口gdb就出来了
;;gdb --annotate=3 filename
;;http://www.inet.net.nz/~nickrob/multi-gud.el
;;http://www.inet.net.nz/~nickrob/multi-gdb-ui.el

;;24以后版本不用
;;(setq gdb-many-windows t)
;;(load-library "multi-gud.el")
;;(load-library "multi-gdb-ui.el")

(add-hook 'gdb-mode-hook '(lambda ()
	(define-key c-mode-base-map [(f6)] 'gud-go)
	(define-key c-mode-base-map [(f7)] 'gdb-many-windows)
	(define-key gud-mode-map [(f7)] 'gdb-many-windows)
	(define-key c-mode-base-map [(f8)] 'gdb-restore-windows)
	(define-key gud-mode-map [(f8)] 'gdb-restore-windows)
	(define-key c-mode-base-map [(f9)] 'gud-next)
	(define-key c-mode-base-map [(f10)] 'gud-step)))

