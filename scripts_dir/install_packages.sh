#!/bin/bash

echo -e '\n'
echo '<<<<--------------------------------------->>>>'
echo 'installing packages'
sudo dnf upgrade
sudo dnf install neovim zsh kitty gnome-tweaks lsd lolcat neofetch cowsay fd-find cmatrix
echo '<<<<--------------------------------------->>>>'
echo 'OK'
