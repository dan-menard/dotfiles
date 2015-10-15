# Setup instructions (for a new machine or VM)

## Shell setup

**use zsh:**

chsh -s $(which zsh)

**install oh-my-zsh:**

sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

**clone dotfiles somewhere:**

git clone git@github.com:dan-menard/dotfiles.git

**copy dotfiles:**

cd dotfiles
cp .* ~/

## VIM-specific setup

**install bundle:**

git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

**install awesome non-default theme:**

git clone git@github.com:Lokaltog/vim-distinguished.git
cp -R vim-distinguised/colors ~/.vim/
