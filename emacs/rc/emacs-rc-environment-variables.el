;;; environment variables
;(when (equal system-type 'gnu/linux)
;      (message "Emacs Run on GNU/Linux")
;      (setenv "PATH" (concat "/opt/mips-4.3/bin:" (getenv "PATH")))
;      (setq exec-path (append exec-path '("/opt/mips-4.3/bin"))))

;(when (string= (getenv "USER") "lsg")
;  (setenv "PATH" (concat (getenv "PATH") ":/opt/tools/bin:/opt/tools/usr/sbin:/opt/tools/;usr/bin"))
;  (setq exec-path (append exec-path '("/opt/tools/bin")))
;  (setq exec-path (append exec-path '("/opt/tools/usr/sbin")))
;  (setq exec-path (append exec-path '("/opt/tools/usr/bin")))
;)

