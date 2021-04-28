# A script for installing my everyday env + dotfiles for working over SSH.

# Link relevant dotfiles to their proper locations
cp ~/dotfiles/vimrc ~/.aliases
cp ~/.vimrc
cp ~/dotfiles/zshrc ~/.zshrc

# Install things those dotfiles use.
if ! command -v fzf &> /dev/null; then
  sudo apt-get install -y fzf
fi

if ! command -v nvim &> /dev/null; then
  sudo apt-get install -y nvim
fi

# Let's go!
source ~/.zshrc
