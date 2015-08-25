#!/bin/sh

#install wifi-password
curl -L https://raw.github.com/rauchg/wifi-password/master/wifi-password.sh -o /usr/local/bin/wifi-password && chmod +x /usr/local/bin/wifi-password

#set up Colossal Cave Adventure 2.5 (430pts)
mkdir ~/.adventure && cp bin/adventure/* ~/.adventure/