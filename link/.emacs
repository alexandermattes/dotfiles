; Install el-get package manager
(add-to-list 'load-path "~/.emacs.d/el-get/el-get")

(unless (require 'el-get nil t)
  (url-retrieve
   "https://raw.github.com/dimitri/el-get/master/el-get-install.el"
   (lambda (s)
     (end-of-buffer)
     (eval-print-last-sexp))))

; Install packages with el-get
(setq my:el-get-packages
      '(evil
        ))

(el-get 'sync my:el-get-packages)
