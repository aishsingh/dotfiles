#!/bin/bash

dir="/home/$USER/dotfiles"

echo 'Starting main symlinks'
ln -sfv $dir/bashrc				 /home/$USER/.bashrc 
ln -sfv $dir/bspwm/bspwmrc		 /home/$USER/.config/bspwm/.  
ln -sfv $dir/bspwm/panel		 /home/$USER/.config/bspwm/.  
ln -sfv $dir/bspwm/panel_bar	 /home/$USER/.config/bspwm/. 
ln -sfv $dir/bspwm/panel_colors	 /home/$USER/.config/bspwm/. 
ln -sfv $dir/bspwm/panel_dzen2	 /home/$USER/.config/bspwm/. 
ln -sfv $dir/bspwm/sxhkdrc		 /home/$USER/.config/sxhkd/.
ln -sfv $dir/compton.conf 		 /home/$USER/.config/.
ln -sfv $dir/conkyrc			 /home/$USER/.config/conky/. 
ln -sfv $dir/irssi/*			 /home/$USER/.irssi/*
ln -sfv $dir/mpd.conf			 /home/$USER/.config/mpd/. 
ln -sfv $dir/terminalrc			 /home/$USER/.config/xfce4/terminal/. 
ln -sfv $dir/tmux.conf			 /home/$USER/.tmux.conf
ln -sfv $dir/vim				 /home/$USER/.vim
ln -sfv $dir/vimrc				 /home/$USER/.vimrc
ln -sfv $dir/xinitrc			 /home/$USER/.xinitrc
ln -sfv $dir/Xresources			 /home/$USER/.Xresources
ln -sfv $dir/zshrc				 /home/$USER/.zshrc

echo 'Starting /etc symlinks'
echo 'Need root password'
sudo ln -sfv $dir/etc/*			 /etc/.

echo 'All dotfiles have been symlinked'
echo ':)'
