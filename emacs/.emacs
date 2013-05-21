;; setting environment-variables
(load "~/emacs/rc/emacs-rc-environment-variables.el")

;; custom-set-variables
(load "~/emacs/rc/emacs-rc-custom-set-variables.el")

;;;;;;;;;;;;;;;; standard emacs setting that do not depend on third party addons ;;;;;;;;;;;;;;;;
;;; so we can use emacsclient to start a buffer
(server-start)

;;; remove the boring startup message
(setq inhibit-startup-message t)

(setq user-full-name "lshain")
(setq user-mail-address "lshain.gyho@gmail.com")

;;; Emacs title bar to reflect file name
(defun frame-title-string ()
   "Return the file name of current buffer, using ~ if under home directory"
   (let
      ((fname (or
                 (buffer-file-name (current-buffer))
                 (buffer-name))))
      ;;let body
      (when (string-match (getenv "HOME") fname)
        (setq fname (replace-match "~" t t fname)))
      fname))

(setq frame-title-format '((:eval (frame-title-string))))
(setq icon-title-format "%b")

;;;window size and initial position
;(set-frame-height (selected-frame) 48)
(set-frame-position (selected-frame) 0 0)

;;; we want to keep the line as is, we are programmers, we have no long lines
(setq line-move-visual nil)
;;; must set line-move-visual to nil to set track-eol
(setq track-eol t)

(setq default-major-mode 'text-mode)

(setq make-backup-files nil) ; Don't want any backup files

;;; bridge emacs to system clipboard, to we can copy and paste between emacs and the system apps
(setq x-select-enable-clipboard t)

;;; yes, we are programmers
(setq-default fill-column 80)

;;; auto revert mode configuration
;;; revert buffer periodly, so we can edit a file in another place and emacs will reflect the change imediatly
(global-auto-revert-mode 1)

;;; display time in 24hour format in mode line
(display-time-mode 1)
(setq display-time-24hr-format t)
(setq display-time-day-and-date t)

;;; mouse releated
(mouse-avoidance-mode 'animate)
;; Enable the mouse wheel
(mouse-wheel-mode t)
;; Mouse wheel scrolls buffer under pointer; this is useful for examining a
;; help buffer or something
(setq mouse-wheel-follow-mouse t)

;(setq scroll-conservatively 10000)
(setq mouse-wheel-scroll-amount '(1 ((shift) . 1))) ;; one line at a time
(setq mouse-wheel-progressive-speed nil) ;; don't accelerate scrolling
(setq mouse-wheel-follow-mouse 't) ;; scroll window under mouse
(setq scroll-step 1) ;; keyboard scroll one line at a time

(global-set-key "\C-x\C-b" 'buffer-menu)

;;copy word
(defun copy-word (&optional arg)
  "Copy words at point."
  (interactive "P")
  (save-excursion
    (let ((beg (progn (if (looking-back "[a-zA-Z]" 1) (backward-word 1)) (point)))
	  (end (progn (forward-word arg) (point))))
      (copy-region-as-kill beg end))
    )
)

(global-set-key (kbd "C-c w") 'copy-word)

;;copy line
(defun copy-line (&optional arg)
  "Save current line into Kill-Ring without mark the line."
  (interactive "P")
  (save-excursion
    (let (
	  (beg (line-beginning-position))
	  (end (line-end-position))
	  )
      (copy-region-as-kill beg end)
      )
    )
)

(global-set-key (kbd "C-c l") 'copy-line)

;; format(indent) the code after yank
(dolist (command '(yank yank-pop))
       (eval `(defadvice ,command (after indent-region activate)
                (and (not current-prefix-arg)
                     (member major-mode '(emacs-lisp-mode lisp-mode
                                                          clojure-mode    scheme-mode
                                                          haskell-mode    ruby-mode
                                                          rspec-mode      python-mode
                                                          c-mode          c++-mode
                                                          objc-mode       plain-tex-mode))
                     (let ((mark-even-if-inactive transient-mark-mode))
                       (indent-region (region-beginning) (region-end) nil))))))

(defun insert-new-line-up ()
  "Opens a new line before the current line.
Equivalent to beginning-of-line, open-line."
  (interactive)
  (beginning-of-line)
  (open-line 1)
  (indent-according-to-mode))

(global-set-key (kbd "<C-S-return>") 'insert-new-line-up)

(defun insert-new-line-down ()
  "Opens a new line after the current line. "
  (interactive)
  (move-end-of-line nil)
  (newline-and-indent))

;; Shift the select region right if distance if posive, left if negative
(defun shift-region (distance)
  (let ((mark (mark)))
    (save-excursion
      (indent-rigidly (region-beginning) (region-end) distance)
      (push-mark mark tt)
      ;; Tell the command loop not to deactivate the mark
      ;; for transient mark mode
      (setq deactivate-mark nil))))

(defun shift-right ()
  (interactive)
  (shift-region 1))

(defun shift-left ()
  (interactive)
  (shift-region -1))

;; Bind (shift-right) and (shift-left) function to your favorite keys.
(global-set-key [C-S-right] 'shift-right)
(global-set-key [C-S-left] 'shift-left)

(global-set-key (kbd "<C-return>") 'insert-new-line-down)

;;comment line(bind to `Ctrl-c ;' in C mode)
(defun comment-line (&optional arg)
  "Comment the line where the point is in."
  (interactive "P")
  (save-excursion
    (let (
	  (beg (line-beginning-position))
	  (end (line-end-position))
	  )
      (comment-region beg end arg)
      )))


;;delete selection mode(replace by type text,delete by DEL)
(delete-selection-mode t)

;; display the current function name in the mode line
(which-function-mode t)

;; if the current character is `tab', strech the cursor
(setq x-stretch-cursor t)

;;see metching pairs of parenttheses
(show-paren-mode 1)

; Customize packages settings
;; first, add package paths to `load-path'
(add-to-list 'load-path "~/emacs/elisp")
(add-to-list 'load-path "~/emacs/elisp/bookmarkplus")

; color set
(load "~/emacs/rc/emacs-rc-color-theme.el")

;;tabbar
(require 'tabbar)
(tabbar-mode)
(global-set-key [(control >)] 'tabbar-forward-tab)
(global-set-key [(control <)] 'tabbar-backward-tab)

;highlight line
(require 'highline)
;(setq highline-face 'highlight)
(set-face-background 'highline-face "#2d2d2d")
(global-highline-mode 1)

;;highlight the matching parentheses surrounding point
(require 'highlight-parentheses)

;; mic-paren
(require 'mic-paren)
(paren-activate)
(setq paren-message-show-linenumber 'absolute)

;indicat empty lines
(setq default-indicate-empty-lines t)

;; 指针颜色设置为白色
(set-cursor-color "purple")
;; 光标显示为一竖线
(setq-default cursor-type 'bar)

;; auto-complete priority
(setq hippie-expand-try-functions-list
      '(
	senator-try-expand-sematic
	try-expand-dabbrev
	try-expand-dabbrev-visible
	try-expand-dabbrev-all-buffers
	try-expand-dabbrev-from-kill
	try-complete-file-name-partially
	try-complete-file-name
	try-expand-all-abbrevs
	try-expand-list
	try-expand-line
	try-complete-lisp-symbol-partially
	try-complete-lisp-symbol))

;;;;session restore
(require 'session)
(add-hook 'after-init-hook 'session-initialize)

;;make shell scirpt executable after save
(setq prefix-function-name t)
(require 'shebang)

;;; cperl-mode is preferred to perl-mode
;;; "Brevity is the soul of wit" <foo@acm.org>
;(defalias 'perl-mode 'cperl-mode)
;; Use cperl-mode instead of the default perl-mode
(add-to-list 'auto-mode-alist '("\\.\\([pP][Llm]\\|al\\)\\'" . cperl-mode))
(add-to-list 'interpreter-mode-alist '("perl" . cperl-mode))
(add-to-list 'interpreter-mode-alist '("perl5" . cperl-mode))
(add-to-list 'interpreter-mode-alist '("miniperl" . cperl-mode))

(add-hook 'cperl-mode-hook 'n-cperl-mode-hook t)
(defun n-cperl-mode-hook ()
  (setq cperl-indent-level 4)
  (setq cperl-continued-statement-offset 0)
  (setq cperl-extra-newline-before-brace t)
;  (set-face-background 'cperl-array-face "wheat")
;  (set-face-background 'cperl-hash-face "wheat")
)

(autoload 'awk-mode "cc-mode" nil t)

;;; etags
(defun create-tags (dir-name)
  "Create tags file.  "
  (interactive "DDirectory: ")
  (eshell-command
   (format "find %s -type f -name \"*.[ch]\" | etags -" dir-name)))

;; turn on image file support
(auto-image-file-mode)

;;; highlight symbol
(require 'highlight-symbol)
(global-set-key [(control f3)] 'highlight-symbol-at-point)
(global-set-key [f3] 'highlight-symbol-next)
(global-set-key [(shift f3)] 'highlight-symbol-prev)
(global-set-key [(meta f3)] 'highlight-symbol-prev)

;; bookmark manager
(require 'bm)
(global-set-key (kbd "<C-f5>") 'bm-toggle)
(global-set-key (kbd "<f5>")   'bm-next)
(global-set-key (kbd "<S-f5>") 'bm-previous)

; markdown support
(autoload 'markdown-mode "markdown-mode.el" "Major mode for editing Markdown files" t)
(setq auto-mode-alist
      (cons '("\\.mkd" . markdown-mode) auto-mode-alist))

;;  latex set ;;;;;;;;
(load "~/emacs/rc/emacs-rc-latex.el")

;; smooth scrolling
(require 'smooth-scrolling)
(load "~/emacs/rc/emacs-rc-lutts.el")
(load "~/emacs/rc/emacs-rc-eshell.el")
(load "~/emacs/rc/emacs-rc-buffer-switching.el")

(load "~/emacs/rc/emacs-rc-cedet.el")
(load "~/emacs/rc/emacs-rc-ecb.el")
(load "~/emacs/rc/emacs-rc-c-c++.el")
(load "~/emacs/rc/emacs-rc-java.el")
(load "~/emacs/rc/emacs-rc-auto-complete.el")
(load "~/emacs/rc/emacs-rc-desktop.el")

(load "~/emacs/rc/emacs-rc-gdb-many-window.el")
(load "~/emacs/rc/emacs-rc-linum.el")
(load "~/emacs/rc/emacs-rc-yasnippet.el")

;;  lshain set ;;;;;;;;
(load "~/emacs/rc/emacs-rc-lshain.el")

;; emms
(load "~/emacs/rc/emacs-rc-emms.el")

;;(split-window-tile-3)
