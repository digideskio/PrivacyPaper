SOURCES=$(wildcard *.gnuplot)
TARGETS=$(SOURCES:.gnuplot=.tex) $(SOURCES:.gnuplot=.pdf)

all: notice $(TARGETS) user_agents_table.tex 

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


user_agents_table.tex: ../data/user_agents.txt
	cat ../data/user_agents.txt | sed 's/|/ \& /g ; s/$$/\\\\/' > user_agents_table.tex

