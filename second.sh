#!/bin/sh

Dir=~/Android/

# Make the cell directory if it doesn't exist
if [ ! -d "$Dir" ]; then
    mkdir "$Dir"
fi

# Select device
Devices=$(simple-mtpfs -l)

if [ ! -n "$Devices" ]; then
    notify-send "No devices found"
    exit
else
    Device=$(echo "$Devices" | rofi -dmenu -p "Select device:" || notify-send "No device selected")
    Id=${Device%%:*}
    Name=${Device##*: }
    if [ ! -d "$Dir$Name" ]; then
        mkdir "$Dir$Name"
    fi
fi

if [ ! -n "$(find "$Dir$Name" -maxdepth 0 -empty)" ]; then
    fusermount -u "$Dir$Name" && notify-send "Android Mount" "Device Unmounted"
else
    simple-mtpfs --device "$Id" "$Dir$Name" && notify-send "Android Mount" "Device Mounted in $Dir$Name"
fi

#### manually
## list devices -> simple-mtpfs -l
## mount #device -> simple-mtpfs --device 1 ~/Android/
## unmount device -> fusermount -u ~/Android/
