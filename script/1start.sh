#!/bin/bash
echo "Start script"
echo "Запуск обновления"
apt -y install mc wget curl
sed -i '32c\PermitRootLogin yes' /etc/ssh/sshd_config
swapoff -a
sed -i 's!/swap!#/swap!' /etc/fstab
echo "Необходимо указать новый пароль пользователя root!!!"
passwd root
service sshd restart
reboot
