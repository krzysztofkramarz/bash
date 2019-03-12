#!/usr/bin/bash
 # przyklad
echo "podaj swoje dane"

read -p 'User: ' USER
read -sp 'Haslo: ' PASSWORD

echo "Twoj usertoo: $USER a hasło to oczywiscie $PASSWORD"

echo "Podaj teraz kilka kompozytorow"
read K1 K2 K3
echo "Ho ho podaleś $K1  "
echo "No i $K2 "
echo "oraz $K3 "
