;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

(setq user-full-name "Igor Alentev"
      user-mail-address "alentev.olm@ya.ru")

(setq doom-font (font-spec :family "JetBrains Mono" :size 12 :weight 'light)) ;; Doom main font
(setq doom-theme 'doom-dracula) ;; Doom main theme

(setq org-directory "~/org/") ;; Default org location

(setq display-line-numbers-type 'relative) ;; Relative line numbers

(setq explicit-shell-file-name "/bin/zsh")
(getenv "PATH")
 (setenv "PATH"
(concat
 "/Library/TeX/texbin" ":"

(getenv "PATH")))
