#!/bin/sh

# load ssh keys from keychain for this session
eval $(keychain --eval --quiet --noask id_rsa)

# call our exporter elisp script
emacs --batch -l ~/.dotfiles/bin/notes-org-export.el

# change directory to our repo
cd ~/projects/web/obsoke.com

# commit latest changes
git commit -am "Notes update for: $(date)"

# push commit to get built on gh pages
git push
