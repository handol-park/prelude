(use-package aidermacs
  :ensure t
  :bind (("C-c a" . aidermacs-transient-menu)) ; Or your preferred binding
  :config
  (aidermacs-setup-minor-mode) ; Optional: enables minor mode for prompt files
  :custom
  ;; Select your preferred model (if not using .aider.conf.yml)
  ;; (aidermacs-default-model "gemini-pro")
  ;; Set other options as desired (see Aidermacs README/customize group)
  (aidermacs-backend 'vterm))

(use-package gptel
  :ensure t
  :after (org)
  :custom
  (gptel-default-mode 'org-mode)

  ;; Use branching context in Org mode
  (gptel-org-branching-context t)

  :config
  (setq gptel-model 'gemini-2.5-flash-preview-05-20)
  (setq gptel-backend
        (gptel-make-gemini
            "GPTel-Gemini-Stonai"
          :key (getenv "GEMINI_API_KEY")
          :stream t))

  (setf (alist-get 'org-mode gptel-prompt-prefix-alist) "@user\n")
  (setf (alist-get 'org-mode gptel-response-prefix-alist) "@assistant\n"))

(use-package gptel-magit
  :ensure t
  :after (gptel magit)
  :hook (magit-mode . gptel-magit-install))
