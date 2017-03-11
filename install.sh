#!/usr/bin/env sh

current_dir="$(pwd)"

echo "Creating symbolic link to .vimrc"

ln -s $current_dir/.vimrc ~/.vimrc

echo "Creating symbolic link to .vim"

ln -s $current_dir/.vim ~/.vim

echo "Creating symbolic link to .zshrc"

ln -s $current_dir/.zshrc ~/.zshrc

echo "Creating symbolic link to .bashrc"

ln -s $current_dir/.bashrc ~/.bashrc

echo "Creating symbolic link to .editorconfig"

ln -s $current_dir/.editorconfig ~/.editorconfig

echo "Creating symbolic link to .git_functions.sh"

ln -s $current_dir/.git_functions.sh ~/.git_functions.sh

