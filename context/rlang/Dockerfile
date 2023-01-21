FROM eddelbuettel/r2u:22.04

COPY packages.r packages.r

RUN Rscript packages.r

COPY requirements.txt requirements.txt

RUN apt update && \
  apt install -y pandoc

RUN apt update && \
  apt install -y python3-pip python-is-python3 python3-dev && \
  pip install -r requirements.txt

RUN echo "alias r=radian" >> ~/.bashrc
