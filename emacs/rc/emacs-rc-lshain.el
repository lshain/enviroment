;;**********************    lshain add       ************************
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
;;(setq default-tab-width 4)

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

;; 临时记号
;; 有时你需要跳到另一个文件进行一些操作，然后很快的跳回来。你当然可以 使用 bookmark或者寄存器。
;; 但是这些实在是太慢了。你多想拥有vi那样的 ma, mb, 'a, 'b 的操作。现在你可以用几行 elisp 达到类似的目的
(defun ska-point-to-register()
  "Store cursorposition _fast_ in a register. 
Use ska-jump-to-register to jump back to the stored 
position."
  (interactive)
  (setq zmacs-region-stays t)
  (point-to-register 8))

(defun ska-jump-to-register()
  "Switches between current cursorposition and position
that was stored with ska-point-to-register."
  (interactive)
  (setq zmacs-region-stays t)
  (let ((tmp (point-marker)))
        (jump-to-register 8)
        (set-register 8 tmp)))
(define-key global-map (kbd "C-c v") 'ska-point-to-register)
(define-key global-map (kbd "C-c b") 'ska-jump-to-register)

;; go-to-char 非常感谢 Oliver Scholz 提供这个函数给 我。
;; 这个函数是一个 vi 的 "f" 命令的替代品。vi的用户知道，vi有 一个特别好的命令 "f"。当你按 "fx", x 是任意一个字符时
;; 光标 就会移动到下一个 "x" 处。这之后只要按 ";"(分号)，光标就到再 下一个 "x"。
;; 举个例子说明这个命令的用途。比如我们有这样一行字，光标在 行首。
;;(setq unread-command-events (list last-input-event)))
;;                                               ^^^^^
;; 我们希望迅速的到达最后那个 event 处，于是我在 vi 里按 "fe"。结果光标到了 "setq" 的那个 e 上面，这时候我接着按 ";", 
;; 不一会儿就到了我们想要的地方。很方便吧？可能起初不觉得，后来 你发现这真的非常好！

;; 我一直觉得 Emacs 没有这样一个方便的命令，但是 Oliver 给了 我一个完美的答案：
;; 有了这段代码之后，当你按 C-c f x (x 是任意一个字符) 时，光 标就会到下一个 x 处。再次按 x，光标就到下一个 x。比如 C-c f w w w w ..., C-c f b b b b b b ...
;; 我觉得这个方式比 vi 的 "f" 要快。
(defun wy-go-to-char (n char)
  "Move forward to Nth occurence of CHAR.
Typing `wy-go-to-char-key' again will move forwad to the next Nth
occurence of CHAR."
  (interactive "p\ncGo to char: ")
  (search-forward (string char) nil nil n)
  (while (char-equal (read-char)
             char)
    (search-forward (string char) nil nil n))
  (setq unread-command-events (list last-input-event)))
(define-key global-map (kbd "C-c f") 'wy-go-to-char)

;; 无论在什么样的主模式下都打开auto-fill模式
;;    (setq-default auto-fill-function 'do-auto-fill)

;; 移动光标设置
(global-set-key [home] 'beginning-of-buffer)
(global-set-key [end]  'end-of-buffer)

