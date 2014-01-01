xrdb -merge ~/.Xresources &
#unagi &
compton --config ~/.config/compton.conf &
unclutter -idle 3 -root -jitter 10 &
mpd ~/.config/mpd/mpd.conf &
exec awesome
