#!/bin/sh

if dpkg-query -W -f'${Status}' "openjdk-8-jdk" 2>/dev/null | grep -q "ok installed"; then
  echo "OpenJDK already installed"
else
  echo "Installing openjdk-8-jdk"
  apt-get install openjdk-8-jdk
fi

if dpkg-query -W -f'${Status}' "netbeans" 2>/dev/null | grep -q "ok installed"; then
  echo "Netbeans already installed"
else
  echo "Installing netbeans"
  wget https://download.netbeans.org/netbeans/8.2/final/bundles/netbeans-8.2-linux.sh
  chmod +x netbeans-8.2-linux.sh
  ./netbeans-8.2-linux.sh --silent
fi

systemctl start mysql.service
systemctl start apache2

su



useradd -c "Merritt User" -d /home/merritt -s /usr/bin/bash -m merritt
mkdir /home/merritt/public_html
chmod 755 /home/merritt/public_html

echo "let b:did_intent = 1" >> /home/merritt/.vim/indent/html.vim
chmod 644 /home/merritt/.vim/indent/html.vim

echo "let b:did_intent = 1" >> /home/root/.vim/indent/html.vim
chmod 644 /home/root/.vim/indent/html.vim

echo "merritt  ALL=(ALL:ALL) ALL" >>  /etc/sudoers

a2enmod userdir
