export TYPE=${TYPE:-"organization"} # repository/organization/enterprise
export SOURCE=${SOURCE:-"organization-name"} # your repo / org / enterprise name

for f in *.yaml; do envsubst < $f | kubectl delete -f -; done
