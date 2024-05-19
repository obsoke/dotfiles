#!/usr/bin/env bash

# e: exit if command exit code != 0
# u: bail if undefined varaible is accessed
# -o pipefail: return code is set to status of last process in pipe
set -euo pipefail

echo "Hello!"

# Install standard dots
stow --dotfiles zsh git mise
