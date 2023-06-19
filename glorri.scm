(define-module (glorri)
  #:use-module (glorri hello)
  #:export (glorri-main))

(define* (glorri-main arg0 . args)
  ;; Add glorri site directory to Guile's load path so that user's can
  ;; easily import their own modules.
  (add-to-load-path (getcwd))
  (setlocale LC_ALL "")
  (hello-world))
