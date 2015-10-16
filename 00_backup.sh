#!/bin/sh

###  backup old machine's key items

mkdir -p ~/migration/home
mkdir -p ~/migration/ST
cd ~/migration

# what is worth reinstalling?
brew leaves         > brew-list.txt    # all top-level brew installs
brew cask list      > cask-list.txt
npm list -g --depth=0   > npm-g-list.txt

cp ~/.z ~/migration/home
cp -R ~/.ssh ~/migration/home
cp /Library/Preferences/SystemConfiguration/com.apple.airport.preferences.plist ~/migration  # wifi
cp -R ~/Library/Services ~/migration # automator stuff
cp ~/.bash_history ~/migration # back it up for fun?
cp ~/.zsh_history ~/migration # back it up for fun?
#cp ~/.gitconfig.local ~/migration
#cp ~/.z ~/migration # z history file.
cp -r  ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/ ~/migration/ST
