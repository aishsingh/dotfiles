#!/bin/bash
###########################
## This script moves the selected files to a dotfiles folder then symlinks them back to the home folder 
###########################


dir="/home/$USER/dotfiles"
files="bashrc conkyrc Xresources xinitrc zshrc vimrc tmux.conf"

for file in $files; do
	if [ -f "$dir/$file" ] 
	then
		#file exists
		echo "$file found."
	else
		#file needs to be moved
		echo "$file not found in $dir."
		echo "Moving $file from ~ to $dir"
		mv -f ~/.$file $dir/$file
	fi
	
	echo "Creating symlink to $file in home directory."
	ln -sf $dir/$file /home/$USER/.$file
done
