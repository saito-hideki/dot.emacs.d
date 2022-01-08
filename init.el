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

;; for yaml-mode
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages '(yaml-mode)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
