#!/bin/bash

#if plik nie istnieje to touch

DATA=$( date '+%d %B %X' )
echo $DATA >> notatki.txt

read -p "Co dzisiaj wyniosłeś z lekcji"  TEXT


notify-send "Za 5 minut bedzie wypełnianie notatki z dnia"
zenity --entry --text "Codzisiaj wyniosłeś z lekcji?" >> notatki.txt 

exit