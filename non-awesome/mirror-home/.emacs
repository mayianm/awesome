;; This avoids a bug where emacs waits for ~5 seconds when font is changed
(modify-frame-parameters nil '((wait-for-wm . nil)))

;; Get rid of the splash screen
(setq inhibit-startup-message t)

;; Use AucTex
;;(load "auctex.el" nil t t)

;; Key bindings ----------------------------------------------------------------

(global-set-key "\M-g" 'goto-line)
(global-set-key "\C-c\C-v" 'uncomment-region)

;; Define C programming customizations -----------------------------------------
;; Note: most offsets should be changed to use c-offsets-alist as is partially
;;       done in the overture style.  Also see
;;       http://www.gnu.org/software/emacs/manual/html_node/ccmode/Sample-_002eemacs-File.html#Sample-_002eemacs-File

(defconst Chombo-style
  '((c-tab-always-indent               . t)
    (c-basic-offset                    . 2)
    (c-comment-only-line               . 0)
    (continued-statement-offset        . 2)
    (c-continued-brace-offset          . 0)
    (c-brace-offset                    . 0)
    (c-brace-imaginary-offset          . 0)
    (c-argdecl-indent                  . 2)
    (c-label-offset                    . -2)
    (c++-member-init-indent            . 2)
    (c++-continued-member-init-offset  . 0)
    (c++-empty-arglist-indent          . 2)
    (c++-friend-offset                 . 0)
    )
  "Chombo Style")

(defconst Overture-style
  '((c-tab-always-indent               . t)
    (c-basic-offset                    . 2)
    (c-comment-only-line               . 0)
    (continued-statement-offset        . 2)
    (c-continued-brace-offset          . 0)
    (c-brace-offset                    . 0)
    (c-brace-imaginary-offset          . 0)
    (c-argdecl-indent                  . 2)
    (c-offsets-alist                   . ((substatement-open . 0)
                                          (access-label      . 0)))
    (c++-member-init-indent            . 2)
    (c++-continued-member-init-offset  . 0)
    (c++-empty-arglist-indent          . 2)
    (c++-friend-offset                 . 0)
    )
  "Overture Style")

(defconst CFDkit-style
  '((c-tab-always-indent               . t)
    (c-indent-comments-syntactically-p . t)
    (c-basic-offset                    . 3)
    (c-set-offset 'defun-block-intro ' 4)
    )
  "CFDKit Style")

(defconst my-style
  '((c-tab-always-indent        . t)
    (c-indent-comments-syntactically-p . t)
    (c-basic-offset             . 3)
    (c-set-offset 'defun-block-intro ' +)
    )
  "My Style")

;; Customizations for all of c-mode, c++-mode, and objc-mode
(defun my-c-mode-common-hook ()
  ;; add my personal style and set it for the current buffer
  (c-add-style "Chombo" Chombo-style t)
  (c-add-style "Overture" Overture-style)
  (c-add-style "CFDKit" CFDkit-style)
  (c-add-style "MyStyle" my-style)
  ;; we like auto-newline and hungry-delete
  (c-toggle-auto-hungry-state 1)
  )

(add-hook 'c-mode-common-hook 'my-c-mode-common-hook)

