;; use package
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(package-initialize)

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
  :init :custom (ac-delay 0 . 0)
  :init :custom (ac-trigger-key "TAB")
  :config
  (use-package auto-complete-c-headers
    :ensure t
    :config
    (defun my:ac-c-headers-init ()
      (add-to-list 'ac-sources 'ac-source-c-headers)
      )
    (add-hook 'c-mode-hook 'my:ac-c-headers-init)
    (add-hook 'c++-mode-hook 'my:ac-c-headers-init)
    )
  )

(use-package yasnippet
  :ensure t
  :init (yas-global-mode 1)
  :config
  (use-package yasnippet-snippets
    :ensure t
    )
  )

(use-package ivy
  :ensure t
  :init :custom (ivy-mode 1)
  :init (if (< emacs-major-version 27)
            (setq xref-show-xrefs-function #'ivy-xref-show-xrefs)
          (setq xref-show-definitions-function #'ivy-xref-show-defs)
          )
  :bind ("C-]" . xref-find-definitions-other-window)
  :config
  (use-package ivy-xref
    :ensure t
    )

  (use-package ivy-prescient
    :ensure t
    :init :custom (ivy-prescient-mode 1)
    )
  )

(use-package dired-rsync
  :ensure t
  :bind (:map dired-mode-map ("C-s" . 'dired-rsync))
  )

(use-package magit
  :ensure t
  :bind ("M-g" . magit-status)
  )

(use-package eyebrowse
  :ensure t
  :init :custom (eyebrowse-mode 1)
  :init :custom (eyebrowse-mode-line-style 'smart)
  :init :custom (eyebrowse-switch-back-and-forth t)
  :init :custom (eyebrowse-wrap-around t)
  :bind ("C--"             . eyebrowse-close-window-config)
  :bind ("C-="             . my:create-workspace)
  :bind ([C-S-iso-lefttab] . eyebrowse-prev-window-config)
  :bind ([C-tab]           . eyebrowse-prev-window-config)
  )

(use-package shackle
  :ensure t
  :init :custom (shackle-mode 1)
  :config
  (setq shackle-rules
        '((compilation-mode :noselect t
                            :align 'below
                            :size 0 . 3
                            :popup t
           )
          (vc-annotate-mode :align 'below
                            :size 0 . 8
                            )
          (gud-mode :select t
                    :align 'below
                    :size 0         . 3
                    :popup t
                    )
          (grep-mode :select t
                     :align 'below
                     :size 0        . 3
                     :popup t
                     )
          )
        shackle-default-rule '(:select t))
  (advice-add 'eshell-life-is-too-much :after 'my:close-on-exit)
  )

(use-package exec-path-from-shell
  :ensure t
  :config
  (when (memq window-system '(mac ns x))
    (exec-path-from-shell-initialize))
  )

(use-package eshell-git-prompt
  :ensure t
  :init (eshell-git-prompt-use-theme 'robbyrussell)
  )

(use-package markdown-mode
  :ensure t
  )

(use-package protobuf-mode
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
  :hook (python-mode . highlight-indentation-current-column-mode)
  :init :custom-face (highlight-indentation-current-column-face ((t (:background "dark slate gray"))))
  )

(use-package projectile
  :ensure t
  :init (projectile-mode +1)
  :init (define-key projectile-mode-map (kbd "M-p") 'projectile-command-map)
  :config
  (defadvice projectile-project-root (around ignore-remote first activate)
    (unless (file-remote-p default-directory) ad-do-it))
  )

(use-package dashboard
  :ensure t
  :config
  (dashboard-setup-startup-hook)
  (setq dashboard-items '((recents   . 8)
                          (projects  . 8)
                          (bookmarks . 8)
                          (agenda    . 8)
                          (registers . 8)
                          )
        )
  )

(use-package evil
  :ensure t
  :init (evil-mode 1)
  :bind (:map evil-emacs-state-map
              ("C-?" . my:grep-find-at-point)
              ("C-;" . comment-line)
              ("C-:" . goto-line)
              ("C-." . isearch-repeat-forward)
              ("C-," . isearch-repeat-backward)
              ("C-/" . isearch-forward-symbol-at-point)
              ("M-<RET>" . switch-to-buffer)
              ("C-a" . mark-whole-buffer)
              ("C-f" . isearch-forward)
              ("C-o" . find-file)
              ("C-r" . replace-string)
              ("C-s" . save-buffer)
              ("C-t" . find-tag)
              ("C-w" . kill-current-buffer)
              ("C-q" . kill-buffer-and-window)
              ("C-y" . my:duplicate-line)
              ("C-S-a" . align)
              ("C-S-f" . my:grep-find-read-from-minibuffer)
              ("C-S-t" . my:create-tags)
              ("C-<prior>" . other-window---1)
              ("C-<next>" . other-window)
              )
  :config
  (global-undo-tree-mode -1)
  (when (display-graphic-p)
    (setq evil-default-state 'emacs)
    )
  )

;; global key bindings
(global-set-key [f5] 'revert-buffer)
(global-set-key [f7] 'gdb)
(global-set-key [f8] 'eshell)
(global-set-key [f9] 'my:compile)
(global-set-key [M-f4] 'kill-emacs)

;; other specs
(add-hook 'c-mode-common-hook 'my:cc-style)
(add-hook 'csharp-mode-hook 'my:cc-style)
(add-hook 'makefile-mode-hook 'my:script-style)
(add-hook 'python-mode-hook 'my:script-style)
(add-hook 'lisp-mode-hook 'my:script-style)
(add-hook 'emacs-lisp-mode-hook 'my:script-style)

;; MacOS
(when (eq system-type 'darwin)
  (global-set-key (kbd "<home>") 'beginning-of-line)
  (global-set-key (kbd "<end>") 'end-of-line)
  )

;; yes-no -> y-n
(fset 'yes-or-no-p 'y-or-n-p)

;; custom functions
(defun other-window---1 ()
  (interactive)
  (other-window -1)
  )

(defun my:script-style ()
  (setq tab-width 4)
  (setq indent-tabs-mode nil)
  )

(defun my:working-indent ()
  (setq c-basic-offset 2)
  (setq tab-width 2)
  (setq indent-tabs-mode nil)
  )

(defun my:cc-style ()
  (c-set-style "linux")
  (c-set-offset 'inlambda '0)
  (c-set-offset 'innamespace '0)
  (c-set-offset 'inextern-lang '0)
  (c-set-offset 'inline-open '0)
  (c-set-offset 'label '0)
  (c-set-offset 'case-label '0)
  (c-set-offset 'access-label '-)
  (my:working-indent)
  )

(defun my:split-window ()
  "Split window properly."
  (interactive)
  ;; (message "%d %d" (window-pixel-height) (window-pixel-width))
  (if (> (window-pixel-height) (window-pixel-width))
      (split-window-vertically)
    (split-window-horizontally)
    )
  )

(defun my:close ()
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

(defun my:close-on-exit ()
  (when (not (one-window-p))
    (delete-window)))

(defun my:close-buffer-and-window ()
  "Close buffer/window."
  (interactive)
  (kill-this-buffer)
  (delete-window)
  )

(defun my:open-term ()
  (interactive)
  (term "/bin/bash")
  )

(defun my:create-workspace () ;; (file-path)
  "Create new workspace."
  ;; (interactive "FNew workspace: ")
  (interactive)
  (eyebrowse-create-window-config)
  ;; (switch-to-buffer "*scratch*")
  (delete-other-windows)
  ;; (find-file file-path)
  )

(defun my:compile (compile-path)
  "Compile."
  (interactive "FCompile in: ")
  (cd compile-path)
  (compile (read-string "Compile command: " "make -j4"))
  )

(defun my:create-tags (dir-path)
  "Create tags file."
  ;; how to browse local TAGS to remote access:
  ;; replace whatever matches local path prefix e.g. /home/[username]/
  ;;                      by remote path prefix e.g. /ssh:[username]/home/[username]/
  (interactive "DCreate TAGS file from: ")
  (let ((save-dir-path
         (completing-read "Save TAGS file to: "
                          tags-table-list nil t (car tags-table-list))))
    (eshell-command
     (format "find %s -follow -type f -name \"*.[ch]\" -or -name \"*.[ch]pp\" -or -name \"*.py\" | %s -f %s/TAGS -e -L -"
             dir-path
             (if (eq system-type 'darwin)
                 "/usr/local/bin/ctags"
               "ctags")
             save-dir-path
             )
     )
    )
  )

(defun my:grep-find (what-to-grep)
  (interactive)
  (setq where-to-grep (read-file-name "Grep in: " default-directory))
  (grep-find (format "find %s -type f -exec grep -I --color -nH --exclude=TAGS --include=\*.h --include=\*.cpp --include=\*.py --include=\*.c -e \"%s\" \{\} +"
                     where-to-grep
                     what-to-grep
                     )
             )
  )

(defun my:grep-find-read-from-minibuffer ()
  "setting up grep-command using sentence read from minibuffer"
  (interactive)
  (my:grep-find (read-string "Grep: "))
  )

(defun my:grep-find-at-point ()
  "setting up grep-command using current word under cursor as a search string"
  (interactive)
  (my:grep-find (symbol-at-point))
  )

(defun my:duplicate-line (arg)
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
 '(ac-auto-show-menu t)
 '(ac-delay 0.0)
 '(ac-trigger-key "TAB")
 '(column-number-mode t)
 '(compile-command "make -j4 -C")
 '(cua-mode t nil (cua-base))
 '(cua-prefix-override-inhibit-delay 0.1)
 '(custom-safe-themes
   (quote
    ("ca849ae0c889eb918785cdc75452b1e11a00848a5128a95a23872e0119ccc8f4" default)))
 '(default-frame-alist
    (quote
     ((right-divider-width . 1)
      (alpha . 90)
      (fullscreen . maximized))))
 '(desktop-save-mode nil)
 '(electric-pair-mode t)
 '(evil-toggle-key "C-`")
 '(eyebrowse-mode 1)
 '(eyebrowse-mode-line-style (quote smart))
 '(eyebrowse-switch-back-and-forth t)
 '(eyebrowse-wrap-around t)
 '(global-auto-revert-mode nil)
 '(global-linum-mode nil)
 '(global-nlinum-mode nil)
 '(inhibit-startup-screen t)
 '(ivy-mode 1)
 '(ivy-prescient-mode 1)
 '(large-file-warning-threshold 100000000)
 '(make-backup-files nil)
 '(menu-bar-mode nil)
 '(package-selected-packages
   (quote
    (evil exec-path-from-shell dired-rsync magit projectile yasnippet-snippets yasnippet auto-complete-c-headers auto-complete dashboard ivy-prescient bash-completion eshell-git-prompt shackle rebecca-theme highlight-indentation protobuf-mode fzf nlinum markdown-mode eyebrowse tangotango-theme use-package ivy-xref cmake-mode)))
 '(redisplay-dont-pause t t)
 '(save-place-mode t)
 '(scroll-conservatively 10000)
 '(scroll-margin 1)
 '(scroll-preserve-screen-position 1)
 '(scroll-step 1)
 '(select-enable-clipboard t)
 '(shackle-mode 1)
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
