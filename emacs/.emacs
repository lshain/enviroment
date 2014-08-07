;; custom-set-variables
(load "~/github/enviroment/emacs/rc/emacs-rc-custom-set-variables.el")

(setq user-full-name "lshain")
(setq user-mail-address "lshain.gyh@gmail.com")

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

;; cscope
(require 'xcscope)

;; smooth scrolling
(require 'smooth-scrolling)
(load "~/github/enviroment/emacs/rc/emacs-rc-eshell.el")
(load "~/github/enviroment/emacs/rc/emacs-rc-buffer-switching.el")
(load "~/github/enviroment/emacs/rc/emacs-rc-cedet.el")
(load "~/github/enviroment/emacs/rc/emacs-rc-ecb.el")
(load "~/github/enviroment/emacs/rc/emacs-rc-c-c++.el")
(load "~/github/enviroment/emacs/rc/emacs-rc-java.el")
(load "~/github/enviroment/emacs/rc/emacs-rc-auto-complete.el")

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
 '(display-time-mode t)
 '(ecb-options-version "2.40")
 '(ecb-source-path (quote ("$HOME/android-code/kernel/linux-2.6.28.6" "$HOME/android-code/TelephonyAnalysis")))
 '(jde-global-classpath (quote ("$HOME/develop/android/android-sdk-linux/platforms/android-11/android.jar" "$HOME/develop/android/android-sdk-linux/platforms/android-12/android.jar" "$HOME/develop/android/android-sdk-linux/platforms/android-13/android.jar" "$HOME/develop/android/android-sdk-linux/platforms/android-14/android.jar" "$HOME/develop/android/android-sdk-linux/platforms/android-15/android.jar" "$HOME/develop/android/android-sdk-linux/platforms/android-16/android.jar" "$HOME/develop/android/android-sdk-linux/platforms/android-17/android.jar" "$HOME/develop/android/android-sdk-linux/platforms/android-18/android.jar" "$HOME/develop/android/android-sdk-linux/platforms/android-19/android.jar")))
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
 '(tool-bar-mode nil)
 '(transient-mark-mode t))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Droid Sans Mono" :foundry "unknown" :slant normal :weight normal :height 143 :width normal))))
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
