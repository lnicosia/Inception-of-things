echo "Configuring master node"

echo "Installing kubectl prerequisites..."
cd /etc/yum.repos.d/
sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-*
sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-*

echo "Installing k3s..."
curl -sfL https://get.k3s.io | INSTALL_K3S_EXEC="server --node-ip 192.168.42.110"\
	K3S_TOKEN="713705"\
	K3S_KUBECONFIG_MODE="644" sh -

echo "Installing Helm..."
curl https://raw.githubusercontent.com/kubernetes/helm/master/scripts/get > install-helm.sh
chmod u+x install-helm.sh
./install-helm.sh

echo "Installing Metric server..."
kubectl apply -f https://github.com/kubernetes-sigs/metrics-server/releases/latest/download/components.yaml

# sudo service k3s status
# sudo /usr/local/bin/k3s server
# k3s-killall.sh
# sudo /usr/local/bin/kubectl get nodes
# kubectl get nodes -o wide
# kubectl get all -n kube-system

echo "Master configuration done"
