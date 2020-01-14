(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(package-initialize)

;; use package
;; (use-package tangotango-theme
;;   :ensure t
;;   :init (load-theme 'tangotango t)
;;   )
(use-package rebecca-theme
  :ensure t
  :init (load-theme 'rebecca t)
  )

(use-package auto-complete
  :ensure t
  :init (ac-config-default)
  :init :custom (ac-auto-show-menu t)
  :init :custom (ac-trigger-key "TAB")
  )

(use-package ivy
  :ensure t
  :init :custom (ivy-mode 1)
  :init (if (< emacs-major-version 27)
            (setq xref-show-xrefs-function #'ivy-xref-show-xrefs)
          (setq xref-show-definitions-function #'ivy-xref-show-defs)
          )
  :bind ("C-]" . xref-find-definitions-other-window)
  )

(use-package ivy-xref
  :ensure t
  )

(use-package ivy-prescient
  :ensure t
  :init (ivy-prescient-mode 1)
 )

(use-package eyebrowse
  :ensure t
  :init :custom (eyebrowse-mode 1)
  :init :custom (eyebrowse-mode-line-style 'smart)
  :init :custom (eyebrowse-switch-back-and-forth t)
  :init :custom (eyebrowse-wrap-around t)
  :bind ("C-'" . eyebrowse-close-window-config)
  :bind ("C-n" . my-create-workspace)
  :bind ([C-S-iso-lefttab] . eyebrowse-prev-window-config)
  :bind ([C-tab] . eyebrowse-prev-window-config)
  )

(use-package shackle
  :ensure t
  :init :custom (shackle-mode 1)
  :init (setq shackle-rules
              '((compilation-mode
                 :noselect t
                 :align 'below
                 :size 0.3
                 :popup t
                 )
                ("\\`\\*e?shell"
                 :regexp t
                 :align 'below
                 :size 0.3
                 :popup t
                 )
                ("\\`\\*vc*"
                 :regexp t
                 :align 'below
                 :size 0.3
                 :popup t
                 )
                (vc-annotate-mode
                 :align 'below
                 :size 0.8
                 )
                (gud-mode
                 :select t
                 :align 'below
                 :size 0.3
                 :popup t
                 )
                (grep-mode
                 :select t
                 :align 'below
                 :size 0.3
                 :popup t
                 )
                )
              shackle-default-rule '(:select t))
  :init (advice-add 'eshell-life-is-too-much :after 'my-close-on-exit)
  )

(use-package eshell-git-prompt
  :ensure t
  :init (eshell-git-prompt-use-theme 'powerline)
  )

(use-package markdown-mode
  :ensure t
  )

(use-package bash-completion
  :ensure t
  :init (bash-completion-setup)
  )

(use-package nlinum
  :ensure t
  :init :custom (global-linum-mode nil)
  :init :custom (global-nlinum-mode nil)
  )

(use-package highlight-indentation
  :ensure t
  :init (add-hook 'python-mode-hook 'highlight-indentation-current-column-mode)
  :init :custom-face (highlight-indentation-current-column-face ((t (:background "dark slate gray"))))
  )

(use-package clang-format+
  :ensure t
 )

(use-package projectile
  :ensure t
  :config (define-key projectile-mode-map (kbd "C-p") 'projectile-command-map)
  :config (projectile-mode +1)
  :init (setq projectile-project-search-path '("~/devs/"))
  )

(use-package dashboard
  :ensure t
  :config (dashboard-setup-startup-hook)
 )

;; key bindings
(global-set-key (kbd "C-?") 'my-grep-find-at-point)
(global-set-key (kbd "C-;") 'comment-line)
(global-set-key (kbd "C-:") 'goto-line)
(global-set-key (kbd "C-.") 'isearch-repeat-forward)
(global-set-key (kbd "C-,") 'isearch-repeat-backward)
(global-set-key (kbd "C-/") 'isearch-forward-symbol-at-point)
(global-set-key (kbd "C-a") 'mark-whole-buffer)
(global-set-key (kbd "C-b") 'switch-to-buffer)
(global-set-key (kbd "C-d") 'kill-whole-line)
(global-set-key (kbd "C-f") 'isearch-forward)
(global-set-key (kbd "C-o") 'find-file)
(global-set-key (kbd "C-r") 'replace-string)
(global-set-key (kbd "C-s") 'save-buffer)
(global-set-key (kbd "C-t") 'find-tag)
(global-set-key (kbd "C-w") 'kill-current-buffer)
(global-set-key (kbd "C-y") 'my-duplicate-line)
(global-set-key (kbd "C-S-a") 'align)
(global-set-key (kbd "C-S-f") 'my-grep-find-read-from-minibuffer)
(global-set-key (kbd "C-S-t") 'my-create-tags)
;; (global-set-key (kbd "C-S-w") 'my-close-buffer-and-window)
(global-set-key (kbd "C-<prior>") 'other-window---1)
(global-set-key (kbd "C-<next>") 'other-window)
(global-set-key [f5] 'revert-buffer)
(global-set-key [f7] 'gdb)
(global-set-key [f8] 'eshell)
;; (global-set-key [f8] 'my-open-term)
(global-set-key [f9] 'my-compile)
(global-set-key [M-f4] 'kill-emacs)

;; other specs
(add-hook 'c-mode-common-hook 'my-cc-style)
(add-hook 'csharp-mode-hook 'my-cc-style)
(add-hook 'makefile-mode-hook 'my-script-style)
(add-hook 'python-mode-hook 'my-script-style)
(add-hook 'lisp-mode-hook 'my-script-style)
(add-hook 'emacs-lisp-mode-hook 'my-script-style)

(when (null (boundp 'init-toggled-maximized))
  (toggle-frame-maximized)
  (setq init-toggled-maximized t)
  )

;; MacOS
(when (eq system-type 'darwin)
  (global-set-key (kbd "<home>") 'beginning-of-line)
  (global-set-key (kbd "<end>") 'end-of-line)
  )

(fset 'yes-or-no-p 'y-or-n-p)

;; custom functions
(defun other-window---1 ()
  (interactive)
  (other-window -1)
  )

(defun my-script-style ()
  (setq tab-width 4)
  (setq indent-tabs-mode nil)
  )

(defun my-working-indent ()
  (setq c-basic-offset 2)
  (setq tab-width 2)
  (setq indent-tabs-mode nil)
  )

(defun my-cc-style ()
  (c-set-style "linux")
  (c-set-offset 'inlambda '0)
  (c-set-offset 'innamespace '0)
  (c-set-offset 'inextern-lang '0)
  (c-set-offset 'inline-open '0)
  (c-set-offset 'label '0)
  (c-set-offset 'case-label '0)
  (c-set-offset 'access-label '-)
  (my-working-indent)
  )

(defun my-split-window ()
  "Split window properly."
  (interactive)
  ;; (message "%d %d" (window-pixel-height) (window-pixel-width))
  (if (> (window-pixel-height) (window-pixel-width))
      (split-window-vertically)
    (split-window-horizontally)
    )
  )

(defun my-close ()
  "Close file/window."
  (interactive)
  (if (> (length (get-buffer-window-list)) 1)
      (if (buffer-file-name (previous-buffer))
          ()
        (delete-window)
        )
    (progn
      (kill-this-buffer)
      ;; (message (buffer-file-name (current-buffer)))
      (message "%d" (length (buffer-list)))
      (if (> (count-windows) 1)
          (delete-window)
        )
      )
    )
  )
(defun my-close-on-exit ()
  (when (not (one-window-p))
    (delete-window)))
(defun my-close-buffer-and-window ()
  "Close file/window."
  (interactive)
  (kill-this-buffer)
  (delete-window)
  )
(defun my-open-term ()
  (interactive)
  (term "/bin/bash")
  )

(defun my-create-workspace () ;; (file-path)
  "Create tags file."
  ;; (interactive "FNew workspace: ")
  (interactive)
  (eyebrowse-create-window-config)
  (switch-to-buffer "*scratch*")
  (delete-other-windows)
  ;; (find-file file-path)
  )

(defun my-compile (compile-path)
  "Create tags file."
  (interactive "FCompile in: ")
  (cd compile-path)
  (compile (read-string "Compile command: " "make -j4"))
  )

(defun my-create-tags (dir-path)
  "Create tags file."
  (interactive "DCreate TAGS file from: ")
  (let ((save-dir-path
         (completing-read "Save TAGS file to: "
                          tags-table-list nil t (car tags-table-list))))
    (eshell-command
     (format "find %s -follow -type f -name \"*.[ch]\" -or \
-name \"*.[ch]pp\" -or -name \"*.py\" | ctags -f %s/TAGS -e -L -"
             dir-path save-dir-path))
    )
  )

(defun my-grep-find (what-to-grep)
  (interactive)
  (setq where-to-grep (read-file-name "Grep in: " default-directory))
  (grep-find (format "find %s -type f -exec grep -I --color -nH --exclude=TAGS \
--include=\*.h --include=\*.cpp --include=\*.py --include=\*.c -e \"%s\" \{\} +"
                     where-to-grep what-to-grep))
  )

(defun my-grep-find-read-from-minibuffer ()
  "setting up grep-command using sentence read from minibuffer"
  (interactive)
  (my-grep-find (read-string "Grep: "))
  )

(defun my-grep-find-at-point ()
  "setting up grep-command using current word under cursor as a search string"
  (interactive)
  (my-grep-find (symbol-at-point))
  )

(defun my-duplicate-line (arg)
  "Duplicate current line, leaving point in lower line."
  (interactive "*p")
  ;; save the point for undo
  (setq buffer-undo-list (cons (point) buffer-undo-list))
  ;; local variables for start and end of line
  (let ((bol (save-excursion (beginning-of-line) (point)))
        eol)
    (save-excursion
      ;; don't use forward-line for this, because you would have
      ;; to check whether you are at the end of the buffer
      (end-of-line)
      (setq eol (point))
      ;; store the line and disable the recording of undo information
      (let ((line (buffer-substring bol eol))
            (buffer-undo-list t)
            (count arg))
        ;; insert the line arg times
        (while (> count 0)
          (newline)         ;; because there is no newline in 'line'
          (insert line)
          (setq count (1- count))
          )
        )
      ;; create the undo information
      (setq buffer-undo-list (cons (cons eol (point)) buffer-undo-list)))) ; end-of-let
  ;; put the point in the lowest line and return
  (next-line arg)
  )

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(column-number-mode t)
 '(compile-command "make -j4 -C")
 '(cua-mode t nil (cua-base))
 '(custom-safe-themes
   (quote
    ("ca849ae0c889eb918785cdc75452b1e11a00848a5128a95a23872e0119ccc8f4" default)))
 '(default-frame-alist (quote ((alpha . 90))))
 '(desktop-save-mode nil)
 '(electric-pair-mode t)
 '(global-auto-revert-mode nil)
 '(inhibit-startup-screen t)
 '(ivy-mode 1)
 '(make-backup-files nil)
 '(menu-bar-mode nil)
 '(package-selected-packages
   (quote
    (dashboard projectile auto-complete ivy-prescient clang-format+ bash-completion eshell-git-prompt shackle rebecca-theme highlight-indentation protobuf-mode fzf nlinum markdown-mode eyebrowse tangotango-theme use-package ivy-xref cmake-mode)))
 '(redisplay-dont-pause t t)
 '(save-place-mode t)
 '(scroll-conservatively 10000)
 '(scroll-margin 1)
 '(scroll-preserve-screen-position 1)
 '(scroll-step 1)
 '(select-enable-clipboard t)
 '(show-paren-mode t)
 '(tags-table-list (quote ("~/")))
 '(tool-bar-mode nil)
 '(tooltip-mode nil)
 '(window-divider-default-right-width 1)
 '(window-divider-mode t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(highlight-indentation-current-column-face ((t (:background "dark slate gray")))))
