export RUST_SRC_PATH=~/.rustup/toolchains/stable-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/src
export NPM_CONFIG_PREFIX=~/.node_modules
export CARGO_HOME=~/.cargo

# this is required to get ruby to install gems only in user gem folder
#export GEM_PATH=$(ls -t -U | ruby -e 'puts Gem.user_dir')
#export GEM_HOME=$GEM_PATH

# path
path=("$GEM_PATH/bin" $path)
path=("$HOME/.cargo/bin" $path)
path=("$HOME/.node_modules/bin" $path)
path=("/usr/local/heroku/bin" $path)
path=("$HOME/.dotfiles/bin" $path)
