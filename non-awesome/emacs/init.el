;; Avoid waiting on WM when swapping fonts
(modify-frame-parameters nil '((wait-for-wm . nil)))

;; Get rid of the splash screen
(setq inhibit-startup-message t)

;; Disable bell sound, it's awful
(setq visible-bell t)
(setq ring-bell-function 'ignore)

;; Add all desired packages
(require 'package)

;; Follow hardening instructions at https://glyph.twistedmatrix.com/2015/11/editor-malware.html
;; Use https for packages
(setq package-archives
      '(("gnu" . "https://elpa.gnu.org/packages/")
        ("melpa" . "https://melpa.org/packages/")))

;; Always check certificates!
(setq tls-checktrust t)
;; Set trust roots
(let ((trustfile
       (replace-regexp-in-string
        "\\\\" "/"
        (replace-regexp-in-string
         "\n" ""
         (shell-command-to-string "python -m certifi")))))
  (setq tls-program
        (list
         (format "gnutls-cli%s --x509cafile %s -p %%p %%h"
                 (if (eq window-system 'w32) ".exe" "") trustfile)))
  (setq gnutls-verify-error t)
  (setq gnutls-trustfiles (list trustfile)))

;; Initialise packages now
(setq package-enable-at-startup nil)
(package-initialize)

;; Ensure that use-package is installed
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(eval-when-compile
  (require 'use-package))

;; Ensure that all packages are actually installed
(setq use-package-always-ensure t)

;; Desired theme
(tool-bar-mode -1)
(scroll-bar-mode -1)

;; Buffer navigation and file information
(use-package vertico
  :ensure t
  :config
  (vertico-mode))

(use-package orderless
  :ensure t
  :config
  (setq completion-styles '(orderless)
	read-buffer-completion-ignore-case t))

(use-package marginalia
  :ensure t
  :config
  (marginalia-mode))

;; Swap between numbered windows using M-<num>
(use-package winum
  :ensure t
  :config
  (global-set-key (kbd "M-0") 'treemacs-select-window)
  (global-set-key (kbd "M-1") 'winum-select-window-1)
  (global-set-key (kbd "M-2") 'winum-select-window-2)
  (global-set-key (kbd "M-3") 'winum-select-window-3)
  (global-set-key (kbd "M-4") 'winum-select-window-4)
  (global-set-key (kbd "M-5") 'winum-select-window-5)
  (global-set-key (kbd "M-6") 'winum-select-window-6)
  (global-set-key (kbd "M-7") 'winum-select-window-7)
  (global-set-key (kbd "M-8") 'winum-select-window-8)
  (winum-mode))

;; Tree based project views
(use-package treemacs
  :ensure t)

;; Generally useful key combination completions
(use-package which-key
  :ensure t
  :config
  (which-key-mode))

;; Language server protocol for auto complete stuff
(use-package lsp-mode
  :ensure t
  :bind (:map lsp-mode-map
	      ("C-c l" . lsp-command-map)
	      ("C-c d" . lsp-describe-thing-at-point)
	      ("C-c a" . lsp-execute-code-action)
	      ("C-c j" . lsp-find-definition))
  :hook (
         (c-mode . lsp)
         (c++-mode . lsp)
         (python-mode . lsp)
         (f90-mode . lsp)
         )
  :commands (lsp lsp-deferred)
  :config
  (lsp-enable-which-key-integration t)
  ())

;; UI for lsp-mode
(use-package lsp-ui :commands lsp-ui-mode)

;; Front end for auto completions
(use-package company
  :ensure t
  :config
  (company-keymap--unbind-quick-access company-active-map)
  (setq company-idle-delay 0.1
	company-minimum-prefix-length 1))

;; Syntax checking on the fly
(use-package flycheck
  :ensure t
  :config
  (setq flycheck-check-syntax-automatically '(save idle-change mode-enabled)
        flycheck-idle-change-delay 2))

;; Snippet support
(use-package yasnippet
  :ensure t
  :config
  (yas-global-mode 1))

;; set better key binds for hs-minor-mode
(add-hook 'hs-minor-mode-hook
          (lambda ()
            (local-set-key (kbd "C-<backspace>") 'hs-hide-block)
            (local-set-key (kbd "C-<return>") 'hs-show-block)
            ))

;; Redirect custom stuff elsewhere to keep this area clean
(setq custom-file "~/.emacs.d/custom.el")
(load custom-file t)

;;; Latex
(use-package auctex
  :ensure t
  :defer t)

;;; C/C++
;; Style is combination of Chombo, Overture, and CFDkit
(defconst my-style
  '((c-tab-always-indent               . t)
    (c-indent-comments-syntactically-p . t)
    (c-basic-offset                    . 3)
    (c-set-offset 'defun-block-intro ' 4)
    (c-comment-only-line               . 0)
    (continued-statement-offset        . 2)
    (c-continued-brace-offset          . 0)
    (c-brace-offset                    . 0)
    (c-brace-imaginary-offset          . 0)
    (c-argdecl-indent                  . 2)
    (c-label-offset                    . -2)
    (c-offsets-alist                   . ((substatement-open . 0)
                                          (access-label      . 0)))
    (c++-member-init-indent            . 2)
    (c++-continued-member-init-offset  . 0)
    (c++-empty-arglist-indent          . 2)
    (c++-friend-offset                 . 0)
    )
  "My Style")

;; Customizations for all of c-mode, c++-mode, and objc-mode
(defun my-c-mode-common-hook ()
  ;; add my personal style and set it for the current buffer
  (c-add-style "MyStyle" my-style)
  ;; Enable hungry-delete
  (c-toggle-hungry-state 1)
  )

;; Enable c++-mode for .cu files
(setq auto-mode-alist
  (append
    '(
      ;; File name ends in `.cu'.
      ("\\.cu\\'" . c++-mode)
      ;; File name end in `.CHF'
      ("\\.ChF\\'" . fortran-mode)
      ("\\.inputs$" . sh-mode)
    )
    auto-mode-alist))

(add-hook 'c-mode-common-hook 'my-c-mode-common-hook)
(add-hook 'c++-mode-common-hook 'my-c-mode-common-hook)

(add-hook 'c-mode-common-hook 'hs-minor-mode)
(add-hook 'c++-mode-common-hook 'hs-minor-mode)

;;; Rust
(use-package rustic
  :ensure t
  :bind (("<f6>" . rustic-format-buffer))
  :config
  (require 'lsp-rust)
  (setq lsp-rust-analyzer-completion-add-call-parenthesis nil))
