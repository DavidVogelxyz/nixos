#!/bin/bash

# Directories
[ ! -d ~/.cache/bash ] && mkdir -p ~/.cache/bash
[ ! -d ~/.cache/shell ] && mkdir -p ~/.cache/shell
[ ! -d ~/.cache/zsh ] && mkdir -p ~/.cache/zsh
[ ! -d ~/.config/bash ] && mkdir -p ~/.config/bash
[ ! -d ~/.config/nvim ] && mkdir -p ~/.config/nvim
[ ! -d ~/.config/shell ] && mkdir -p ~/.config/shell
[ ! -d ~/.config/zsh ] && mkdir -p ~/.config/zsh
[ ! -d /usr/local/share/fonts/m/ ] && sudo mkdir -p /usr/local/share/fonts/m/
# [ ! -d ~/.local/share ] && mkdir -p ~/.local/share	# already there? not sure why commented out but seems to be okay
# [ ! -d ~/.local/src ] && mkdir -p ~/.local/src	# gets created with `git clone`

# Unconditional
curl -L https://raw.githubusercontent.com/DavidVogelxyz/dotfiles/main/.config/nvim/init.vim -o ~/.config/nvim/init.vim

curl -L https://raw.githubusercontent.com/DavidVogelxyz/dotfiles/main/.config/bash/.bashrc -o ~/.config/bash/.bashrc
[ -f ~/.bashrc ] && rm ~/.bashrc ; ln -s .config/bash/.bashrc ~/.bashrc
curl -L https://raw.githubusercontent.com/DavidVogelxyz/dotfiles/main/.config/shell/profile -o ~/.config/shell/profile
[ -f ~/.profile ] && rm ~/.profile ; ln -s .config/shell/profile ~/.profile
[ -f ~/.zprofile ] && rm ~/.zprofile ; ln -s .config/shell/profile ~/.zprofile
curl -L https://raw.githubusercontent.com/DavidVogelxyz/dotfiles/main/.config/zsh/.zshrc -o ~/.config/zsh/.zshrc

# Fonts
[ ! -e /usr/local/share/fonts/m/MesloLGS_NF_Regular.ttf ] && sudo curl -L https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Regular.ttf -o /usr/local/share/fonts/m/MesloLGS_NF_Regular.ttf
[ ! -e /usr/local/share/fonts/m/MesloLGS_NF_Bold.ttf ] && sudo curl -L https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold.ttf -o /usr/local/share/fonts/m/MesloLGS_NF_Bold.ttf
[ ! -e /usr/local/share/fonts/m/MesloLGS_NF_Italic.ttf ] && sudo curl -L https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Italic.ttf -o /usr/local/share/fonts/m/MesloLGS_NF_Italic.ttf
[ ! -e /usr/local/share/fonts/m/MesloLGS_NF_Bold_Italic.ttf ] && sudo curl -L https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold%20Italic.ttf -o /usr/local/share/fonts/m/MesloLGS_NF_Bold_Italic.ttf

# Powerlevel10k
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/.local/src/powerlevel10k

# Source code for DWM, etc.
git clone https://github.com/davidvogelxyz/dmenu ~/.local/src/dmenu
git clone https://github.com/davidvogelxyz/dwm-debian ~/.local/src/dwm-debian
git clone https://github.com/davidvogelxyz/dwmblocks ~/.local/src/dwmblocks
git clone https://github.com/davidvogelxyz/st ~/.local/src/st

# Dotfiles for DWM, etc.
cd ~
git init
git remote add voidrice https://github.com/lukesmithxyz/voidrice.git
git fetch voidrice
git checkout voidrice/master -- .config/dunst
git checkout voidrice/master -- .config/fontconfig/fonts.conf
git checkout voidrice/master -- .config/gtk-2.0
git checkout voidrice/master -- .config/gtk-3.0
git checkout voidrice/master -- .config/lf
git checkout voidrice/master -- .config/mimeapps.list
git checkout voidrice/master -- .config/mpd
git checkout voidrice/master -- .config/mpv
git checkout voidrice/master -- .config/newsboat
git checkout voidrice/master -- .config/pipewire
git checkout voidrice/master -- .config/pulse
git checkout voidrice/master -- .config/shell/bm-dirs
git checkout voidrice/master -- .config/shell/bm-files
git checkout voidrice/master -- .config/shell/inputrc
# git checkout voidrice/master -- .config/shell/profile		# loading profile file earlier; also loading my own custom file
git checkout voidrice/master -- .config/sxiv
git checkout voidrice/master -- .config/user-dirs.dirs
git checkout voidrice/master -- .config/wal
git checkout voidrice/master -- .config/wget
git checkout voidrice/master -- .config/x11
git checkout voidrice/master -- .config/zathura
# git checkout voidrice/master -- .config/zsh			# loading zsh file earlier; also loading my own custom file
git checkout voidrice/master -- .gtkrc-2.0
git checkout voidrice/master -- .local/
git checkout voidrice/master -- .xprofile
# git checkout voidrice/master -- .zprofile			# loading profile file earlier; also loading my own custom file

curl -L https://raw.githubusercontent.com/DavidVogelxyz/dotfiles/main/.config/lf/scope-debian -o ~/.config/lf/scope
curl -L https://raw.githubusercontent.com/DavidVogelxyz/dotfiles/main/.local/bin/statusbar/sb-price -o ~/.local/bin/statusbar/sb-price

[ ! -e ~/.local/share/Emerald-wallpaper_1920x1080.png ] && cp ~/.local/src/debian-dwm/Emerald-wallpaper_1920x1080.png ~/.local/share
rm ~/.local/share/bg ; ln -s Emerald-wallpaper_1920x1080.png ~/.local/share/bg
