#!/bin/bash

echo '<<<<--------------------------------------->>>>'
echo 'installing packages'
sudo dnf upgrade
sudo dnf install neovim zsh kitty gnome-tweaks lsd gcc llvm g++ lolcat neofetch cowsay fd-find
echo '<<<<--------------------------------------->>>>'
echo 'OK'
