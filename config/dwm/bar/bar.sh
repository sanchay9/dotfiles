#!/bin/sh

# ^c$var^ = fg color
# ^b$var^ = bg color

interval=0

. ~/.config/dwm/bar/themes/tokyonight

# cpu() {
#     cpu_val=$(grep -o "^[^ ]*" /proc/loadavg)

#     printf "^c$black^ ^b$green^ CPU"
#     printf "^c$white^ ^b$grey^ $cpu_val"
# }

# pkg_updates() {
#     updates=$(checkupdates | wc -l)

#     if [ -z "$updates" ]; then
#         printf "^c$green^  Fully Updated"
#     else
#         printf "^c$green^  $updates"" updates"
#     fi
# }

wired() {
    if [ -d /sys/class/net/eno1 ]; then
        if [ "$(cat /sys/class/net/eno1/carrier)" == "1" ]; then
            printf "^c$black^^b$blue^ 󰈀 ^d^"
        fi
    fi
}

wlan() {
    case "$(cat /sys/class/net/wl*/operstate 2>/dev/null)" in
        up) printf "^c$blue^ 󰤨 ^d^%s"
            printf "^c$blue^$(iwgetid -r) ^d^";;
        # down) printf "^c$black^ ^b$blue^ 󰤭 ^d^%s" " ^c$blue^";;
    esac
}

toggle=/tmp/batterytooglebar
battery() {
    get_capacity="$(cat /sys/class/power_supply/BAT0/capacity)"
    get_status="$(cat /sys/class/power_supply/BAT0/status)"

    if [ $get_status = "Full" ]; then
        printf "^c$green^ 󰁹 ^d^"
    elif [ $get_status = "Charging" ]; then
        printf "^c$green^ 󰂄 ^d^"
    else
        if [ $get_capacity -le 20 ]; then
            if [ ! -e $toggle ]; then
                touch $toggle
                printf "^c$red^ 󰂃 ^d^"
            else
                rm $toggle
                printf "^c$green^ 󰂃 ^d^"
            fi
        else
            printf "^c$red^ 󰁹 ^d^"
        fi
    fi

    printf "^c$green^$get_capacity%% ^d^"
}

brightness() {
    printf "^c$yellow^ 󰃞 ^d^"
    printf "^c$yellow^$(($(brightnessctl g)*100/255))%% ^d^"
}

mem() {
    printf "^c$blue^ 󰍛 ^d^"
    printf "^c$blue^$(free -h | awk '/^Mem/ { print $3 }' | sed s/i//g) ^d^"
}

clock() {
    printf "^c$red^ 󰃭 ^d^"
    printf "^c$red^$(date '+%e %h %a') ^d^"
    printf "^c$red^  󰥔 ^d^"
    printf "^c$red^$(date '+%H:%M') ^d^"

}

audio () {
    VOL=$(pamixer --get-volume)
    STATE=$(pamixer --get-mute)

    printf "%s"
    if [ "$STATE" = "true" ] || [ "$VOL" -eq 0 ]; then
        printf "🔇"
    elif [ "$VOL" -gt 0 ] && [ "$VOL" -le 33 ]; then
        printf "🔈 %s%%" "$VOL"
    elif [ "$VOL" -gt 33 ] && [ "$VOL" -le 66 ]; then
        printf "🔉 %s%%" "$VOL"
    else
        printf "🔊 %s%%" "$VOL"
    fi
    printf "%s\n"
}

PREFIX_PLAY=' '
PREFIX_PAUSE=' '

playing() {
    # printf "$(mpc current)"
    printf "$(playerctl metadata -f {{artist}} 2> /dev/null)"
    printf " - "
    printf "$(playerctl metadata -f {{title}} 2> /dev/null)  "
    # current_song="$(mpc current)"

    # if [[ "$current_song" = "" ]]; then
    #     print ""
    # else
    #     print "$current_song "
    # fi
}

while true
do
    # [ $interval = 0 ] || [ $(($interval % 3600)) = 0 ] && updates=$(pkg_updates)
    [ $interval = 0 ] || [ $(($interval % 3600)) = 0 ]
    interval=$((interval + 1))

    sleep 1 && xsetroot -name "$(wired)$(wlan) $(battery)  $(brightness)  $(mem)  $(clock)"
done
