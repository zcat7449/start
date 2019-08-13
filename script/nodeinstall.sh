#!/bin/bash

sed -i '1i\192.168.1.221 kmaster01.lan kmaster01' /etc/hosts
sed -i '2i\192.168.1.222 kmaster02.lan kmaster02' /etc/hosts
sed -i '3i\192.168.1.223 kmaster03.lan kmaster03' /etc/hosts
sed -i '4i\192.168.1.224 kmaster04.lan kmaster04' /etc/hosts
sed -i '5i\192.168.1.225 kmaster05.lan kmaster05' /etc/hosts
echo "Hosts файл обновлен!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
> /etc/apt/sources.list.d/kubernetes.list
sed -i '1i\deb http://apt.kubernetes.io/ kubernetes-xenial main' /etc/apt/sources.list.d/kubernetes.list
apt update && apt install -y apt-transport-https curl 
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add - 
apt update
apt install -y kubelet kubeadm kubectl docker.io 
