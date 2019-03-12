#!/usr/bin/bash
 # przyklad
 echo "uruchomiles skrypt: $0"
 echo "Podałeś: $# argumentow. Oto one: "
 echo $@ '-> All the arguments supplied to the Bash script.'
 echo $? '->The exit status of the most recently run process.'
 echo $$ ' ->The process ID of the current script.'

echo  " $ USER to $USER  The username of the user running the script."
echo  "$ HOSTNAME to $HOSTNAME The hostname of the machine the script is running on"
echo  "$ SECONDS to $SECONDS  The number of seconds since the script was started"
echo  "$ RANDOM to $RANDOM  Returns a different random number each time is it referred to."
echo  "$ LINENO to $LINENO"

lista=$( ls -halt )

echo "To lista co jest w katalogu: $lista"