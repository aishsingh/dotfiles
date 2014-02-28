# Fix up X server
xrdb -merge ~/.Xresources &
xmodmap ~/.Xmodmap

# Fix up fonts
xset +fp /usr/share/fonts/local
xset fp rehash

# screen powersave
xset +dpms
xset dpms 0 0 300

# Compositor
compton --config ~/.config/compton.conf &
#unagi &

# MPD Daemon
mpd ~/.config/mpd/mpd.conf &

# Set Wallpaper
#hsetroot -solid \#444444
hsetroot -center ~/downloads/wallpapers/the-alps-2-1920x1200.jpg

# Set Cursor
xsetroot -cursor_name left_ptr
#unclutter -idle 3 -root &

# Top panel
export PANEL_FIFO=/tmp/panel-fifo
export PANEL_HEIGHT=19
/home/aish/.config/bspwm/panel &

# Drop-down terminal
#tilda &

# Start bspwm 
sxhkd &
exec bspwm
