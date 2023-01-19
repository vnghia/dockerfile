FROM r-base:4.2.2

RUN apt update && \
  # reticulate
  apt install -y libpng-dev && \
  # tidyverse
  apt install -y zlib1g-dev libcurl4-openssl-dev libssl-dev libxml2-dev && \
  # kableExtra
  apt install -y texlive-plain-generic libfontconfig1-dev

COPY packages.r packages.r

RUN Rscript packages.r

RUN apt update && \
  apt install -y python3-pip && \
  pip install numpy radian

RUN apt update && \
  apt install -y pandoc texlive-bibtex-extra \
  biber texlive-fonts-recommended \
  texlive-latex-recommended texlive-latex-extra \
  texlive-science lmodern texlive-luatex && \
  tlmgr init-usertree
