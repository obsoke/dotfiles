#!/bin/sh

# load ssh keys from keychain for this session
eval $(keychain --eval --quiet --noask id_rsa)

# call our exporter elisp script
emacs --batch -l ~/.dotfiles/bin/whatidid-org-export.el

# change directory to our repo
cd ~/web/obsoke.com

# commit latest changes
git commit -am "WhatIDid update for: $(date)"

# push commit to get built on gh pages
git push
