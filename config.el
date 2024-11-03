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

(use-package company
  :ensure t)

(use-package eglot
    :ensure t)
  (require 'eglot)
(add-to-list 'eglot-server-programs '((c++-mode c-mode) "clangd"))
(add-to-list 'eglot-server-programs '(rust-mode "rust-analyzer"))
(add-hook 'c-mode-hook 'eglot-ensure)
(add-hook 'c++-mode-hook 'eglot-ensure)
(add-hook 'cmake-mode-hook 'eglot-ensure)
(add-hook 'go-mode-hook 'eglot-ensure)
(add-hook 'rust-mode-hook 'eglot-ensure)

(use-package magit
  :ensure t)

(use-package ido
  :ensure t)
(setq ido-everywhere t)
(ido-mode 1)

(unless (file-exists-p "~RoamNotes")
  (make-directory "~/RoamNotes"))
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
(rainbow-delimiters-mode 1)
