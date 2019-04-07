#!/bin/bash
cd $HOME/Desktop

if [ ! -d zrzuty ]; then
mkdir zrzuty
fi

 DATA=$( date '+%d%B%X' )
 import -window root $HOME/Desktop/zrzuty/printscreen$DATA.png
