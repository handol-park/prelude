(use-package treesit
  :config
  (add-to-list 'treesit-language-source-alist
               '(python . ("https://github.com/tree-sitter/tree-sitter-python" "v0.20.4")))
  (add-to-list 'major-mode-remap-alist '(python-mode . python-ts-mode))
  (treesit-install-language-grammar 'python))

(use-package eglot
  :hook ((python-mode . eglot-ensure)
         (python-ts-mode . eglot-ensure))
  :config
  (add-to-list 'eglot-server-programs
               '((python-mode python-ts-mode)
                 "basedpyright-langserver" "--stdio")))
