;;
;; get file extension
;;
(defun get-ext (file-name)
	   (file-name-extension file-name))

 
;; get the base name of the file
;;
(defun base-name (file-name)
	   (file-name-sans-extension file-name))
  
(defun curr-file ()
	   "Return the filename (without directory) of the current buffer"
	   (file-name-nondirectory (buffer-file-name (current-buffer)))
)



;;**********************    l add       ************************
;; 设置字体
;; 方法为: emacs->options->Set Default Font->"M-x describe-font"查看当前使用的字体名称、字体大小
;(set-default-font " -bitstream-Courier 10 Pitch-normal-normal-normal-*-19-*-*-*-m-0-iso10646-1")

;; 把这些缺省禁用的功能打开
(put 'set-goal-column 'disabled nil)
(put 'narrow-to-region 'disabled nil)
(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)
(put 'LaTeX-hide-environment 'disabled nil)

;; 以 y/n 替代 yes/no
(fset 'yes-or-no-p 'y-or-n-p)

;; 用一个很大的 kill ring. 这样防止我不小心删掉重要的东西。
(setq kill-ring-max 200)

;; 防止页面滚动时跳动
(setq scroll-margin 3
      scroll-conservatively 10000)

;; 写文件的编码方式
;;(set-buffer-file-coding-system 'gb2312)
(set-buffer-file-coding-system 'utf-8)

;; 新建文件的编码方式
;;(setq default-buffer-file-coding-system 'gb2312)
(setq default-buffer-file-coding-system 'utf-8)

;; 终端方式的编码方式
(set-terminal-coding-system 'utf-8)

;; 键盘输入的编码方式
;;(set-keyboard-coding-system 'gb2312) 
(set-keyboard-coding-system 'utf-8) 

;; 读取或写入文件名的编码方式
(setq file-name-coding-system 'utf-8) 

;; 可以递归的使用 minibuffer
(setq enable-recursive-minibuffers t)

;; 禁止终端响铃
(setq visiable-bell t) 

;; 设置tab为4个空格的宽度
(setq default-tab-width 4)

;; 设置一下备份时的版本控制，这样更加安全。
(setq version-control t)
(setq kept-new-versions 3)
(setq delete-old-versions t)
(setq kept-old-versions 2)
(setq dired-kept-versions 1)

;; 设置备份时的版本控制，这样更加安全。
(mapcar
  (function (lambda (setting)
                     (setq auto-mode-alist
                               (cons setting auto-mode-alist))))
   '(("\\.xml$".  sgml-mode)
     ("\\\.bash" . sh-mode)
     ("\\.rdf$".  sgml-mode)
     ("\\.session" . emacs-lisp-mode)
     ("\\.l$" . c-mode)
     ("\\.css$" . css-mode)
     ("\\.cfm$" . html-mode)
     ("gnus" . emacs-lisp-mode)
     ("\\.idl$" . idl-mode)))

;; 让 dired 可以递归的拷贝和删除目录
(setq dired-recursive-copies 'top)
(setq dired-recursive-deletes 'top)

;; 时间戳设置(time-stamp)，设定文档上次保存的信息
;; 只要里在你得文档里有Time-stamp:的设置，就会自动保存时间戳
;; 启用time-stamp
(setq time-stamp-active t)

;; 去掉time-stamp的警告？
(setq time-stamp-warn-inactive t)

;; 使用C-k删掉指针到改行末的所有东西
(setq-default kill-whole-line t)

;; 增大使用查找函数和变量的寻找范围
(setq apropos-do-all t)

;; 是用aspell程序作为Emacs的拼写检查成学
(setq-default ispell-program-name "aspell")

;; 功能是将当前行设为本页第一行，同终端下的clear命令有点相似
(defun line-to-top-of-window () 
"Move the line point is on to top of window." 
(interactive) 
(recenter 0)) 

;; 无论在什么样的主模式下都打开auto-fill模式
;;    (setq-default auto-fill-function 'do-auto-fill)

;; 移动光标设置
(global-set-key [home] 'beginning-of-buffer)
(global-set-key [end]  'end-of-buffer)

;; buffer刷新
(global-set-key [C-f5] 'revert-buffer)
