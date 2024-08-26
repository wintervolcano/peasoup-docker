FROM nvidia/cuda:12.0.0-devel-ubuntu22.04

RUN apt-get update &&\
    apt-get install -y --no-install-recommends \
    git \   
    ca-certificates

WORKDIR /software/

RUN git clone https://github.com/wintervolcano/dedisp.git && \
    cd dedisp &&\
    git checkout arch-sm89 && \
    make -j 32 && \
    make install 

RUN git clone https://github.com/wintervolcano/peasoup.git && \
    cd peasoup && \
    git checkout arch89 && \
    make -j 32 && \
    make install 
   
RUN ldconfig /usr/local/lib


