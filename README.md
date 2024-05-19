# Dotfiles v7

These dotfiles are meant to be used in combination with [GNU Stow](https://www.gnu.org/software/stow/). To install a module, use the stow command in combination with the module/folder name (e.g.: `stow zsh` for zsh dotfiles).

The contents of each top-level "module" (e.g.: `/config`,`/zsh`) are symlinked relative to the home directory (`~/`).

This dotfiles repo takes advantage of stow's `--dotfiles` option - any file/folder with the prefix "dot-" (e.g.: "dot-foo") will be automatically symlinked with the correct name (e.g.: ".foo"). This flag needs to be provided if also using `-D` to remove a package's symlinks.

```sh
cd ~/.dotfiles # cd into cloned directory
./install
# OR
stow --dotfiles zsh git config [...other packages]
```
