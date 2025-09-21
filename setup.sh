#!/bin/bash
echo "Install vim configuration..."

cd ~/dotfiles

if [ -f "$HOME/.vimrc" ]; then
	mv ~/.vimrc ~/.vimrc.`date +%Y%m%d`
fi

ln -s ~/dotfiles/vimrc ~/.vimrc

git submodule init
git submodule update

vi +BundleInstall! +qall

