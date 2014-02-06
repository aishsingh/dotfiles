# Fix up X server
xrdb -merge ~/.Xresources &
#xmodmap ~/.Xmodmap

# Fix up fonts
xset +fp /usr/share/fonts/local
xset fp rehash

# Compositor
compton --config ~/.config/compton.conf &

# MPD Daemon
mpd ~/.config/mpd/mpd.conf &

# Set Wallpaper
hsetroot -tile ~/downloads/wallpapers/tweed_@2X.png

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
