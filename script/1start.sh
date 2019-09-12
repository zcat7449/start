#!/bin/bash
echo "Start script"
echo "Запуск обновления"
apt -y install mc wget curl
sed -i '32c\PermitRootLogin no' /etc/ssh/sshd_config
sed -i '122i\Match Address 192.168.1.0/24' /etc/ssh/sshd_config
sed -i '123i\	     PermitRootLogin yes' /etc/ssh/sshd_config
swapoff -a
timedatectl set-timezone Asia/Yekaterinburg
sed -i 's!/swap!#/swap!' /etc/fstab
sed -i '1i\192.168.1.221 kmaster01 kmaster01.lan' /etc/hosts
sed -i '2i\192.168.1.222 kmaster02 kmaster02.lan' /etc/hosts
sed -i '3i\192.168.1.223 kmaster03 kmaster03.lan' /etc/hosts
sed -i '4i\192.168.1.224 kmaster04 kmaster04.lan' /etc/hosts
sed -i '5i\192.168.1.225 kmaster05 kmaster05.lan' /etc/hosts
sed -i '6i\192.168.88.221 vmaster01' /etc/hosts
sed -i '7i\192.168.88.222 vmaster02' /etc/hosts
sed -i '8i\192.168.88.223 vmaster03' /etc/hosts
echo "!!!Необходимо указать новый пароль пользователя root!!!"
passwd root
service sshd restart
reboot

