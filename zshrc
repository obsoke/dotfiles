# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# vi mode
bindkey -v

# auto complete
autoload -Uz compinit
compinit
zstyle ':completion:*' menu select
setopt COMPLETE_ALIASES

# prompt
# theme: agnoster
setopt promptsubst
source /home/dale/repos/agnoster-zsh-theme/agnoster.zsh-theme

# aliases
alias l='ls -lh --color=auto'
alias ls='ls --color=auto'
alias la='ls -lha --color=auto'
alias vi='vim'
alias v='vim'
alias ..='cd ..'
alias ...='cd ../..'

# load zsh syntax highlight plugin
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# load keychain
eval $(keychain --eval --quiet --noask id_rsa)
