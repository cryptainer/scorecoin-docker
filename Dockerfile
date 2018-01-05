FROM ubuntu:16.04

ARG scorecoinVersion=2.0
ARG _scorecoinBin=/opt/scorecoin/scored
ARG _entryPointBin=/opt/docker-entrypoint.sh

ARG tarDirectory=Scorecoin-2.0

ENV WALLET_CONF /etc/scorecoin/score.conf
ENV WALLET_DATA /data/

RUN apt-get update && \
    apt-get install -y wget build-essential libssl-dev libdb++-dev libboost-all-dev libqrencode-dev \
    dh-autoreconf libgmp-dev

COPY /docker-entrypoint.sh $_entryPointBin

RUN chmod +x $_entryPointBin && \
    ln -s $_entryPointBin /usr/local/bin/docker-entry && \
    mkdir sources && \
    cd sources && \
    wget https://github.com/marksteven2017/Scorecoin/archive/$scorecoinVersion.tar.gz -O sources.tar.gz && \
    tar -xzvf sources.tar.gz && \
    cd $tarDirectory/src/secp256k1 && \
    ls -alh && \
    chmod +x autogen.sh && \
    ./autogen.sh && \
    chmod +x configure && \
    ./configure && \
    cd .. && \
    ls -alh && \
    make -f makefile.unix USE_UPNP=- && \
    mkdir -p `dirname $_scorecoinBin` && \
    mv Scored $_scorecoinBin && \
    ln -s $_scorecoinBin /usr/local/bin/scored && \
    cd ../../../ && \
    rm -rf sources

RUN mkdir -p /etc/scorecoin

VOLUME /data

EXPOSE 17075 22350

ENTRYPOINT ["docker-entry"]

