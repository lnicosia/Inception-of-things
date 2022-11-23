echo "Configuring master node"

echo "Installing kubectl prerequisites..."
cd /etc/yum.repos.d/
sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-*
sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-*

echo "Installing k3s..."
curl -sfL https://get.k3s.io | K3S_KUBECONFIG_MODE="644" sh -

# echo "Starting server..."
# sudo /usr/local/bin/k3s server

echo "Checking nodes..."
kubectl get nodes

echo "Master configuration done"
