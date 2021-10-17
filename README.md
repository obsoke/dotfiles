# Dotfiles v7

These dotfiles are meant to be used in combination with [GNU Stow](https://www.gnu.org/software/stow/). To install a module, use the stow command in combination with the module/folder name (e.g.: `stow zsh` for zsh dotfiles).

The contents of each top-level "module" (e.g.: `/config`,`/zsh`) are symlinked relative to the home directory (`~/`).

```sh
cd ~/.dotfiles # cd into cloned directory
stow zsh # install zsh dotfiles
stow config # install various .config for used apps
```
