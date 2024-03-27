#!/bin/bash

echo -e '\n'
echo '<<<<--------------------------------------->>>>'
echo 'removing default dotfiles if they exist'
rm -iv ~/.zshrc
rm -iv ~/.config/nvim/init.vim
# rm -iv ~/.config/Code/User/settings.json
rm -iv ~/.config/kitty/kitty.conf
rm -iv ~/.config/lsd/config.yaml
rm -iv ~/.config/lsd/colors.yaml
echo -e '\n'

echo '<<<<--------------------------------------->>>>'
echo 'creating directories if they do not exist'
mkdir ~/.config/nvim
# mkdir -p ~/.config/Code/User
mkdir ~/.config/kitty
mkdir ~/.config/lsd
echo -e '\n'

echo '<<<<--------------------------------------->>>>'
echo 'creating symbolic links'
ln -s ~/dotfiles/.zshrc ~/.zshrc
ln -s ~/dotfiles/init.vim ~/.config/nvim/init.vim
# ln -s ~/dotfiles/settings.json ~/.config/Code/User/settings.json
ln -s ~/dotfiles/kitty.conf ~/.config/kitty/kitty.conf
ln -s ~/dotfiles/lsd/config.yaml ~/.config/lsd/config.yaml
ln -s ~/dotfiles/lsd/colors.yaml ~/.config/lsd/colors.yaml
echo '<<<<--------------------------------------->>>>'
echo 'OK'
