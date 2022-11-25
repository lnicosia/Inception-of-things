#!/bin/bash
# curl -sfL https://get.k3s.io | sh -s - --server "https://192.168.42.110:6443" --write-kubeconfig-mode 644 --flannel-iface=eth1 --token-file "/vagrant_conf/token" --kubeconfig="/vagrant_conf/k3s.yaml"

curl -sfL https://get.k3s.io | K3S_URL="https://192.168.42.110:6443" K3S_TOKEN_FILE="/vagrant_conf/token"  sh -s - --flannel-iface eth1
