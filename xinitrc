# Mounts
devmon --exec-on-drive "twmnc -c 'Mounted %f on %d'" --exec-on-unmount "twmnc -c 'Unmounted %l'" --exec-on-remove "twmnc -c 'Device removed'" &

# Fix up X server
xrdb -merge ~/.Xresources &
xmodmap ~/.Xmodmap

# Fix up fonts
xset +fp /usr/share/fonts/local
xset fp rehash

# screen powersave after 2 min
xset +dpms
xset dpms 0 0 500
#
# Compositor
compton --config ~/.config/compton.conf &
# unagi &

# MPD Daemon
mpd ~/.config/mpd/mpd.conf &

# Git commit cache for dzen2 panel
git -C /data/Android/physicsgame rev-list HEAD --count > /tmp/git_commit_count.txt

# Set Wallpaper
# hsetroot -solid \#222222
# hsetroot -center downloads/wallpapers/linux_arch_grey_background_operational_sistem_1920x1080_53707.jpg
# hsetroot -tile ~/downloads/wallpapers/tweed_@2X.png
# hsetroot -tile ~/downloads/wallpapers/escheresque_ste.png -gamma 1.4
# hsetroot -center ~/image.png
# hsetroot -center ~/downloads/wallpapers/drown.jpg
# hsetroot -tile ~/downloads/wallpapers/swirl_pattern.png -tint #777777

# Set Cursor
xsetroot -cursor_name left_ptr
unclutter -idle 2 -root &

# BG Animation
# roxterm -f -e pipes &

# Top panel
xfce4-panel &
# export PANEL_FIFO=/tmp/panel-fifo
# export PANEL_HEIGHT=19
# sleep 15 && /home/aish/.config/bspwm/panel &
#
# Other conkys
# conky -c /home/aish/.config/conky/time &
# sleep 1 && conky -c /home/aish/.config/conky/disks &
# sleep 1 && conky -c /home/aish/.config/conky/graph &
# sleep 1 && conky -c /home/aish/.config/conky/log_wicd &

# Drop-down terminal
#tilda &

# Alsa
amixer set Master 95%
amixer set Speaker 28%

# disable Ctrl-S terminal freezes
stty -ixon

# fix grey windows
#wmname LG3D

# Notification Daemon
twmnd &

# Note taking
#xpad --no-new &

# Suspent after 8 mins inactivity
xautolock -time 8 -locker "/home/aish/.scripts/suspend.sh" -detectsleep &

# Start bspwm 
# sxhkd &
# exec bspwm
exec openbox-session
# exec startxfce4
