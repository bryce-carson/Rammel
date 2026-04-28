# Copyright 1991-1998 by Norman Ramsey.  All rights reserved.
# See file COPYRIGHT for more information.
#
# don't edit this file; edit ../nwconfig instead

include ../nwconfig

################################################################
# CII is directory where you installed CII ($BUILDDIR)

CII=../cii

INCS=-I$(CII)/include -I$(LUA)/include

# after installation, make doc for literate version

# list of object files for each target

NOOBJS= $(OUTPUT)/columns$(O) $(OUTPUT)/cpif$(O) \
	$(OUTPUT)/env-lua$(O) $(OUTPUT)/errors$(O) \
	$(OUTPUT)/finduses$(O) $(OUTPUT)/fromascii$(O) \
	$(OUTPUT)/getline$(O) \
	$(OUTPUT)/ipipe$(O) $(OUTPUT)/ipipe-lua$(O) \
	$(OUTPUT)/lua-help$(O) $(OUTPUT)/lua-main$(O) \
	$(OUTPUT)/main$(O) $(OUTPUT)/markparse$(O) $(OUTPUT)/markup$(O) \
	$(OUTPUT)/misc-lua$(O) $(OUTPUT)/modtrees$(O) $(OUTPUT)/modules$(O) \
	$(OUTPUT)/mpipe$(O) $(OUTPUT)/mpipe-lua$(O) \
	$(OUTPUT)/notangle$(O) $(OUTPUT)/noweb-lua$(O) $(OUTPUT)/nwbuffer$(O) \
	$(OUTPUT)/nwbuffer-lua$(O) $(OUTPUT)/nwprocess$(O) $(OUTPUT)/nwtime$(O) \
	$(OUTPUT)/recognize$(O) \
	$(OUTPUT)/stages$(O) $(OUTPUT)/strsave$(O) $(OUTPUT)/sys$(O) \
	$(OUTPUT)/util$(O) \
	$(OUTPUT)/xpipe$(O) $(OUTPUT)/xpipe-lua$(O)

NWMTIMEOBJS=$(OUTPUT)/columns$(O) \
	$(OUTPUT)/errors$(O) \
	$(OUTPUT)/getline$(O) \
	$(OUTPUT)/nwmtime$(O)

FILES=	columns.nw cpif.nw \
	errors.nw \
	finduses.nw \
	getline.nw \
	ipipe.nw ipipe-lua.nw \
	lua-main.nw \
	main.nw markparse.nw markup.nw match.nw modtrees.nw modules.nw mpipe.nw mpipe-lua.nw \
	notangle.nw nwbuffer.nw nwbuffer-lua.nw nwmtime.nw nwprocess.nw nwtime.nw \
	recognize.nw \
	strsave.nw \
	xpipe.nw xpipe-lua.nw

# sources to build when distributing C code
#   (add all generated .c and .h files to this list)

