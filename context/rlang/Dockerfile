FROM eddelbuettel/r2u:22.04

COPY packages.r packages.r

RUN Rscript packages.r && rm -rf /var/lib/apt/lists/*

ENV PATH="${PATH}:/root/bin/"

COPY requirements.txt requirements.txt

RUN apt update && \
  apt install -y --no-install-recommends pandoc && \
  rm -rf /var/lib/apt/lists/*

RUN apt update && \
  apt install -y --no-install-recommends git && \
  apt install -y --no-install-recommends \
  python3-pip python-is-python3 python3-dev && \
  rm -rf /var/lib/apt/lists/* && \
  pip install -r requirements.txt

RUN echo "alias r=radian" >> ~/.bashrc
