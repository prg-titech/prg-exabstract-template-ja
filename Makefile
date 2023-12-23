MAKEFLAGS += --silent

DOC := ex_abstract
LATEX := platex
LFLAGS := -halt-on-error -synctex=1 -kanji=UTF8
BIBTEX := pbibtex
DVIPDF := dvipdfmx

.SUFFIXES: .bib .tex .dvi .pdf

all: ex_abstract

ex_abstract: $(DOC).tex
	$(LATEX) $(LFLAGS) $(DOC)
	-$(BIBTEX) $(DOC)
	$(LATEX) $(LFLAGS) $(DOC)
	$(LATEX) $(LFLAGS) $(DOC)
	$(DVIPDF) $(DOC)

clean:
	rm -f *.pdf *.out *.aux *.bbl *.blg *.log *.toc *.ptb *.tod *.fls *.fdb_latexmk *.lof *.lot *.dvi *.synctex.gz

.PHONY: all clean distclean
