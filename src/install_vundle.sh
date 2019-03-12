#/bin/sh

#Downloads vundle to ~/.vim/bundle/Vundle.vim
download_vundle()
{
if [-d "~/.vim/bundle/Vundle.vim"]
then
    echo "Downloading Vundle.vim to ~/.vim/bundle/Vundle.vim"
    git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
else
    echo "Vundle is already installed"
fi
}

#Installs vundle plugins from .vimrc
install_plugins()
{
vim +PluginInstall +qall
}

#Symlink .vimrc
symlink_dotfiles()
{
ln -s ../.vimrc ~/.vimrc
}

echo "This will install Vundle and plugins on your system. Do you want to continue?"
select yn in "Yes" "No"; do
    case $yn in
        Yes ) download_vundle; install_plugins; symlink_dotfiles; break;;
        No ) exit;;
    esac
done
