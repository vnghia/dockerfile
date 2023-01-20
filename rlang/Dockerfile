FROM eddelbuettel/r2u:22.04

COPY packages.r packages.r

RUN Rscript packages.r

COPY requirements.txt requirements.txt

RUN apt update && \
  apt install -y python3-pip python-is-python3 && \
  pip install -r requirements.txt

RUN apt update && \
  apt install -y pandoc texlive-bibtex-extra \
  biber texlive-fonts-recommended \
  texlive-latex-recommended texlive-latex-extra \
  texlive-science lmodern texlive-luatex && \
  tlmgr init-usertree
