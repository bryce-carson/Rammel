# Copyright 1995-1998 by Norman Ramsey.  All rights reserved.
# See file COPYRIGHT for more information.
#
# Edit nwconfig before running

include nwconfig

# Stop editing.  No user-serviceable parts below.

all: code scripts styles

bootstrap:
	-mkdir $(LIB3)/tools 2>$(NUL)
	cd tools && $(MK) "OUTPUT=$(LIB3)/tools" && cd ..

ciilib:
	-mkdir $(LIB3)/cii 2>$(NUL)
	cd cii && $(MK) "OUTPUT=$(LIB3)/cii" && cd ..

lualib:
	-mkdir $(LIB3)/lua-2.5 2>$(NUL)
	cd lua-2.5 && $(MK) $(LuaMakefile) "OUTPUT=$(LIB3)/lua-2.5" && cd ..

lualib3:
	-mkdir $(LIB3)/lua-3.0 2>$(NUL)
	cd lua-3.0 && $(MK) $(LuaMakefile) "OUTPUT=$(LIB3)/lua-3.0" && cd ..

code: bootstrap ciilib lualib
	-mkdir $(LIB3)/c 2>$(NUL)
	cd c && $(MK) "NOTANGLE=more" "TANGLEOPTS= | $(NOCOND) lua2 | $(NOCOND) $(PIPE) | $(LIB3)/tools/markup | $(LIB3)/tools/nt" "CPIF=>" "TOOLS=$(LIB3)/tools" "LUA=../lua-2.5" "LUALIB=$(LIB3)/lua-2.5" "OUTPUT=$(LIB3)/c" && cd ..

scripts: bootstrap
	-mkdir $(LIB3)/lua 2>$(NUL)
	cd lua && $(MK) "NOTANGLE=more" "TANGLEOPTS= | $(NOCOND) lua2 | $(LIB3)/tools/markup | $(LIB3)/tools/nt" "CPIF=>" "OUTPUT=$(LIB3)/lua" && cd ..

styles: bootstrap
	-mkdir $(LIB3)/tex 2>$(NUL)
	cd tex && $(MK) "NOTANGLE=more" "TANGLEOPTS= | $(LIB3)/tools/markup | $(LIB3)/tools/nt" "CPIF=>" "OUTPUT=$(LIB3)/tex" && cd ..

