# <3 vim
export EDITOR='vim'

# Fancy dev tools
[ -f /opt/dev/dev.sh ] && source /opt/dev/dev.sh

# Make it pretty
autoload -U promptinit && promptinit
prompt adam1

export export CLICOLOR=YES
export LSCOLORS="Gxfxcxdxbxegedabagacad"

alias grep='grep --color'

# Up-arrow history search
autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey '^[OA' up-line-or-beginning-search
bindkey '^[[A' up-line-or-beginning-search
bindkey '^[OB' down-line-or-beginning-search
bindkey '^[[B' down-line-or-beginning-search

# Persist history between sessions
HISTSIZE=1000
HISTFILE=~/.history
SAVEHIST=1000

# Git autocompletion
autoload -U compinit && compinit
zmodload -i zsh/complist

# External files
. ~/.aliases
