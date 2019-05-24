(deftheme richard
  "Created 2019-05-24.")

(custom-theme-set-variables
 'richard
 '(ac-auto-show-menu 0.1)
 '(ac-trigger-key nil)
 '(ansi-color-faces-vector [default default default italic underline success warning error])
 '(cua-mode t)
 '(default-frame-alist (quote ((tool-bar-lines . 0) (menu-bar-lines . 1) (alpha . 90))))
 '(eyebrowse-mode-line-style (quote smart))
 '(eyebrowse-switch-back-and-forth t)
 '(eyebrowse-wrap-around t)
 '(highlight-indent-guides-auto-character-face-perc 25)
 '(highlight-indent-guides-method (quote character))
 '(indent-tabs-mode t)
 '(inhibit-startup-screen t)
 '(make-backup-files nil)
 '(package-selected-packages (quote (eyebrowse highlight-indent-guides csharp-mode auto-complete-c-headers ac-math auto-correct markdown-mode ## auto-complete auto-complete-clang)))
 '(prog-mode-hook (quote (auto-complete-mode highlight-indent-guides-mode eyebrowse-mode)))
 '(scroll-step 1)
 '(select-enable-clipboard t)
 '(tab-always-indent t)
 '(tab-width 4)
 '(tags-table-list (quote ("~/")))
 '(electric-pair-mode t)
 '(global-auto-revert-mode t)
 '(global-linum-mode t)
 '(show-paren-mode t)
 '(tool-bar-mode nil))

(custom-theme-set-faces
 'richard
 )

(provide-theme 'richard)
