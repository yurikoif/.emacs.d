(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ac-auto-show-menu 0.01)
 '(compile-command "make -j4 -C")
 '(cua-mode t nil (cua-base))
 '(default-frame-alist (quote ((alpha . 90))))
 '(desktop-save-mode nil)
 '(electric-pair-mode t)
 '(eyebrowse-mode 1)
 '(eyebrowse-mode-line-style (quote smart))
 '(eyebrowse-switch-back-and-forth t)
 '(eyebrowse-wrap-around nil)
 '(global-auto-revert-mode nil)
 '(global-linum-mode t)
 '(inhibit-startup-screen t)
 '(ivy-mode 1)
 '(make-backup-files nil)
 '(package-selected-packages
   (quote
    (markdown-mode eyebrowse tangotango-theme use-package ivy-xref cmake-mode auto-complete)))
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
 '(tooltip-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(package-initialize)

;; use package
(use-package tangotango-theme
  :demand
  :init (load-theme 'tangotango t))
(use-package auto-complete
  :demand
  :init (ac-config-default)
  :init :custom (ac-auto-show-menu 0.01))
(use-package ivy
  :demand
  :init :custom (ivy-mode 1)
  :init (if (< emacs-major-version 27)
            (setq xref-show-xrefs-function #'ivy-xref-show-xrefs)
          (setq xref-show-definitions-function #'ivy-xref-show-defs))
  :bind ("C-]" . xref-find-definitions-other-window))
(use-package ivy-xref
  :demand)
(use-package eyebrowse
  :demand
  :init :custom (eyebrowse-mode 1)
  :init :custom (eyebrowse-mode-line-style 'smart)
  :init :custom (eyebrowse-switch-back-and-forth t)
  :init :custom (eyebrowse-wrap-around nil)
  :bind ("C-'" . eyebrowse-close-window-config)
  :bind ("C-n" . my-create-workspace)
  :bind ("C-<home>" . eyebrowse-prev-window-config)
  :bind ("C-<end>" . eyebrowse-next-window-config))
(use-package markdown-mode
  :demand)

;; key bindings
(global-set-key (kbd "C-?") 'my-grep-find-at-point)
(global-set-key (kbd "C-;") 'comment-line)
(global-set-key (kbd "C-:") 'goto-line)
(global-set-key (kbd "C-.") 'isearch-repeat-forward)
(global-set-key (kbd "C-,") 'isearch-repeat-backward)
(global-set-key (kbd "C-/") 'isearch-forward-symbol-at-point)
(global-set-key (kbd "C-a") 'mark-whole-buffer)
(global-set-key (kbd "C-S-d") 'kill-whole-line)
(global-set-key (kbd "C-f") 'isearch-forward)
(global-set-key (kbd "C-k") 'my-open-terminal)
(global-set-key (kbd "C-o") 'find-file)
(global-set-key (kbd "C-r") 'replace-string)
(global-set-key (kbd "C-s") 'save-buffer)
(global-set-key (kbd "C-S-f") 'my-grep-find-read-from-minibuffer)
(global-set-key (kbd "C-w") 'kill-current-buffer)
(global-set-key (kbd "C-x a") 'align)
(global-set-key (kbd "C-x t") 'my-create-tags)
(global-set-key (kbd "C-y") 'duplicate-line)
;; (global-set-key [C-tab] 'other-window)
(global-set-key [C-tab] 'ivy-switch-buffer)
;; (global-set-key [C-S-iso-lefttab] 'other-window---1)
;; (global-set-key (kbd "C-<prior>") 'previous-buffer)
;; (global-set-key (kbd "C-<next>") 'next-buffer)
(global-set-key (kbd "C-<prior>") 'other-window---1)
(global-set-key (kbd "C-<next>") 'other-window)
(global-set-key [f5] 'revert-buffer)
(global-set-key [f8] 'shell-command)
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
  (setq init-toggled-maximized t))

;; MacOS
(when (eq system-type 'darwin)
  (global-set-key (kbd "<home>") 'beginning-of-line)
  (global-set-key (kbd "<end>") 'end-of-line))

(fset 'yes-or-no-p 'y-or-n-p)

;; custom functions
(defun other-window---1 ()
  (interactive)
  (other-window -1))

(defun my-script-style ()
  (setq tab-width 4)
  (setq indent-tabs-mode nil))

(defun my-working-indent ()
  (setq c-basic-offset 2)
  (setq tab-width 2)
  (setq indent-tabs-mode nil))

(defun my-cc-style ()
  (c-set-style "linux")
  (c-set-offset 'inlambda '0)
  (c-set-offset 'innamespace '0)
  (c-set-offset 'inextern-lang '0)
  (c-set-offset 'inline-open '0)
  (c-set-offset 'label '0)
  (c-set-offset 'case-label '0)
  (c-set-offset 'access-label '-)
  (my-working-indent))

(defun my-split-window ()
  "Split window properly."
  (interactive)
  ;; (message "%d %d" (window-pixel-height) (window-pixel-width))
  (if (> (window-pixel-height) (window-pixel-width))
      (split-window-vertically)
    (split-window-horizontally)))

(defun my-open (file-path)
  "Open file in proper new window."
  (interactive "FOpen file: ")
  (if (buffer-file-name (current-buffer))
      (my-split-window))
  (find-file file-path))

(defun my-open-terminal ()
  "Open terminal in proper new window."
  (interactive)
  (if (buffer-file-name (current-buffer))
      (my-split-window))
  (term "/bin/bash"))

(defun my-close ()
  "Close file/window."
  (interactive)
  (if (> (length (get-buffer-window-list)) 1)
      (if (buffer-file-name (previous-buffer))
          ()
        (delete-window))
    (progn
      (kill-this-buffer)
      ;; (message (buffer-file-name (current-buffer)))
      (message "%d" (length (buffer-list)))
      (if (> (count-windows) 1)
          (delete-window)))))

(defun my-create-workspace (file-path)
  "Create tags file."
  (interactive "FNew workspace: ")
  (eyebrowse-create-window-config)
  (delete-other-windows)
  (find-file file-path))

(defun my-compile (compile-path)
  "Create tags file."
  (interactive "FCompile in: ")
  (cd compile-path)
  (compile (read-string "Compile command: " "make -j4")))

(defun my-create-tags (dir-path)
  "Create tags file."
  (interactive "DCreate TAGS file from: ")
  (let ((save-dir-path
         (completing-read "Save TAGS file to: "
                          tags-table-list nil t (car tags-table-list))))
    (eshell-command
     (format "find %s -follow -type f -name \"*.[ch]\" -or -name \"*.[ch]pp\" -or -name \"*.py\" | ctags -f %s/TAGS -e -L -"
             dir-path save-dir-path))))

(defun my-grep-find (what-to-grep)
  (interactive)
  (setq where-to-grep (read-directory-name "Grep in: " default-directory))
  (grep-find (format "find %s -type f -exec grep --color -nH --exclude='TAGS' --include='*.h' --include='*.cpp' --include='*.py' --include='*.c' -e \"%s\" \{\} +"
                     where-to-grep what-to-grep)))

(defun my-grep-find-read-from-minibuffer ()
  "setting up grep-command using sentence read from minibuffer"
  (interactive)
  (my-grep-find (read-string "Grep: ")))

(defun my-grep-find-at-point ()
  "setting up grep-command using current word under cursor as a search string"
  (interactive)
  (my-grep-find (symbol-at-point)))

(defun duplicate-line (arg)
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
          (setq count (1- count))))
      ;; create the undo information
      (setq buffer-undo-list (cons (cons eol (point)) buffer-undo-list)))) ; end-of-let
  ;; put the point in the lowest line and return
  (next-line arg))
