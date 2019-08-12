#!/bin/bash

sed '1i\192.168.1.221 kmaster01.lan kub-master01' /etc/hosts
sed '2i\192.168.1.222 kmaster02.lan kub-master02' /etc/hosts
sed '3i\192.168.1.223 knode03.lan knode03' /etc/hosts
sed '4i\192.168.1.224 knode04.lan knode04' /etc/hosts
sed '5i\192.168.1.225 knode05.lan knode05' /etc/hosts

apt update
apt install -y docker.io
apt update && apt install -y apt-transport-https curl 
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add - 
cat << EOF> /etc/apt/sources.list.d/kubernetes.list 
deb http://apt.kubernetes.io/ kubernetes-xenial main 
EOF 
apt update
apt install -y kubelet kubeadm kubectl
