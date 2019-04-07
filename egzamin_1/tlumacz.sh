#!/bin/bash



echo  "Na jaki jezyk chcesz przetlumaczyc slowo lub zdanie? Podaj dwuliterowy skrot"

trans -R

read KOD

read -p "Jakie chcesz slowo przetlumaczyc: " SLOWO

echo `trans -brief :$KOD "$SLOWO" `

