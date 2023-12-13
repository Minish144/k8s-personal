1. Build the image (or pull)
```bash
docker build -t bsc .
```

2. Run
```bash
docker run \
    --name bsc-node \
    --restart always \
    -p 8545:8545 \
    -p 8546:8546 \
    -p 30311:30311 \
    -v ${PWD}/config.toml:/bsc/config.toml \
    -v ${PWD}/node:/bsc/node \
    bsc \
        --cache 8000 \
        --rpc.allow-unprotected-txs \
        --syncmode full \
        --tries-verify-mode none \
        --diffblock 5000 \
        --rpc.txfeecap 0 \
        --rpc.gascap 0 \
        --http \
        --http.corsdomain="*" \
        --pruneancient=true \
        --history.transactions=0 \
        --db.engine=pebble \
        --ws \
        --ws.origins="*" \
        --block-amount-reserved 1024
```
