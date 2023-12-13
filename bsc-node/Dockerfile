FROM ethereum/solc:0.6.4-alpine
LABEL stage=builder

RUN apk update && apk upgrade --no-cache
RUN apk add vim iproute2 wget gcc git g++ sudo net-tools curl screen unzip

RUN mkdir -p /bsc/node
WORKDIR /bsc

RUN wget   $(curl -s https://api.github.com/repos/bnb-chain/bsc/releases/latest |grep browser_ |grep geth_linux |cut -d\" -f4)
RUN mv /bsc/geth_linux /bsc/geth
RUN chmod -v u+x /bsc/geth

RUN wget   $(curl -s https://api.github.com/repos/bnb-chain/bsc/releases/latest |grep browser_ |grep mainnet |cut -d\" -f4)
RUN unzip mainnet.zip

EXPOSE 8545 8546 30311 30311/udp

ENTRYPOINT ["/bsc/geth"]
