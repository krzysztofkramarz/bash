#!/bin/bash
 # program ada, ile w podanym katalogu jest plikow *.java i ile z nich ma publiczne metody
#oraz ile z nich jest pokyte javadoc. Statystyka jest wy

cd /media/krzysztof/JavaAcademy/Akademia_Javy/Kod/javadoc_test
# cd $1

let TOTAL=0
let JAVADOC=0
let PUBLIC=0
for d in $( find -readable -executable -type d )
do
    for file in  $d/*.java
    do
        if  [ -f $file  ] && [ -r $file  ] && [ -s $file  ] 
        then    
                let TOTAL++
                let " JAVADOC = $JAVADOC + $( grep '\/\*\*' -Pc $file ) " 
                let " PUBLIC = $PUBLIC + $( grep '(.*public.*[^;]$)|(.*public.*abstract.*)' -Pc $file ) "
        fi
    done
done
echo "Plikow *.java jest $TOTAL"
echo "JAVADOC  $JAVADOC"
echo "PUBLIC  $PUBLIC"
let " WYNIK =  100 *  $JAVADOC  / $PUBLIC "
echo "Pokrycie: $WYNIK %"

# \/\*\*(\n.*)*\*\/\n*\s*public\s*(class|interface)
# grep   -re  '\/\*\*([[:cntrl:]].*)*\*\/[[:cntrl:]]*[[:space:]]*public[[:space:]]*(class|interface)'  ./*.ja
