#!/bin/bash

while true; do

IFOPEN=$(ps aux | grep Terminal)

if [[ $IFOPEN != *"Terminal.app/Contents/MacOS/Terminal"* ]];
then
open -a Terminal &
fi

done
