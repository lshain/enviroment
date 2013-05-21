;;自动补全代码插件yasnippet-bundle.el
(load-file "~/emacs/elisp/yasnippet-bundle.el")
(require 'yasnippet-bundle)
(yas/initialize)
(yas/load-directory "~/emacs/elisp/")

(require 'dropdown-list)
       (setq yas/prompt-functions '(yas/dropdown-prompt
              yas/ido-prompt
              yas/completing-prompt))

