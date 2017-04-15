#!/bin/sh

# load ssh keys from keychain for this session
eval $(keychain --eval --quiet --noask id_rsa)

# change directory to our repo
cd ~/org

# commit latest changes
git commit -am "Org commit for: $(date)"

# push commit to get built on gh pages
git push
