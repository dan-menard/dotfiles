if [ -f ~/.bashrc ]; then
  . ~/.bashrc
fi

if [ -f ~/.bash_aliases ]; then
  . ~/.bash_aliases
fi

if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash
fi

# Better CLI colors
export CLICOLOR=1
export LSCOLORS=gxfxcxdxbxegedabagacad

# Override OSX defaults for stuff like git and ruby
export PATH="/usr/local/bin:$PATH"
