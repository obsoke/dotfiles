alias l='eza -l --icons --group-directories-first'
alias ls='eza --icons --group-directories-first'
alias la='eza -la --icons --group-directories-first'
alias cat='bat'
alias vi='nvim'
alias v='nvim'
alias g='git'
alias ..='cd ..'
alias ...='cd ../..'
alias docker-killimg='docker rmi $(docker images -a -q)'
alias freespace='df -hH -t ext4'

# use reflector to refresh arch's package list
alias update-mirrorlist='reflector --country ca,us | sudo tee /etc/pacman.d/mirrorlist'
