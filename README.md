# goldcoin-chest

**goldcoin-chest** is a Dockerfile for running the GoldCoin (GLD) wallet in a container.

Based on an *Ubuntu 16.04* image, it follows the build instructions given at https://www.gldtalk.org/index.php?topic=3764.0

## Building

The `goldcoin.conf`file contains the following settings. You might want to edit it before building.

    rpcuser=goldcoinrpc
    rpcpassword=6Szr2m4gppqU86SfnDnJmcz92svUsiQm1xRPCSpzPsi3
    rpcallowip=*

To build the Docker image, do:

    docker build -t alex-georgiou/goldcoind .


## Running

To run the image:

    docker run -d -p 8121:8121 -p 8122:8122 -t alex-georgiou/goldcoind


## Communicating

You can communicate to the wallet using the Bitcoin client on your host, since the RPC protocol is virtually identical (minus a few commands).

### Checking if it works

    bitcoin-cli -rpcuser=goldcoinrpc -rpcpassword=6Szr2m4gppqU86SfnDnJmcz92svUsiQm1xRPCSpzPsi3 -rpcport=8122 getbalance

### Watching as the blockchain synchronizes:

Run this on your host to watch as the blocks download. The current block can be seen here: https://chainz.cryptoid.info/gld/

    watch bitcoin-cli -rpcuser=goldcoinrpc -rpcpassword=6Szr2m4gppqU86SfnDnJmcz92svUsiQm1xRPCSpzPsi3 -rpcport=8122 getblockcount


## Acknowledgements

Thanks to Amir Eslampanah (akumaburn) for suggesting that I try Ubuntu 16.04.2 LTS. I had trouble building on 16.10.
