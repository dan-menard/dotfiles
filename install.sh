# A script for installing my everyday env + dotfiles for working over SSH.

# Link relevant dotfiles to their proper locations
cp ~/dotfiles/.aliases ~/.aliases
cp ~/dotfiles/.vimrc ~/.vimrc
cp -R ~/nvim ~/.config
cp ~/dotfiles/.zshrc ~/.zshrc

# Install things those dotfiles use.
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions

if ! command -v fzf &> /dev/null; then
  sudo apt-get install -y fzf
fi

if ! command -v nvim &> /dev/null; then
  sudo apt-get install -y nvim
fi
