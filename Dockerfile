# docker build -t build_slides . && docker run --rm -v .:/data build_slides

FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive 
RUN apt-get update && apt-get install -y git inkscape python3 python3-pip texlive-latex-base && rm -rf /var/lib/apt/lists/*
RUN python3 -m pip install --upgrade pip
RUN pip install lxml

WORKDIR /home/presenter
RUN git clone https://github.com/johannes-graeter/inkslides.git

WORKDIR /home/presenter/inkslides
RUN python3 setup.py install

WORKDIR /data
CMD ["/bin/bash", "make_verteidigung.sh"]
