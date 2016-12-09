# oh-my-zsh
export ZSH=~/.oh-my-zsh
source $ZSH/oh-my-zsh.sh
ZSH_THEME="avit"

# Plugins
#
# vi-mode: vim bindings on command line
# fasd: wicked-cool command line productivity tool
# git: git status in prompt
plugins=(vi-mode fasd git)

# Exports and specific library initialization
export EDITOR='vim'
export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin:$HOME/bin"

export NVM_DIR=~/.nvm
source $(brew --prefix nvm)/nvm.sh

# External files
. ~/.aliases

# Settings I might still want
#
# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Super-cool up-arrow behavior.
autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey '^[OA' up-line-or-beginning-search
bindkey '^[[A' up-line-or-beginning-search
bindkey '^[OB' down-line-or-beginning-search
bindkey '^[[B' down-line-or-beginning-search

[ -f /opt/dev/dev.sh ] && source /opt/dev/dev.sh
PATH="$HOME/.themekit:$PATH"
PATH="$HOME/.themekit:$PATH"

export PATH="$HOME/.yarn/bin:$PATH"
