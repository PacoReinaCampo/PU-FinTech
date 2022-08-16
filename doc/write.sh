rm -f *.pdf
rm -f *.tex

pandoc PRELUDE-TT.md -s -o PU-TT-NTM.pdf
pandoc BOOK.md -s -o PU-FinTech.pdf

pandoc PRELUDE-TT.md -s -o PU-TT-NTM.tex
pandoc BOOK.md -s -o PU-FinTech.tex
