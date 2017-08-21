#!/usr/bin/env bash

# Dotfiles
# by Dale Karp <dale@dale.io>

BASEDIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# spacemacs
ln -sf ${BASEDIR}/spacemacs $HOME/.spacemacs

# .config folder
ln -sf ${BASEDIR}/config/compton/ $HOME/.config/
ln -sf ${BASEDIR}/config/i3 $HOME/.config/
ln -sf ${BASEDIR}/config/polybar $HOME/.config/
ln -sf ${BASEDIR}/config/systemd $HOME/.config/
ln -sf ${BASEDIR}/config/termite $HOME/.config/

# zsh
ln -sf ${BASEDIR}/zshrc $HOME/.zshrc
ln -sf ${BASEDIR}/zshenv $HOME/.zshenv
ln -sf ${BASEDIR}/zprofile $HOME/.zprofile

# Xorg
ln -sf ${BASEDIR}/Xmodmap $HOME/.Xmodmap

# others
ln -sf ${BASEDIR}/fehbg $HOME/.fehbg
ln -sf ${BASEDIR}/gitconfig $HOME/.gitconfig
ln -sf ${BASEDIR}/tern-project $HOME/.tern-project
