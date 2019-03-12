#!/bin/bash
 # program ada, ile w podanym katalogu jest plikow *.java i ile z nich ma publiczne metody
#oraz ile z nich jest pokyte javadoc. Statystyka jest wy

# cd /media/krzysztof/JavaAcademy/Akademia_Javy/Kod/javadoc_test
cd $1
 
let WITHOUT=0
let TOTAL=0

for d in $( find -readable -executable -type d )
do
    for file in  $d/*.java
    do
        if  [ -f $file  ] && [ -r $file  ] && [ -s $file  ] 
        then    
                let TOTAL++
                javadoc=$( grep '\/\*\*' $file )
                public=$( grep 'public[[:space:]]*[class|interface]' $file )
                if [ -n "$public" ] && [ -z "$javadoc" ]
                then
                    echo "Klasa: $file nie ma javadoca!"
                    let WITHOUT++;
                fi
        fi
    done
done
echo "Total  $TOTAL"
echo "WITHOUT  $WITHOUT"
let " WYNIK =  100 * ( $TOTAL - $WITHOUT) / $TOTAL "
echo "Pokrycie: $WYNIK %"

# \/\*\*(\n.*)*\*\/\n*\s*public\s*(class|interface)
# grep   -re  '\/\*\*([[:cntrl:]].*)*\*\/[[:cntrl:]]*[[:space:]]*public[[:space:]]*(class|interface)'  ./*.ja
