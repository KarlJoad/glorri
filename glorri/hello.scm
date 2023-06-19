(define-module (glorri hello)
  #:export (hello-world))

(define (hello-world)
  "Print \"Hello World\", returning nothing."
  (display "Hello World")
  (newline))
