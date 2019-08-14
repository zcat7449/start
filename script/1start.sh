#!/bin/bash
echo "Start script"
echo "Запуск обновления"
apt -y install mc wget curl
sed -i '32c\PermitRootLogin yes' /etc/ssh/sshd_config
swapoff -a
sed -i 's!/swap!#/swap!' /etc/fstab
sed -i '1i\192.168.1.221 kmaster01.lan kmaster01' /etc/hosts
sed -i '2i\192.168.1.222 kmaster02.lan kmaster02' /etc/hosts
sed -i '3i\192.168.1.223 kmaster03.lan kmaster03' /etc/hosts
sed -i '4i\192.168.1.224 kmaster04.lan kmaster04' /etc/hosts
sed -i '5i\192.168.1.225 kmaster05.lan kmaster05' /etc/hosts
echo "Необходимо указать новый пароль пользователя root!!!"
passwd root
service sshd restart
reboot
