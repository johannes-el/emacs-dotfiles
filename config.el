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

(load-theme 'modus-vivendi)

(use-package evil
  :ensure t)
(evil-mode 1)

(use-package company
  :ensure t)

(use-package eglot
  :ensure t)
(require 'eglot)

(add-hook 'lisp-mode-hook 'eglot-ensure)
(add-hook 'lisp-interaction-mode-hook 'eglot-ensure)
(add-hook 'emacs-lisp-mode-hook 'eglot-ensure)
(add-hook 'python-mode-hook 'eglot-ensure)
(add-hook 'rust-mode-hook 'eglot-ensure)
(add-hook 'go-mode-hook 'eglot-ensure)

(add-to-list 'eglot-server-programs '((c++-mode c-mode) "clangd"))
(add-to-list 'eglot-server-programs '(rust-mode "rust-analyzer"))
(add-to-list 'eglot-server-programs '((emacs-lisp-mode) . ("emacs-lsp")))
(add-to-list 'eglot-server-programs '((lisp-mode lisp-interaction-mode) . ("cl-lsp")))

(use-package sly
  :ensure t)

(use-package paredit
  :ensure t
  :hook ((lisp-mode . paredit-mode)
         (emacs-lisp-mode . paredit-mode)
         (clojure-mode . paredit-mode)
         (scheme-mode . paredit-mode)
         (sly-mode . paredit-mode)
         (sly-repl-mode . paredit-mode)))

(use-package magit
  :ensure t)

(use-package ido
  :ensure t)
(setq ido-everywhere t)
(ido-mode 1)

(use-package projectile
  :ensure t)
(setq projectile-mode +1)
(global-set-key (kbd "C-c p f") 'projectile-find-file)
(global-set-key (kbd "C-c p p") 'projectile-switch-project)

(unless (file-exists-p "~/RoamNotes")
  (make-directory "~/RoamNotes"))
  (use-package org-roam
    :ensure t
    :custom
    (org-roam-directory "~/RoamNotes")
    :config
    (org-roam-setup))

(use-package org-superstar
  :ensure t
  :hook (org-mode . org-superstar-mode)
  :config
  (setq org-superstar-headline-bullets-list '("•" "◉" "○" "◇" "◆"))
  (setq org-superstar-todo-bullet-alist '(("TODO" . "◯")
                                         ("DONE" . "✔")))
  (setq org-superstar-item-bullet-alist '(("-" . "◆")
                                         ("+" . "◇")
                                         ("*" . "●"))))

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
