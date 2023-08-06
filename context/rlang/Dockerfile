FROM r-base:4.3.1

# bspm
RUN apt-get update && apt-get install -y --no-install-recommends \
  python3-apt \
  && Rscript -e 'install.packages(c("bspm"))' \
  && echo "suppressMessages(bspm::enable())" | tee -a /etc/R/Rprofile.site \
  && echo "options(install.packages.compile.from.source = 'never')" | tee -a /etc/R/Rprofile.site \
  && rm -rf /var/lib/apt/lists/*

# languageserver
RUN apt-get update \
  && Rscript -e 'install.packages(c("languageserver"))' \
  && rm -rf /var/lib/apt/lists/*

# tidyverse
RUN apt-get update \
  && Rscript -e 'install.packages(c("dplyr", "reshape2", "tidyverse"))' \
  && rm -rf /var/lib/apt/lists/*

# python3 and common packages
ENV VIRTUAL_ENV=/opt/venv
ENV PATH="$VIRTUAL_ENV/bin:$PATH"
RUN apt-get update && apt-get install -y --no-install-recommends \
  python-is-python3 python3-dev python3-pip python3-venv \
  && python -m venv $VIRTUAL_ENV \
  && pip install --no-cache-dir numpy pandas jupyterlab radian \
  && Rscript -e 'install.packages(c("reticulate", "IRkernel")); IRkernel::installspec()' \
  && echo "reticulate::use_virtualenv('$VIRTUAL_ENV', required = TRUE)" | tee -a /etc/R/Rprofile.site \
  && rm -rf /var/lib/apt/lists/*

# ggplot2
RUN apt-get update \
  && Rscript -e 'install.packages(c("ggplot2", "hrbrthemes", "scico", "patchwork"))' \
  && rm -rf /var/lib/apt/lists/*

# rmarkdown
RUN apt-get update && apt-get install -y --no-install-recommends \
  pandoc \
  && Rscript -e 'install.packages(c("rmarkdown", "bookdown", "kableExtra"))' \
  && rm -rf /var/lib/apt/lists/*

# tinytex
RUN apt-get update \
  && Rscript -e 'install.packages(c("tinytex")); library(tinytex); install_tinytex(force = TRUE); tlmgr_install(c("biblatex"))' \
  && rm -rf /var/lib/apt/lists/*

# tikz
RUN apt-get update \
  && Rscript -e 'install.packages(c("tikzDevice")); library(tinytex); tlmgr_install(c("pgf", "preview", "xcolor")); parse_install(files = c("grfext.sty", "luatex85.sty"))' \
  && echo "options(tikzLatex = '/root/bin/pdflatex')" | tee -a /etc/R/Rprofile.site \
  && echo "options(tikzXelatex = '/root/bin/xelatex')" | tee -a /etc/R/Rprofile.site \
  && echo "options(tikzLualatex = '/root/bin/lualatex')" | tee -a /etc/R/Rprofile.site \
  && rm -rf /var/lib/apt/lists/*

# biber
# TODO: https://tex.stackexchange.com/questions/640197/no-biber-executable-but-tlmgr-claims-its-installed
RUN apt-get update && apt-get install -y --no-install-recommends \
  wget perl ca-certificates build-essential \
  libbtparse-dev libssl-dev \
  && mkdir -p /opt/biber \
  && wget https://github.com/plk/biber/archive/refs/tags/v2.19.tar.gz -O - \
  | tar -xz --strip-components 1 -C /opt/biber \
  && cd /opt/biber/ \
  && cpan -T Module::Build XML::LibXML \
  && perl Build.PL \
  && ./Build installdeps --cpan_client 'cpan -T' \
  && ./Build install \
  && rm -rf /opt/biber \
  && rm -rf /var/lib/apt/lists/*
