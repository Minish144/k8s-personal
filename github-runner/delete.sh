export TYPE=${TYPE:-"organization"} # ra

for f in *.yaml; do envsubst < $f | kubectl delete -f -; done
