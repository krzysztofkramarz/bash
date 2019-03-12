#!/bin/bash

#if plik nie istnieje to touch
cd 
ILE_TREE=$( tree -dl ~ | tail -1 )
ILE_LS=$( ls -RAl  | grep "^d" | wc -l )
echo "Tree daje wynik: $ILE_TREE"
echo "Ls daje wynik $ILE_LS"
exit






