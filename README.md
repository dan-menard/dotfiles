# Setup instructions for a new machine/VM

(Not included: package managers and ruby version managers.)

## Shell setup

**use zsh:**

`chsh -s $(which zsh)`

**install oh-my-zsh:**

`sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"`

**clone dotfiles somewhere:**

`git clone git@github.com:dan-menard/dotfiles.git`

**copy dotfiles:**

```
cd dotfiles
cp .* ~/
```

### OSX-specific ###

**install fasd with brew**

`brew install fasd`

### Linux-specific ###

**install fasd manually**

https://github.com/clvv/fasd#install

## VIM setup

**install plugins:**

open vim and run `:PluginInstall`

**install c-family language support for YCM:**

```
cd ~/.vim/bundle/YouCompleteMe
./install.py --clang-completer
```
