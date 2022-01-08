(package-initialize)
(setq package-archives
      '(("gnu" . "http://elpa.gnu.org/packages/")
        ("melpa" . "http://melpa.org/packages/")
        ("org" . "http://orgmode.org/elpa/")))

(load-theme 'tango-dark t)

(setq inhibit-splash-screen t)
(setq make-backup-files nil)
(setq auto-save-default nil)

(setq tab-width 4)
(setq indent-tabs-mode nil)

(add-to-list 'default-frame-alist '(font . "VL Gothic-14"))
(cond ((string-match "^23\." emacs-version)
       (cond (window-system
              (set-default-font "VL Gothic-14")
              (set-fontset-font (frame-parameter nil 'font)
                                'japanese-jisx0208
                                '("VL Gothic-14" . "unicode-bmp"))
              ))))

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
 '(package-selected-packages '(ddskk yaml-mode markdown-preview-mode json-mode ini-mode)))
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
