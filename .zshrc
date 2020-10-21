# <3 neovim
export EDITOR='nvim'
bindkey -v

# Override silly defaults
RM_STAR_SILENT=1

# Fancy dev tools
[ -f /opt/dev/dev.sh ] && source /opt/dev/dev.sh
if [ -e /Users/dan-menard/.nix-profile/etc/profile.d/nix.sh ]; then . /Users/dan-menard/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer

# Make it pretty
autoload -U promptinit && promptinit
export PS1='%F{magenta}%~ > %f'

export CLICOLOR=YES
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

# Prompt autocompletion
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=blue"

# Git autocompletion
autoload -U compinit && compinit
zmodload -i zsh/complist

# Aliases
. ~/.aliases

# Custom functions that are too big to put in here
#. ~/.git_checkout_branch_from_pr

# Gross, I know, I don't know where else to put it
path+=('~/dev/shopify/web/node_modules/.bin')
