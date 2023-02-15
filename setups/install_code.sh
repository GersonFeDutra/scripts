#!/bin/bash
cd ~/
mkdir code
cd code
git clone https://aur.archlinux.org/visual-studio-code-bin.git --depth 1
sudo chmod 777 visual-studio-code-bin
cd visual-studio-code-bin
makepkg -si
