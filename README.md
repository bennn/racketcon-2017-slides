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
- Racket is on GitHub
- "core" repos in the Racket organization


Useful answer (is longer):
- install development version of the package
- connect dev. version to a fork
- write documentation, unit tests
- submit a pull request

Here's the deal. I'm going to speak for N minutes and give you the franchised
route to submitting a pull request. Then I'll open it up to questions --- should
have lots of time for questions. If nobody has any question, then I will ask
some, then we can start office hours.


Step 0, install Racket. I've already done this, got Racket v6.10.1 from
<download.racket-lang.org>. Next we're going to use `raco` to run some commands,
so when I write

`raco6.10.1` what I mean is the `raco` executable from by Racket v6.10.1 install.


Step 1, install the package from source. Lets say we want to edit RackUnit.
Need to run 2 commands

```
$ raco pkg update --catalog https://pkgs.racket-lang.org rackunit
$ raco pkg update --clone rackunit
```

First command says _where_ to find the development version of RackUnit.
Second command installs RackUnit from the git repo.

NOTE: second command puts the clone in your current directory.
Good idea to keep all clones in the same place.


Next, make a fork.
Go to GitHub for this, click the fork button, choose the repo to fork to, and that's done.

Last thing to do here is connect your clone --- which is on your computer --- to
your fork --- which is on the internet. Magic words (from the cloned dir):

```
$ git remote rename origin upstream
$ git remote add origin <FORK-URL>
```

where `<FORK-URL>` the URL of your new fork, something like `https://github.com/USER/rackunit`
Golden.

Now we're in business, from here let's open a new branch:

```
$ git checkout -b my-branch
```

And for fun let's edit RackUnit:

(add a `printf` to `rackunit/rackunit-lib/rackunit/main.rkt`)

if all's gone well so far, should see a "hello" from RackUnit


~~~ FUNKY HENCEFORTH ~~~

Down to real business, lets talk about how to find the code docs tests.
That file we just edited, `main.rkt` in the RackUnit collection,
 is in the folder `rackunit/rackunit-lib/rackunit/`.

Step back for a bit,
the `rackunit/` directory holds a bunch of directories. In here you'll notice:
- `rackunit-lib/`
- `rackunit-doc/`
- `rackunit-test/`

Gives you a hint where to find things.

NOTE: this is a convention, these toplevel folders.
Other core repos follow the convention, so its worth exploring this example.


- `-lib` contains the implementation, in a folder named `rackunit`
  everything here is fair game to require EXCEPT the stuff in the `private/`
  folder; that's how Racket does private okay its a please don't touch

  If you want to edit code, check `rackunit-lib/rackunit/private`

- `-doc` contains the documentation, buried in a `scribblings/` folder.
  Start at the doc, dive down to the scribblings.
  Not sure what file to edit?
  Open the docs (`raco docs rackunit`), click a nearby section header.
  At least gives you a filename to go on.

- `-test` has the tests, somewhere in a `rackunit` folder.

Course you can edit all these files in DrRacket.
But how to build and how to test?

First lets edit the docs.
To rebuild, run `raco setup rackunit`.

Second lets run the tests: `raco test -c rackunit`

Okay and that's that.
Cloning has 2 parts --- get the dev. code and make a fork ---
 and then you can edit the code, build and test using those commands.
Hack on things, test and build using those commands,

To summarize:

```
$ raco pkg update --catalog https://pkgs.racket-lang.org PKG
$ raco pkg update --clone PKG
$ raco setup PKG
$ raco test -c --drdr PKG
```

- - -

My Questions
---

- DrRacket command to update catalog
- possible to combine catalog & clone?
- what do when 6.11 comes out?
