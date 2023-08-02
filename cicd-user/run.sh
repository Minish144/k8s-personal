kubectl create namespace calcoulomb

kubectl create serviceaccount calcoulomb -n calcoulomb

kubectl apply -f 01-rolebinding.yaml

SECRET_NAME=$(kubectl get serviceaccount your-serviceaccount -n your-namespace -o jsonpath='{.secrets[0].name}')
TOKEN=$(kubectl get secret $SECRET_NAME -n your-namespace -o jsonpath='{.data.token}' | base64 --decode)

echo "${TOKEN}"
