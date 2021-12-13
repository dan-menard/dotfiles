# Setup instructions for a new machine/VM

(Not included: package managers and ruby version managers.)

## Shell setup

**use zsh:**

`chsh -s $(which zsh)`

**clone dotfiles somewhere:**

`git clone git@github.com:dan-menard/dotfiles.git`

**copy dotfiles:**

```
cd dotfiles
cp .* ~/
```

**clone zsh-autocomplete:**

`git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions`

### Install the necessities ###

**install brew**

https://brew.sh/

**install things with brew**

`brew install fasd fzf neovim node`

### iTerm colors

https://raw.githubusercontent.com/mbadolato/iTerm2-Color-Schemes/master/schemes/Dracula%2B.itermcolors

## VIM setup

**install plugins:**

https://github.com/junegunn/vim-plug#installation
^ Remember to use the nvim install path

then open vim and run `:PluginInstall`
