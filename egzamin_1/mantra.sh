#!/bin/bash
echo "Robie strukturke"


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

if [ -d ./$PROJEKT ]; then
  rm -rf $PROJEKT
fi

mkdir $PROJEKT
cd $PROJEKT

###### MAVEN ######
touch pom.xml
mkdir -p src/{main,test}/java/com/fonowizja/$PROJEKT
curl -o pom.xml https://gist.githubusercontent.com/krzysztofkramarz/33c88f9d47f16dd91ccc0a0a22b09ca0/raw/7c7663f1022fbac539e19e92951d641fea0abb60/pom.xml

sed -ie "s/<groupId>grupa_do_zmiany<\/groupId>/<groupId>com.fonowizja.<\/groupId>/g" pom.xml
sed -ie "s/<artifactId>app_do_zmiany<\/artifactId>/<artifactId>$PROJEKT<\/artifactId>/g" pom.xml
sed -ie "s/<version>wersja_do_zmiany<\/version>/<version>1.0.0-SNAPSHOT<\/version>/g" pom.xml



sed -ie  "s/<dependencies>/<dependencies>\n<dependency>\n<groupId>org.apache.logging.log4j<\/groupId>\n<artifactId>log4j-core<\/artifactId>\n<version>2.11.2<\/version>\n<\/dependency>/g"  pom.xml

sed -ie  "s/<dependencies>/<dependencies>\n<dependency>\n<groupId>org.testng<\/groupId>\n<artifactId>testng<\/artifactId>\n<version>6.14.3<\/version>\n<scope>test<\/scope>\n<\/dependency>/g"  pom.xml

rm pom.xmle

###### GIT ######
git init
curl -o .gitignore https://gist.githubusercontent.com/krzysztofkramarz/bf1850128dfe415ced3ca3bdd65b1424/raw/cb1a5244717e71bdc9a917995756ab6ce3babb81/.gitignore


###### INNE ######
echo -e "# ABOUT $PROJEKT\n\n\nProjekt jest szkieletem przyszlej super aplikacji## PREREQUISITES \n\n\n### RUNNING" > README.md 


/opt/idea/bin/idea.sh . &

git add .
git commit -m "Initial commit"

exit
