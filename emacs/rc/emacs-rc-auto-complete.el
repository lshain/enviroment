(add-to-list 'load-path "~/emacs/elisp/auto-complete-1.3.1")

(require 'auto-complete-config)
(ac-config-default)

(add-to-list 'ac-dictionary-directories "~/emacs/elisp/auto-complete-1.3.1/dict")

;(setq ac-auto-show-menu nil)
;; show 1 seconds later
(setq ac-auto-show-menu 1)

;;(define-key ac-mode-map (kbd "M-/") 'auto-complete)

