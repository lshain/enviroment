(jde-set-variables
'(jde-project-name "openalarm-android")
'(jde-gen-buffer-boilerplate
  '("/**"
    "*  OpenAlarm - an extensible alarm for Android"
    "*  Copyright (C) 2010 Liu Yen-Liang (Josh)"
    "*"
    "*"
    "*  This program is free software: you can redistribute it and/or modify"
    "*  it under the terms of the GNU General Public License as published by"
    "*  the Free Software Foundation, either version 3 of the License, or"
    "*  (at your option) any later version."
    "*"
    "*  This program is distributed in the hope that it will be useful,"
    "*  but WITHOUT ANY WARRANTY; without even the implied warranty of"
    "*  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the"
    "*  GNU General Public License for more details."
    "*"
    "*  You should have received a copy of the GNU General Public License"
    "*  along with this program. If not, see ."
    "*/"))
'(jde-log-max 5000)
'(jde-enable-abbrev-mode t)
;; Class path for browsing files and generate code templates
'(jde-global-classpath
    (quote ("$ANDROID_SDK_ROOT/platforms/android-7/android.jar"
            "$HOME/projects/openalarm-android/bin")))
'(jde-sourcepath
    (quote ("$HOME/projects/openalarm-android/src"
            "$HOME/android/eclair_21/frameworks/base/core/java")))
'(jde-compile-option-directory "$HOME/projects/openalarm-android/bin") 
'(jde-complete-function (quote jde-complete-menu)) 
'(jde-run-working-directory "$HOME/projects/openalarm-android/bin")
'(jde-help-docsets
    (quote (("Android SDK Doc" "$ANDROID_SDK_ROOT/docs/index.html" nil))))
'(jde-build-function (quote (jde-ant-build)))
'(jde-ant-args "-emacs")
'(jde-ant-complete-target t)
'(jde-ant-enable-find t) 
'(jde-ant-read-args nil)
'(jde-ant-read-buildfile nil)
'(jde-ant-read-target nil)
'(jde-ant-use-global-classpath nil)
'(jde-ant-working-directory "$HOME/projects/openalarm-openalarm/bin/") 
'(jde-built-class-path (quote ("$HOME/projects/openalarm-android/bin")))
)
