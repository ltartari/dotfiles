#!/bin/zsh

for file in $HOME/src/dotfiles/*; do
	if [ -e "$HOME/.file" ]; then
  	ln -s $HOME/src/dotfiles/#{file} $HOME/.#{file}
	fi
done

if [ -e "$HOME/.zsh" ]; then
	ln -s $HOME/src/dotfiles/.zsh $HOME/.zsh
fi

