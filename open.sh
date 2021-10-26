#!/bin/bash

while true; do

IFOPEN=$(ps aux | grep Terminal)

if [[ $IFOPEN != *"Terminal.app/Contents/MacOS/Terminal"* ]];
then
open -a Terminal &
osascript -e 'tell application "Terminal" to set miniaturized of every window to true'
fi

done
