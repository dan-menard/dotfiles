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

if [ -e  ~/.rbenv ]; then
  export PATH="$HOME/.rbenv/bin:$PATH"
  eval "$(rbenv init -)"
fi

if [ -e ~/.fasd ]; then
  eval "$(fasd --init auto)"
fi

# External files
. ~/.aliases

# Settings I might still want
#
# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"
