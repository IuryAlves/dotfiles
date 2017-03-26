#!/usr/bin/env sh

current_dir="$(pwd)"


install_space_vim (){ 
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/liuchengxu/space-vim/master/install.sh)"
}


if [ "$1" = "--use-space-vim" ]; then
    echo "Installing space vim... "
    install_space_vim
else
    echo "Creating symbolic link to .vimrc"

    ln -snf "$current_dir/.vimrc" ~/.vimrc

    echo "Creating symbolic link to .vim"

    ln -snf $current_dir/.vim ~/.vim

fi


echo "Creating symbolic link to .zshrc"

ln -snf $current_dir/.zshrc ~/.zshrc

echo "Creating symbolic link to .bashrc"

ln -snf $current_dir/.bashrc ~/.bashrc

echo "Creating symbolic link to .editorconfig"

ln -snf $current_dir/.editorconfig ~/.editorconfig

echo "Creating symbolic link to .git_functions.sh"

ln -snf $current_dir/.git_functions.sh ~/.git_functions.sh

