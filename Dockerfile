FROM ubuntu:16.04

MAINTAINER Alexandros Georgiou <alex.georgiou@gmail.com>
LABEL description="Container for building and running a GoldCoin wallet" Version="1.0"
LABEL version="v0.7.5.0-g7.5-beta"

# mainnet ports
EXPOSE 8121 8122

# testnet ports
#EXPOSE 18122 18121

RUN \
	apt-get update && \
	apt install -y software-properties-common && \
	add-apt-repository ppa:bitcoin/bitcoin && \
	apt-get update && \
    apt install -y git g++ make libminiupnpc-dev libdb4.8++-dev libqt4-dev libqrencode-dev libqtwebkit-dev libboost-all-dev libssl-dev

RUN \
	git clone https://github.com/goldcoin/goldcoin && \
	cd /goldcoin && \
	git checkout 54a47e7

RUN \
	mkdir goldcoin/src/obj /root/.goldcoin && \
	cd /goldcoin/src && \
	make -f makefile.unix  USE_IPV6=1 USE_UPNP=1 USE_QRCODE=1 64BIT=1 RELEASE=1

COPY goldcoin.conf /root/.goldcoin/

WORKDIR /goldcoin/src

CMD goldcoind
