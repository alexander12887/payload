#!/bin/bash

echo 'Command       Description
-------       -----------
user          show macs username
ip            show macs ip address
version       show macs version
screenshot    screenshots macs current screen
talk          text to speech
help          shows the help menu
custom        enter custom bash command'

while true; do
echo -n '> '
read COMMAND

case $COMMAND in

user)
    WHOAMI=$(whoami)
    echo '$WHOAMI'
    ;;
ip)
    IP=$(ifconfig | grep -Eo 'inet (addr:)?([0-9]*\.){3}[0-9]*' | grep -Eo '([0-9]*\.){3}[0-9]*' | grep -v '127.0.0.1')
    echo '$IP'
    ;;
version)
    VERSION=$(sw_vers -productVersion)
    echo '$VERSION'
    ;;
screenshot)
    SCREENSHOT=$(screencapture -o screenshot.jpg)
    echo '$SCREENSHOT'
    ;;
talk)
    echo -n 'Enter text to speech dialogue: '
    read INPUT
    TALK=$(say $INPUT)
    ;;
help)
echo 'Command       Description
-------       -----------
user          show macs username
ip            show macs ip address
version       show macs version
screenshot    screenshots macs current screen
talk          text to speech
help          shows the help menu
custom        enter custom bash command'
;;
command)
    echo -n 'Custom bash command: '
    read COMMAND
    CUSTOM_COMMAND=$($COMMAND)
    echo '$COMMAND'
    ;;

esac
done
