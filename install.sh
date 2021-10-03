#!/bin/zsh

brew tap homebrew/cask-fonts
xargs brew install < my_formula.txt
xargs brew install --cask < my_cask_formula.txt

for file in .??*
do
	[ "$file" = ".git" ] && continue
	ln -s ~/mac-dotfiles/"$file" ~/"$file"
done

mkdir ~/.vim/undo
