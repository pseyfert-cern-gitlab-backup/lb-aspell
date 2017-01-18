# lb-aspell

A small aspell integration for the LHCb document templates.

## Assumptions

 * All tex files are in the main directory and the skippable files are the
   non-text .tex files from the template. Extensions to `$(shell find . -name
   *.tex)` are certainly possible (though might require filtering tikz files).

```Makefile
CHECKFILES := $(wildcard *.tex)
CHECKFILES := $(filter-out LHCb_authorlist.tex lhcb-symbols-def.tex main.tex preamble.tex wordcount.tex  title-LHCb-ANA.tex title-LHCb-CONF.tex title-LHCb-INT.tex title-LHCb-PAPER.tex acknowledgements.tex main-prl.tex, $(CHECKFILES))
```

 * You write GB English

## USAGE

In the current version it is assumed your repository is the `latex` directory
of the template, i.e. not residing in a subdirectory. Otherwise the
`.gitlab-ci.yml` needs to be adapted.

Add the aspell configuration to the template's `Makefile` with

```Makefile
include aspell.mk
```

## Note

I also added the following to the Makefile

```Makefile
.DELETE_ON_ERROR:
```

## Work needed

Having to copy these files into every project is obviously not idea.
Similarly, hand editing the main project's Makefile seems suboptimal.

I'm open to suggestions by issue or merge request - or email in case you don't
have a cern computing account and don't want to create a lightweight account.
