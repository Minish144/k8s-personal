#!/bin/bash

export NETWORK_INTERFACE=${NETWORK_INTERFACE:-"enp7s0"}

read -p "Please note that mapping wireguard config inside the docker will erase your host's current configuration. If needed, please make sure to backup your files from /etc/wireguard. Got it? [ENTER]"

for f in *.yaml; do envsubst < $f | kubectl apply -f -; done

read -p "Don't forget to restart wireguard pod after configuring config in wireguard-ui [ENTER]"
