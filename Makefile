FILE=proposta
LATEX=${FILE}.tex
DVI=${FILE}.dvi
PS=${FILE}.ps
PDF=proposta.pdf

forsure: all

all: pdf
	mv -f ${FILE}.pdf ${PDF} 
	[ -d logs ] || mkdir logs
	mv -f *.blg *.bbl *.aux *.log logs/

pdf: bib
	pdflatex ${FILE}

bib: ${LATEX}
	pdflatex ${LATEX}
	bibtex ${FILE}
	pdflatex ${LATEX}

clean:
	rm -rf *.blg *.bbl *.aux *.dvi *.log *.ps logs