SRCS=	$(OUTPUT)/cargs.h $(OUTPUT)/columns.c $(OUTPUT)/columns.h $(OUTPUT)/cpif.c \
	$(OUTPUT)/cpif.h \
	$(OUTPUT)/env-lua.c $(OUTPUT)/env-lua.h $(OUTPUT)/errors.c $(OUTPUT)/errors.h \
	$(OUTPUT)/finduses.c $(OUTPUT)/fromascii.c $(OUTPUT)/fromascii.h \
	$(OUTPUT)/getline.c $(OUTPUT)/getline.h \
	$(OUTPUT)/ipipe-lua.c $(OUTPUT)/ipipe-lua.h $(OUTPUT)/ipipe.c $(OUTPUT)/ipipe.h \
	$(OUTPUT)/lua-help.c $(OUTPUT)/lua-help.h $(OUTPUT)/lua-main.c $(OUTPUT)/lua-main.h \
	$(OUTPUT)/main.c $(OUTPUT)/markparse.c $(OUTPUT)/markparse.h $(OUTPUT)/markup.c \
	$(OUTPUT)/markup.h $(OUTPUT)/match.c $(OUTPUT)/match.h $(OUTPUT)/misc-lua.c \
	$(OUTPUT)/misc-lua.h $(OUTPUT)/modtrees.c $(OUTPUT)/modtrees.h $(OUTPUT)/modules.c \
	$(OUTPUT)/modules.h $(OUTPUT)/mpipe-lua.c $(OUTPUT)/mpipe-lua.h $(OUTPUT)/mpipe.c \
	$(OUTPUT)/mpipe.h \
	$(OUTPUT)/notangle.c	$(OUTPUT)/notangle.h $(OUTPUT)/noweb-lua.c $(OUTPUT)/noweb-lua.h \
	$(OUTPUT)/nwbuffer-lua.c $(OUTPUT)/nwbuffer.c $(OUTPUT)/nwbuffer.h \
	$(OUTPUT)/nwmtime.c $(OUTPUT)/nwprocess.c $(OUTPUT)/nwprocess.h $(OUTPUT)/nwtime.c \
	$(OUTPUT)/nwtime.h \
	$(OUTPUT)/precompiled.h \
	$(OUTPUT)/recognize.c $(OUTPUT)/recognize.h \
	$(OUTPUT)/stages.c $(OUTPUT)/stages.h $(OUTPUT)/strsave.c $(OUTPUT)/strsave.h \
	$(OUTPUT)/sys.c $(OUTPUT)/sys.h \
	$(OUTPUT)/util.c $(OUTPUT)/util.h \
	$(OUTPUT)/xpipe-lua.c $(OUTPUT)/xpipe-lua.h $(OUTPUT)/xpipe.c $(OUTPUT)/xpipe.h

NAME='name of RCS version'

# metarule so you don't need a new rule for each object file

.c$(O):;	$(CC) $(INCS) $(XCFLAGS) $(CFLAGS)$@ $*.c

all:	$(OUTPUT)/no$(E) $(OUTPUT)/nwmtime$(E)

doc:	$(OUTPUT)/doc.tex $(OUTPUT)/allcode.tex
	pdflatex -output-directory=$(OUTPUT) doc.tex >$(NUL)
	pdflatex -output-directory=$(OUTPUT) doc.tex >$(NUL)
	pdflatex -output-directory=$(OUTPUT) doc.tex

$(OUTPUT)/nwmtime$(E):	$(NWMTIMEOBJS)
	$(LD) $(LFLAGS)$@ $(NWMTIMEOBJS)

$(OUTPUT)/no$(E):	$(NOOBJS) $(LIB3)/cii/memchk$(O) $(LIB3)/cii/libcii$(A) $(LUALIB)/liblua$(A) $(LUALIB)/liblualib$(A)
	$(LD) $(LFLAGS)$@ $(NOOBJS) $(LIBPROLOG) $(LIB3)/cii/libcii$(A) $(LUALIB)/liblua$(A) $(LUALIB)/liblualib$(A) $(LIBEPILOG)

touch: $(SRCS)
	touch $(SRCS)

clean:
	-$(RM) $(NOOBJS) 2>$(NUL)
	-$(RM) $(NWMTIMEOBJS) 2>$(NUL)
	-$(RM) $(SRCS) 2>$(NUL)
	-$(RM) $(OUTPUT)/nwbuffer-lua.0 2>$(NUL)
	-$(RM) $(OUTPUT)/nwbuffer-lua.1 2>$(NUL)
	-$(RM) $(OUTPUT)/nwbuffer-lua.2 2>$(NUL)
	-$(RM) $(OUTPUT)/nwbuffer-lua.3 2>$(NUL)
	-$(RM) $(OUTPUT)/allcode.tex 2>$(NUL)
	-$(RM) $(OUTPUT)/doc.aux 2>$(NUL)
	-$(RM) $(OUTPUT)/doc.log 2>$(NUL)
	-$(RM) $(OUTPUT)/doc.out 2>$(NUL)
	-$(RM) $(OUTPUT)/doc.tex 2>$(NUL)
	-$(RM) $(OUTPUT)/doc.toc 2>$(NUL)

