1. Install cert-manager in your cluster
```bash
kubectl apply -f https://github.com/cert-manager/cert-manager/releases/download/v1.8.2/cert-manager.yaml
```

2. Deploy ARC
```bash
kubectl create -f \
	https://github.com/actions/actions-runner-controller/\
	releases/download/v0.22.0/actions-runner-controller.yaml
```

3. Generate a Personal Access Token (PAT) for ARC to authenticate with GitHub
```bash
kubectl create secret generic controller-manager \
    -n actions-runner-system \
    --from-literal=github_token=REPLACE_YOUR_TOKEN_HERE
```

4. `./run.sh`
