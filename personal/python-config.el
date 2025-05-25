(use-package treesit
  :config
  (add-to-list 'treesit-language-source-alist
               '(python . ("https://github.com/tree-sitter/tree-sitter-python" "v0.20.4")))
  (add-to-list 'major-mode-remap-alist '(python-mode . python-ts-mode))
  (treesit-install-language-grammar 'python))

(use-package eglot
  :hook (((python-mode python-ts-mode) . eglot-ensure))
  :config
  (add-to-list 'eglot-server-programs
               '((python-mode python-ts-mode)
                 "basedpyright-langserver" "--stdio")))

;; (use-package lsp-mode
;;   :ensure t
;;   :hook (((python-mode python-ts-mode) . lsp)
;;          (lsp-mode . lsp-enable-which-key-integration))
;;   :commands lsp)

;; (use-package lsp-ui
;;   :ensure t
;;   :commands lsp-ui-mode)

;; (use-package lsp-pyright
;;   :ensure t
;;   :custom ((lsp-pyright-langserver-command "basedpyright")
;;            (lsp-pyright-basedpyright-inlay-hints-generic-types t))
;;   :hook ((python-mode python-ts-mode) . (lambda ()
;;                                           (require 'lsp-pyright)
;;                                           (lsp))))


;; NOTE: `lsp-bridge' is advised not to byte-compile the package but not
;; found to avoid byte-compilation with vc-use-package (2025-05-23 PDT)

;; (unless (package-installed-p 'vc-use-package)
;;   (package-vc-install "https://github.com/slotThe/vc-use-package"))
;; (require 'vc-use-package)

;; (use-package yasnippet
;;   :ensure t)

;; (use-package lsp-bridge
;;   :vc (lsp-bridge :url "https://github.com/manateelazycat/lsp-bridge.git")
;;   :after (yasnippet markdown-mode)
;;   :config
;;   (global-lsp-bridge-mode))


(use-package flymake-ruff
  :ensure t
  :hook (eglot-managed-mode . flymake-ruff-load))

(use-package ruff-format
  :ensure t)