(setq mouse-drag-copy-region t)

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

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["black" "#d55e00" "#009e73" "#f8ec59" "#0072b2" "#cc79a7" "#56b4e9" "white"])
 '(column-number-mode t)
 '(custom-enabled-themes nil)
 '(custom-safe-themes
   '("6fc18b6b991926ea5debf205ee144b1a1fdcfcb69236024cc0bd863b666a1a11" "84890723510d225c45aaff941a7e201606a48b973f0121cb9bcb0b9399be8cba" "a8245b7cc985a0610d71f9852e9f2767ad1b852c2bdea6f4aadc12cce9c4d6d0" "d91ef4e714f05fff2070da7ca452980999f5361209e679ee988e3c432df24347" "0598c6a29e13e7112cfbc2f523e31927ab7dce56ebb2016b567e1eff6dc1fd4f" "5f27195e3f4b85ac50c1e2fac080f0dd6535440891c54fcfa62cdcefedf56b1b" "b9cbfb43711effa2e0a7fbc99d5e7522d8d8c1c151a3194a4b176ec17c9a8215" "a19265ef7ecc16ac4579abb1635fd4e3e1185dcacbc01b7a43cf7ad107c27ced" "b9a06c75084a7744b8a38cb48bc987de10d68f0317697ccbd894b2d0aca06d2b" "8e797edd9fa9afec181efbfeeebf96aeafbd11b69c4c85fa229bb5b9f7f7e66c" "2b9dc43b786e36f68a9fd4b36dd050509a0e32fe3b0a803310661edb7402b8b6" "b583823b9ee1573074e7cbfd63623fe844030d911e9279a7c8a5d16de7df0ed0" "1436d643b98844555d56c59c74004eb158dc85fc55d2e7205f8d9b8c860e177f" "585942bb24cab2d4b2f74977ac3ba6ddbd888e3776b9d2f993c5704aa8bb4739" "8f97d5ec8a774485296e366fdde6ff5589cf9e319a584b845b6f7fa788c9fa9a" "a22f40b63f9bc0a69ebc8ba4fbc6b452a4e3f84b80590ba0a92b4ff599e53ad0" "89336ca71dae5068c165d932418a368a394848c3b8881b2f96807405d8c6b5b6" "115d42fa02a5ce6a759e38b27304e833d57a48422c2408d5455f14450eb96554" "6383f86cac149fb10fc5a2bac6e0f7985d9af413c4be356cab4bfea3c08f3b42" "addfaf4c6f76ef957189d86b1515e9cf9fcd603ab6da795b82b79830eed0b284" "8eafb06bf98f69bfb86f0bfcbe773b44b465d234d4b95ed7fa882c99d365ebfd" "4aa183d57d30044180d5be743c9bd5bf1dde686859b1ba607b2eea26fe63f491" "bdc90f305ecd4008fd39174adebfcdaf729e38aac1222a872b1f054d97adbc3d" default))
 '(default-frame-alist
    '((cursor-color . "white")
      (cursor-type . bar)
      (vertical-scroll-bars . right)
      (menu-bar-lines . 1)
      (height . 74)))
 '(delete-selection-mode t)
 '(ecb-options-version "2.40")
 '(f90-comment-region "!!")
 '(f90-continuation-indent 4)
 '(f90-do-indent 2)
 '(f90-if-indent 2)
 '(f90-program-indent 2)
 '(f90-type-indent 2)
 '(global-font-lock-mode t nil (font-lock))
 '(indent-tabs-mode nil)
 '(ispell-program-name "aspell")
 '(neo-theme 'nerd)
 '(package-selected-packages
   '(gruber-darker-theme treemacs helm-projectile sr-speedbar function-args helm auto-complete-clang-async cdlatex gnu-elpa-keyring-update seq rust-mode rtags let-alist flycheck auto-complete helm-gtags yasnippet))
 '(safe-local-variable-values
   '((c-offsets-alist
      (inexpr-class . +)
      (inexpr-statement . +)
      (lambda-intro-cont . +)
      (inlambda . c-lineup-inexpr-block)
      (template-args-cont c-lineup-template-args +)
      (incomposition . +)
      (inmodule . +)
      (innamespace . +)
      (inextern-lang . +)
      (composition-close . 0)
      (module-close . 0)
      (namespace-close . 0)
      (extern-lang-close . 0)
      (composition-open . 0)
      (module-open . 0)
      (namespace-open . 0)
      (extern-lang-open . 0)
      (objc-method-call-cont c-lineup-ObjC-method-call-colons c-lineup-ObjC-method-call +)
      (objc-method-args-cont . c-lineup-ObjC-method-args)
      (objc-method-intro .
                         [0])
      (friend . 0)
      (cpp-define-intro c-lineup-cpp-define +)
      (cpp-macro-cont . +)
      (cpp-macro .
                 [0])
      (inclass . +)
      (stream-op . c-lineup-streamop)
      (arglist-cont-nonempty c-lineup-gcc-asm-reg c-lineup-arglist)
      (arglist-cont c-lineup-gcc-asm-reg 0)
      (arglist-intro . +)
      (catch-clause . 0)
      (else-clause . 0)
      (do-while-closure . 0)
      (label . 2)
      (access-label . -)
      (substatement-label . 2)
      (substatement . +)
      (statement-case-open . 0)
      (statement-case-intro . +)
      (statement-block-intro . +)
      (statement-cont . +)
      (statement . 0)
      (brace-entry-open . 0)
      (brace-list-entry . 0)
      (brace-list-intro . +)
      (brace-list-close . 0)
      (brace-list-open . 0)
      (block-close . 0)
      (inher-cont . c-lineup-multi-inher)
      (inher-intro . +)
      (member-init-cont . c-lineup-multi-inher)
      (member-init-intro . +)
      (annotation-var-cont . +)
      (annotation-top-cont . 0)
      (topmost-intro-cont . c-lineup-topmost-intro-cont)
      (topmost-intro . 0)
      (knr-argdecl . 0)
      (func-decl-cont . +)
      (inline-close . 0)
      (inline-open . +)
      (class-close . 0)
      (class-open . 0)
      (defun-block-intro . +)
      (defun-close . 0)
      (defun-open . 0)
      (string . c-lineup-dont-change)
      (arglist-close . c-lineup-arglist)
      (substatement-open . 0)
      (case-label . 0)
      (block-open . 0)
      (c . 1)
      (comment-intro . 0)
      (knr-argdecl-intro . -))
     (c-cleanup-list scope-operator brace-else-brace brace-elseif-brace brace-catch-brace empty-defun-braces list-close-comma defun-close-semi)
     (c-hanging-semi&comma-criteria c-semi&comma-no-newlines-before-nonblanks)
     (c-hanging-colons-alist
      (member-init-intro before)
      (inher-intro)
      (case-label after)
      (label after)
      (access-label after))
     (c-hanging-braces-alist
      (substatement-open after)
      (brace-list-open after)
      (brace-entry-open)
      (defun-open after)
      (class-open after)
      (inline-open after)
      (block-open after)
      (block-close . c-snug-do-while)
      (statement-case-open after)
      (substatement after))
     (c-comment-only-line-offset . 0)
     (c-tab-always-indent . t)))
 '(show-paren-mode t nil (paren))
 '(show-paren-style 'expression)
 '(tex-dvi-view-command 'xdvi)
 '(tool-bar-mode nil))

