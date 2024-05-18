HISTFILE=~/.zsh_history

HISTSIZE=100000000
SAVEHIST=100000000

# Ignore some commands
HISTORY_IGNORE="(ls|pwd|cd)*"

setopt appendhistory
# Write the history file in the ':start:elapsed;command' format.
setopt EXTENDED_HISTORY
# Do not record an event starting with a space.
setopt HIST_IGNORE_SPACE
# Don't store history commands
setopt HIST_NO_STORE
setopt hist_expire_dups_first
# Ignore duplication command history list
setopt hist_ignore_dups 
setopt hist_verify
