#!/usr/bin/bash
 # przyklad
 echo Hello World!
 echo Dzisiaj jest:
 date
 echo -n "wszystko OK?: "
 read odp
 if [ "$odp" != "n" ]
  then echo to fajnie
  else echo szkoda
 fi
 
 echo "A to nasz PWD: `pwd`"
