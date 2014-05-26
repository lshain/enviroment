(add-to-list 'load-path "~/github/enviroment/emacs/elisp/ecb-2.40")
(require 'ecb)

(global-set-key [f12] 'ecb-activate)
(global-set-key [C-f12] 'ecb-deactivate)
(global-set-key (kbd "C-c 0") 'ecb-goto-window-directories)
(global-set-key (kbd "C-c 1") 'ecb-goto-window-sources)
(global-set-key (kbd "C-c 2") 'ecb-goto-window-methods)
(global-set-key (kbd "C-c 3") 'ecb-goto-window-symboldef)
(global-set-key (kbd "C-c e") 'ecb-goto-window-edit-last)
(global-set-key (kbd "C-c r") 'ecb-redraw-layout)

