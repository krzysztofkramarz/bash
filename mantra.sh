#!/bin/bash
echo "Robie strukturke"
cd ~/Kod/repo 

if [ $# -gt 1 ]
then
    echo "Podales więcej niż jeden parametr. Do widzenia"
    exit
elif [ $# -lt 1 ]
then
    read -p "Nie podałes nazwy projektu. Podaj ją teraz: " PROJEKT
else
    PROJEKT=$1
fi

if [ -d "~/Kod/$PROJEKT" ]; then
  rm -r project
fi

mkdir $PROJEKT
cd $PROJEKT

###### MAVEN ######
touch pom.xml
mkdir -p src/{main,test}/java/com/fonowizja/$PROJEKT
curl -o pom.xml https://gist.githubusercontent.com/LIttleAncientForestKami/c9b185c123fc97f6022861f645766aa5/raw/45db276f570fcca357fbcf36b6209517c69c6427/pom.xml

sed -ie "s/<groupId>.*<\/groupId>/<groupId>com.fonowizja.<\/groupId>/g" pom.xml
sed -ie "s/<artifactId>.*<\/artifactId>/<artifactId>$PROJEKT<\/artifactId>/g" pom.xml
sed -ie "s/<version>.*<\/version>/<version>1.0.0-SNAPSHOT<\/version>/g" pom.xml

rm pom.xmle


###### GIT ######
git init

echo -e "*.class""\n""target/""\n"".idea/"'\n'"*.iml" > .gitignore

###### INNE ######
echo -e "# ABOUT $PROJEKT\n\n\n## PREREQUISITES \n\n\n### RUNNING" > README.md 

/home/krzysztof/.local/share/Trash/files/idea-IC-183.5912.21/bin/idea.sh . &

git add .
git commit -m "Initial commit"

exit