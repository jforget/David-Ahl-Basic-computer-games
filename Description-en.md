-*- encoding: utf-8; indent-tabs-mode: nil -*-

PURPOSE
=======

Since late 2022, generative artificial intelligence is available to anyone
with an Internet connection. I have even been told that some people use
IA chat programs as psychoanalysts. That reminds me of a forerunner of
AI psychoanalysts, Eliza, written in the 1960's.

The BASIC  version of Eliza  was published  in David Ahl's  book _More
Computer Games_, a  sequel of his best-seller  _Basic Computer Games_.
So  my interest  in  Eliza  expanded into  an  interest  in the  Basic
computer games from these books.

This repository describes  my efforts to get these  computer games and
to run them.

GAME PROGRAMS
=============

Eliza
-----

[Eliza](https://en.wikipedia.org/wiki/ELIZA)
was not written  by David Ahl, but by Joseph  Weizenbaum. Many sources
are provided by
[a Github repository](https://github.com/jeffshrager/elizagen.org),
in various programming languages. Since I am interested only in Basic
versions, I have selected, more or less randomly,
[a 1979 version](https://github.com/jeffshrager/elizagen.org/blob/master/Other_Elizas/1979_EricPlatt_DR_CHALLENGER_CLEAN.BAS),
[a 2013 version](https://github.com/jeffshrager/elizagen.org/blob/master/Other_Elizas/20130209_www.jesperjuul.net%7Celiza%7CELIZA.BAS)
available at
[another address](https://jesperjuul.net/eliza/ELIZA.BAS)
and [another 2013 version](https://github.com/jeffshrager/elizagen.org/blob/3f3414c8a3e359e5f392d92883241d3bd41e7988/Other_Elizas/20120310ShragerNorthEliza.c64basic).

Actually, as  seen just  below, I  have not used  these files,  I have
found another version.

Basic Computer Games
--------------------

[Both](https://www.atariarchives.org/basicgames/)
[books](https://www.atariarchives.org/morebasicgames/)
by David Ahl are available from
[Atari Archives](https://www.atariarchives.org/),
with a
[third book](https://www.atariarchives.org/bigcomputergames/)
I did not know about. Among all the programs, we certainly find
[Eliza](https://www.atariarchives.org/morebasicgames/showpage.php?page=56).

The problem  is that these  files are available  as GIF images.  So we
would need some OCR programs to  convert them into ASCII source files.
Fortunately, the programs  from the first book are available  as a Zip
archive and as a tar.gz archive on the
[Vintage Basic webpage](http://www.vintage-basic.net/games.html)
and the programs from the second book are available as a Zip archive at
[another website](https://www.roug.org/retrocomputing/languages/basic/morebasicgames).

The first two books are also available on the
[archive.org]((https://archive.org/details/basic-computer-games-microcomputer-edition_202207)
[website](https://archive.org/details/More_BASIC_Computer_Games),
displaying the  contents as GIF images  (or JPEG? or PNG?).  There are
links to download the whole book as a text file or as a PDF file. Yet,
in the text files,  there are many OCR errors. So we  must use the Zip
archives instead.

BASIC INTERPRETERS
==================

The [BASIC  language](https://rosettacode.org/wiki/99_Bottles_of_Beer/Basic)
has changed  in spades between  its first days  in 1965 and  now. Line
numbers have disappeared, now you have user functions with parameters,
you have local variables with well-specified scope. A
[modern program](https://rosettacode.org/wiki/10001th_prime#BASIC256)
has a very different look when compared with a
[classical program](https://rosettacode.org/wiki/10001th_prime#GW-BASIC).

Since the games have been written in the 1970's, I need an interpreter
which accepts the classical syntax with line numbers and the like.

For my  tests, I  use a virtual  machine with xubuntu  25.04. I  use a
virtual machine, because uninstalling a software can be simply done by
restoring a previous  snapshot. I choose xubuntu, because  it has more
software packages  related to BASIC  than other distributions  such as
Fedora. 25.04  because it is  the most recent xubuntu  virtual machine
installed on my computer.

brandy
------

The [website](https://brandy.matrixnetwork.co.uk/)
mentions version 1.23.6, the APT package has version 1.23.4.

When I test the minimal program `test1.bas` from `bcg.tar.gz`:

```
10 print "I am test 1"
20 end
```

The `brandy` interpreter crashes:

```
$ brandy test1.bas
heap.c:init_workspace: Requested heapsize is 67108864 (&4000000)
heap.c:init_workspace: Allocating at 0x400000, size &4000000
heap.c:init_workspace: mmap returns 0x400000
```

I have tried a few other programs, they crash in the same fashion.

Yet, if I type no filename  in the command line, the interpreter opens
an  input window  and  I  can type  BASIC  statements  in this  window
(upper-case only,  lower-case letters trigger syntax  error messages).
The `test1.bas` program  fails, because it contains  `print` and `end`
in  lowercase chars.  On the  other hand,  several other  programs run
successfully, such as `sinewave.bas`, `amazing.bas` and `love.bas`. Or
there are a few errors, such as  `bunny.bas` in which the array `B` is
not    declared,   or    `eliza.bas`   (the    one   extracted    from
`morebasicgames.zip`) which uses  a `P$` variable in  line 255 without
defining it.

The most serious  problem is that the window  cannot change dimensions
and you cannot scroll back to the previous lines (no scrollbars).

A few useful commands:

```
HELP
HELP "."
HELP "LOAD"
LOAD "amazing.bas"
RUN
QUIT
```

Note that  the commands must  be typed  with upper-case chars.  On the
other hand,  filenames must be typed  as they appear when  listing the
file directory.

bwbasic
-------

The [website](https://sourceforge.net/projects/bwbasic/)
mentions version 3.40, the APT package has version 2.20pl2.

To invoke  the interpreter, the  command is `bwbasic`. It  accepts the
pathname for a  BASIC source file as a CLI  parameter. The interpreter
uses the  current xterm window to  interact with the user,  so you can
browse the previous lines by using the scroll bars.

Lower-case  letters are  allowed.  On the  other  hand, some  problems
arise. For  example, in `sinewave.bas`,  a comment is prefixed  by the
pseudo-keyword   `REMARKABLE`  (with   a  `REM`   prefix),  but   this
interpreter does not understand the trick. Also, in many programs, the
interpreter does  not recognise  the `NEXT` end-of-loop  statements if
they are not the first statement in the line.

More surprising:  when I run  `calendar.bas`, after fixing  the `NEXT`
statements not  at the beginning  of a  line, I have  errors seemingly
attributed to  `sh`. These  are not  blocking errors.  But there  is a
blocking error, with an array `M`,  declared with `DIM M(12)`, and for
which the program uses indices 0 to 12:

```
bwBASIC: load "calendar.bas"
bwBASIC: run
                               CALENDAR
              CREATIVE COMPUTING  MORRISTOWN, NEW JERSEY
sh: 1: PRINT:PRINT:PRINT: not found
sh: 1: REM: not found
sh: 1: Syntax error: "(" unexpected
sh: 1: 10: not found
sh: 1: FOR: not found
sh: 1: NEXT: not found

ERROR in line 160: in dim_check(): array subscript var <M> pos <0> val <2> out
of range <0>-<1>.
```

About `eliza.bas` (from `morebasicgames.zip`), the "shell" errors are still
there. The blocking problem in this program is that there is some loss
of  synchronisation  between  the  `DATA` statements  and  the  `READ`
statements. The  program reads  several strings  and then  switches to
reading  numeric  data. The  problem  is  that  for some  reason,  the
internal  `DATA` pointer  still designates  a `DATA`  string when  the
numeric `READ` is executed.

```
bwBASIC: load "eliza.bas"
bwBASIC: run
                         ELIZA
                   CREATIVE COMPUTING
                 MORRISTOWN, NEW JERSEY
sh: 1: PRINT:PRINT:PRINT: not found
sh: 1: REM: not found
sh: 1: Syntax error: "(" unexpected

ERROR in line 140: expression <WHEN?> is not a numerical constant.
bwBASIC:
```

gambas
------

The [website](https://gambaswiki.org/website/en/main.html)
mentions version 3.21.2, the APT package has version 3.20.2.

The `gambas3`  command launches a full  development environment, which
allows you  to create a  full graphic  application, instead of  just a
CLI-oriented program. It  is too much complicated for  my needs, which
are just running (and possibly updating) BASIC programs created in the
1970's.

yabasic
------

The [website](https://2484.de/yabasic/)
mentions version 2.91.4, the APT package has version 2.91.1.

The  `yabasic`  command accepts  a  filename  as  a parameter.  If  no
filename is  provided, it enters  a CLI  interface where you  can type
your  program  on  the  fly  and  run it.  Once  the  program  is  run
(on-the-fly program or source file), `yabasic` ends and yields control
to shell. If the program does not  take input from the user, or if the
user can prepare  the input data before running the  program, the call
to `yabasic`  can be  part of a  shell pipeline or  its output  can be
redirected with `>`.

Example with `love.bas`, which takes a single input from the user:

```
echo kisses | yabasic love.bas | less
```

Some syntactic features of the 1970-era BASIC interpreters are missing
from `yabasic`. All examples are taken from `sinewave.bas`.

* print several arguments separated with semicolons

  ```
  ---Error: syntax error
     10 PRINT TAB(30); "SINE WAVE"
                       ^~~~~~~~~~~
  ---Error: Couldn't parse program
  ---Error: Program not executed
  ```

  But you can print several arguments if they are separated with commas.

* find a keyword hidden inside a supposedly normal identifier

  ```
  ---Error in sinewave.bas, line 4:
  ---Error: syntax error
     40 REMARKABLE PROGRAM BY DAVID AHL
                   ^~~~~~~
  ---Error: Couldn't parse program
  ---Error: Program not executed
  ```

* implicit `GOTO` in a `IF ... THEN` construct

  ```
  ---Error in sinewave.bas, line 10:
  ---Error: syntax error
     140 IF B=1 THEN 180
                     ^~~
  ---Error: Couldn't parse program
  ---Error: Program not executed
  ```

* a `IF ... THEN` construct must be closed with a `ENDIF`

  ```
  ---Error in sinewave.bas, line 16:
  ---Error: a closing endif is expected before next
     200 NEXT T
         ^~~~
  ---Error: if-statement starting at line 10 has seen no 'endif' yet
     200 NEXT T
         ^~~~
  ---Error: syntax error
     200 NEXT T
              ^
  ---Error: Couldn't parse program
  ---Error: Program not executed
  ```

  You may use [`FI`](https://2484.de/yabasic/yabasic.htm#ref_fi)
  instead of `ENDIF`.

* the `TAB` function which should generate a string with _n_ space chars is not known

  ```
  ---Error in sinewave.bas, line 1:
  ---Error: 'TAB()' is neither array nor subroutine
     10 PRINT TAB(30), "SINE WAVE"
                    ^
  ---Error: Program stopped due to an error
  ```

  Actually, we must use
  [function `string$()`](https://2484.de/yabasic/yabasic.htm#ref_string).

  Or else, we  can create a user subroutine. The  only problem is that
  its name cannot be `TAB`, but  `TAB$` since it produces a string (or
  `tab$`,   but   you   should   be  consistent,   these   names   are
  case-sensitive).

  ```
  10 PRINT tab$(30), "SINE WAVE"
  20 PRINT tab$(15), "CREATIVE COMPUTING  MORRISTOWN, NEW JERSEY"
  [...]
  130 PRINT tab$(A);
  [...]
  300 sub tab$(n)
  310 return string$(n, " ")
  320 end sub
  ```

Vintage BASIC
-------------

There are no APT packages for Vintage BASIC, you have to download from the
[website](http://vintage-basic.net/).
Version is 1.0.3.

The first installation method I tried is, as shown on the
[website](http://vintage-basic.net/download.html),

```
cp -R vintage-basic-1.0.3-linux-x86_64/bin ~/bin
cp -R vintage-basic-1.0.3-linux-x86_64/share ~/share
```

It does not work. On the other hand

```
cp -R vintage-basic-1.0.3-linux-x86_64/bin/* ~/bin
cp -R vintage-basic-1.0.3-linux-x86_64/share/* ~/share
```

works  fine and  provides  a  program `vintbas`.  This  program has  a
required parameter, the  pathname of the BASIC source  file. The BASIC
program is run,  then `vintbas` terminates and returns  control to the
shell.  The way  it  works  is the  usual  Unix  way, with  pipelines,
redirection and the like.  On the other hand, there is  no way to type
the program  "on the fly",  by repeatedly typing  a line number  and a
BASIC statement.

All programs from `bcg.tar.gz` and from `morebasicgames.zip` (at least
all the programs I have tried) run without requiring any modification.

As  an  aside, there  is  some  cleanup  to  do in  the  documentation
directory  `~/share/doc`, because  the  archive  includes somes  files
specific to Mac OSX.

```
  /home/jf/share/doc:
  drwxr-xr-x 3 jf jf 4096 févr.  4 19:14 .
  drwxrwxr-x 3 jf jf 4096 févr.  4 19:14 ..
  -rw-r--r-- 1 jf jf  120 févr.  4 19:14 ._.DS_Store
  -rw-r--r-- 1 jf jf 6148 févr.  4 19:14 .DS_Store
  -rwxr-xr-x 1 jf jf  176 févr.  4 19:14 ._vintage-basic-1.0.3
  drwxr-xr-x 3 jf jf 4096 févr.  4 19:14 vintage-basic-1.0.3
```

For the sake of completeness, I have tried the other installation procedures.

```
sudo cp -R vintage-basic-1.0.3-linux-x86_64/bin /usr/local/bin
sudo cp -R vintage-basic-1.0.3-linux-x86_64/share /usr/local/share
```

As above, you need to add stars to get a proper installation

```
sudo cp -R vintage-basic-1.0.3-linux-x86_64/bin/* /usr/local/bin
sudo cp -R vintage-basic-1.0.3-linux-x86_64/share/* /usr/local/share
```

And as above, there is some cleanup to do in `/usr/local/share/doc`.

For source-based installation, the archive
`vintage-basic-1.0.3.tar.gz` is not downloaded from address
`http://www.vintage-basic.net/downloads.html` (plural "download" as
given by the link on the website), but from address
[`http://vintage-basic.net/download.html`](http://vintage-basic.net/download.html),
(singular "download") or from
[Hackage](https://hackage.haskell.org/package/vintage-basic)
(not tested). Also, I did not test installation from a
[Github clone](https://github.com/lylek/vintage-basic).

We need the
[Stack](http://haskellstack.org/)
Haskell tool. I  have installed it from the APT  packages for xubuntu.
Version installed is 2.15.7. Then I typed the command

```
stack setup
```

This command  took time, because on  my computer it needed  to install
GHC. There was an early warning:

```
Warning: Stack has not been tested with GHC versions 9.10 and above, and using 9.10.3, this may fail.
Preparing to install GHC (tinfo6) to an isolated location. This will not interfere with any system-level installation.
```

then many error messages telling me `mkdir not possible` or `write not
possible` and it ended with

```
Error: [S-7441]
       Received ExitFailure 2 when running
       Raw command: /usr/bin/tar Jxf /home/jf/.stack/programs/x86_64-linux/ghc-tinfo6-9.10.3.tar.xz
       Run from: /home/jf/.stack/programs/x86_64-linux/ghc-tinfo6-9.10.3.temp/

       Error encountered while unpacking GHC with
         tar Jxf /home/jf/.stack/programs/x86_64-linux/ghc-tinfo6-9.10.3.tar.xz
         run in /home/jf/.stack/programs/x86_64-linux/ghc-tinfo6-9.10.3.temp/

       The following directories may now contain files, but won't be used by Stack:
       * /home/jf/.stack/programs/x86_64-linux/ghc-tinfo6-9.10.3.temp/
       * /home/jf/.stack/programs/x86_64-linux/ghc-tinfo6-9.10.3/

       For more information consider rerunning with --verbose flag.
```

I  did not  consider rerunning  the  command, I  dropped this  method.
Anyhow, the installation from the binary archive is fine for me.

COPYRIGHT AND LICENSE
=====================

For the texts
-------------

The documentation  in this repository  is licensed under  the Creative
Commons License CC-BY-SA (Attribution, Sharealike). See the
[Creative Commons website](https://creativecommons.org/licenses/by-sa/4.0/deed.en).

For the programs (if any)
-------------------------

Copyright (c) 2026 Jean Forget

This library is  free software; you can redistribute  it and/or modify
it under the same terms as Perl 5.16.3. For more details, see the full
text of the licenses in the LICENSE file.

This program is distributed in the hope that it will be useful, but it
is provided “as is” and without any express or implied warranties. For
details, see the full text of the licenses in the file LICENSE.

