#lang at-exp slideshow

;; 

(require
  slideshow/code
  racket/runtime-path)

;; =============================================================================

(define (do-show)
  (parameterize ([current-main-font "Roboto"]
                 [*current-tech* #false])
    #;(sec:title)
    #;(sec:short-answer)
    #;(sec:contribution-outline)
    #;(sec:getting-started)
    #;(sec:install-source)
    #;(sec:edit-code)
    #;(sec:contribution-outline)
    #;(sec:render-documentation)
    #;(sec:run-tests)
    #;(sec:contribution-outline)
    (sec:summary)
    (void)))

;; -----------------------------------------------------------------------------

;; TODO make it blue
(define url
  tt)

(define MD-URL
  @url{https://tinyurl.com/racketeering101}
  @;@url{https://github.com/bennn/racket-lang-org/blob/pr-blog/blog/_src/posts/2017-09-27-tutorial-contributing-to-racket.md}
  )

(define PR-URL
  @url{https://github.com/racket/racket-lang-org/pull/58})

(define-runtime-path PWD ".")

;; *current-tech* : Parameterof Boolean
;; - #true => assume presenter has internet access
;; - #false => add slides / animations to simulate a live demo
(define *current-tech* (make-parameter #false))

(define (lo-tech?)
  (not (*current-tech*)))

;; Return "tech mode" for the presentation.
(define (get-current-tech)
  (for/or ([arg (in-vector (current-command-line-arguments))])
    (lo-tech-flag? arg)))

(define (lo-tech-flag? x)
  (and (member x '("lo-tech")) #true))

(define (bebas-bold str)
  (text str "Bebas Neue, Bold" 72))

(define CHECK
  (disk 10 #:color "green"))

(define-syntax-rule (mypara elem* ...)
  ;; TODO work on alignment
  (para #:align 'left elem* ...))

;; -----------------------------------------------------------------------------

(define (sec:title)
  (slide
    #:title "Racketeering 101"
    @t{Ben Greenman, NEU}
    @comment{
      hello everyone, I'm here to tell you how to contribute to racket
    }))

(define (sec:short-answer)
  (slide
    #:title "Q. How to contribute to Racket?"
    'next
    @item{A. Submit a pull request}
    @comment{
      Racket is on GitHub,
      to suggest changes etc etc. just find the right repo and throw things at it
    })
  (when (lo-tech?)
    (slide
      #:title "Racket on Github"
      @comment{})
    (slide
      #:title "Main Distribution Repos"
      @comment{})
    (slide
      #:title "Edit on GitHub ..."
      @comment{})
    (slide
      #:title "Fork ..."
      @comment{})
    (slide
      #:title "Submit a Pull Request"
      @comment{})
    (void))
  (slide
    #:title "Q. How to contribute to Racket?"
    'next
    @item{A. Submit a pull request @|CHECK|}
    @comment{
      Racket is on GitHub,
      to suggest changes etc etc. just find the right repo and throw things at it
    })
  (void))

;; TODO parameterize by number of times played, show checkmarks?
(define (sec:contribution-outline)
  (slide
    #:title "Q. How to ..."
    @item{Install a package from source}
    @item{Edit, run the code}
    @item{Render documentation}
    @item{Run tests}
    @comment{
      kk for most contributions need more answers
    })
  (void))

(define (sec:getting-started)
  (slide
    #:title "Step 0: Getting Started"
    @para{Download Racket @url{download.racket-lang.org}}
    @para{Locate @tt{raco}}
    @para{Choose a package, @tt{<PKG> = pict}}
    @comment{
      yo lo
      I have racket 6.10.1 installed, assuming you have the same thing too
      need to find raco inside the package
      ask if you have trouble today
    })
  (void))

(define (sec:install-source)
  (slide
    #:title "Step 1: Install <PKG> from source"
    @mypara{@tt{raco pkg update --catalog https://pkgs.racket-lang.org <PKG>}}
    @mypara{@tt{raco pkg update --clone <PKG>}}
    @comment{
      time to install = roughly 1 coffee break
    })
  (slide
    #:title "Step 1.5: Fork <PKG>"
    @item{Fork @tt{<PKG>} on GitHub}
    @item{@tt{git remote add fork https://github.com/<USER>/<PKG>}}
    @item{@tt{git checkout -b <BRANCH-NAME>}}
    @comment{
      now you have the source, can start hacking,
      but now is agood time to connect this clone to a fork of your own
      on the github
    })
  (when (lo-tech?)
    (slide
      #:title "Go to GitHub"
      @comment{})
    (slide
      #:title "Fork"
      @comment{})
    (slide
      #:title "Connect fork and clone"
      @comment{})
    (void))
  (void))

(define (sec:edit-code)
  (slide
    #:title "Step 2: Edit the code"
    @item{Look under @tt{<PKG>-lib}}
    @item{"Open Defining File"}
    @item{@tt{raco fc <PKG>}}
    @comment{
      time to edit the code,
      general advice, what you want is probably under pict-lib
      DrRacket and racket-mode can help with this
      also raco fc
    })
  (when (lo-tech?)
    (slide
      #:title "Hack on <PKG>"
      @comment{})
    (slide
      #:title "Commit changes"
      @comment{})
    (slide
      #:title "Push to branch"
      @comment{})
    (slide
      #:title "Submit PR"
      @comment{})
    (void))
  (void))

(define (sec:render-documentation)
  (slide
    #:title "Edit Documentation"
    @item{To view: @tt{raco docs <PKG>}}
    @item{To edit: @tt{<PKG>-doc/**/scribblings}}
    @item{To build: @tt{raco setup <PKG>}}
    @comment{
      docs time,
      fun fact you have a copy of the racket documentation

      as motivating example I'm going to suggest an edit to the pict library,
      see there's all these dingbas, but its missing something,
      see I have this beautiful picture of my cat that I think would make a
      great addition

      I want `#lang racket (require pict/littlebear) meow` to give the picture
    })
  (when (lo-tech?)
    (slide
      #:title "Create the module"
      @comment{})
    (slide
      #:title "Test usage"
      @comment{})
    (slide
      #:title "Find the docs"
      @comment{
        now lets update the docs so everyone knows about this new power
      })
    (slide
      #:title "Edit the docs"
      @comment{
      })
    (slide
      #:title "Render the docs"
      @item{@tt{raco setup pict}}
      @comment{
      })
    (void))
  (void))

(define (sec:run-tests)
  (slide
    #:title "Run tests"
    @item{@tt{raco test --drdr -c <PKG>}}
    @comment{
      exactly how to test depends on the package,
      but usually raco test -c says if you broke something

      many projects have a .travis.yml file you can check
      --- but not all! --- thats something worth fixing
    })
  (when (lo-tech?)
    (slide
      #:title "Output of raco test"
      @comment{})
    (void))
  (void))

(define (sec:summary)
  (slide
    #:title "Summary"
    @item{Pre-clone: @tt{raco pkg update --catalog https://pkgs.racket-lang.org <PKG>}}
    @item{Clone: @tt{raco pkg install --clone <PKG>}}
    @item{Build: @tt{raco setup <PKG>}}
    @item{Test: @tt{raco test -c <PKG>}}
    @para{More info at @|MD-URL|}
    @comment{
    })
  (void))

;; =============================================================================

(module+ main
  (do-show))
