#!/bin/bash
echo "Setup Vim"

cd ~/dotfiles

if [ -f "$HOME/.vimrc" ]; then
	mv ~/.vimrc ~/.vimrc.`date +%Y%m%d`
fi

ln -s ~/dotfiles/vimrc ~/.vimrc

vim +BundleInstall! +qall

