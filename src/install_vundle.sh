#/bin/bash

#Download Vundle
if [-d "~/.vim/bundle/Vundle.vim"]
then
    git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
else
    echo "Vundle is already installed"
fi

#Install plugins
vim +PluginInstall +qall
