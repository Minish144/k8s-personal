# https://computingforgeeks.com/setup-prometheus-and-grafana-on-kubernetes/?amp
#
git clone https://github.com/prometheus-operator/kube-prometheus.git
cd kube-prometheus

kubectl create -f manifests/setup
kubectl create -f manifests/

kubectl --namespace monitoring patch svc prometheus-k8s -p '{"spec": {"type": "NodePort"}}'
kubectl --namespace monitoring patch svc alertmanager-main -p '{"spec": {"type": "NodePort"}}'
kubectl --namespace monitoring patch svc grafana -p '{"spec": {"type": "NodePort"}}'

kubectl -n monitoring get svc  | grep NodePort
