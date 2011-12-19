FILE=proposta
LATEX=${FILE}.tex
DVI=${FILE}.dvi
PS=${FILE}.ps
PDF=proposta.pdf

forsure: all

all: pdf
	mv -f ${FILE}.pdf ${PDF} 
	[ -d logs ] || mkdir logs
	mv -f *.blg *.bbl *.aux *.dvi *.log *.ps logs

pdf:ps
	ps2pdf ${PS}

ps:dvi
	dvips ${DVI}


dvi: ${LATEX} bib
	latex ${LATEX}

bib: ${LATEX}
	latex ${LATEX}
	bibtex ${FILE}
	latex ${LATEX}

clean:
	rm -rf *.blg *.bbl *.aux *.dvi *.log *.ps logs
