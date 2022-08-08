rm -f *.pdf
rm -f *.tex

pandoc BOOK.md -s -o PU-FinTech.pdf
pandoc BOOK.md -s -o PU-FinTech.tex
