1. Find kubelet config file
```bash
ls /etc/systemd/system/kubelet.service.d/ 10-kubeadm.conf
```

2. Append `--max-pods=500` to the end of the line starting with `ExecStart=/usr/bin/kubelet` so it looks like so
```bash
...
ExecStart=/usr/bin/kubelet $KUBELET_KUBECONFIG_ARGS $KUBELET_CONFIG_ARGS $KUBELET_KUBEADM_ARGS $KUBELET_EXTRA_ARGS --max-pods=243
```

3. Restart kubelet daemon
```bash
restart kubelet && systemctl daemon-reload && systemctl restart kubelet
```
