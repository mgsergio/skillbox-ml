#!bash
jupyter-nbconvert --to html kiva.ipynb
/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome \
  --headless \
  --disable-gpu \
  --no-margins \
  --print-to-pdf-no-header \
  --print-to-pdf kiva.html
