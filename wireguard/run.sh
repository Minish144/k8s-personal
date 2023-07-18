#!/bin/bash

export TIMEZONE=${TIMEZONE:-"Etc/UTC"} # timezone
export SERVERPORT=${SERVERPORT:-"31820"} # port to expose
export ALLOWEDIPS=${ALLOWEDIPS:-"0.0.0.0/0, ::/0"} # allowed ips

export VOLUME_NODE_NAME=${VOLUME_NODE_NAME:-"kube-master-1.techpotion.local"} # k8s node name from `$ kubectl get nodes --show-labels`

export PEER_DNS=$(kubectl -n kube-system get svc | grep kube-dns | awk '{print $3}')

# for f in *.yaml; do envsubst < $f | cat - && echo "---"; done

for f in *.yaml; do envsubst < $f | kubectl apply -f -; done

