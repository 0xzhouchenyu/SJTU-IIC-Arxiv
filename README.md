<p align="center">
  <img src="figs/sjtu-iic-logo.png" width="360" alt="SJTU-IIC logo">
</p>

# SJTU-IIC-Arxiv

Reusable public arXiv LaTeX template for SJTU-IIC papers.

This repository packages the SJTU-IIC arXiv style, header assets, and a minimal
paper scaffold. New papers should start from this repository instead of copying
style files from an existing manuscript.

## Quick Start

Clone the template and compile the example:

```bash
git clone https://github.com/0xzhouchenyu/SJTU-IIC-Arxiv.git
cd SJTU-IIC-Arxiv
make pdf
```

The main entry point is `main.tex`. On Overleaf, upload the repository contents
and set `main.tex` as the main document.

## Repository Layout

```text
.
  main.tex                 Example manuscript entry point
  sjtu_iic_arxiv.sty       SJTU-IIC public arXiv style
  refs.bib                 Example bibliography
  sections/                Example section files
  figs/                    Header and resource-link assets
  Makefile                 Local build and arXiv source packaging helpers
```

## Template Conventions

- Put title, author, affiliation, header, and resource metadata in `main.tex`.
- Keep reusable notation in a separate file only when a paper needs it.
- Keep generated PDFs and LaTeX intermediates out of git.
- Use `\githublink{...}` and `\huggingfacelink{...}` only when the paper has
  public resources ready to show in the abstract box.
- Add `\paperurl{https://arxiv.org/abs/xxxx.xxxxx}` after an arXiv identifier is
  assigned.

## Build Targets

```bash
make pdf       # compile main.tex
make clean     # remove auxiliary files
make cleanall  # remove auxiliary files and generated PDF
make arxiv     # compile, generate .bbl, and create the arXiv source zip
```

Before submitting to arXiv, inspect the generated source zip and compile from a
fresh copy.

## License

The LaTeX template code is released under the MIT License. The SJTU and
SJTU-IIC logos under `figs/` are included only for preparing SJTU-IIC
manuscripts and remain marks of their respective owners.
