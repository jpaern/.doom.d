;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "Juri Paern"
      user-mail-address "juri.paern@gmail.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;;
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
;; (setq doom-font (font-spec :family "monospace" :size 12 :weight 'semi-light)
;;       doom-variable-pitch-font (font-spec :family "sans" :size 13))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-one)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/privat/org/")

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)

;; ***************************************************************************
;; Juri's stuff, start
;; ***************************************************************************

(cond
 ((string-equal (system-name) "emi")
  (setq doom-font (font-spec :family "monospace" :size 18)
        doom-variable-pitch-font (font-spec :family "monospace" :size 18)))
 ((string-equal (system-name) "lin")
  (setq doom-font (font-spec :family "monospace" :size 20)
        doom-variable-pitch-font (font-spec :family "monospace" :size 20)))
)


(setq projectile-project-search-path '("~/dev/" "~/privat/leuphana/"
                                       "~/privat/bewerbungen/"))

; (setq +latex-viewers '(evince))
; (setq lsp-tex-server 'texlab)
(setq digestif-path (shell-command-to-string "which digestif"))
(setq exec-path (append exec-path '("/nix/store/n9s4rjrwvqij23l9wlw4axzv8pcpzwaa-lua5.3-digestif-dev-1/bin")))
(setq exec-path (append exec-path '("/nix/store/gnsn5ndfkq6g17rjy4z92sffkx9x2yqp-texlab-3.3.1/bin")))
(setq exec-path (append exec-path '("/nix/store/aynhkayshbg1wankhfw06w0v5x1yv037-texlive-combined-2021/bin/")))
(setq exec-path (append exec-path '("/nix/store/cx6id47xmn4ki9k86z81p2ml4ix2mrvl-evince-41.3/bin")))
(setq exec-path (append exec-path '("/nix/store/3gydwm4jjc2q38jgyn3c1xvgs5ngnrzg-zathura-with-plugins-0.4.8/bin")))
(setq lsp-tex-server 'digestif)

;(directory-file-name
; (file-name-directory
;  (shell-command-to-string "which digestif")))
;
;(shell-command-to-string "which digestif")

;; (org-agenda-files (ignore-errors (directory-files +org-dir t "\\.org$" t)))
(require 'org-bullets)
(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))


;; Hunspell
;(setq ispell-hunspell-dict-paths-alist
;      '(("de_DE" "~/.nix-profile/share/hunspell/de_DE.aff")))
;(add-to-list 'ispell-local-dictionary-alist '("de_DE"
;                                              "[[:alpha:]]"
;                                              "[^[:alpha:]]"
;                                              "[']"
;                                              t
;                                              ("-d" "de_DE"); Dictionary file name
;                                              nil
;                                              utf-8))
;
;(add-to-list 'ispell-local-dictionary-alist '("en_US"
;                                              "[[:alpha:]]"
;                                              "[^[:alpha:]]"
;                                              "[']"
;                                              t
;                                              ("-d" "en_US")
;                                              nil
;                                              utf-8))
;
;(setq ispell-program-name "hunspell"          ; Use hunspell to correct mistakes
;      ispell-dictionary   "de_DE")  ; Default dictionary to use

(defun switch-dictionary-de-en ()
  "Switch german and english dictionaries."
  (interactive)
  (let* ((dict ispell-current-dictionary)
         (new (if (string= dict "de_DE") "en_US"
                   "de_DE")))
    (ispell-change-dictionary new)
    (message "Switched dictionary from %s to %s" dict new)))

(global-set-key (kbd "C-c d") 'switch-dictionary-de-en)

;; Guess language
;(use-package! guess-language         ; Automatically detect language for Flyspell
;  :defer t
;  :init (add-hook 'text-mode-hook #'guess-language-mode)
;  :config
;  (setq guess-language-langcodes '((en . ("en_GB" "English"))
;                                   (de . ("de_DE" "German")))
;        guess-language-lAnguages '(en de)
;        guess-language-min-paragraph-length 45)
;  :diminish guess-language-mode)

;; ***************************************************************************
;; Juri's stuff, end
;; ***************************************************************************


;; Here are some additional functions/macros that could help you configure Doom:
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.

