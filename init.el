;; Package download-path list settings
(package-initialize)
(setq package-archives
      '(("gnu" . "http://elpa.gnu.org/packages/")
        ("melpa" . "http://melpa.org/packages/")
        ("org" . "http://orgmode.org/elpa/")))

;; Pass through shell environment variables to emacs
(when (require 'exec-path-from-shell nil t)
  (exec-path-from-shell-initialize))

;; Set the window size at startup
(when window-system
  (add-to-list 'default-frame-alist '(height . 60))
  (add-to-list 'default-frame-alist '(width . 100)))

;; Language environment settings
(set-language-environment "UTF-8")

;; Set color theme for emacs
(if window-system (progn
   (load-theme 'material t)
))
(if (not window-system) (progn
   (load-theme 'monokai t)
))

;; Auto save and backup file setting
(setq auto-save-default nil)
(setq make-backup-files nil)

;; Startup screen settings
(setq inhibit-startup-screen t)
(setq inhibit-splash-screen t)
(setq initial-scratch-message "")
(menu-bar-mode -1)
(tool-bar-mode -1)

;; Line-numbers, column-numbers, line highlighting, and scroll settings
(global-linum-mode 1)
(global-hl-line-mode)
(column-number-mode t)
(setq scroll-conservatively 1)
(setq linum-format "%4d:")

;; Tab indent and wide settings
(setq indent-tabs-mode nil)
(setq tab-width 4)

;; Show matching pairs of parentheses and other characters settings
(show-paren-mode t)
(electric-pair-mode t)

;; White-space highlighting settings
(setq whitespace-style '(face
                         trailing
                         tabs
                         empty
                         spaces
                         ;;space-mark
                         tab-mark))
(setq whitespace-space-regexp "\\(\u3000+\\)")
(global-whitespace-mode 1)

;; Font and line-space settings
(add-to-list 'default-frame-alist '(font . "Ricty Diminished Discord 16"))
(cond ((string-match "^23\." emacs-version)
       (cond (window-system
              (set-default-font "Ricty Diminished Discord 16")
              (set-fontset-font (frame-parameter nil 'font)
                                'japanese-jisx0208
                                '("Ricty Diminished Discord 16" . "unicode-bmp"))

              ))))
(setq-default line-spacing 2)

;; Spell checker settings
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

;; Markdown and preview settings
(setq markdown-command "pandoc")
(setq markdown-preview-stylesheets (list "github.css"))
;;(setq markdown-preview-stylesheets
;;      (list "https://cdnjs.cloudflare.com/ajax/libs/github-markdown-css/3.0.1/github-markdown.min.css"))

;; SKK settings
(if window-system (progn
  (global-set-key "\C-x\C-j" 'skk-mode)
  (global-set-key "\C-xj" 'skk-auto-fill-mode)
  (global-set-key "\C-xt" 'skk-tutorial)
  (setq default-input-method "japanese-skk")

  (setq skk-server-host "localhost")
  (setq skk-server-portnum 1178)
  (setq skk-jisyo-code 'utf-9)
))

;; Development environment settings
(elpy-enable)

;; ----------------------------------------
;; Following lines are automatically added
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(material-theme elpy exec-path-from-shell afternoon-theme flatland-theme cyberpunk-theme color-theme-sanityinc-solarized flatland-black-theme ddskk yaml-mode markdown-preview-mode json-mode ini-mode)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; EOF
