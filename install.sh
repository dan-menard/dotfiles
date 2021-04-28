# A script for installing my everyday env + dotfiles for working over SSH.

# Link relevant dotfiles to their proper locations
ln -sf ~/dotfiles/vimrc ~/.aliases
ln -sf ~/dotfiles/vimrc ~/.vimrc
ln -sf ~/dotfiles/zshrc ~/.zshrc

# Install things those dotfiles use.
if ! command -v fzf &> /dev/null; then
  sudo apt-get install -y fzf
fi

if ! command -v nvim &> /dev/null; then
  sudo apt-get install -y nvim
fi

# Let's go!
source ~/.zshrc
