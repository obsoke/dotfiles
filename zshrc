# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# vi mode
bindkey -v

# auto complete
autoload -Uz compinit
compinit
zstyle ':completion:*' menu select
setopt COMPLETE_ALIASES

source /home/dale/.dotfiles/zsh/git.zsh

# prompt
SPACESHIP_TIME_SHOW=true
SPACESHIP_TIME_12HR=true
SPACESHIP_PROMPT_ORDER=(
  time          # Time stampts section
  user          # Username section
  host          # Hostname section
  dir           # Current directory section
  git           # Git section (git_branch + git_status)
  #node          # Node.js section
  #ruby          # Ruby section
  #xcode         # Xcode section
  #swift         # Swift section
  #golang        # Go section
  #docker        # Docker section
  #venv          # virtualenv section
  #pyenv         # Pyenv section
  line_sep      # Line break
  #vi_mode       # Vi-mode indicator
  char          # Prompt character
)
setopt promptsubst
source /home/dale/repos/spaceship-zsh-theme/spaceship.zsh-theme

# aliases
alias l='ls -lh --color=auto'
alias ls='ls --color=auto'
alias la='ls -lha --color=auto'
alias vi='vim'
alias v='vim'
alias ..='cd ..'
alias ...='cd ../..'
alias become-postgres='sudo -u postgres -i'
alias npm-ls='npm ls -g --depth=0'
alias docker-killimg='docker rmi $(docker images -a -q)'

# load zsh syntax highlight plugin
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
# load keychain
eval $(keychain --eval --quiet --noask id_rsa)
# setup & load virtualenvwrapper
export WORKON_HOME=~/.venvs
source /usr/bin/virtualenvwrapper.sh
