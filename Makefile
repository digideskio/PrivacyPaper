SOURCES=$(wildcard PrivacyPaper.tex)
TARGETS=$(SOURCES:.tex=.pdf)

all: $(TARGETS)

%.pdf: %.tex
	pdflatex $(<:.tex=)
	bibtex $(<:.tex=)
	pdflatex $(<:.tex=)
	pdflatex $(<:.tex=)

clean:
	rm -f *.aux *.bbl *.blg *.log *.out *.pdf
