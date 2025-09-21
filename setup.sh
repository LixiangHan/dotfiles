#!/bin/bash
echo "Install NeoVim..."

curl -LO https://github.com/neovim/neovim/releases/download/v0.11.4/nvim-linux-x86_64.appimage

chmod u+x nvim-linux-x86_64.appimage

mv nvim-linux-x86_64.appimage ~/.local/bin/nvim

export PATH="$HOME/.local/bin:$PATH"

rm nvim-linux-x86_64.appimage

echo "Setup LazyVim..."

cd ~/dotfiles

if [ -f "$HOME/.config/nvim" ]; then
  mv ~/.config/nvim ~/.config/nvim.$(date +%Y%m%d)
fi

ln -s ~/dotfiles/nvim ~/.config/nvim
