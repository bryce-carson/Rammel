include ../nwconfig

CONFIG=	$(OUTPUT)/pipes.cfg \
	$(OUTPUT)/sys.cfg \
	$(OUTPUT)/noweb.cfg \
	$(OUTPUT)/util.cfg \
	$(OUTPUT)/list.nws \
	$(OUTPUT)/set.nws

FILTERS=	$(OUTPUT)/cat.nws \
		$(OUTPUT)/stripconds.nws \
		$(OUTPUT)/xchunks.nws \
		$(OUTPUT)/lines.nws

STAGES=	$(OUTPUT)/totex.nws \
	$(OUTPUT)/tohtml.nws \
	$(OUTPUT)/noidx.nws \
	$(OUTPUT)/elide.nws \
	$(OUTPUT)/unmarkup.nws \
	$(FILTERS)

SCRIPTS=	$(OUTPUT)/tangle \
		$(OUTPUT)/weave

all: $(CONFIG) $(STAGES) $(SCRIPTS)

test: $(CONFIG) $(STAGES) $(SCRIPTS)
	@echo 'write("Scripts load from .\n")' | NWPATH=. no
	@echo 'argv = {"-internaldefaults", "-n", "-html", "/dev/null"}; do_nwfile("weave.nws"); write("Null weave OK.\n")' | NWPATH=. no
	@echo 'argv = {"-internal", "test.nw"}; do_nwfile("tangle.nws"); write("Null tangle OK.\n")' | NWPATH=. no

htmltest: $(CONFIG) $(STAGES) $(SCRIPTS)
	@echo 'testfile("/home/nr/www/noweb/index.html")' | NWPATH=. no

clean:

clobber: clean
	-$(RM) $(CONFIG) $(FILTERS) $(STAGES) $(SCRIPTS) 2>$(NUL)

install: $(SCRIPTS) $(CONFIG) $(STAGES)
	for i in $(CONFIG) $(STAGES); do sed 's@|LIBDIR|@$(LIB2)@g' $$i > $(LIB3)/$$i; done
	for i in $(SCRIPTS); do cp $$i $(LIB3)/`basename $$i .nws`; done

$(OUTPUT)/pipes.cfg:		config.nw;	$(NOTANGLE) config.nw		$(TANGLEOPTS) -Rpipes.cfg	$(CPIF) $@
$(OUTPUT)/sys.cfg:		config.nw;	$(NOTANGLE) config.nw		$(TANGLEOPTS) -Rsys.cfg		$(CPIF) $@
$(OUTPUT)/noweb.cfg:		config.nw;	$(NOTANGLE) config.nw		$(TANGLEOPTS) -Rnoweb.cfg	$(CPIF) $@
$(OUTPUT)/util.cfg:		config.nw;	$(NOTANGLE) config.nw		$(TANGLEOPTS) -Rutil.cfg	$(CPIF) $@
$(OUTPUT)/list.nws:		list.nw;	$(NOTANGLE) list.nw		$(TANGLEOPTS) $(CPIF) $@
$(OUTPUT)/set.nws:		set.nw;		$(NOTANGLE) set.nw		$(TANGLEOPTS) $(CPIF) $@
$(OUTPUT)/totex.nws:		totex.nw;	$(NOTANGLE) totex.nw		$(TANGLEOPTS) $(CPIF) $@
$(OUTPUT)/tohtml.nws:	tohtml.nw;	$(NOTANGLE) tohtml.nw		$(TANGLEOPTS) $(CPIF) $@
$(OUTPUT)/noidx.nws:		noidx.nw;	$(NOTANGLE) noidx.nw		$(TANGLEOPTS) $(CPIF) $@
$(OUTPUT)/elide.nws:		elide.nw;	$(NOTANGLE) elide.nw		$(TANGLEOPTS) $(CPIF) $@
$(OUTPUT)/unmarkup.nws:	unmarkup.nw;	$(NOTANGLE) unmarkup.nw		$(TANGLEOPTS) $(CPIF) $@
$(OUTPUT)/cat.nws:		cat.nw;		$(NOTANGLE) cat.nw		$(TANGLEOPTS) $(CPIF) $@
$(OUTPUT)/stripconds.nws:	stripconds.nw;	$(NOTANGLE) stripconds.nw	$(TANGLEOPTS) $(CPIF) $@
$(OUTPUT)/xchunks.nws:	xchunks.nw;	$(NOTANGLE) xchunks.nw		$(TANGLEOPTS) $(CPIF) $@
$(OUTPUT)/lines.nws:		lines.nw;	$(NOTANGLE) lines.nw		$(TANGLEOPTS) $(CPIF) $@
$(OUTPUT)/tangle:		tangle.nw;	$(NOTANGLE) tangle.nw		$(TANGLEOPTS) $(CPIF) $@
$(OUTPUT)/weave:		weave.nw;	$(NOTANGLE) weave.nw		$(TANGLEOPTS) $(CPIF) $@

################################################################
#

noidx.tex: noidx.nw
	noweave -delay -x -filter 'elide hackers:*' noidx.nw > noidx.tex
