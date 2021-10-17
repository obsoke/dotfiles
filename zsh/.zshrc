# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block, everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# vi mode
bindkey -v
# bind ctrl+R to searching history
bindkey '^R' history-incremental-search-backward
# auto complete
autoload -Uz compinit
compinit
zstyle ':completion:*' menu select
setopt COMPLETE_ALIASES
setopt promptsubst
source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme
# shell history
HISTSIZE=100000000
SAVEHIST=100000000
setopt appendhistory
setopt HIST_IGNORE_SPACE
setopt extended_history
setopt hist_expire_dups_first
setopt hist_ignore_dups # ignore duplication command history list
setopt hist_ignore_space
setopt hist_verify
HISTFILE=~/.zsh_history

# aliases
alias l='exa -l --group-directories-first'
alias ls='exa --group-directories-first'
alias la='exa -la --group-directories-first'
alias cat='bat'
alias vi='vim'
alias v='vim'
alias g='git'
alias ..='cd ..'
alias ...='cd ../..'
alias become-postgres='sudo -u postgres -i'
alias npm-ls='npm ls -g --depth=0'
alias docker-killimg='docker rmi $(docker images -a -q)'
alias freespace='df -hH -t ext4'

# load zsh syntax highlight plugin
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
# load keychain
eval $(keychain --eval --quiet --noask id_rsa)

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Autojump
eval "$(lua /usr/share/z.lua/z.lua --init zsh enhanced once fzf)"

# NVM
source /usr/share/nvm/init-nvm.sh
