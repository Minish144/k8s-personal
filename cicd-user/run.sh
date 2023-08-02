kubectl create namespace calcoulomb

kubectl create serviceaccount calcoulomb -n calcoulomb

kubectl apply -f 01-rolebinding.yaml

SECRET_NAME=$(kubectl get serviceaccount calcoulomb -n calcoulomb -o jsonpath='{.secrets[0].name}')
TOKEN=$(kubectl get secret $SECRET_NAME -n calcoulomb -o jsonpath='{.data.token}' | base64 --decode)

echo "${TOKEN}"