clobber:	clean
	-$(RM) $(OUTPUT)/nwmtime$(E) $(OUTPUT)/no$(E) 2>$(NUL)
	-$(RM) $(OUTPUT)/doc.pdf 2>$(NUL)

$(OUTPUT)/doc.tex:	doc.nw
	$(CP) doc.nw $@

$(OUTPUT)/allcode.tex:	$(FILES)
	$(OUTPUT)/no weave -ifilter "Stages.elide, 'hackers:*'" -n -index $(FILES) > $@

################################################################

$(OUTPUT)/cargs.h:		cargs.nw;	$(NOTANGLE) cargs.nw		$(TANGLEOPTS) -L"#line %L "\"cargs.nw"\"%N"		-Rheader $(CPIF) $@
$(OUTPUT)/columns.h:		columns.nw;	$(NOTANGLE) columns.nw		$(TANGLEOPTS) -L"#line %L "\"columns.nw"\"%N"		-Rheader $(CPIF) $@
$(OUTPUT)/cpif.h:		cpif.nw;	$(NOTANGLE) cpif.nw		$(TANGLEOPTS) -L"#line %L "\"cpif.nw"\"%N"		-Rheader $(CPIF) $@
$(OUTPUT)/env-lua.h:		env-lua.nw;	$(NOTANGLE) env-lua.nw		$(TANGLEOPTS) -L"#line %L "\"env-lua.nw"\"%N"		-Rheader $(CPIF) $@
$(OUTPUT)/errors.h:		errors.nw;	$(NOTANGLE) errors.nw		$(TANGLEOPTS) -L"#line %L "\"errors.nw"\"%N"		-Rheader $(CPIF) $@
$(OUTPUT)/fromascii.h:	fromascii.nw;	$(NOTANGLE) fromascii.nw	$(TANGLEOPTS) -L"#line %L "\"fromascii.nw"\"%N"		-Rheader $(CPIF) $@
$(OUTPUT)/getline.h:		getline.nw;	$(NOTANGLE) getline.nw		$(TANGLEOPTS) -L"#line %L "\"getline.nw"\"%N"		-Rheader $(CPIF) $@
$(OUTPUT)/ipipe.h:		ipipe.nw;	$(NOTANGLE) ipipe.nw		$(TANGLEOPTS) -L"#line %L "\"ipipe.nw"\"%N"		-Rheader $(CPIF) $@
$(OUTPUT)/ipipe-lua.h:	ipipe-lua.nw;	$(NOTANGLE) ipipe-lua.nw	$(TANGLEOPTS) -L"#line %L "\"ipipe-lua.nw"\"%N"		-Rheader $(CPIF) $@
$(OUTPUT)/lua-help.h:	lua-help.nw;	$(NOTANGLE) lua-help.nw		$(TANGLEOPTS) -L"#line %L "\"lua-help.nw"\"%N"		-Rheader $(CPIF) $@
$(OUTPUT)/lua-main.h:	lua-main.nw;	$(NOTANGLE) lua-main.nw		$(TANGLEOPTS) -L"#line %L "\"lua-main.nw"\"%N"		-Rheader $(CPIF) $@
$(OUTPUT)/markparse.h:	markparse.nw;	$(NOTANGLE) markparse.nw	$(TANGLEOPTS) -L"#line %L "\"markparse.nw"\"%N"		-Rheader $(CPIF) $@
$(OUTPUT)/markup.h:		markup.nw;	$(NOTANGLE) markup.nw		$(TANGLEOPTS) -L"#line %L "\"markup.nw"\"%N"		-Rheader $(CPIF) $@
$(OUTPUT)/match.h:		match.nw;	$(NOTANGLE) match.nw		$(TANGLEOPTS) -L"#line %L "\"match.nw"\"%N"		-Rheader $(CPIF) $@
$(OUTPUT)/misc-lua.h:	misc-lua.nw;	$(NOTANGLE) misc-lua.nw		$(TANGLEOPTS) -L"#line %L "\"misc-lua.nw"\"%N"		-Rheader $(CPIF) $@
$(OUTPUT)/modtrees.h:	modtrees.nw;	$(NOTANGLE) modtrees.nw		$(TANGLEOPTS) -L"#line %L "\"modtrees.nw"\"%N"		-Rheader $(CPIF) $@
$(OUTPUT)/modules.h:		modules.nw;	$(NOTANGLE) modules.nw		$(TANGLEOPTS) -L"#line %L "\"modules.nw"\"%N"		-Rheader $(CPIF) $@
$(OUTPUT)/mpipe.h:		mpipe.nw;	$(NOTANGLE) mpipe.nw		$(TANGLEOPTS) -L"#line %L "\"mpipe.nw"\"%N"		-Rheader $(CPIF) $@
$(OUTPUT)/mpipe-lua.h:	mpipe-lua.nw;	$(NOTANGLE) mpipe-lua.nw	$(TANGLEOPTS) -L"#line %L "\"mpipe-lua.nw"\"%N"		-Rheader $(CPIF) $@
$(OUTPUT)/notangle.h:	notangle.nw;	$(NOTANGLE) notangle.nw		$(TANGLEOPTS) -L"#line %L "\"notangle.nw"\"%N"		-Rheader $(CPIF) $@
$(OUTPUT)/noweb-lua.h:	noweb-lua.nw;	$(NOTANGLE) noweb-lua.nw	$(TANGLEOPTS) -L"#line %L "\"noweb-lua.nw"\"%N"		-Rheader $(CPIF) $@
$(OUTPUT)/nwbuffer.h:	nwbuffer.nw;	$(NOTANGLE) nwbuffer.nw		$(TANGLEOPTS) -L"#line %L "\"nwbuffer.nw"\"%N"		-Rheader $(CPIF) $@
$(OUTPUT)/nwprocess.h:	nwprocess.nw;	$(NOTANGLE) nwprocess.nw	$(TANGLEOPTS) -L"#line %L "\"nwprocess.nw"\"%N"		-Rheader $(CPIF) $@
$(OUTPUT)/nwtime.h:		nwtime.nw;	$(NOTANGLE) nwtime.nw		$(TANGLEOPTS) -L"#line %L "\"nwtime.nw"\"%N"		-Rheader $(CPIF) $@
$(OUTPUT)/precompiled.h:	precompiled.nw;	$(NOTANGLE) precompiled.nw	$(TANGLEOPTS) -L"#line %L "\"precompiled.nw"\"%N"	-Rheader $(CPIF) $@
$(OUTPUT)/recognize.h:	recognize.nw;	$(NOTANGLE) recognize.nw	$(TANGLEOPTS) -L"#line %L "\"recognize.nw"\"%N"		-Rheader $(CPIF) $@
$(OUTPUT)/stages.h:		stages.nw;	$(NOTANGLE) stages.nw		$(TANGLEOPTS) -L"#line %L "\"stages.nw"\"%N"		-Rheader $(CPIF) $@
$(OUTPUT)/strsave.h:		strsave.nw;	$(NOTANGLE) strsave.nw		$(TANGLEOPTS) -L"#line %L "\"strsave.nw"\"%N"		-Rheader $(CPIF) $@
$(OUTPUT)/sys.h:		sys.nw;		$(NOTANGLE) sys.nw		$(TANGLEOPTS) -L"#line %L "\"sys.nw"\"%N"		-Rheader $(CPIF) $@
$(OUTPUT)/util.h:		util.nw;	$(NOTANGLE) util.nw		$(TANGLEOPTS) -L"#line %L "\"util.nw"\"%N"		-Rheader $(CPIF) $@
$(OUTPUT)/xpipe.h:		xpipe.nw;	$(NOTANGLE) xpipe.nw		$(TANGLEOPTS) -L"#line %L "\"xpipe.nw"\"%N"		-Rheader $(CPIF) $@
$(OUTPUT)/xpipe-lua.h:	xpipe-lua.nw;	$(NOTANGLE) xpipe-lua.nw	$(TANGLEOPTS) -L"#line %L "\"xpipe-lua.nw"\"%N"		-Rheader $(CPIF) $@

