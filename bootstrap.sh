#!/usr/bin/env bash

# Dotfiles
# by Dale Karp <dale@dale.io>

BASEDIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# .config folder
ln -sf ${BASEDIR}/config/alacritty $HOME/.config/
ln -sf ${BASEDIR}/config/picom $HOME/.config/
ln -sf ${BASEDIR}/config/i3 $HOME/.config/
ln -sf ${BASEDIR}/config/polybar $HOME/.config/
ln -sf ${BASEDIR}/config/user-dirs.dirs $HOME/.config/

# doom-emacs
ln -sf ${BASEDIR}/emacs $HOME/.doom.d

# zsh
ln -sf ${BASEDIR}/zsh/zshrc $HOME/.zshrc
ln -sf ${BASEDIR}/zsh/zshenv $HOME/.zshenv
ln -sf ${BASEDIR}/zsh/zprofile $HOME/.zprofile
ln -sf ${BASEDIR}/zsh/p10k.zsh $HOME/.p10k.zsh

# Xorg
ln -sf ${BASEDIR}/xorg/Xmodmap $HOME/.Xmodmap
ln -sf ${BASEDIR}/xorg/Xresources $HOME/.Xresources

# others
ln -sf ${BASEDIR}/misc/fehbg $HOME/.fehbg
ln -sf ${BASEDIR}/misc/gitconfig $HOME/.gitconfig
