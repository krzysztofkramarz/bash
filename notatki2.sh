#!/bin/bash

#if plik nie istnieje to touch
cd ~/Kod/bash

DAY_NUMBER=$( date '+%w' )
echo $DAY_NUMBER

if [ $DAY_NUMBER -eq 1 ]
    then
        DAY_NAME='Poniedziałek'

    elif  [ $DAY_NUMBER -eq 2 ]
    then
        DAY_NAME='Wtorek'

    elif  [ $DAY_NUMBER -eq 3 ]
    then
        DAY_NAME='Środa'

    elif  [ $DAY_NUMBER -eq 4 ]
    then
        DAY_NAME='Czwartek'

    elif  [ $DAY_NUMBER -eq 5 ]
    then
        DAY_NAME='Piątek - Końtyg'
fi

DATA=$( date '+%d %B %X ' )
NAGLOWEK="\n   <$DAY_NAME>   $DATA "
# echo -e enables interpretation of bckslash escapes
echo -e $NAGLOWEK >> notatki.txt

zenity --entry --text "Co dzisiaj wyniosłeś z lekcji?" >> notatki.txt 

exit