################################################################

$(OUTPUT)/columns.c:		columns.nw;	$(NOTANGLE) columns.nw		$(TANGLEOPTS) -L"#line %L "\"columns.nw"\"%N"	$(CPIF) $@
$(OUTPUT)/cpif.c:		cpif.nw;	$(NOTANGLE) cpif.nw		$(TANGLEOPTS) -L"#line %L "\"cpif.nw"\"%N"	$(CPIF) $@
$(OUTPUT)/errors.c:		errors.nw;	$(NOTANGLE) errors.nw		$(TANGLEOPTS) -L"#line %L "\"errors.nw"\"%N"	$(CPIF) $@
$(OUTPUT)/env-lua.c:		env-lua.nw;	$(NOTANGLE) env-lua.nw		$(TANGLEOPTS) -L"#line %L "\"env-lua.nw"\"%N"	$(CPIF) $@
$(OUTPUT)/finduses.c:	finduses.nw;	$(NOTANGLE) finduses.nw		$(TANGLEOPTS) -L"#line %L "\"finduses.nw"\"%N"	$(CPIF) $@
$(OUTPUT)/fromascii.c:	fromascii.nw;	$(NOTANGLE) fromascii.nw	$(TANGLEOPTS) -L"#line %L "\"fromascii.nw"\"%N"	$(CPIF) $@
$(OUTPUT)/getline.c:		getline.nw;	$(NOTANGLE) getline.nw		$(TANGLEOPTS) -L"#line %L "\"getline.nw"\"%N"	$(CPIF) $@
$(OUTPUT)/ipipe.c:		ipipe.nw;	$(NOTANGLE) ipipe.nw		$(TANGLEOPTS) -L"#line %L "\"ipipe.nw"\"%N"	$(CPIF) $@
$(OUTPUT)/ipipe-lua.c:	ipipe-lua.nw;	$(NOTANGLE) ipipe-lua.nw	$(TANGLEOPTS) -L"#line %L "\"ipipe-lua.nw"\"%N"	$(CPIF) $@
$(OUTPUT)/lua-help.c:	lua-help.nw;	$(NOTANGLE) lua-help.nw		$(TANGLEOPTS) -L"#line %L "\"lua-help.nw"\"%N"	$(CPIF) $@
$(OUTPUT)/lua-main.c:	lua-main.nw;	$(NOTANGLE) lua-main.nw		$(TANGLEOPTS) -L"#line %L "\"lua-main.nw"\"%N"	$(CPIF) $@
$(OUTPUT)/main.c:		main.nw;	$(NOTANGLE) main.nw		$(TANGLEOPTS) -L"#line %L "\"main.nw"\"%N"	$(CPIF) $@
$(OUTPUT)/markup.c:		markup.nw;	$(NOTANGLE) markup.nw		$(TANGLEOPTS) -L"#line %L "\"markup.nw"\"%N"	$(CPIF) $@
$(OUTPUT)/markparse.c:	markparse.nw;	$(NOTANGLE) markparse.nw	$(TANGLEOPTS) -L"#line %L "\"markparse.nw"\"%N"	$(CPIF) $@
$(OUTPUT)/misc-lua.c:	misc-lua.nw;	$(NOTANGLE) misc-lua.nw		$(TANGLEOPTS) -L"#line %L "\"misc-lua.nw"\"%N"	$(CPIF) $@
$(OUTPUT)/modtrees.c:	modtrees.nw;	$(NOTANGLE) modtrees.nw		$(TANGLEOPTS) -L"#line %L "\"modtrees.nw"\"%N"	$(CPIF) $@
$(OUTPUT)/modules.c:		modules.nw;	$(NOTANGLE) modules.nw		$(TANGLEOPTS) -L"#line %L "\"modules.nw"\"%N"	$(CPIF) $@
$(OUTPUT)/mpipe.c:		mpipe.nw;	$(NOTANGLE) mpipe.nw		$(TANGLEOPTS) -L"#line %L "\"mpipe.nw"\"%N"	$(CPIF) $@
$(OUTPUT)/mpipe-lua.c:	mpipe-lua.nw;	$(NOTANGLE) mpipe-lua.nw	$(TANGLEOPTS) -L"#line %L "\"mpipe-lua.nw"\"%N"	$(CPIF) $@
$(OUTPUT)/notangle.c:	notangle.nw;	$(NOTANGLE) notangle.nw		$(TANGLEOPTS) -L"#line %L "\"notangle.nw"\"%N"	$(CPIF) $@
$(OUTPUT)/noweb-lua.c:	noweb-lua.nw;	$(NOTANGLE) noweb-lua.nw	$(TANGLEOPTS) -L"#line %L "\"noweb-lua.nw"\"%N"	$(CPIF) $@
$(OUTPUT)/nwbuffer.c:	nwbuffer.nw;	$(NOTANGLE) nwbuffer.nw		$(TANGLEOPTS) -L"#line %L "\"nwbuffer.nw"\"%N"	$(CPIF) $@
$(OUTPUT)/nwbuffer-lua.0:	nwbuffer-lua.nw
	$(NOTANGLE) nwbuffer-lua.nw $(TANGLEOPTS) -R"key macros header" >$(OUTPUT)/nwbuffer-lua.0
