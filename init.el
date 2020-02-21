;; Alice's init.el

(let ((gc-cons-threshold most-positive-fixnum))

  (defun reload-dotemacs ()
    "Reloads dotemacs.org"
    (interactive)
    (org-babel-load-file (expand-file-name "dotemacs.org" user-emacs-directory)))

  ;; Set repositories
  (require 'package)
  (setq-default
   load-prefer-newer t
   package-enable-at-startup nil
   gnutls-algorithm-priority "NORMAL:-VERS-TLS1.3")
  (add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)
  (add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/") t)
  (package-initialize)

  ;; Install dependencies
  (unless (package-installed-p 'use-package)
    (package-refresh-contents)
    (package-install 'use-package t))
  (setq-default
   use-package-always-defer t
   use-package-always-ensure t)

  ;; Use latest Org
  (use-package org :ensure org-plus-contrib)

  ;; Tangle configuration
  (reload-dotemacs)

  (garbage-collect))
