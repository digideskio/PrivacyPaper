SOURCES=$(wildcard *.gnuplot)
TARGETS=$(SOURCES:.gnuplot=.tex) $(SOURCES:.gnuplot=.pdf)

all: notice $(TARGETS)

notice:
	@echo "NOTE: You may have to run make twice (when make complains)"

%.tex: %.gnuplot
	gnuplot $<

%.eps: %.tex

%.pdf: %.eps %.tex
	epstopdf $<

clean:
	rm -f *.tex
	rm -f *.eps
	rm -f *.pdf
