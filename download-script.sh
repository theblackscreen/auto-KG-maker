# downloading the legislative documents
mkdir legislative
cd legislative
curl -o one.pdf "https://ec.europa.eu/transparency/documents-register/api/files/PV(2021)2401?ersIds=090166e5e7856d91"
curl -o two.pdf "https://ec.europa.eu/transparency/documents-register/api/files/PV(2021)2402?ersIds=090166e5e7857cee"
curl -o three.pdf "https://ec.europa.eu/transparency/documents-register/api/files/PV(2021)2400?ersIds=090166e5e731a763"
curl -o four.pdf "https://ec.europa.eu/transparency/documents-register/api/files/PV(2021)2399?ersIds=090166e5e730f4f0"
curl -o five.pdf "https://ec.europa.eu/transparency/documents-register/api/files/PV(2021)2397?ersIds=090166e5e64abd26"

pdftotext one.pdf
pdftotext two.pdf
pdftotext three.pdf
pdftotext four.pdf
pdftotext five.pdf

# moving the processed files to the txts directory
mkdir txts
mv one.txt txts/one.txt
mv two.txt txts/two.txt
mv three.txt txts/three.txt
mv four.txt txts/four.txt
mv five.txt txts/five.txt
cd ..

# downloading fiction books
mkdir fiction
cd fiction
curl -o one.txt https://gutenberg.org/files/15/15-0.txt
curl -o two.txt https://gutenberg.org/cache/epub/1257/pg1257.txt
curl -o three.txt https://gutenberg.org/files/2759/2759-0.txt
curl -o four.txt https://gutenberg.org/files/53341/53341-0.txt
curl -o five.txt https://gutenberg.org/files/560/560-0.txt

# moving the processed files to the txts directory
mkdir txts
mv one.txt txts/one.txt
mv two.txt txts/two.txt
mv three.txt txts/three.txt
mv four.txt txts/four.txt
mv five.txt txts/five.txt
cd ..

# downloading the NLP papers
mkdir nlp-papers
cd nlp-papers
curl -o one.pdf https://arxiv.org/pdf/2202.00540.pdf
curl -o two.pdf https://arxiv.org/pdf/2202.00528.pdf
curl -o three.pdf https://arxiv.org/pdf/2202.01035.pdf
curl -o four.pdf https://arxiv.org/pdf/2202.01771.pdf
curl -o five.pdf https://arxiv.org/pdf/2202.03418.pdf

pdftotext one.pdf
pdftotext two.pdf
pdftotext three.pdf
pdftotext four.pdf
pdftotext five.pdf

# moving the processed files to the txts directory
mkdir txts
mv one.txt txts/one.txt
mv two.txt txts/two.txt
mv three.txt txts/three.txt
mv four.txt txts/four.txt
mv five.txt txts/five.txt
cd ..

# downloading the newspaper articles
mkdir news-articles
cd news-articles
curl -o one.pdf https://dds.crl.edu/page/download/39901
curl -o two.pdf https://dds.crl.edu/page/download/39902
curl -o three.pdf https://dds.crl.edu/page/download/39903
curl -o four.pdf https://dds.crl.edu/page/download/39904
curl -o five.pdf https://dds.crl.edu/page/download/39905

pdftotext one.pdf
pdftotext two.pdf
pdftotext three.pdf
pdftotext four.pdf
pdftotext five.pdf

# moving the processed files to the txts directory
mkdir txts
mv one.txt txts/one.txt
mv two.txt txts/two.txt
mv three.txt txts/three.txt
mv four.txt txts/four.txt
mv five.txt txts/five.txt
cd ..

# download wikipedia articles
mkdir wiki-articles
cd wiki-articles
curl -o one.html "https://en.wikipedia.org/w/index.php?title=Aesara&oldid=1058366823"
curl -o two.html "https://en.wikipedia.org/w/index.php?title=Slate_and_stylus&oldid=1045424053"
curl -o three.html "https://en.wikipedia.org/w/index.php?title=Perfect_phylogeny&oldid=1044079338"
curl -o four.html "https://en.wikipedia.org/w/index.php?title=Hanelle_Culpepper&oldid=1063454313"
curl -o five.html "https://en.wikipedia.org/w/index.php?title=Mount_Wow&oldid=1009579137"

pandoc one.html --output one.txt
pandoc two.html  --output two.txt
pandoc three.html --output three.txt
pandoc four.html  --output four.txt
pandoc five.html  --output five.txt

# moving the processed files to the txts directory
mkdir txts
mv one.txt txts/one.txt
mv two.txt txts/two.txt
mv three.txt txts/three.txt
mv four.txt txts/four.txt
mv five.txt txts/five.txt
cd ..
