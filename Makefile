
# __  __       _         __ _ _      
#|  \/  | __ _| | _____ / _(_) | ___ 
#| |\/| |/ _` | |/ / _ \ |_| | |/ _ \
#| |  | | (_| |   <  __/  _| | |  __/
#|_|  |_|\__,_|_|\_\___|_| |_|_|\___|
#                                    

###################################################

PDFEXE    = pdflatex --shell-escape
BIBEXE    = bibtex
PDFTEST   = mupdf

TEXSRC    = cv.tex
BIBSRC    = bibliography.bib
SVGSRC    = $(shell /bin/ls --color=none \
	    | /bin/grep --color=none ".svg")

OUTFILE   = ${TEXSRC:.tex=.pdf}
ENDFILE   = amlesh_resume.pdf

MISCFILE  = ${TEXSRC:.tex=.aux} \
	    ${TEXSRC:.tex=.log} \
	    ${TEXSRC:.tex=.dvi} \
	    ${TEXSRC:.tex=.out} \
	    ${TEXSRC:.tex=.bbl} \
	    ${TEXSRC:.tex=.blg} \
	    ${TEXSRC:.tex=.toc} \

MAKEARGS  = --no-print-directory -C

####################################################

${OUTFILE}: ${TEXSRC} ${BIBSRC}
	-${PDFEXE} ${TEXSRC}
	-${BIBEXE} ${TEXSRC:.tex=.aux}
	-${PDFEXE} ${TEXSRC}
	-${PDFEXE} ${TEXSRC}
	mv ${OUTFILE} ${ENDFILE}

pdf: ${OUTFILE}
	-${PDFTEST} ${ENDFILE}

refresh: spotless pdf

clean:
	-rm ${SVGSRC:.svg=.pdf}
	-rm ${SVGSRC:.svg=.pdf_tex}
	-rm -fv ${MISCFILE}
	-rm -rfv _minted*/

spotless: clean 
	-rm ${OUTFILE}
#	-rm ${ENDFILE}

ci: spotless
	git add .
	git commit -e
