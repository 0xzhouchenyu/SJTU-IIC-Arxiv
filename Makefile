MAIN ?= main
LATEXMK ?= latexmk

.PHONY: pdf clean cleanall arxiv

pdf:
	$(LATEXMK) -pdf -interaction=nonstopmode -halt-on-error $(MAIN).tex

clean:
	$(LATEXMK) -c $(MAIN).tex

cleanall:
	$(LATEXMK) -C $(MAIN).tex

arxiv: pdf
	rm -rf _build/arxiv_submission
	mkdir -p _build/arxiv_submission
	rsync -a \
		--exclude='.git/***' \
		--exclude='_build/***' \
		--exclude='$(MAIN).pdf' \
		--include='*/' \
		--include='*.tex' \
		--include='*.sty' \
		--include='*.cls' \
		--include='*.bst' \
		--include='*.bib' \
		--include='*.bbl' \
		--include='*.png' \
		--include='*.pdf' \
		--include='*.jpg' \
		--include='*.jpeg' \
		--exclude='*' \
		./ _build/arxiv_submission/
	cd _build && zip -qr SJTU-IIC-Arxiv-source.zip arxiv_submission
