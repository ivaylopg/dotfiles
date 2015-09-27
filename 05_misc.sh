#!/bin/sh

#install wifi-password
echo "##### INSTALLING wifi-password #####"
curl -L https://raw.github.com/rauchg/wifi-password/master/wifi-password.sh -o /usr/local/bin/wifi-password && chmod +x /usr/local/bin/wifi-password

#install git-friendly
echo "##### INSTALLING git-friendly #####"
curl -s https://raw.githubusercontent.com/jamiew/git-friendly/master/install.sh | bash

#install CamingoCode Font
echo "##### INSTALLING CamingoCode Font #####"
mkdir $HOME/Desktop/camingo
cd $HOME/Desktop/camingo
curl -O http://janfromm.de/_data/downloads/CamingoCode-v1.0.zip
unzip *
open CamingoCode-*.ttf
cd ../
mv camingo ~/.Trash

#set up Colossal Cave Adventure 2.5 (430pts)
echo "##### INSTALLING Colossal Cave Adventure #####"
mkdir ~/.adventure && cp $(pwd)/bin/adventure/* ~/.adventure/

#install aws cli
echo "##### INSTALLING AWS CLI #####"
cd $HOME/Desktop
curl "https://s3.amazonaws.com/aws-cli/awscli-bundle.zip" -o "awscli-bundle.zip"
unzip awscli-bundle.zip
sudo ./awscli-bundle/install -i /usr/local/aws -b /usr/local/bin/aws
