;;----------------------------------------------------------------------------
;; Misc config - yet to be placed in separate files
;;----------------------------------------------------------------------------
(add-auto-mode 'tcl-mode "Portfile\\'")
(fset 'yes-or-no-p 'y-or-n-p)

(dolist (hook (if (fboundp 'prog-mode)
                  '(prog-mode-hook ruby-mode-hook)
                '(find-file-hooks)))
  (add-hook hook 'goto-address-prog-mode))
(add-hook 'after-save-hook 'executable-make-buffer-file-executable-if-script-p)
(setq goto-address-mail-face 'link)

(setq-default regex-tool-backend 'perl)

(add-auto-mode 'conf-mode "Procfile")


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

;; Neotree config
(require 'neotree)

(provide 'init-misc)
