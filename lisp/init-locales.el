(defun sanityinc/utf8-locale-p (v)
  "Return whether locale string V relates to a UTF-8 locale."
  (and v (string-match "UTF-8" v)))

(defun locale-is-utf8-p ()
  "Return t iff the \"locale\" command or environment variables prefer UTF-8."
  (or (sanityinc/utf8-locale-p (and (executable-find "locale") (shell-command-to-string "locale")))
      (sanityinc/utf8-locale-p (getenv "LC_ALL"))
      (sanityinc/utf8-locale-p (getenv "LC_CTYPE"))
      (sanityinc/utf8-locale-p (getenv "LANG"))))

(when (or window-system (locale-is-utf8-p))
  (setq utf-translate-cjk-mode nil) ; disable CJK coding/encoding (Chinese/Japanese/Korean characters)
  (set-language-environment 'utf-8)
  (setq locale-coding-system 'utf-8)
  (set-default-coding-systems 'utf-8)
  (set-terminal-coding-system 'utf-8)
  (set-selection-coding-system (if (eq system-type 'windows-nt) 'utf-16-le 'utf-8))
  (prefer-coding-system 'utf-8))

;; Set html color fit to monokai theme
(defun web-mode-hook ()
  (set-face-attribute 'web-mode-html-tag-face nil :foreground "#FFFFFF")
  (set-face-attribute 'web-mode-html-tag-bracket-face nil :foreground "#FFFFFF")
  (set-face-attribute 'web-mode-html-attr-value-face nil :foreground "#FFF68F")
  (set-face-attribute 'web-mode-html-attr-name-face nil :foreground "#FF8C00"))

(add-hook 'web-mode-hook 'web-mode-hook )

;; Set jsx mode
(add-to-list 'auto-mode-alist '("\\.jsx\\'" . web-mode))
(setq web-mode-content-types-alist
      '(("jsx" . "\\.js[x]?\\'")))

;; Set avy config
(global-set-key (kbd "C-'") 'avy-goto-char-2)
(global-set-key (kbd "M-g f") 'avy-goto-line)
(global-set-key (kbd "M-g w") 'avy-goto-word-1)
(global-set-key (kbd "M-g e") 'avy-goto-word-0)

;; Enable highlight current line
(global-hl-line-mode t)

;;Customize theme
(add-to-list 'custom-theme-load-path "~/.emacs.d/moe-theme.el/")
(add-to-list 'load-path "~/.emacs.d/moe-theme.el/")
(require 'moe-theme)
(load-theme 'moe-dark t)

;; Hide menu bar
(menu-bar-mode 0)
(tool-bar-mode 0)

(provide 'init-locales)
