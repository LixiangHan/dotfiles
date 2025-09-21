#!/bin/bash
echo "Setup Zsh..."

sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

cd ~/dotfiles

if [ -f "$HOME/.zshrc" ]; then
  mv ~/.zshrc ~/.zshrc.$(date +%Y%m%d)
fi

ln -s ~/dotfiles/zshrc ~/.zshrc

source ~/.zshrc
