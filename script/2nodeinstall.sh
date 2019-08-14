#!/bin/bash

curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add - 
echo "Hosts файл обновлен!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
echo '#kubernetes' > /etc/apt/sources.list.d/kubernetes.list
sed -i '1i\deb http://apt.kubernetes.io/ kubernetes-xenial main' /etc/apt/sources.list.d/kubernetes.list
apt update && apt install -y apt-transport-https curl 
apt update
apt install -y kubelet kubeadm kubectl docker.io docker-compose 
systemctl enable docker
systemctl enable kubelet
apt -y install keepalived
systemctl enable keepalived && systemctl restart keepalived
sysctl net.bridge.bridge-nf-call-iptables=1
git clone https://github.com/rjeka/kubernetes-ha.git

