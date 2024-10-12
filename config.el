(setq inhibit-startup-screen t)
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

(setq custom-file (concat user-emacs-directory "custom.el"))
(load custom-file)

(setq display-line-numbers-type 'relative)
(global-display-line-numbers-mode)

(setq backup-directory-alist `(("." . "~/.saves")))

(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(use-package standard-themes
:ensure t)
:config
  (load-theme 'standard-dark)

(use-package evil
  :ensure t)
(evil-mode 1)

(use-package magit
  :ensure t)

(use-package ido
  :ensure t)
(setq ido-everywhere t)
(ido-mode 1)

(use-package org-roam
  :ensure t
  :custom
  (org-roam-directory "~/RoamNotes")
  :config
  (org-roam-setup))

(use-package emms
  :ensure t)
(use-package emms-setup
  :ensure nil
  :init
  (add-hook 'emms-player-started-hook 'emms-show)
  :config
  (setq emms-show-format "Playing: %s")
  (emms-all)
  (emms-default-players)
  (setq emms-source-file-default-directory "~/.emmsMusic/")
)

(use-package rainbow-delimiters
  :ensure t
  :hook ((emacs-lisp-mode
    scheme-mode
    common-lisp-mode
    lisp-mode
    LaTeX-mode)))