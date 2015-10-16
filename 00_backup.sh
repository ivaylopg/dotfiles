#!/bin/sh

###  backup old machine's key items

mkdir -p ~/migration/home
mkdir -p ~/migration/ST
mkdir -p ~/migration/Lib/Services
cd ~/migration

# what is worth reinstalling?
brew leaves             > brew-list.txt    # all top-level brew installs
brew cask list          > cask-list.txt
npm list -g --depth=0   > npm-g-list.txt

cp -R ~/.ssh ~/migration/home
cp -R ~/.zsh-antigen ~/migration/home
cp /Library/Preferences/SystemConfiguration/com.apple.airport.preferences.plist ~/migration  # wifi
cp -R ~/Library/Services ~/migration/Lib/Services # automator stuff
cp ~/.bash_history ~/migration/home # back it up for fun?
cp ~/.zsh_history ~/migration/home # back it up for fun?
#cp ~/.gitconfig.local ~/migration
cp -r  ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/ ~/migration/ST
