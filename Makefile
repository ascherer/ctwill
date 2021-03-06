# Makefile for CTWILL
CFLAGS = -g
CWEBINPUTS = /usr/local/lib/cweb

ALL = Makefile ctwill.w common.w common.h prod.w ctwill.diffs prod.diffs \
      proofmac.tex ctwimac.tex refsort.w twinx.w twinxmac.tex

.SUFFIXES: .dvi .tex .w .ref .sref

.w.tex:
	cweave $*.w

.tex.dvi:	
	tex $*.tex

.w.dvi:
	make $*.tex
	make $*.dvi

.w.c:
	ctangle $*.w

.w.o:
	make $*.c
	make $*.o

.ref.sref:
	refsort < $*.ref > $*.sref

ctwill: ctwill.o common.o
	cc $(CFLAGS) -o ctwill ctwill.o common.o

ctwill.c: prod.w common.h

common.o: common.c
	$(CC) $(CFLAGS) -DCWEBINPUTS=\"$(CWEBINPUTS)\" -c common.c

prod.w:
	cp ../cweb/prod.w .

refsort: refsort.o
	cc $(CFLAGS) -o refsort refsort.o

twinx: twinx.o
	cc $(CFLAGS) -o twinx twinx.o

clean:
	rm -f -r *~ *.o ctwill.tex \
	  *.log *.dvi *.toc *.idx *.scn core ctwill refsort twinx

floppy: $(ALL)
	bar cvf /dev/rfd0 $(ALL)
	bar tvf /dev/rfd0
	eject

tarfile: $(ALL)
	tar cvhf /tmp/ctwill.tar $(ALL)
	gzip -9 /tmp/ctwill.tar