careful:
	$(MK) clobber
	$(MK) all clean
	-$(RMDIR) $(LIB3)/first 2>$(NUL)
	mkdir $(LIB3)/first
	mkdir $(LIB3)/first/c
	$(CPR) $(LIB3)/c/* $(LIB3)/first/c
	mkdir $(LIB3)/first/lua
	$(CPR) $(LIB3)/lua/* $(LIB3)/first/lua
	mkdir $(LIB3)/first/tex
	$(CPR) $(LIB3)/tex/* $(LIB3)/first/tex
	$(MK) clobber
	$(MK) bootstrap
	$(MK) ciilib
	$(MK) lualib
	-mkdir $(LIB3)/c 2>$(NUL)
	cd c && $(MK) "NWPATH=$(LIB3)/first/lua" "NOTANGLE=more" "TANGLEOPTS= | $(NOCOND) lua2 | $(NOCOND) $(PIPE) | $(LIB3)/first/c/no tangle" "CPIF=>" "TOOLS=$(LIB3)/tools" "LUA=../lua-2.5" "LUALIB=$(LIB3)/lua-2.5" "OUTPUT=$(LIB3)/c" && cd ..
	-mkdir $(LIB3)/lua 2>$(NUL)
	cd lua && $(MK) "NWPATH=$(LIB3)/first/lua" "NOTANGLE=$(LIB3)/first/c/no tangle" "TANGLEOPTS=" "CPIF=>" "OUTPUT=$(LIB3)/lua" && cd ..
	-mkdir $(LIB3)/tex 2>$(NUL)
	cd tex && $(MK) "NWPATH=$(LIB3)/first/lua" "NOTANGLE=$(LIB3)/first/c/no tangle" "TANGLEOPTS=" "CPIF=>" "OUTPUT=$(LIB3)/tex" && cd ..
	echo At this point we are attempting to build the literate version.
	echo It may fail if you have not previously installed noweb.sty.
	cd c && $(MK) "NWPATH=$(LIB3)/first/lua" "OUTPUT=$(LIB3)/c" doc && cd ..
	-$(RMDIR) $(LIB3)/first
	$(MK) all clean

transfer:
#	make 2 from bootstrap
	$(MK) clobber
	$(MK) all
	cd c && $(MK) "NWPATH=$(LIB3)/lua" "OUTPUT=$(LIB3)/c" doc && cd ..
	mkdir $(LIB3)/2b
	mkdir $(LIB3)/2b/c
	mkdir $(LIB3)/2b/lua
	mkdir $(LIB3)/2b/tex
	$(CPR) $(LIB3)/c/* $(LIB3)/2b/c
	$(CPR) $(LIB3)/lua/* $(LIB3)/2b/lua
	$(CPR) $(LIB3)/tex/* $(LIB3)/2b/tex
	$(MK) clean
#	make 3 from bootstrap
	$(MK) clobber
	$(MK) bootstrap
	$(MK) ciilib
	$(MK) lualib3
	mkdir $(LIB3)/c
	mkdir $(LIB3)/lua
	mkdir $(LIB3)/tex
	cd c && $(MK) "NOTANGLE=more" "TANGLEOPTS= | $(NOCOND) lua3 | $(NOCOND) $(PIPE) | $(LIB3)/tools/markup | $(LIB3)/tools/nt" "CPIF=>" "TOOLS=$(LIB3)/tools" "LUA=../lua-3.0" "LUALIB=$(LIB3)/lua-3.0" "OUTPUT=$(LIB3)/c" && cd ..
	cd lua && $(MK) "NOTANGLE=more" "TANGLEOPTS= | $(NOCOND) lua3 | $(LIB3)/tools/markup | $(LIB3)/tools/nt" "CPIF=>" "OUTPUT=$(LIB3)/lua" && cd ..
	cd tex && $(MK) "NOTANGLE=more" "TANGLEOPTS= | $(LIB3)/tools/markup | $(LIB3)/tools/nt" "CPIF=>" "OUTPUT=$(LIB3)/tex" && cd ..
	cd c && $(MK) "NWPATH=$(LIB3)/lua" "OUTPUT=$(LIB3)/c" doc && cd ..
	mkdir $(LIB3)/3b
	mkdir $(LIB3)/3b/c
	mkdir $(LIB3)/3b/lua
	mkdir $(LIB3)/3b/tex
	$(CPR) $(LIB3)/c/* $(LIB3)/3b/c
	$(CPR) $(LIB3)/lua/* $(LIB3)/3b/lua
	$(CPR) $(LIB3)/tex/* $(LIB3)/3b/tex
	$(MK) clean
#	make 2 from 2
	$(MK) clobber
	$(MK) bootstrap
	$(MK) ciilib
	$(MK) lualib
	mkdir $(LIB3)/c
	mkdir $(LIB3)/lua
	mkdir $(LIB3)/tex
	mkdir $(LIB3)/22
	mkdir $(LIB3)/22/c
	mkdir $(LIB3)/22/lua
	mkdir $(LIB3)/22/tex
	cd c && $(MK) "NWPATH=$(LIB3)/2b/lua" "NOTANGLE=more" "TANGLEOPTS= | $(NOCOND) lua2 | $(NOCOND) $(PIPE) | $(LIB3)/2b/c/no tangle" "CPIF=>" "TOOLS=$(LIB3)/tools" "LUA=../lua-2.5" "LUALIB=$(LIB3)/lua-2.5" "OUTPUT=$(LIB3)/c" && cd ..
	cd lua && $(MK) "NWPATH=$(LIB3)/2b/lua" "NOTANGLE=more" "TANGLEOPTS= | $(NOCOND) lua2 | $(LIB3)/2b/c/no tangle" "CPIF=>" "OUTPUT=$(LIB3)/lua" && cd ..
	cd tex && $(MK) "NWPATH=$(LIB3)/2b/lua" "NOTANGLE=$(LIB3)/2b/c/no tangle" "TANGLEOPTS=" "CPIF=>" "OUTPUT=$(LIB3)/tex" && cd ..
	cd c && $(MK) "NWPATH=$(LIB3)/lua" "OUTPUT=$(LIB3)/c" doc && cd ..
	$(CPR) $(LIB3)/c/* $(LIB3)/22/c
	$(CPR) $(LIB3)/lua/* $(LIB3)/22/lua
	$(CPR) $(LIB3)/tex/* $(LIB3)/22/tex
	$(MK) clean
#	make 3 from 2
	$(MK) clobber
	$(MK) bootstrap
	$(MK) ciilib
	$(MK) lualib3
	mkdir $(LIB3)/c
	mkdir $(LIB3)/lua
	mkdir $(LIB3)/tex
	mkdir $(LIB3)/32
	mkdir $(LIB3)/32/c
	mkdir $(LIB3)/32/lua
	mkdir $(LIB3)/32/tex
	cd c && $(MK) "NWPATH=$(LIB3)/2b/lua" "NOTANGLE=more" "TANGLEOPTS= | $(NOCOND) lua3 | $(NOCOND) $(PIPE) | $(LIB3)/2b/c/no tangle" "CPIF=>" "TOOLS=$(LIB3)/tools" "LUA=../lua-3.0" "LUALIB=$(LIB3)/lua-3.0" "OUTPUT=$(LIB3)/c" && cd ..
	cd lua && $(MK) "NWPATH=$(LIB3)/2b/lua" "NOTANGLE=more" "TANGLEOPTS= | $(NOCOND) lua3 | $(LIB3)/2b/c/no tangle" "CPIF=>" "OUTPUT=$(LIB3)/lua" && cd ..
	cd tex && $(MK) "NWPATH=$(LIB3)/2b/lua" "NOTANGLE=$(LIB3)/2b/c/no tangle" "TANGLEOPTS=" "CPIF=>" "OUTPUT=$(LIB3)/tex" && cd ..
	cd c && $(MK) "NWPATH=$(LIB3)/lua" "OUTPUT=$(LIB3)/c" doc && cd ..
	$(CPR) $(LIB3)/c/* $(LIB3)/32/c
	$(CPR) $(LIB3)/lua/* $(LIB3)/32/lua
	$(CPR) $(LIB3)/tex/* $(LIB3)/32/tex
	$(MK) clean
#	make 2 from 3
	$(MK) clobber
	$(MK) bootstrap
	$(MK) ciilib
	$(MK) lualib
	mkdir $(LIB3)/c
	mkdir $(LIB3)/lua
	mkdir $(LIB3)/tex
	mkdir $(LIB3)/23
	mkdir $(LIB3)/23/c
	mkdir $(LIB3)/23/lua
	mkdir $(LIB3)/23/tex
	cd c && $(MK) "NWPATH=$(LIB3)/3b/lua" "NOTANGLE=more" "TANGLEOPTS= | $(NOCOND) lua2 | $(NOCOND) $(PIPE) | $(LIB3)/3b/c/no tangle" "CPIF=>" "TOOLS=$(LIB3)/tools" "LUA=../lua-2.5" "LUALIB=$(LIB3)/lua-2.5" "OUTPUT=$(LIB3)/c" && cd ..
	cd lua && $(MK) "NWPATH=$(LIB3)/3b/lua" "NOTANGLE=more" "TANGLEOPTS= | $(NOCOND) lua2 | $(LIB3)/3b/c/no tangle" "CPIF=>" "OUTPUT=$(LIB3)/lua" && cd ..
	cd tex && $(MK) "NWPATH=$(LIB3)/3b/lua" "NOTANGLE=$(LIB3)/3b/c/no tangle" "TANGLEOPTS=" "CPIF=>" "OUTPUT=$(LIB3)/tex" && cd ..
	cd c && $(MK) "NWPATH=$(LIB3)/lua" "OUTPUT=$(LIB3)/c" doc && cd ..
	$(CPR) $(LIB3)/c/* $(LIB3)/23/c
	$(CPR) $(LIB3)/lua/* $(LIB3)/23/lua
	$(CPR) $(LIB3)/tex/* $(LIB3)/23/tex
	$(MK) clean
#	make 3 from 3
	$(MK) clobber
	$(MK) bootstrap
	$(MK) ciilib
	$(MK) lualib3
	mkdir $(LIB3)/c
	mkdir $(LIB3)/lua
	mkdir $(LIB3)/tex
	mkdir $(LIB3)/33
	mkdir $(LIB3)/33/c
	mkdir $(LIB3)/33/lua
	mkdir $(LIB3)/33/tex
	cd c && $(MK) "NWPATH=$(LIB3)/3b/lua" "NOTANGLE=more" "TANGLEOPTS= | $(NOCOND) lua3 | $(NOCOND) $(PIPE) | $(LIB3)/3b/c/no tangle" "CPIF=>" "TOOLS=$(LIB3)/tools" "LUA=../lua-3.0" "LUALIB=$(LIB3)/lua-3.0" "OUTPUT=$(LIB3)/c" && cd ..
	cd lua && $(MK) "NWPATH=$(LIB3)/3b/lua" "NOTANGLE=more" "TANGLEOPTS= | $(NOCOND) lua3 | $(LIB3)/3b/c/no tangle" "CPIF=>" "OUTPUT=$(LIB3)/lua" && cd ..
	cd tex && $(MK) "NWPATH=$(LIB3)/3b/lua" "NOTANGLE=$(LIB3)/3b/c/no tangle" "TANGLEOPTS=" "CPIF=>" "OUTPUT=$(LIB3)/tex" && cd ..
	cd c && $(MK) "NWPATH=$(LIB3)/lua" "OUTPUT=$(LIB3)/c" doc && cd ..
	$(CPR) $(LIB3)/c/* $(LIB3)/33/c
	$(CPR) $(LIB3)/lua/* $(LIB3)/33/lua
	$(CPR) $(LIB3)/tex/* $(LIB3)/33/tex
	$(MK) clean
	$(MK) checkclean
	echo Let's see how different it is.
	pause
	$(MK) checkdifferent
	echo Let's see how similar it is.
	pause
	$(MK) checksame
	pause

checkclean:
	$(RM) $(LIB3)/2b\c\*.exe $(LIB3)/2b\c\*.log $(LIB3)/2b\c\*.obj $(LIB3)/2b\c\*.pdf
	$(RM) $(LIB3)/22\c\*.exe $(LIB3)/22\c\*.log $(LIB3)/22\c\*.obj $(LIB3)/22\c\*.pdf
	$(RM) $(LIB3)/23\c\*.exe $(LIB3)/23\c\*.log $(LIB3)/23\c\*.obj $(LIB3)/23\c\*.pdf
	$(RM) $(LIB3)/3b\c\*.exe $(LIB3)/3b\c\*.log $(LIB3)/3b\c\*.obj $(LIB3)/3b\c\*.pdf
	$(RM) $(LIB3)/32\c\*.exe $(LIB3)/32\c\*.log $(LIB3)/32\c\*.obj $(LIB3)/32\c\*.pdf
	$(RM) $(LIB3)/33\c\*.exe $(LIB3)/33\c\*.log $(LIB3)/33\c\*.obj $(LIB3)/33\c\*.pdf

checkdifferent:
	windiff $(LIB3)/2b $(LIB3)/3b
	windiff $(LIB3)/2b $(LIB3)/32
	windiff $(LIB3)/2b $(LIB3)/33
	windiff $(LIB3)/22 $(LIB3)/3b
	windiff $(LIB3)/22 $(LIB3)/32
	windiff $(LIB3)/22 $(LIB3)/33
	windiff $(LIB3)/23 $(LIB3)/3b
	windiff $(LIB3)/23 $(LIB3)/32
	windiff $(LIB3)/23 $(LIB3)/33

checksame:
	windiff $(LIB3)/2b $(LIB3)/22
	windiff $(LIB3)/22 $(LIB3)/23
	windiff $(LIB3)/3b $(LIB3)/32
	windiff $(LIB3)/32 $(LIB3)/33

pdf: install
	-mkdir $(LIB3)/c 2>$(NUL)
	cd c && $(MK) "OUTPUT=$(LIB3)/c" doc && cd ..

everything: all todo.html

install: install-code install-scripts install-styles

install-code: code
	$(CP) $(LIB3)/c/no$(E) $(BINDIR)
	$(CP) $(LIB3)/c/nwmtime$(E) $(BINDIR)

install-scripts: scripts
	$(CP) $(LIB3)/lua/* $(BINDIR)

install-styles: styles
	$(CP) $(LIB3)/tex/noweb.sty $(TEXINPUTS)/latex/misc/noweb.sty
	$(CP) $(LIB3)/tex/nwmac.tex $(TEXINPUTS)/generic/misc/nwmac.tex

$(LIB3)/todo.html: bootstrap todo.nw
	no weave -html todo.nw | $(LIB3)/tools/l2htodo > $(LIB3)/todo.html

# Not configurable by nwconfig because this is an author only command.
www: $(LIB3)/todo.html
	$(CP) $(LIB3)/todo.html /home/cellar/nr/www/noweb/todo3.html

clean:
	cd tools && $(MK) "OUTPUT=$(LIB3)/tools" clobber && cd ..
	-$(RMDIR) $(LIB3)/tools 2>$(NUL)
	cd cii && $(MK) "OUTPUT=$(LIB3)/cii" clobber && cd ..
	-$(RMDIR) $(LIB3)/cii 2>$(NUL)
	cd lua-2.5 && $(MK) $(LuaMakefile) "OUTPUT=$(LIB3)/lua-2.5" clobber && cd ..
	-$(RMDIR) $(LIB3)/lua-2.5 2>$(NUL)
	cd c && $(MK) "OUTPUT=$(LIB3)/c" clean && cd ..
	cd lua && $(MK) "OUTPUT=$(LIB3)/lua" clean && cd ..
	cd tex && $(MK) "OUTPUT=$(LIB3)/tex" clean && cd ..
	-$(RM) *~ 2>$(NUL)

clobber: clean
	cd c && $(MK) "OUTPUT=$(LIB3)/c" clobber && cd ..
	-$(RMDIR) $(LIB3)/c 2>$(NUL)
	cd lua && $(MK) "OUTPUT=$(LIB3)/lua" clobber && cd ..
	-$(RMDIR) $(LIB3)/lua 2>$(NUL)
	cd tex && $(MK) "OUTPUT=$(LIB3)/tex" clobber && cd ..
	-$(RMDIR) $(LIB3)/tex 2>$(NUL)
	-$(RM) *.html 2>$(NUL)
