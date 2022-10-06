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
 '(custom-enabled-themes '(gruber-darker))
 '(custom-safe-themes
   '("3d2e532b010eeb2f5e09c79f0b3a277bfc268ca91a59cdda7ffd056b868a03bc" "7923541211298e4fd1db76c388b1d2cb10f6a5c853c3da9b9c46a02b7f78c882" "6fc18b6b991926ea5debf205ee144b1a1fdcfcb69236024cc0bd863b666a1a11" "84890723510d225c45aaff941a7e201606a48b973f0121cb9bcb0b9399be8cba" "a8245b7cc985a0610d71f9852e9f2767ad1b852c2bdea6f4aadc12cce9c4d6d0" "d91ef4e714f05fff2070da7ca452980999f5361209e679ee988e3c432df24347" "0598c6a29e13e7112cfbc2f523e31927ab7dce56ebb2016b567e1eff6dc1fd4f" "5f27195e3f4b85ac50c1e2fac080f0dd6535440891c54fcfa62cdcefedf56b1b" "b9cbfb43711effa2e0a7fbc99d5e7522d8d8c1c151a3194a4b176ec17c9a8215" "a19265ef7ecc16ac4579abb1635fd4e3e1185dcacbc01b7a43cf7ad107c27ced" "b9a06c75084a7744b8a38cb48bc987de10d68f0317697ccbd894b2d0aca06d2b" "8e797edd9fa9afec181efbfeeebf96aeafbd11b69c4c85fa229bb5b9f7f7e66c" "2b9dc43b786e36f68a9fd4b36dd050509a0e32fe3b0a803310661edb7402b8b6" "b583823b9ee1573074e7cbfd63623fe844030d911e9279a7c8a5d16de7df0ed0" "1436d643b98844555d56c59c74004eb158dc85fc55d2e7205f8d9b8c860e177f" "585942bb24cab2d4b2f74977ac3ba6ddbd888e3776b9d2f993c5704aa8bb4739" "8f97d5ec8a774485296e366fdde6ff5589cf9e319a584b845b6f7fa788c9fa9a" "a22f40b63f9bc0a69ebc8ba4fbc6b452a4e3f84b80590ba0a92b4ff599e53ad0" "89336ca71dae5068c165d932418a368a394848c3b8881b2f96807405d8c6b5b6" "115d42fa02a5ce6a759e38b27304e833d57a48422c2408d5455f14450eb96554" "6383f86cac149fb10fc5a2bac6e0f7985d9af413c4be356cab4bfea3c08f3b42" "addfaf4c6f76ef957189d86b1515e9cf9fcd603ab6da795b82b79830eed0b284" "8eafb06bf98f69bfb86f0bfcbe773b44b465d234d4b95ed7fa882c99d365ebfd" "4aa183d57d30044180d5be743c9bd5bf1dde686859b1ba607b2eea26fe63f491" "bdc90f305ecd4008fd39174adebfcdaf729e38aac1222a872b1f054d97adbc3d" default))
 '(default-frame-alist
    '((cursor-color . "white")
      (cursor-type . bar)
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
   '(lsp-ui auto-complete-clang-async cdlatex helm-gtags helm-projectile auctex gruber-darker rustic company which-key lsp-mode winum marginalia orderless use-package yasnippet treemacs rust-mode rtags pdf-tools gruber-darker-theme function-args flycheck auto-complete))
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
 '(show-paren-style 'expression)
 '(tex-dvi-view-command 'xdvi)
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 113 :width normal :foundry "GOOG" :family "Roboto Mono"))))
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