FROM golang:1.21.5-bullseye

RUN apt -y update && apt -y upgrade
RUN apt install -y man vim iproute2 xz-utils wget gcc git g++ sudo  inetutils-ping net-tools curl screen cron unzip liblz4-tool

RUN mkdir -p /bsc
WORKDIR /bsc

RUN wget   $(curl -s https://api.github.com/repos/bnb-chain/bsc/releases/latest |grep browser_ |grep mainnet |cut -d\" -f4)
RUN mv geth_linux geth
RUN chmod -v u+x geth

RUN touch /bsc/node/config.toml /bsc/node/genesis.json

RUN mkdir -p bsc/node

CMD "/bsc/geth --config /bsc/config.toml --datadir /bsc/node --cache 8000 --rpc.allow-unprotected-txs --syncmode full --tries-verify-mode none --diffblock 5000 --rpc.txfeecap 0 --rpc.gascap 0 --http --http.corsdomain=* --pruneancient=true --history.transactions=0 --db.engine=pebble --ws --ws.origins=* --block-amount-reserved 1024"