$(OUTPUT)/nwbuffer-lua.1:	nwbuffer.nw
	$(NOTANGLE) nwbuffer.nw $(TANGLEOPTS) -R"key macros" >$(OUTPUT)/nwbuffer-lua.1
$(OUTPUT)/nwbuffer-lua.2:	nwbuffer-lua.nw
	$(NOTANGLE) nwbuffer-lua.nw $(TANGLEOPTS) -R"key macros footer" >$(OUTPUT)/nwbuffer-lua.2
$(OUTPUT)/nwbuffer-lua.3:	$(OUTPUT)/nwbuffer-lua.0 $(OUTPUT)/nwbuffer-lua.1 $(OUTPUT)/nwbuffer-lua.2
	more $(OUTPUT)/nwbuffer-lua.0 | $(TOOLS)/tie $(OUTPUT)/nwbuffer-lua.1 $(OUTPUT)/nwbuffer-lua.2 nwbuffer-lua.nw >$(OUTPUT)/nwbuffer-lua.3
$(OUTPUT)/nwbuffer-lua.c: $(OUTPUT)/nwbuffer-lua.3
	$(NOTANGLE) $(OUTPUT)/nwbuffer-lua.3 $(TANGLEOPTS) $(CPIF) $@
$(OUTPUT)/nwprocess.c:	nwprocess.nw;	$(NOTANGLE) nwprocess.nw	$(TANGLEOPTS) -L"#line %L "\"nwprocess.nw"\"%N"	$(CPIF) $@
$(OUTPUT)/nwmtime.c:		nwmtime.nw;	$(NOTANGLE) nwmtime.nw		$(TANGLEOPTS) -L"#line %L "\"nwmtime.nw"\"%N"	$(CPIF) $@
$(OUTPUT)/nwtime.c:		nwtime.nw;	$(NOTANGLE) nwtime.nw		$(TANGLEOPTS) -L"#line %L "\"nwtime.nw"\"%N"	$(CPIF) $@
$(OUTPUT)/recognize.c:	recognize.nw;	$(NOTANGLE) recognize.nw	$(TANGLEOPTS) -L"#line %L "\"recognize.nw"\"%N"	$(CPIF) $@
$(OUTPUT)/stages.c:		stages.nw;	$(NOTANGLE) stages.nw		$(TANGLEOPTS) -L"#line %L "\"stages.nw"\"%N"	$(CPIF) $@
$(OUTPUT)/strsave.c:		strsave.nw;	$(NOTANGLE) strsave.nw		$(TANGLEOPTS) -L"#line %L "\"strsave.nw"\"%N"	$(CPIF) $@
$(OUTPUT)/sys.c:		sys.nw;		$(NOTANGLE) sys.nw		$(TANGLEOPTS) -L"#line %L "\"sys.nw"\"%N"	$(CPIF) $@
$(OUTPUT)/util.c:		util.nw;	$(NOTANGLE) util.nw		$(TANGLEOPTS) -L"#line %L "\"util.nw"\"%N"	$(CPIF) $@
$(OUTPUT)/xpipe.c:		xpipe.nw;	$(NOTANGLE) xpipe.nw		$(TANGLEOPTS) -L"#line %L "\"xpipe.nw"\"%N"	$(CPIF) $@
$(OUTPUT)/xpipe-lua.c:	xpipe-lua.nw;	$(NOTANGLE) xpipe-lua.nw	$(TANGLEOPTS) -L"#line %L "\"xpipe-lua.nw"\"%N"	$(CPIF) $@

