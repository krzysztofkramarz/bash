#!/bin/bash
 # program ada, ile w podanym katalogu jest plikow *.java i ile z nich ma publiczne metody
#oraz ile z nich jest pokyte javadoc. Statystyka jest wy

## NIE OBLICZA

cd /media/krzysztof/JavaAcademy/Akademia_Javy/Kod/javadoc_test
# cd $1
               
    JAVADOC=$( grep '\/\*\*' -rPc ) 
    PUBLIC=$( grep '(.*public.*[^;]$)|(.*public.*abstract.*)' -rPc )

echo "JAVADOC  $JAVADOC"
echo "PUBLIC  $PUBLIC"
#let " WYNIK =  100 * ( $PUBLIC - $JAVADOC ) / $PUBLIC "
#echo "Pokrycie: $WYNIK %"

# \/\*\*(\n.*)*\*\/\n*\s*public\s*(class|interface)
# grep   -re  '\/\*\*([[:cntrl:]].*)*\*\/[[:cntrl:]]*[[:space:]]*public[[:space:]]*(class|interface)'  ./*.ja
