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
# stary pom curl -o pom.xml https://gist.githubusercontent.com/krzysztofkramarz/33c88f9d47f16dd91ccc0a0a22b09ca0/raw/7c7663f1022fbac539e19e92951d641fea0abb60/pom.xml
curl -o pom.xml https://gist.githubusercontent.com/krzysztofkramarz/e2947d0d74bfce04f51fad4d8aefaf4d/raw/cebb92b0341361dabdf571443bb29483b66f423e/pom2.xml


sed -ie "s/<groupId>grupa_do_zmiany<\/groupId>/<groupId>com.fonowizja.<\/groupId>/g" pom.xml
sed -ie "s/<artifactId>app_do_zmiany<\/artifactId>/<artifactId>$PROJEKT<\/artifactId>/g" pom.xml
sed -ie "s/<version>wersja_do_zmiany<\/version>/<version>1.0.0-SNAPSHOT<\/version>/g" pom.xml

rm pom.xmle


###### GIT ######
git init

echo -e "*.class""\n""target/""\n"".idea/"'\n'"*.iml" > .gitignore

###### INNE ######
echo -e "# ABOUT $PROJEKT\n\n\n## PREREQUISITES \n\n\n### RUNNING" > README.md 

#/home/krzysztof/.local/share/Trash/files/idea-IC-183.5912.21/bin/idea.sh . &

/opt/idea-IC-183.5912.21/bin/idea.sh . &

git add .
git commit -m "Initial commit"

exit