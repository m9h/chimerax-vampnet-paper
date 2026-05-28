# Build the chimerax-vampnet research-plan paper with tectonic.
#
#   make           build paper.pdf
#   make watch     auto-rebuild on file changes (needs entr or watchexec)
#   make clean     remove build artifacts

TECTONIC ?= tectonic
TEX      := paper.tex
OUT      := paper.pdf

.PHONY: all clean watch
all: $(OUT)

$(OUT): $(TEX) references.bib
	$(TECTONIC) --keep-logs --reruns 4 $(TEX)

watch:
	@command -v entr >/dev/null 2>&1 || { echo "entr not installed; install with: apt install entr"; exit 1; }
	ls $(TEX) references.bib | entr -c $(MAKE)

clean:
	rm -f $(OUT) paper.log paper.aux paper.bbl paper.blg paper.fls paper.out paper.toc
