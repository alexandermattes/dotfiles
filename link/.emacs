; Install el-get package manager if necessary
(add-to-list 'load-path "~/.emacs.d/el-get/el-get")

(unless (require 'el-get nil 'noerror)
  (with-current-buffer
      (url-retrieve-synchronously
       "https://raw.githubusercontent.com/dimitri/el-get/master/el-get-install.el")
    (goto-char (point-max))
    (eval-print-last-sexp)))

; Install packages with el-get
(setq my:el-get-packages
      '(el-get        ; el-get is selfhosting
	evil
	evil-surround
	evil-leader
	evil-org-mode
	powerline
	powerline-evil
        ))

(el-get 'sync my:el-get-packages)

; Set evil-mode by default
(require 'evil)
(evil-mode t)

(require 'powerline)
(powerline-default-theme)

(require 'powerline-evil)

; TODO: Helm
; TODO: airline
; TODO: smooth scrolling
; TODO: evil plugins
; TODO: line numbers
; TODO: org mode
; TODO: 
