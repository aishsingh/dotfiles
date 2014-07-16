# # Mounts
# devmon --exec-on-drive "twmnc -c 'Mounted %f on %d'" --exec-on-unmount "twmnc -c 'Unmounted %l'" --exec-on-remove "twmnc -c 'Device removed'" &
# #CopyConsole -r=/mnt/sync/cloud -u="aishwarya_singh95@hotmail.com" —data=/home/aish/.copy -daemon
#
# # Fix up X server
# xrdb -merge ~/.Xresources &
# xmodmap ~/.Xmodmap
#
# # Fix up fonts
# xset +fp /usr/share/fonts/local
# xset fp rehash
#
# # screen powersave after 2 min
# xset +dpms
# xset dpms 0 0 500
#
# # Compositor
# compton --config ~/.config/compton.conf &
# # unagi &
#
# # MPD Daemon
# mpd ~/.config/mpd/mpd.conf &
#
# # Set Wallpaper
# # hsetroot -solid \#222222
# hsetroot -center downloads/wallpapers/linux_arch_grey_background_operational_sistem_1920x1080_53707.jpg
# # hsetroot -center downloads/wallpapers/mountain.jpg
#
# # Set Cursor
# xsetroot -cursor_name left_ptr
# unclutter -idle 2 -root &
#
# # BG Animation
# # roxterm -f -e pipes &
#
# # Top panel
export PANEL_FIFO=/tmp/panel-fifo
export PANEL_HEIGHT=19
sleep 13 && /home/aish/.config/bspwm/panel &
#
# # Other conkys
# # conky -c /home/aish/.config/conky/time &
# # sleep 1 && conky -c /home/aish/.config/conky/disks &
# # sleep 1 && conky -c /home/aish/.config/conky/graph &
# # sleep 1 && conky -c /home/aish/.config/conky/log_wicd &
#
# # Drop-down terminal
# #tilda &
#
# # Alsa
# amixer set Master 95%
# amixer set Speaker 28%
#
# # Notification Daemon
# twmnd &
#
# # Start bspwm 
# sxhkd &
# exec bspwm
# # exec startxfce4
