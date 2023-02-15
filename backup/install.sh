#!/bin/bash

#exit 255 # Verificar TODO.S

echo "Tip: pipe this to tee to save the log. Eg.: ./install.sh | tee install.log"

# Update
sudo pacman -Syu
yay -Syu

if [ $? -eq 0 ] && [ $(test "$(checkupdates | wc -l)") -eq 0 ]; then
    # Update succeded or already updated
    DO_REBOOT=""
    read -p "Reboot now? (Y/n)" DO_REBOOT

    if [[ "${DO_REBOOT,,}" != "n" ]]; then
        reboot
        exit 0
    fi
else
        echo "Not recommended to go ahead without updating!"
        exit 1
fi


# Paths
MEGA_DIR=~/MEGA/MEGAsync
BACKUP_DIR="$MEGA_DIR/Backup"
HOOK="$BACKUP_DIR/.hook"
DOTFILES="$MEGA_DIR/Programming/dotfiles"

if [[ -f "$HOOK" ]]; then
    echo "HOOK file found at: $BACKUP_DIR"
else
    read -p "HOOK file not found. Insert MEGAsync dir path:" MEGA_DIR
    BACKUP_DIR="$MEGA_DIR/Backup"
    HOOK="$BACKUP_DIR/.hook"
    if [[ ! -f "$HOOK" ]]; then
        echo "File not found!"
        exit 1
    fi
fi


# Git
## Generate ssh keys
mkdir ~/.ssh
cd ~/.ssh

ssh-keygen -t rsa -b 4096 -C "GersonFeDutra@private.com" | tee GersonFeDutra.randomart.log
ssh-keygen -t rsa -b 4096 -C "linky@char.com" -f char | tee char.randomart.log
ssh-add -D

if [[ "$?" != "0" ]]; then
    eval `ssh-agent -s`
    ssh-add -D
fi

ssh-add id_rsa
ssh-add char
echo "Added SSH keys:"
ssh-add -l

echo "Update your GitHub account with ~/.ssh/id_rsa.pub and ~/.ssh/char.pub"
echo "~/.ssh/id_rsa.pub public SSH:"
cat id_rsa
echo "~/.ssh/id_rsa.pub public SSH:"
cat id_rsa.pub
echo "~/.ssh/char.pub public SSH:"
cat char.pub

# Make links I (SSH)
echo "Creating links:"

echo "~/.ssh/config"
ln -s "$DOTFILES/ssh/config" ~/.ssh/config

# Reference: https://medium.com/@doc.aicdev/multiple-ssh-keys-for-git-3d165641f50
echo "Checking GitHub connection GersonFeDutra:"
ssh -T git@GersonFeDutra.github.com

echo "Checking GitHub connection char:"
ssh -T git@char.github.com

cd -


# Make Links II

echo ~/".scripts"
ln -s "$MEGA_DIR/Programming/scripts" ~/.scripts

bindir=~/".local/bin"
if [ -d "$bindir" ]; then
    if [ "$(ls -A bindir)" ]; then
        mv "$bindir" ~/".scripts/bin/old"
    else
        # empty dir
        rm "$bindir"
    fi
    ln -s ~/".scripts/bin" "$bindir"
fi

for DIR in "$MEGA_DIR/Programming/dotfiles/.config/"*/
do
    FILE=~/.config/$(basename "$DIR")
    echo "$FILE"
    ln -s "$DIR" "$FILE"
done

for BASE_FILE in "$BACKUP_DIR/.config/.desktop"
do
    if [ "${BASE_FILE##*.}" != "desktop" ] || [ "${BASE_FILE##*.}" != "png" ]; then
        continue
    fi
    FILE=~/.local/share/applications/$(basename "$BASE_FILE")
    echo "$FILE"
    ln -s "$BASE_FILE" "$FILE"
done

for DIR in {Music Pictures}
do
    # Remove the old empty directory before copying
    if [[ -z ~/"$DIR" ]]; then
        rm ~/"$DIR"
    fi
    BASE_DIR="$MEGA_DIR/$DIR"
    echo "$BASE_DIR"
    ln -s "$BASE_DIR" ~/"$DIR"
done

