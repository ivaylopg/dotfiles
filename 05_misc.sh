#!/bin/sh

#install alcatraz xcode package manager
curl -fsSL https://raw.githubusercontent.com/supermarin/Alcatraz/deploy/Scripts/install.sh | sh
#rm -rf ~/Library/Application\ Support/Developer/Shared/Xcode/Plug-ins/Alcatraz.xcplugin
#rm -rf ~/Library/Application\ Support/Developer/Shared/Xcode/Plug-ins/Alcatraz.xcplugin

#install wifi-password
echo "##### INSTALLING wifi-password #####"
curl -L https://raw.github.com/rauchg/wifi-password/master/wifi-password.sh -o /usr/local/bin/wifi-password && chmod +x /usr/local/bin/wifi-password

#install git-friendly
echo "##### INSTALLING git-friendly #####"
curl -s https://raw.githubusercontent.com/jamiew/git-friendly/master/install.sh | bash

#set up sublime text CLI
sudo ln -s "/Applications/Sublime Text.app/Contents/SharedSupport/bin/subl" /usr/bin/subl

#install aws cli
echo "##### INSTALLING AWS CLI #####"
cd $HOME/Desktop
curl "https://s3.amazonaws.com/aws-cli/awscli-bundle.zip" -o "awscli-bundle.zip"
unzip awscli-bundle.zip
sudo ./awscli-bundle/install -i /usr/local/aws -b /usr/local/bin/aws

#install CamingoCode Font ( This is now done in brew cask)
# echo "##### INSTALLING CamingoCode Font #####"
# mkdir $HOME/Desktop/camingo
# cd $HOME/Desktop/camingo
# curl -O http://janfromm.de/_data/downloads/CamingoCode-v1.0.zip
# unzip *
# open CamingoCode-*.ttf
# cd ../
# mv camingo ~/.Trash

#set up Colossal Cave Adventure 2.5 (430pts)
echo "##### INSTALLING Colossal Cave Adventure #####"
mkdir ~/.adventure && cp $(pwd)/bin/adventure/* ~/.adventure/
