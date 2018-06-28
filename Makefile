# Makefile for CTWILL
CFLAGS = -g
CWEBINPUTS = /usr/local/lib/cweb

ALL = Makefile cweave.w common.w common.h prod.w \
      ctwill.w cweav-twill.ch prod-twill.w prod-twill.ch \
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

all: ctwill refsort twinx

# Stuff from original CWEB
cweave.w common.w common.h prod.w:
	cp ../cweb/$@ .

ctwill.w: cweave.w cweav-twill.ch
	tie -m $@ $^

cweav-twill.ch: prod-twill.w

prod-twill.w: prod.w prod-twill.ch
	tie -m $@ $^

ctwill: ctwill.o common.o
	cc $(CFLAGS) -o ctwill ctwill.o common.o

ctwill.c: prod-twill.w common.h

common.o: common.c
	$(CC) $(CFLAGS) -DCWEBINPUTS=\"$(CWEBINPUTS)\" -c common.c

refsort: refsort.o
	cc $(CFLAGS) -o refsort refsort.o

twinx: twinx.o
	cc $(CFLAGS) -o twinx twinx.o

clean:
	rm -f -r *~ *.o ctwill.tex \
	  *.log *.dvi *.toc *.idx *.scn core ctwill refsort twinx

veryclean: clean
	rm -f *.c common.w common.h prod.w prod-twill.w cweave.w ctwill.w

floppy: $(ALL)
	bar cvf /dev/rfd0 $(ALL)
	bar tvf /dev/rfd0
	eject

tarfile: $(ALL)
	tar cvhf /tmp/ctwill.tar $(ALL)
	gzip -9 /tmp/ctwill.tar