;; (custom-set-faces
;;  ;; custom-set-faces was added by Custom.
;;  ;; If you edit it by hand, you could mess it up, so be careful.
;;  ;; Your init file should contain only one such instance.
;;  ;; If there is more than one, they won't work right.
;;  '(default ((t (:inherit nil :stipple nil :background "#181818" :foreground "#e4e4ef" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 75 :width normal :foundry "PfEd" :family "DejaVu Sans Mono"))))
;;  '(font-latex-math-face ((((class color) (background light)) (:foreground "red2"))))
;;  '(font-latex-sedate-face ((((class color) (background light)) (:foreground "orange"))))
;;  '(font-lock-comment-face ((((class color) (min-colors 89)) (:foreground "#b2b2b2" :slant italic))))
;;  '(font-lock-constant-face ((((class color) (min-colors 89)) (:foreground "#1f5bff"))))
;;  '(font-lock-function-name-face ((((class color) (min-colors 89)) (:foreground "#ef2929"))))
;;  '(font-lock-keyword-face ((((class color) (min-colors 89)) (:foreground "#00af00"))))
;;  '(font-lock-string-face ((((class color) (min-colors 89)) (:foreground "#ff1f8b"))))
;;  '(font-lock-type-face ((((class color) (min-colors 89)) (:foreground "#18b2b2"))))
;;  '(font-lock-variable-name-face ((((class color) (min-colors 89)) (:foreground "#ff8700"))))
;;  '(show-paren-match ((((class color) (min-colors 89)) (:background "#d7d7ff"))))
;;  '(show-paren-mismatch ((((class color)) (:background "dark slate grey")))))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 88 :width normal :foundry "GOOG" :family "Roboto Mono"))))
 '(font-latex-math-face ((((class color) (background light)) (:foreground "red2"))))
 '(font-latex-sedate-face ((((class color) (background light)) (:foreground "orange"))))
 '(font-lock-comment-face ((((class color) (min-colors 89)) (:foreground "#b2b2b2" :slant italic))))
 '(font-lock-constant-face ((((class color) (min-colors 89)) (:foreground "#1f5bff"))))
 '(font-lock-function-name-face ((((class color) (min-colors 89)) (:foreground "#ef2929"))))
 '(font-lock-keyword-face ((((class color) (min-colors 89)) (:foreground "#00af00"))))
 '(font-lock-string-face ((((class color) (min-colors 89)) (:foreground "#ff1f8b"))))
 '(font-lock-type-face ((((class color) (min-colors 89)) (:foreground "#18b2b2"))))
 '(font-lock-variable-name-face ((((class color) (min-colors 89)) (:foreground "#ff8700"))))
 '(show-paren-match ((((class color) (min-colors 89)) (:background "#d7d7ff"))))
 '(show-paren-mismatch ((((class color)) (:background "dark slate grey")))))

; from enberg on #emacs
(setq compilation-finish-function
      (lambda (buf str)
        (if (null (string-match ".*exited abnormally.*" str))
            ;;no errors, make the compilation window go away in a few seconds
            (progn
              (run-at-time
               "2 sec" nil 'delete-windows-on
               (get-buffer-create "*compilation*"))
                        (message "No Compilation Errors!")))))
;; Makes *scratch* empty.
(setq initial-scratch-message "")

;; Removes *scratch* from buffer after the mode has been set.
(defun remove-scratch-buffer ()
  (if (get-buffer "*scratch*")
      (kill-buffer "*scratch*")))
(add-hook 'after-change-major-mode-hook 'remove-scratch-buffer)

;; Don't show *Buffer list* when opening multiple files at the same time.
(setq inhibit-startup-buffer-menu t)

;; Packages
(require 'package)

(add-to-list 'package-archives
             '("MELPA Stable" . "https://stable.melpa.org/packages/") t)
(package-initialize)

;; Set default theme
(load-theme 'gruber-darker t)

;; lua-mode
(add-to-list 'load-path "/home/ian/.emacs.d/lisp")
(autoload 'lua-mode "lua-mode" "Lua editing mode." t)
(add-to-list 'auto-mode-alist '("\\.lua$" . lua-mode))
(add-to-list 'interpreter-mode-alist '("lua" . lua-mode))

;; Auto complete stuff
(ac-config-default)
(global-auto-complete-mode t)

;; Matlab mode
(add-to-list 'load-path "/home/ian/Code/matlab-emacs-src")
(require 'matlab-load)
(autoload 'matlab-mode "matlab" "Enter MATLAB mode." t)
(setq auto-mode-alist (cons '("\\.m\\'" . matlab-mode) auto-mode-alist))
(autoload 'matlab-shell "matlab" "Interactive MATLAB mode." t)

;; Enable helm
(require 'helm)
(require 'helm-config)
(global-set-key (kbd "C-c h") 'helm-command-prefix)
(global-unset-key (kbd "C-x c"))

(define-key helm-map (kbd "<tab>") 'helm-execute-persistent-action) ; rebind tab to run persistent action
(define-key helm-map (kbd "C-i") 'helm-execute-persistent-action) ; make TAB work in terminal
(define-key helm-map (kbd "C-z")  'helm-select-action) ; list actions using C-z

(setq helm-split-window-in-side-p           t ; open helm buffer inside current window, not occupy whole other window
      helm-move-to-line-cycle-in-source     t ; move to end or beginning of source when reaching top or bottom of source.
      helm-ff-search-library-in-sexp        t ; search for library in `require' and `declare-function' sexp.
      helm-scroll-amount                    8 ; scroll 8 lines other window using M-<next>/M-<prior>
      helm-ff-file-name-history-use-recentf t
      helm-echo-input-in-header-line t)

(setq helm-autoresize-max-height 0)
(setq helm-autoresize-min-height 20)
(helm-autoresize-mode 1)

(helm-mode 1)

;; Enable helm-gtags-mode
(setq
 helm-gtags-ignore-case t
 helm-gtags-auto-update t
 helm-gtags-use-input-at-cursor t
 helm-gtags-pulse-at-cursor t
 helm-gtags-prefix-key "\C-cg"
 helm-gtags-suggested-key-mapping t
 )

(require 'helm-gtags)
(add-hook 'dired-mode-hook 'helm-gtags-mode)
(add-hook 'eshell-mode-hook 'helm-gtags-mode)
(add-hook 'c-mode-hook 'helm-gtags-mode)
(add-hook 'c++-mode-hook 'helm-gtags-mode)
(add-hook 'asm-mode-hook 'helm-gtags-mode)

(define-key helm-gtags-mode-map (kbd "C-c g a") 'helm-gtags-tags-in-this-function)
(define-key helm-gtags-mode-map (kbd "C-j") 'helm-gtags-select)
(define-key helm-gtags-mode-map (kbd "M-.") 'helm-gtags-dwim)
(define-key helm-gtags-mode-map (kbd "M-,") 'helm-gtags-pop-stack)
(define-key helm-gtags-mode-map (kbd "C-c <") 'helm-gtags-previous-history)
(define-key helm-gtags-mode-map (kbd "C-c >") 'helm-gtags-next-history)

;; Neotree start up
(require 'treemacs)
(global-set-key (kbd "C-M-s") 'treemacs-mode)

;; Removes *messages* from the buffer.
;; (setq-default message-log-max nil)
;; (if (get-buffer "*Messages*")
;;     (kill-buffer "*Messages*"))