################################################################

$(OUTPUT)/columns$(O): $(OUTPUT)/cargs.h $(OUTPUT)/columns.c $(OUTPUT)/columns.h
$(OUTPUT)/cpif$(O): $(OUTPUT)/cpif.c $(OUTPUT)/cpif.h $(OUTPUT)/errors.h $(OUTPUT)/strsave.h
$(OUTPUT)/env-lua$(O): $(OUTPUT)/env-lua.c $(OUTPUT)/env-lua.h $(OUTPUT)/lua-help.h
$(OUTPUT)/errors$(O): $(OUTPUT)/errors.c $(OUTPUT)/errors.h
$(OUTPUT)/finduses$(O): $(OUTPUT)/errors.h $(OUTPUT)/finduses.c $(OUTPUT)/getline.h $(OUTPUT)/match.h $(OUTPUT)/nwbuffer.h $(OUTPUT)/recognize.h
$(OUTPUT)/fromascii$(O): $(OUTPUT)/errors.h $(OUTPUT)/fromascii.c $(OUTPUT)/fromascii.h $(OUTPUT)/getline.h $(OUTPUT)/nwbuffer.h
$(OUTPUT)/getline$(O): $(OUTPUT)/columns.h $(OUTPUT)/errors.h $(OUTPUT)/getline.c $(OUTPUT)/getline.h
$(OUTPUT)/ipipe$(O): $(OUTPUT)/ipipe.c $(OUTPUT)/ipipe.h $(OUTPUT)/nwbuffer.h $(OUTPUT)/nwtime.h
$(OUTPUT)/ipipe-lua$(O): $(OUTPUT)/ipipe-lua.c $(OUTPUT)/ipipe-lua.h
$(OUTPUT)/lua-help$(O): $(OUTPUT)/lua-help.c $(OUTPUT)/lua-help.h
$(OUTPUT)/lua-main$(O): $(OUTPUT)/env-lua.h $(OUTPUT)/ipipe-lua.h $(OUTPUT)/lua-main.c $(OUTPUT)/lua-main.h $(OUTPUT)/misc-lua.h $(OUTPUT)/mpipe-lua.h $(OUTPUT)/noweb-lua.h $(OUTPUT)/stages.h $(OUTPUT)/util.h $(OUTPUT)/xpipe-lua.h
$(OUTPUT)/main$(O): $(OUTPUT)/cargs.h $(OUTPUT)/columns.h $(OUTPUT)/cpif.h $(OUTPUT)/errors.h $(OUTPUT)/main.c $(OUTPUT)/modtrees.h $(OUTPUT)/modules.h $(OUTPUT)/notangle.h $(OUTPUT)/nwbuffer.h
$(OUTPUT)/markparse$(O): $(OUTPUT)/columns.h $(OUTPUT)/errors.h $(OUTPUT)/getline.h $(OUTPUT)/markparse.c $(OUTPUT)/markparse.h $(OUTPUT)/markup.h $(OUTPUT)/nwbuffer.h
$(OUTPUT)/markup$(O): $(OUTPUT)/errors.h $(OUTPUT)/markup.c $(OUTPUT)/markup.h $(OUTPUT)/strsave.h
$(OUTPUT)/misc-lua$(O): $(OUTPUT)/lua-help.h $(OUTPUT)/misc-lua.c $(OUTPUT)/misc-lua.h
$(OUTPUT)/modtrees$(O): $(OUTPUT)/errors.h $(OUTPUT)/modtrees.c $(OUTPUT)/modtrees.h $(OUTPUT)/modules.h $(OUTPUT)/strsave.h
$(OUTPUT)/modules$(O): $(OUTPUT)/columns.h $(OUTPUT)/errors.h $(OUTPUT)/modtrees.h $(OUTPUT)/modules.c $(OUTPUT)/modules.h $(OUTPUT)/strsave.h
$(OUTPUT)/mpipe$(O): $(OUTPUT)/fromascii.h $(OUTPUT)/ipipe.h $(OUTPUT)/mpipe.c $(OUTPUT)/mpipe.h $(OUTPUT)/nwbuffer.h $(OUTPUT)/xpipe.h
$(OUTPUT)/mpipe-lua$(O): $(OUTPUT)/lua-help.h $(OUTPUT)/mpipe.h $(OUTPUT)/mpipe-lua.c $(OUTPUT)/mpipe-lua.h
$(OUTPUT)/notangle$(O): $(OUTPUT)/errors.h $(OUTPUT)/getline.h $(OUTPUT)/match.h $(OUTPUT)/modtrees.h $(OUTPUT)/modules.h $(OUTPUT)/notangle.c $(OUTPUT)/notangle.h $(OUTPUT)/nwbuffer.h $(OUTPUT)/strsave.h
$(OUTPUT)/noweb-lua$(O): $(OUTPUT)/lua-help.h $(OUTPUT)/noweb-lua.c $(OUTPUT)/noweb-lua.h $(OUTPUT)/util.h
$(OUTPUT)/nwbuffer$(O): $(OUTPUT)/nwbuffer.c $(OUTPUT)/nwbuffer.h
$(OUTPUT)/nwbuffer-lua$(O): $(OUTPUT)/lua-help.h $(OUTPUT)/nwbuffer.h $(OUTPUT)/nwbuffer-lua.c
$(OUTPUT)/nwmtime$(O): $(OUTPUT)/getline.h $(OUTPUT)/nwmtime.c
$(OUTPUT)/nwprocess$(O): $(OUTPUT)/nwprocess.c $(OUTPUT)/nwprocess.h
$(OUTPUT)/nwtime$(O): $(OUTPUT)/nwtime.c $(OUTPUT)/nwtime.h
$(OUTPUT)/recognize$(O): $(OUTPUT)/recognize.c
$(OUTPUT)/stages$(O): $(OUTPUT)/cargs.h $(OUTPUT)/fromascii.h $(OUTPUT)/lua-help.h $(OUTPUT)/markparse.h $(OUTPUT)/notangle.h $(OUTPUT)/nwbuffer.h $(OUTPUT)/stages.c $(OUTPUT)/stages.h
$(OUTPUT)/strsave$(O): $(OUTPUT)/errors.h $(OUTPUT)/strsave.c $(OUTPUT)/strsave.h
$(OUTPUT)/sys$(O): $(OUTPUT)/sys.c $(OUTPUT)/sys.h
$(OUTPUT)/util$(O): $(OUTPUT)/precompiled.h $(OUTPUT)/sys.h $(OUTPUT)/util.c $(OUTPUT)/util.h
$(OUTPUT)/xpipe$(O): $(OUTPUT)/errors.h $(OUTPUT)/nwprocess.h $(OUTPUT)/sys.h $(OUTPUT)/util.h $(OUTPUT)/xpipe.c $(OUTPUT)/xpipe.h
$(OUTPUT)/xpipe-lua$(O): $(OUTPUT)/cargs.h $(OUTPUT)/lua-help.h $(OUTPUT)/xpipe.h $(OUTPUT)/xpipe-lua.c $(OUTPUT)/xpipe-lua.h
