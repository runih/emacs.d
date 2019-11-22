
;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(require 'package)
(setq package-enable-at-startup nil)
(add-to-list 'package-archives
	     '("melpa" . "https://melpa.org/packages/"))
(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(unless (package-installed-p 'spacemacs-theme)
  (package-refresh-contents)
  (package-install 'spacemacs-theme))

(setq make-backup-file nil)
(setq auto-save-default nil)

(defalias 'yes-or-no-p 'y-or-n-p)

(org-babel-load-file (expand-file-name "~/.emacs.d/config.org"))


(setq scroll-conservatively 100)

(setq ring-bell-function 'ignore)

(when window-system (global-hl-line-mode t))
(when window-system (global-prettify-symbols-mode t))


(use-package which-key
  :ensure t
  :init
  (which-key-mode))

(use-package beacon
  :ensure t
  :init
  (beacon-mode 1))


(tool-bar-mode -1)
(scroll-bar-mode -1)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (spacemacs-dark)))
 '(custom-safe-themes
   (quote
    ("bffa9739ce0752a37d9b1eee78fc00ba159748f50dc328af4be661484848e476" default)))
 '(package-selected-packages
   (quote
    (beacon auto-complete auto-compile copy-as-format spacemacs-theme use-package which-key org-bullets markdown-mode helm evil ##)))
 '(which-key-mode t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
 (setq powerline-color1 "grey22")
 (setq powerline-color2 "grey40")

(add-to-list 'load-path "~/.emacs.d/vendor/emacs-powerline")
(require 'powerline)

(require 'evil)
(evil-mode 1)

(require 'helm)
(helm-mode 1)

 (defun toggle-transparency ()
   (interactive)
   (let ((alpha (frame-parameter nil 'alpha)))
     (set-frame-parameter
      nil 'alpha
      (if (eql (cond ((numberp alpha) alpha)
                     ((numberp (cdr alpha)) (cdr alpha))
                     ;; Also handle undocumented (<active> <inactive>) form.
                     ((numberp (cadr alpha)) (cadr alpha)))
               100)
          '(85 . 50) '(100 . 100)))))
 (global-set-key (kbd "C-c t") 'toggle-transparency)

(add-to-list 'exec-path "/opt/local/bin")

(set-keyboard-coding-system nil)
(put 'erase-buffer 'disabled nil)

(setq default-input-method "MacOSX")

(setq mac-command-modifier 'meta
      mac-option-modifier nil
      mac-allow-anti-aliasing t
      mac-command-key-is-meta t)

(add-to-list 'auto-mode-alist '("\\.md$" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.mdown$" . markdown-mode))
(add-hook 'markdown-mode-hook
	  (lambda ()
	    (visual-line-mode t)
	    (writegood-mode t)
	    (flyspell-mode t)))
(setq markdown-command "pandoc --smart -f markdown -t html")

(require 'ido)
(ido-mode t)
