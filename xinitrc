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
hsetroot -center ~/downloads/wallpapers/Folds_1920X1080.jpg

# Set cursor
xsetroot -cursor_name left_ptr
unclutter -idle 3 -root &

# Top panel
export PANEL_FIFO=/tmp/panel-fifo
export PANEL_HEIGHT=19
/home/aish/.config/bspwm/panel &
sleep .5 && conky -c ~/.config/conky/conkyrc &

# Start bspwm 
sxhkd &
exec bspwm
