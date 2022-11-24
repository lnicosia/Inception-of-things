echo "Configuring worker node"

echo "Installing kubectl prerequisites..."
cd /etc/yum.repos.d/
sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-*
sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-*

echo "Installing k3s..."
curl -sfL https://get.k3s.io | INSTALL_K3S_EXEC="agent --node-ip 192.168.42.111"\
	K3S_URL="https://192.168.42.110:6443"\
	K3S_TOKEN="713705"\
	K3S_KUBECONFIG_MODE="644" sh -

# sudo service k3s status
# sudo /usr/local/bin/k3s server
# k3s-killall.sh
# sudo /usr/local/bin/kubectl get nodes

echo "Worker configuration done"
