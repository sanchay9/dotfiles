#!/bin/sh

if [[ "$1" != "YouTube Music" ]] && [[ "$1" != "Spotify" ]] && [[ "$2" != "Brightness" ]] && [[ "$2" != "Volume" ]] && [[ "$1" != "ncmpcpp" ]]
then
    mpv ~/.config/dunst/scripts/sound.mp3
    # canberra-gtk-play -i message
fi
