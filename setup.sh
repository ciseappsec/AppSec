#!/bin/sh

systemctl start mysql.service
systemctl start apache2.service



useradd -c "Merritt User" -d /home/merritt -s /usr/bin/bash -m merritt
mkdir /home/merritt/public_html
chmod 755 /home/merritt/public_html

echo "let b:did_intent = 1" >> /home/merritt/.vim/indent/html.vim
chmod 644 /home/merritt/.vim/indent/html.vim

echo "let b:did_intent = 1" >> /home/root/.vim/indent/html.vim
chmod 644 /home/root/.vim/indent/html.vim

echo "merritt  ALL=(ALL:ALL) ALL" >>  /etc/sudoers

a2enmod userdir
