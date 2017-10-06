#lang at-exp slideshow

;; 

(require
  racket/runtime-path)

;; =============================================================================

(define (do-show)
  (parameterize ([current-main-font "Roboto"])
    (title)
    (void)))

;; -----------------------------------------------------------------------------

(define-runtime-path PWD ".")

;; *current-tech* : Parameterof Boolean
;; - #true => assume presenter has internet access
;; - #false => add slides / animations to simulate a live demo
(define *current-tech* (make-parameter #false))

;; Return "tech mode" for the presentation.
(define (get-current-tech)
  (for/or ([arg (in-vector (current-command-line-arguments))])
    (lo-tech-flag? arg)))

(define (lo-tech-flag? x)
  (and (member x '("lo-tech")) #true))

;; -----------------------------------------------------------------------------

(define (title)
  (slide
    (bebas-bold "Recipe for a pull request")
    @t{Ben Greenman}
    @t{Northeastern University}
    @comment{
      ok good morning
    }))

;; -----------------------------------------------------------------------------

(define (bebas-bold str)
  (text str "Bebas Neue, Bold" 72))

;; =============================================================================

(module+ main
  (do-show))
