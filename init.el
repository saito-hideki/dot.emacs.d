(package-initialize)
(setq package-archives
      '(("gnu" . "http://elpa.gnu.org/packages/")
        ("melpa" . "http://melpa.org/packages/")
        ("org" . "http://orgmode.org/elpa/")))

(if window-system (progn
   (load-theme 'deeper-blue t)
))
(if (not window-system) (progn
   (load-theme 'monokai t)
))

(setq auto-save-default nil)
(global-linum-mode 1)
(global-hl-line-mode)

(setq inhibit-startup-message nil)
(setq initial-scrarch-message nil)
(setq initial-scratch-message "")
(setq inhibit-splash-screen t)
(setq make-backup-files nil)
(setq indent-tabs-mode nil)
(setq tab-width 4)
(setq scroll-conservatively 1)

(show-paren-mode t)

(electric-pair-mode t)
(column-number-mode t)
(setq linum-format "%04d:")
(menu-bar-mode -1)
(tool-bar-mode -1)

(setq whitespace-style '(face
                         trailing
                         tabs
                         empty
                         spaces
                         space-mark
                         tab-mark))
(global-whitespace-mode 1)

(add-to-list 'default-frame-alist '(font . "Ricty Diminished Discord 14"))
(cond ((string-match "^23\." emacs-version)
       (cond (window-system
              (set-default-font "Ricty Diminished Discord 14")
              (set-fontset-font (frame-parameter nil 'font)
                                'japanese-jisx0208
                                '("Ricty Diminished Discord 14" . "unicode-bmp"))
              ))))
(setq-default line-spacing 2)

(when (eq system-type 'darwin)
  (setq ispell-program-name "/opt/homebrew/bin/aspell")
)
(when (eq system-type 'gnu/linux)
  (setq ispell-program-name "/usr/bin/aspell")
)

(with-eval-after-load "ispell"
  (setq ispell-local-dictionary "en_US")
  (add-to-list 'ispell-skip-region-alist '("[^\000-\377]+")))

(add-hook 'find-file-hook 'flyspell-mode)
(add-hook 'find-file-hook 'flyspell-buffer)

(setq markdown-preview-stylesheets (list "github.css"))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(afternoon-theme flatland-theme cyberpunk-theme color-theme-sanityinc-solarized flatland-black-theme ddskk yaml-mode markdown-preview-mode json-mode ini-mode)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(if window-system (progn
  (global-set-key "\C-x\C-j" 'skk-mode)
  (global-set-key "\C-xj" 'skk-auto-fill-mode)
  (global-set-key "\C-xt" 'skk-tutorial)
  (setq default-input-method "japanese-skk")

  (setq skk-server-host "localhost")
  (setq skk-server-portnum 1178)
  (setq skk-jisyo-code 'utf-9)
))
