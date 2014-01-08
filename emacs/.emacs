;; setting environment-variables
(load "~/github/enviroment/emacs/rc/emacs-rc-environment-variables.el")

;; custom-set-variables
(load "~/github/enviroment/emacs/rc/emacs-rc-custom-set-variables.el")

;;;;;;;;;;;;;;;; standard emacs setting that do not depend on third party addons ;;;;;;;;;;;;;;;;
;;; so we can use emacsclient to start a buffer
(server-start)

;;; remove the boring startup message
(setq inhibit-startup-message t)

(setq user-full-name "l")
(setq user-mail-address "l.gyh@gmail.com")

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
(add-to-list 'load-path "~/github/enviroment/emacs/elisp")
(add-to-list 'load-path "~/github/enviroment/emacs/elisp/bookmarkplus")

; color set
(load "~/github/enviroment/emacs/rc/emacs-rc-color-theme.el")

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
(global-set-key (kbd "<C-f2>") 'bm-toggle)
(global-set-key (kbd "<f2>")   'bm-next)
(global-set-key (kbd "<S-f2>") 'bm-previous)

; markdown support
(autoload 'markdown-mode "markdown-mode.el" "Major mode for editing Markdown files" t)
(setq auto-mode-alist
      (cons '("\\.mkd" . markdown-mode) auto-mode-alist))

;;  latex set ;;;;;;;;
(load "~/github/enviroment/emacs/rc/emacs-rc-latex.el")

;; smooth scrolling
(require 'smooth-scrolling)
(load "~/github/enviroment/emacs/rc/emacs-rc-lutts.el")
(load "~/github/enviroment/emacs/rc/emacs-rc-eshell.el")
(load "~/github/enviroment/emacs/rc/emacs-rc-buffer-switching.el")

(load "~/github/enviroment/emacs/rc/emacs-rc-cedet.el")
(load "~/github/enviroment/emacs/rc/emacs-rc-ecb.el")
(load "~/github/enviroment/emacs/rc/emacs-rc-c-c++.el")
(load "~/github/enviroment/emacs/rc/emacs-rc-java.el")
(load "~/github/enviroment/emacs/rc/emacs-rc-auto-complete.el")
(load "~/github/enviroment/emacs/rc/emacs-rc-desktop.el")

(load "~/github/enviroment/emacs/rc/emacs-rc-gdb-many-window.el")
(load "~/github/enviroment/emacs/rc/emacs-rc-linum.el")
;;(load "~/github/enviroment/emacs/rc/emacs-rc-yasnippet.el")

;;  l set ;;;;;;;;
(load "~/github/enviroment/emacs/rc/emacs-rc-l.el")

;; emms
(load "~/github/enviroment/emacs/rc/emacs-rc-emms.el")

;; bgColor
(load "~/github/enviroment/emacs/rc/emacs-rc-bgcolor.el")

;;(split-window-tile-3)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(column-number-mode t)
 '(ecb-options-version "2.40")
 '(ecb-source-path (quote ("$HOME/develop/android_source_analysis/android-4.3_r3" "$HOME/develop/android_source_analysis/kernel/goldfish" "$HOME/develop/android-code/kernel/goldfish" "$HOME/develop/android-code/source")))
 '(global-semantic-tag-folding-mode t nil (semantic-util-modes))
 '(menu-bar-mode t)
 '(mode-line-format (quote ("%e" #("-" 0 1 (help-echo "mouse-1: Select (drag to resize)
mouse-2: Make current window occupy the whole frame
mouse-3: Remove current window from display")) mode-line-mule-info mode-line-client mode-line-modified mode-line-remote mode-line-frame-identification #("   " 0 3 (help-echo "mouse-1: Select (drag to resize)
mouse-2: Make current window occupy the whole frame
mouse-3: Remove current window from display")) mode-line-position (vc-mode vc-mode) #("  " 0 2 (help-echo "mouse-1: Select (drag to resize)
mouse-2: Make current window occupy the whole frame
mouse-3: Remove current window from display")) (which-func-mode ("" which-func-format #("--" 0 2 (help-echo "mouse-1: Select (drag to resize)
mouse-2: Make current window occupy the whole frame
mouse-3: Remove current window from display")))) mode-line-modes (global-mode-string (#("--" 0 2 (help-echo "mouse-1: Select (drag to resize)
mouse-2: Make current window occupy the whole frame
mouse-3: Remove current window from display")) global-mode-string)) #("-%-" 0 3 (help-echo "mouse-1: Select (drag to resize)
mouse-2: Make current window occupy the whole frame
mouse-3: Remove current window from display")))))
 '(scroll-bar-mode nil)
 '(semantic-idle-scheduler-idle-time 3)
 '(semantic-self-insert-show-completion-function (lambda nil (semantic-ia-complete-symbol-menu (point))))
 '(tool-bar-mode nil)
 '(transient-mark-mode t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(tabbar-selected-face ((t (:inherit tabbar-default-face :foreground "blue" :box (:line-width 2 :color "white" :style pressed-button)))))
 '(tabbar-unselected-face ((t (:inherit tabbar-default-face :foreground "DarkGreen" :box (:line-width 2 :color "white" :style released-button)))))
 '(xgtags-file-face ((t (:foreground "salmon3" :weight bold))))
 '(xgtags-file-selected-face ((t (:foreground "salmon3" :weight bold))))
 '(xgtags-line-face ((((class color) (background dark)) (:foreground "yellow3"))))
 '(xgtags-line-number-face ((((class color) (background dark)) (:foreground "maroon3"))))
 '(xgtags-line-number-selected-face ((t (:foreground "maroon2" :weight bold))))
 '(xgtags-line-selected-face ((t (:foreground "yellow2" :weight bold))))
 '(xgtags-match-face ((((class color) (background dark)) (:foreground "green3"))))
 '(xgtags-match-selected-face ((t (:foreground "green2" :weight bold)))))
