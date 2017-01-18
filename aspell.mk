%.interactive-spellcheck: %.tex
	aspell -t -d en_GB -p ./.aspell.en.pws -c $<

%.batch-spellcheck: %.tex
	./spellcheck.sh $<

CHECKFILES := $(wildcard *.tex)
CHECKFILES := $(filter-out LHCb_authorlist.tex lhcb-symbols-def.tex main.tex preamble.tex wordcount.tex  title-LHCb-ANA.tex title-LHCb-CONF.tex title-LHCb-INT.tex title-LHCb-PAPER.tex acknowledgements.tex main-prl.tex, $(CHECKFILES))

interactive-spellcheck: $(CHECKFILES:%.tex=%.interactive-spellcheck)
batch-spellcheck: $(CHECKFILES:%.tex=%.batch-spellcheck)

# if pdflatex fails, the output pdf file does not get deleted (as opposed to gcc)
# force target deletion with:
.DELETE_ON_ERROR:
