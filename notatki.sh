#!/bin/bash

#if plik nie istnieje to touch

DATA=$( date '+%d %B %X' )
echo $DATA >> notatki.txt

read -p "Co dzisiaj wyniosłeś z lekcji"  TEXT


until [ "$TEXT" == "q" ]
do
    read TEXT 
    echo $TEXT >> notatki.txt
    
done

exit






