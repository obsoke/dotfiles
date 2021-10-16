export RUST_SRC_PATH=~/.rustup/toolchains/stable-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/src
export CARGO_HOME=~/.cargo
# 4K screen settings
export GDK_SCALE=2
export QT_AUTO_SCREEN_SCALE_FACTOR=1

# path
path=("$HOME/.cargo/bin" $path)
path=("$HOME/.node_modules/bin" $path)
path=("$HOME/.dotfiles/bin" $path)
path=("$HOME/.emacs.d/bin" $path)
