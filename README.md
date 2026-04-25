<!-- -*- mode: markdown; -*- -->
Rammel is:

> *Noweb 3* with a lot of changes; and
>
> © 2026 Bryce Carson.

Rammel is a copyrighten work derived from
[Norman Ramsey's *noweb* version 3](https://github.com/nrnrnr/noweb3),
a copyrighten work.

Rammel is available free for any use in any field of endeavor. The *original
`COPYRIGHT` file **contents*** of Norman Ramsey's noweb version 3 are quoted below;
Rammel is a derivative work with its own name, so the COPYRIGHT file needn't be
retained, only the notice below.

> Noweb is copyright 1989-2015 by Norman Ramsey.  All rights reserved.
>
> Noweb is protected by copyright.  It is not public-domain
> software or shareware, and it is not protected by a ``copyleft''
> agreement like the one used by the Free Software Foundation.
>
> Noweb is available free for any use in any field of endeavor.  You may
> redistribute noweb in whole or in part provided you acknowledge its
> source and include this COPYRIGHT file.  You may modify noweb and
> create derived works, provided you retain this copyright notice, but
> the result may not be called noweb without my written consent.
>
> You may sell noweb if you wish.  For example, you may sell a CD-ROM
> including noweb.
>
> You may sell a derived work, provided that all source code for your
> derived work is available, at no additional charge, to anyone who buys
> your derived work in any form.  You must give permisson for said
> source code to be used and modified under the terms of this license.
> You must state clearly that your work uses or is based on noweb and
> that noweb is available free of change.  You must also request that
> bug reports on your work be reported to you.
>
> If this license does not meet your needs, write to nr@cs.tufts.edu
> to discuss terms.
>
> Noweb version 3 incorporates elements of Lua version 2.5 and CII
> version 1.11, both used by permission.

You are given permission to use Rammel similarly.

Rammel uses:

- any of **PUC Rio's** *Lua 2.5.1*, *Lua 3.2*, or *Lua 5.5*;
- select interfaces and implementations from **Dave Hanson's** *C Interfaces and Implementations*;
- *Premake5*;
- *GNU Make*.

Compatible Make implementations (like nmake) may function, but aren't supported.

A *TODO* file is maintained in Org syntax, so using Emacs to interact with Rammel,
in general, is preferred. The *docs* directory contains documents that existed
within the noweb version 3 sources, from which Rammel is directly inherited from (using
Git); this may disappear in the future.

Building Rammel requires GNU Make, as the effort required to conver the
pre-existing UNIX and NT Makefiles for Dave Hansen's CII to Premake scripts in
Lua (which merely generate makefiles or build scripts for other build systems)
is too high for myself (a UNIX user with GNU Make). Should you really want to
avoid GNU Make at all costs you can convert the Makefiles to Premake5 Lua
scripts yourself and contribute these for the benefit of the community.

  Whenever the action requested of Premake5 is not "gmake" it will complain
  about this.

Rammel may also be built with Lua 2.5.1, Lua 3.2, or Lua 5.5. The work of
converting the Lua filters and stages of noweb version 3 from the custom version
of Lua 2.5 (lua2.5+nw) to standard Lua 2.5 and also to standard Lua 3 is thanks
to the effort of David Zitzelsberger (GitHub user @dazitzel). Rammel is derived
from Zitzelsberger's fork.
