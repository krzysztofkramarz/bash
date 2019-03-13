#!/bin/bash

#if plik nie istnieje to touch
cd ~/Kod/bash

DATA=$( date '+%d %B %X' )
echo $DATA >> notatki.txt

zenity --entry --text "Co dzisiaj wyniosłeś z lekcji?" >> notatki.txt 

exit
