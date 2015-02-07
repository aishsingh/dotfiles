#!/bin/bash

# -- Config ---------------------

FG_COLOR="#aaaaaa"
FG2_COLOR="#666666"
BG_COLOR="#111111"
WIDTH=1010
HEIGHT=16
X=905
Y=1
TEXT_ALIGNMENT="right"
FONT="-*-roboto-condensed-r-*-*-13-*-*-*-*-*-*-*"

SEP="^fg(#2a2a2a) | ^fg()"

BAR_STYLE="-w 33 -h 10 -s o -ss 1 -sw 4 -nonl"
BAR_FG_COLOR=$FG_COLOR
BAR_BG_COLOR="#333333"

MPD_ICON="/home/aish/.config/dzen2/icons/note.xbm"

BATTERY_CHARGING_ICON="/home/aish/.config/dzen2/icons/bat_full_01.xbm"
BATTERY_DISCHARGING_ICON="/home/aish/.config/dzen2/icons/bat_low_01.xbm"
BATTERY_MISSING_ICON="/home/aish/.config/dzen2/icons/ac_01.xbm"
BATTERY_CRITICAL_PERCENTAGE=10
BATTERY_CRITICAL_FG_COLOR="#220000"
BATTERY_CRITICAL_BG_COLOR="#660000"

# -- Icons ----------------------

OS_ICON="/home/aish/.config/dzen2/icons/arch_10x10.xbm"
UPTIME_ICON="/home/aish/.config/dzen2/icons/shroom.xbm"

CON_ICON="/home/aish/.config/dzen2/icons/wifi_01.xbm"
WIRELESS_CLIENT="wicd-client"

VOL_ICON="/home/aish/.config/dzen2/icons/spkr_01.xbm"
CPU_ICON="/home/aish/.config/dzen2/icons/cpu.xbm"
MEM_ICON="/home/aish/.config/dzen2/icons/mem.xbm"

TIM_ICON="/usr/share/icons/stlarch_icons/clock4.xbm"
CLOCK_FORMAT="%l:%M"

GIT_ICON="/home/aish/.config/dzen2/icons/bug_01.xbm"

# -- Colours --------------------

# MEM_COL="#d81860"
# CPU_COL="#b7ce42"
# POW_COL="#fea63c"
# CON_COL="#66aabb"
# VOL_COL="#795ea8"
# TIM_COL="#2098ac"
# KER_COL="#444444"
# UPT_COL="#444444"
MEM_COL="#d81860" 
CPU_COL="#d81860"
POW_COL="#d81860"
CON_COL="#d81860"
VOL_COL="#d81860"
TIM_COL="#d81860"
KER_COL="#d81860"
UPT_COL="#d81860"
MPD_COL="#d81860"
GIT_COL="#d81860"

# -- Functions ------------------

bar() {
	echo $1 | gdbar $BAR_STYLE -fg $BAR_FG_COLOR -bg $BAR_BG_COLOR
}

cpu() {
    cpu=$(bc <<< $(ps -eo pcpu |grep -vE '^\s*(0.0|%CPU)' |sed -n '1h;$!H;$g;s/\n/ +/gp'))
    echo -n "^fg($CPU_COL)^i($CPU_ICON)^fg($FG_COLOR) $cpu"
}

mem() {
    mem=$(free -m|awk 'NR==2 {print $3}')
    echo -n "^fg($MEM_COL)^i($MEM_ICON)^fg($FG_COLOR) $mem"
    echo "^fg($FG2_COLOR) MB^fg(FG_COLOR)"
}

now_playing() {
    songa=$(mpc current -f "%artist%")
    songb=$(mpc current -f "%title%")
    if [[ -z $songb ]]; then
        songb=$(mpc current -f "%file%"|cut -d "/" -f2|sed 's/.mp3$//')
    fi
    if [[ -z $(mpc current)  ]]; then
        songa=""; songb=""
    fi
    echo -n "^fg($MPD_COL)^i($MPD_ICON)  ^fg($FG_COLOR)$songb ^fg($FG2_COLOR)$songa"
}

