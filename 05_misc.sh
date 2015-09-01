#!/bin/sh

#install wifi-password
curl -L https://raw.github.com/rauchg/wifi-password/master/wifi-password.sh -o /usr/local/bin/wifi-password && chmod +x /usr/local/bin/wifi-password

#install git-friendly
bash < <( curl https://raw.githubusercontent.com/jamiew/git-friendly/master/install.sh)

#install CamingoCode Font
mkdir $HOME/Desktop/camingo
cd $HOME/Desktop/camingo
curl -O http://janfromm.de/_data/downloads/CamingoCode-v1.0.zip
unzip *
open CamingoCode-*.ttf

#set up Colossal Cave Adventure 2.5 (430pts)
mkdir ~/.adventure && cp bin/adventure/* ~/.adventure/