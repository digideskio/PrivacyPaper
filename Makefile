SOURCES=$(wildcard PrivacyPaper.tex)
TARGETS=$(SOURCES:.tex=.pdf)

all: $(TARGETS)

%.pdf: %.tex
	latexmk -bibtex -pv -pdf $(<:.tex=)

watch: $(SOURCES)
	latexmk -bibtex -pvc -pdf $(<:.tex=)

clean:
	latexmk -C -bibtex -pdf
