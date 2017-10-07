talk
===

Quick tutorial, RacketCon 2017.
How to submit a pull request to a main Racket repo.

- - -

resources
---

Racket GitHub:
https://github.com/racket

Types of contributions:
- typo
- doc example
- bugfix
- enhancement
- broken deps
- document API
- type annotations

How to submit (franchised route)
0. Get recent copy of Racket
1. Fork the package
2. Find the code
3. Edit, Test, Document
4. Pull request


- - -

script
---

Hello everyone I'm Ben, here to tell you how to contribute to a "core" Racket
repo.

Right. So the question is, how to contribute to Racket?

Short answer: submit a pull request
- Racket is on GitHub (can submit "many things" here)
- "core" repos in the Racket organization

In fact if you know just what you want to do,
 can open the file on GitHub,
 click the pen, make edits,
 and use GitHub to setup a pull request
 Wikipedia-style.

This works for tiny changes, but if you want to:

- run code
- render documentation
- test the changes

then you want the source,
you want to install the development version of the package.

If you have Racket from download.racket-lang.org, then you gotta (find raco):

- raco pkg update --catalog https://pkgs.racket-lang.org pict
- raco pkg update --clone pict

Now you have `pict` in the current directory.
Means you have the development version installed,
 you can edit this code and import it.

To setup a pull request from here,
 need to make a fork of pict,
 then connect your fork as a remote.

Let's do that.

- git remote rename origin upstream
- git remote add origin <FORK-URL>

Now we can create a branch,
 commit changes,
 push to the branch,
 and visit "upstream" to create a pull request.

Any questions on what we've done so far?
Mostly been working with Git / GitHub, the two new commands are

- raco pkg update --catalog https://pkgs.racket-lang.org pict
- raco pkg update --clone <PKG>

Now lets go through the motions of adding a real pull request.
I chose pict because I have a goal in mind, I want to add a picture of my cat to the standard library.

Right, if you go in the docs for pict, there's a section on dingbats.
... fish, jack-o-lantern, then there's extra libraries,
  for balloons
  faces
  flashes
Well I want to add little bear

    #lang racket
    (require pict/littlebear)
    meow

And that should display this picture of the little bear.

Back to the code, the module path gives a spec.
Need to export an identifier named `meow`
 from a module named `littlebear.rkt`
 in the pict collection.

Lets go ahead and do that.

    #lang racket
    (provide meow)
    (require racket/runtime-path pict)
    (define-runtime-path LB "private/little-bear.jpg")
    (define meow (bitmap LB))

Golden, can run the dream code from before.

To help other people find our module, need to add documentation.
Want this to appear on the "More Pict Constructors" page, so need to edit that.
To find the page,
 go to github,
 enter the `pict-doc` folder,
 find the `scribblings` folder,
 and start browsing the files.
I happen to know `more.scrbl` is the right one, so that's that.

Open the file and edit:

  ; also require for-label and in the evaluator
  @section{Little Bear}
  @defmodule[pict/littlebear]{
    Little bear!
  }
  @defidform[meow]{
    Creates a little bear.

  @examples[#:eval ss-eval
  meow
  ]
  }

To rebuild run `raco setup pict`.
Should finish pretty quickly.

The last thing I need to tell you is how to run the tests:

    raco test --drdr -c pict

Other repos might have different ways to test, but this usually does the trick.
If anything this should raise more errors.

Now ready to commit and setup a pull request like before.

To summarize:

```
$ raco pkg update --catalog https://pkgs.racket-lang.org PKG
$ raco pkg update --clone PKG
$ raco setup PKG
$ raco test --drdr -c PKG
```

- - -

My Questions
---

- DrRacket command to update catalog
- possible to combine catalog & clone?
- what do when 6.11 comes out?
