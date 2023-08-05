FROM r-base:4.3.1

# bspm
RUN Rscript -e 'install.packages(c("bspm"))' \
  && rm -rf /var/lib/apt/lists/*

# languageserver
RUN Rscript -e 'install.packages(c("languageserver"))' \
  && rm -rf /var/lib/apt/lists/*

# tidyverse
RUN Rscript -e 'install.packages(c("dplyr", "reshape2", "tidyverse"))' \
  && rm -rf /var/lib/apt/lists/*

# python3 and common packages
ENV VIRTUAL_ENV=/opt/venv
ENV PATH="$VIRTUAL_ENV/bin:$PATH"
RUN apt-get update && apt-get install -y --no-install-recommends \
  python-is-python3 python3-dev python3-pip python3-venv \
  && python -m venv $VIRTUAL_ENV \
  && pip install --no-cache-dir numpy pandas jupyterlab radian \
  && Rscript -e 'install.packages(c("reticulate", "IRkernel")); IRkernel::installspec()' \
  && rm -rf /var/lib/apt/lists/*

# ggplot2
RUN Rscript -e 'install.packages(c("ggplot2", "hrbrthemes", "scico", "patchwork"))' \
  && rm -rf /var/lib/apt/lists/*

# tinytex
RUN Rscript -e 'install.packages(c("tinytex")); library(tinytex); install_tinytex(force = TRUE); tlmgr_install(c("biblatex"))' \
  && rm -rf /var/lib/apt/lists/*

# tikz
RUN Rscript -e 'library(tinytex); tlmgr_install(c("pgf", "preview", "xcolor")); parse_install(files = c("grfext.sty", "luatex85.sty"))' \
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
