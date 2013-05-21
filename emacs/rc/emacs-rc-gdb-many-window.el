;;gdb-many-window
;;这个功能插件可以使emacs的调试界面像VC一样，有watch, stacktrace等窗口，真正实现图形化gdb.
;;在emacs中编译好程序，然后M-x gdb，连按两次ret，多窗口gdb就出来了
;;http://www.inet.net.nz/~nickrob/multi-gud.el
;;http://www.inet.net.nz/~nickrob/multi-gdb-ui.el

(setq gdb-many-windows t)
(load-library "multi-gud.el")
(load-library "multi-gdb-ui.el")

