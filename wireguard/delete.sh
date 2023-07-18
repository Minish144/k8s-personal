#!/bin/bash

for f in *.yaml; do envsubst < $f | kubectl delete -f -; done
