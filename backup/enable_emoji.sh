#!/bin/bash
sudo pacman -S noto-fonts noto-fonts-emoji ttf-liberation ttf-droid adobe-source-sans-fonts ttf-dejavu
git clone https://aur.archlinux.org/ttf-ms-fonts.git
cd ttf-ms-fonts
makepkg -si
cd ..
rm -rf ttf-ms-fonts
