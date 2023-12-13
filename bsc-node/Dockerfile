FROM golang:alpine3.19
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

FROM golang:alpine3.19
COPY --from=0 /bsc /bsc

# p2p
EXPOSE 30311

# rpc
EXPOSE 8045
EXPOSE 8046

ENTRYPOINT ["/bsc/geth", "--config", "/bsc/config.toml", "--datadir", "/bsc/node"]