# Backups from MEGA root
for DIR in {Godot Ludart Notes}
do
    ln -s "$MEGA_DIR/$DIR" ~/Documents/"$DIR"
done

# Settings
## Dark Theme
#sudo pacman -S arc-gtk-theme
gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'
gsettings set org.gnome.desktop.interface gtk-theme "Arc-dark" 

# Retargets

## Autoinstalls
# TODO
#sudo pacman -U megasync-x86_64.pkg.tar.zst
#sudo pacman -U thunar-megasync-x86_64.pkg.tar.xz

# Installers
sudo pacman -S curl

# Apps
yay -S microsoft-edge-stable-bin # Browser
yay -S visual-studio-code-bin # Code
sudo pacman -S gnome-keyring libsecret libgnome-keyring

sudo pacman -S telegram-desktop 
sudo pacman -S discord
## Tools
sudo pacman -S keepassxc # Keys
sudo pacman -S copyq # Clipboard
sudo pacman -S obsidian # Text Editor
sudo pacman -S gimp # Bitmap Image Editor
sudo pacman -S inkscape # Vector Image Editor
sudo pacman -S qbittorrent # Torrent
## Environment
#sudo pacman -S doxygen # Documentation
sudo pacman -S picom # Window Manager
sudo pacman -S flameshot # Screenshots
sudo pacman -S peek # Screenshot (gif)
sudo pacman -S maim # Screenshot cli tool
sudo pacman -S dunst # Notifications
sudo pacman -S htop # Process manager
sudo pacman -S nitrogen # Wallpapers
## Subsistem
sudo pacman -S wine
### File Manager Plugins
sudo pacman -S nemo-terminal

# sudo paman -S gpg2 # Oq?

## Media
sudo pacman -S pamixer # Mixer
sudo pacman -S youtube-dl # WebDownloader
sudo pacman -S obs-studio # OBS

## Rofi
sudo pacman -S rofi
sudo pacman -S rofi-emoji
sudo pacman -S rofi-calc

# File with i3 bar script info
touch ~/.config/brightness

# Fonts
sudo pacman -S ttf-font-awesome 
sudo pacman -S ttf-nerd-fonts-symbols
sudo pacman -S ttf-jetbrains-mono
./enable_emoji.sh
yay -S logo-ls

# Languages
sudo pacman -S llvm
#sudo pacman -S clang
sudo pacman -S ninja
echo "Availlable Java Versions:"
sudo pacman -sS java | grep jre
sudo pacman -S jre-openjdk
echo "Availlable JDK Versions:"
sudo pacman -sS java | grep jdk
sudo pacman -S jdk-openjdk
echo "Later Java version installed:"
java --version
echo "Java installed at: $(which java)"
sudo pacman -S maven
## Required Languages
## (required by NeoVim plugins)
sudo pacman -S ruby
sudo pacman -S nodejs
sudo pacman -S npm
sudo pacman -S python-pip ## Python
sudo pacman -S bash-language-server ## Bash Server

### Dependencies
sudo pacman -S ripgrep
sudo pacman -S fd


# Terminal
#sudo pacman -S tmux


## ZSh
sudo pacman -S zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
yay -S libxft-bgra

## NeoVim
sudo pacman -Syu neovim
#sudo pacman -S vim-plug
pip3 install --user neovim
gem install neovim
gem environment
sudo npm install -g neovim

### Clipboard
sudo pacman -S xclip
### Minimap
yay -S code-minimap

## Vim Plug
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \\n       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
nvim +'PlugInstall --sync' +qa ## Intall vim plugins
echo -e "[[ -s \"\$HOME/.rvm/scripts/rvm\" ]] && source \"\$HOME/.rvm/scripts/rvm\"" >> ~/.bashrc

# Other tools
# sudo pacman -Sy traceroute

# Drivers

echo "\n\033[34mUpdating Drivers...\033[m"
sleep 2

## GPU drivers

echo "\033[31mGPU.\033[m"
sleep 1
yay -S vulkan-icd-loader
yay -S vulkan-radeon
echo "\nInstallation:"
ls /usr/share/vulkan/icd.d/
yay -S vulkan-tools
vulkaninfo


# Final Update
yay -Syu
