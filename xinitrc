# Mounts
devmon --exec-on-drive "twmnc -c 'Mounted %f on %d'" --exec-on-unmount "twmnc -c 'Unmounted %l'" --exec-on-remove "twmnc -c 'Device removed'" &
#CopyConsole -r=/mnt/sync/cloud -u="aishwarya_singh95@hotmail.com" —data=/home/aish/.copy -daemon

# Fix up X server
xrdb -merge ~/.Xresources &
xmodmap ~/.Xmodmap

# Fix up fonts
xset +fp /usr/share/fonts/local
xset fp rehash

# screen powersave after 2 min
xset +dpms
xset dpms 0 0 500

# Compositor
compton --config ~/.config/compton.conf &
#unagi &

# MPD Daemon
mpd ~/.config/mpd/mpd.conf &

# Set Wallpaper
#hsetroot -solid \#444444
#hsetroot -center ~/downloads/wallpapers/chain.jpg
hsetroot -center downloads/wallpapers/benttree.jpg

# Set Cursor
xsetroot -cursor_name left_ptr
#unclutter -idle 3 -root &

# Top panel
export PANEL_FIFO=/tmp/panel-fifo
export PANEL_HEIGHT=19
sleep 10 && /home/aish/.config/bspwm/panel &

# Drop-down terminal
#tilda &

# Alsa
amixer set Master 95%
amixer set Speaker 28%

# Notification Daemon
#twmnd &

# Start bspwm 
sxhkd &
exec bspwm