battery_icon() {
	if [ "$battery_status" == "Charging" ]; then
        echo "^fg($POW_COL)^i($BATTERY_CHARGING_ICON)^fg($FG_COLOR)"
	elif [ "$battery_status" == "Discharging" ]; then
        echo "^fg($POW_COL)^i($BATTERY_DISCHARGING_ICON)^fg($FG_COLOR)"
	else
        echo "^fg($POW_COL)^i($BATTERY_MISSING_ICON)^fg($FG_COLOR)"
	fi
}

battery_percentage() {
	percentage=$(acpi -b | cut -d "," -f 2 | tr -d " %")
	if [ -z "$percentage" ]; then
		echo "AC"
	elif [ $percentage -le $BATTERY_CRITICAL_PERCENTAGE ] && [ $battery_status == "Discharging" ]; then
		# echo 100 | gdbar $BAR_STYLE -fg $BATTERY_CRITICAL_FG_COLOR -bg $BATTERY_CRITICAL_BG_COLOR
        echo "^fg(#d81860)$percentage^fg($FG_COLOR)"
	else
		# bar "$percentage"
        echo $percentage
	fi
    echo "^fg($FG2_COLOR)%^fg(FG_COLOR)"
}

uptime () {
    uptime=$(cat /proc/uptime | awk '{printf "%.0f\n", $1/60/60}')
    echo -n "^fg($UPT_COL)^i($UPTIME_ICON)^fg($FG_COLOR) $uptime"
    echo "^fg($FG2_COLOR) h^fg(FG_COLOR)"
}

kernel () {
	kernel=$(uname -a | awk '{print $3}')
    echo -n "^fg($KER_COL)^i($OS_ICON)^fg($FG_COLOR) $kernel"
}

git () {
    count=$(cat /tmp/git_commit_count.txt)
    echo "^fg($GIT_COL)^i($GIT_ICON)^fg($FG_COLOR) $count ^fg($FG2_COLOR)Commits"
}

battery() {
	battery_status=$(acpi -b | cut -d ' ' -f 3 | tr -d ',')
	echo $(battery_icon) $(battery_percentage)
}

wireless_quality() {
	quality_bar=$(cat /proc/net/wireless | grep wlp3s0 | cut -d ' ' -f 5 | tr -d '.')
    echo "^fg($CON_COL)^i($CON_ICON)^fg($FG_COLOR) ^ca(3, $WIRELESS_CLIENT)$quality_bar^ca()%"
}

wireless_name() {
    name=$(iwgetid -r)
    echo "^fg($CON_COL)^i($CON_ICON)^fg($FG_COLOR) ^ca(3, $WIRELESS_CLIENT)$name"
}

volume() {
    echo -n "^fg($VOL_COL)^i($VOL_ICON)^fg($FG_COLOR) "
	volume=$(amixer get PCM | awk 'NR==6 {print substr($5, 2, 3)}' | tr -d '%')
    echo -n "^ca(1, amixer -q set Master 5%-)^ca(3, amixer -q set Master 5%+)^ca(2, amixer -q set Master toggle)"
    if [ -z "$(amixer get Master | grep "\[on\]")" ]; then
        # echo -n "$(echo $volume | gdbar $BAR_STYLE -bg $BAR_BG_COLOR -fg $BAR_BG_COLOR)"
        echo "^fg(#333333)-$volume-^fg($FG_COLOR)"
    else
        # echo -n "$(bar $volume)"
        echo -n $volume
    fi
}

clock() {
    echo -n "^fg($TIM_COL)^i($TIM_ICON)^fg($FG_COLOR) $(date +$CLOCK_FORMAT)"
}

# -------------------------------------------- SCRIPT EXECUTION LOOP, PIPED INTO DZEN2

while :; do
    PLAYINGMUSIC=`mpc current`
    if [[ -n $PLAYINGMUSIC ]]; then
        echo -n "$(now_playing)$SEP"
    fi
    echo -n "$(git)$SEP"
    echo -n "$(kernel)$SEP"
    echo -n "$(uptime)$SEP"
	echo -n "$(wireless_name)$SEP"
    echo -n "$(mem)$SEP"
    echo -n "$(cpu)$SEP"
	echo -n "$(volume)$SEP"
	echo -n "$(battery)$SEP"
	echo "$(clock)"
	sleep 10
done | dzen2 -fg $FG_COLOR -bg $BG_COLOR -dock -ta $TEXT_ALIGNMENT -w $WIDTH -h $HEIGHT -x $X -y $Y -fn $FONT
