#!/bin/bash
 # program ada, ile w podanym katalogu jest plikow *.java i ile z nich ma publiczne metody
#oraz ile z nich jest pokyte javadoc. Statystyka jest wy

## NIE OBLICZA

cd /media/krzysztof/JavaAcademy/Akademia_Javy/Kod/javadoc_test




RED='\033[0;31m'
GREEN='\033[0;32m'
public_names=($(find ./ -type f -iname "*.java" | xargs cat | grep "public" | wc -l))
doc_made=($(find ./ -type f -iname "*.java" | xargs cat | grep "/\*\" | wc -l))
echo ${doc_made[0]} Java Doc
echo ${public_names[0]} publicznych API
result=`echo "((((${doc_made[0]}+0.0))/((${public_names[0]}+0.0))))*100" | bc -l`
if (( $(echo "$result > 60.0" |bc -l) ))
then
echo -e ${GREEN}$result% z Twoich ${public_names[0]} publicznych API ma dokumentacje
else
echo -e ${RED}$result% z Twoich ${public_names[0]} publicznych API ma dokumentacje
fi