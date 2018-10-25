;; indent
(add-to-list 'write-file-functions 'delete-trailing-whitespace)

(defun my-script-indent ()
  (setq tab-width 4)
  (setq indent-tabs-mode nil)
  )

(add-hook 'makefile-mode-hook 'my-script-indent)
(add-hook 'python-mode-hook 'my-script-indent)
(add-hook 'lisp-mode-hook 'my-script-indent)
(add-hook 'emacs-lisp-mode-hook 'my-script-indent)


;; ebrowse
(defun my-start-ebrowse()
  (if (not (file-exists-p "./BROWSE"))
      (shell-command "ebrowse *.h *.c *.cpp *.java")
    )
  (find-file-noselect "./BROWSE")
  )

(defun my-end-ebrowse()
  (if (file-exists-p "./BROWSE")
      (delete-file "./BROWSE")
    )
  )

(defun my-look-up-into()
  (interactive)
  (if (string= "#include"
               (substring (thing-at-point 'line t) 0 8)
               )
      (ff-find-other-file)
    (ebrowse-tags-view-definition)
    )
  )

(add-hook 'c-mode-common-hook 'my-start-ebrowse)
(add-hook 'kill-emacs-hook 'my-end-ebrowse)
(global-set-key [f12] 'my-look-up-into)


;; nav
(add-to-list 'load-path "~/.emacs.d/emacs-nav")
(require 'nav)
(nav-disable-overeager-window-splitting)
(global-set-key (kbd "C-n") 'nav-toggle)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;; ENVIRONMENT ;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(c-basic-offset 4)
 '(c-default-style "linux")
 '(cua-mode t nil (cua-base))
 '(custom-enabled-themes (quote (wombat)))
 '(default-frame-alist
    (quote
     ((tool-bar-lines . 0)
      (menu-bar-lines . 1)
      (alpha . 90))))
 '(global-auto-revert-mode t)
 '(global-linum-mode t)
 '(indent-tabs-mode t)
 '(inhibit-startup-screen t)
 '(make-backup-files nil)
 '(nav-width 25)
 '(org-support-shift-select (quote always))
 '(package-selected-packages
   (quote
    (csharp-mode auto-complete-c-headers ac-c-headers ac-emoji ac-math auto-correct markdown-mode ## auto-complete auto-complete-clang)))
 '(select-enable-clipboard t)
 '(show-paren-mode t)
 '(tab-always-indent t)
 '(tab-width 4)
 '(tool-bar-mode nil))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Courier New" :foundry "outline" :slant normal :weight normal :height 120 :width normal)))))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;   HISTORY    ;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; set haskell indentation
(add-hook 'haskell-mode-hook 'haskell-indentation-mode)

;; custom surface
;;(setq-default c-basic-offset 4)
(set-background-color "gray9")
(set-foreground-color "wheat")
(fset 'yes-or-no-p 'y-or-n-p)

;; key binding
(global-set-key (kbd "RET") 'newline-and-indent)
(global-set-key (kbd "C-s") 'save-buffer)
(global-set-key (kbd "C-a") 'mark-whole-buffer)
(global-set-key (kbd "C-o") 'find-file)
(global-set-key (kbd "C-w") 'kill-buffer)
(global-set-key (kbd "C-q") 'replace-string)
(global-set-key (kbd "C-f") 'search-forward)
(global-set-key (kbd "C-S-f") 'list-matching-lines)
(global-set-key (kbd "C-l") 'goto-line)
(global-set-key (kbd "C-c 1") 'comment-region)
(global-set-key (kbd "C-c 2") 'uncomment-region)
(global-set-key [C-tab] 'other-window)
(global-set-key [C-S-iso-lefttab] 'other-window-minus-1)
(global-set-key [M-f4] 'kill-emacs)
(global-set-key [f7] 'gdb)
(global-set-key [C-f7] 'jdb)
(global-set-key [f9] 'my-compile)
(global-set-key [C-f9] 'my-run)

;; custom functions
(defun my-compile ()
  "Function for compiling source files."
  (interactive)
  (if (null buffer-file-name)
      (compile (compilation-read-command (car compile-history)))
    (let ((full (file-name-nondirectory buffer-file-name))
          (pref nil)
          (comm nil))
      (setq pref (file-name-sans-extension full))
      (cond
       ((eq major-mode 'c-mode)
        (setq comm (concat "gcc -o " pref " " full " -g -Wall -lm" "-std=c99")))
       ((eq major-mode 'c++-mode)
        (setq comm (concat "g++ -o " pref " " full " -g -Wall")))
       ((eq major-mode 'java-mode)
        (setq comm (concat "javac -g " full)))
       ((eq major-mode 'pascal-mode)
        (setq comm (concat "fpc -g " full)))
       ((eq major-mode 'python-mode)
        (setq comm (concat "python " full)))
       ((eq major-mode 'haskell-mode)
        (setq comm (concat "ghc -o " pref " " full)))
       ((eq major-mode 'lisp-mode)
        (setq comm (concat "clisp " full)))
       ((eq major-mode 'latex-mode)
        (setq comm (concat "pdflatex " full)))
       (t
        (setq comm nil)))
      (if (null comm)
          (if (eq major-mode 'cython-mode)
              (my-cython-compile pref)
            (compile (compilation-read-command (car compile-history))))
        (compile (compilation-read-command comm)))
      (setq my-compiled-flag t))))

(defun my-run ()
  "Function for running compiled execs."
  (interactive)
  (let ((full nil)
        (pref nil)
        (comm nil))
    (if (null buffer-file-name)
        (when (= my-gud-flag 1)
          (when (eq (current-buffer) gud-comint-buffer)
            (setq full (file-name-nondirectory (buffer-file-name my-gud-entry)))
            (setq pref (file-name-sans-extension full))))
      (progn
        (setq full (file-name-nondirectory buffer-file-name))
        (setq pref (file-name-sans-extension full))))
    (cond
     ((eq major-mode 'java-mode)
      (setq comm (concat "java " pref)))
     ((eq major-mode 'python-mode)
      (setq comm (concat "python " full)))
     ((not (string= pref full))
      (setq comm (concat "" pref)))
     (t
      (setq comm nil)))
    (if (null comm)
        (shell-command (read-shell-command "Shell command: " (car shell-command-history)))
      (shell-command (read-shell-command "Shell command: " comm)))))

(when (>= emacs-major-version 24)
  (require 'package)
  (package-initialize)
  (add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)
  )

(ac-config-default)
;; initialize auto-complete-mode
;; (global-auto-complete-mode t)
;; (setq ac-auto-start nil)
;; (ac-set-trigger-key "TAB")
