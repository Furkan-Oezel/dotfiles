#!/bin/bash

echo '<<<<--------------------------------------->>>>'
echo 'setting neovim as default editor for git'
git config --global core.editor "nvim"

echo 'switching to zsh'
chsh -s $(which zsh)

echo 'installing nerdfonts'
cd /home/furkan/Downloads
curl -OL https://github.com/ryanoasis/nerd-fonts/releases/latest/download/SourceCodePro.tar.xz
mkdir SourceCodePro
tar -xf SourceCodePro.tar.xz -C SourceCodePro
sudo cp SourceCodePro/SauceCodeProNerdFontMono-Regular.ttf /usr/share/fonts
sudo cp SourceCodePro/SauceCodeProNerdFontMono-BoldItalic.ttf /usr/share/fonts
sudo cp SourceCodePro/SauceCodeProNerdFontMono-Italic.ttf /usr/share/fonts
sudo cp SourceCodePro/SauceCodeProNerdFontMono-Bold.ttf /usr/share/fonts
echo '<<<<--------------------------------------->>>>'
echo 'OK'
