#!/bin/bash

sed '10i\192.168.1.220 kub-master1.lan kub-master1' /etc/hosts
sed '11i\192.168.1.221 kub-master2.lan kub-master2' /etc/hosts
sed '12i\192.168.1.222 knode1.lan knode1' /etc/hosts

apt update
apt install -y docker.io
apt update && apt install -y apt-transport-https curl 
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add - 
cat << EOF> /etc/apt/sources.list.d/kubernetes.list 
deb http://apt.kubernetes.io/ kubernetes-xenial main 
EOF 
apt update
apt install -y kubelet kubeadm kubectl

