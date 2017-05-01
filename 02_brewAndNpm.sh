#!/bin/sh

#source 99_utils.sh

# Based on the thoughtbot laptop script:
# https://github.com/thoughtbot/laptop/blob/master/mac

fancy_echo() {
  local fmt="$1"; shift
  printf "\n$fmt\n" "$@"
}

add_instructions() {
  touch $HOME/Desktop/manualSetupInstructions.txt
  echo $1 >> $HOME/Desktop/manualSetupInstructions.txt
}

# case "$SHELL" in
#   */zsh) : ;;
#   *)
#     fancy_echo "Changing your shell to zsh ..."
#       chsh -s "$(which zsh)"
#     ;;
# esac

brew_install_or_upgrade() {
  if brew_is_installed "$1"; then
    if brew_is_upgradable "$1"; then
      fancy_echo "Upgrading %s ..." "$1"
      brew upgrade $@
    else
      fancy_echo "Already using the latest version of %s. Skipping ..." "$1"
    fi
  else
    fancy_echo "Installing %s ..." "$1"
    brew install $@
  fi
}

brew_is_installed() {
  local name="$(brew_expand_alias "$1")"

  brew list -1 | grep -Fqx "$name"
}

brew_is_upgradable() {
  local name="$(brew_expand_alias "$1")"

  ! brew outdated --quiet "$name" >/dev/null
}

cask_install() {
  if cask_is_installed "$1"; then
    fancy_echo "Cask %s is already installed. Skipping ..." "$1"
  else
    fancy_echo "Installing Cask: %s ..." "$1"
    brew cask install $@
  fi
}

cask_is_installed() {
  local name="$(cask_expand_alias "$1")"
  brew cask list -1 | grep -Fqx "$name"
}

brew_tap() {
  brew tap "$1" 2> /dev/null
}

brew_expand_alias() {
  brew info "$1" 2>/dev/null | head -1 | awk '{gsub(/:/, ""); print $1}'
}

cask_expand_alias() {
  brew cask info "$1" 2>/dev/null | head -1 | awk '{gsub(/:/, ""); print $1}'
}

append_to_path() {
  local text="$1" path
  local skip_new_line="${2:-0}"

  path="$HOME/.path"

  if ! grep -Fqs "$text" "$path"; then
    if [ "$skip_new_line" -eq 1 ]; then
      printf "%s\n" "$text" >> "$path"
    else
      printf "\n%s\n" "$text" >> "$path"
    fi
  fi
}

npm_install_g() {
  if ! command -v node >/dev/null; then
    fancy_echo "Installing Node ..."
    brew_install_or_upgrade node
    fancy_echo "npm is installing: %s" "$1"
    sudo npm install -g $@
  else
    fancy_echo "npm is installing: %s" "$1"
    sudo npm install -g $@
  fi
}

trap 'ret=$?; test $ret -ne 0 && printf "failed\n\n" >&2; exit $ret' EXIT
set -e

if ! command -v brew >/dev/null; then
  fancy_echo "Installing Homebrew ..."

    mkdir $HOME/.homebrew && curl -L https://github.com/mxcl/homebrew/tarball/master | tar xz --strip 1 -C $HOME/.homebrew
    export PATH=$HOME/.homebrew/bin:$HOME/.homebrew/sbin:$PATH
    append_to_path 'export PATH=$HOME/.homebrew/bin:$HOME/.homebrew/sbin:$PATH' 1

else
  fancy_echo "Homebrew already installed. Skipping ..."
fi

fancy_echo "Updating Homebrew formulas ..."
brew update

brew_install_or_upgrade coreutils

#brew_install_or_upgrade 'zsh'
#fancy_echo "Remember to change your default shell..."
#add_instructions "Add to your /etc/shells - $HOME/.homebrew/bin/zsh"

# brew_install_or_upgrade git
brew_install_or_upgrade node #and npm
brew_install_or_upgrade grc

brew_install_or_upgrade openssl
brew unlink openssl && brew link openssl --force

brew_install_or_upgrade homebrew/dupes/grep
brew_install_or_upgrade homebrew/dupes/screen

brew_install_or_upgrade wget --with-iri
brew_install_or_upgrade ffmpeg --with-libvpx
brew_install_or_upgrade gnu-sed --with-default-names
brew_install_or_upgrade hub
brew_install_or_upgrade gibo
brew_install_or_upgrade fortune
brew_install_or_upgrade cowsay
brew_install_or_upgrade pidof
brew_install_or_upgrade gist
brew_install_or_upgrade pngquant
brew_install_or_upgrade the_silver_searcher
brew_install_or_upgrade fontforge
brew_install_or_upgrade mackup
brew_install_or_upgrade tmux
brew_install_or_upgrade cloc
brew_install_or_upgrade imagemagick
brew_install_or_upgrade pandoc
brew_install_or_upgrade rbenv
brew_install_or_upgrade watch
brew_install_or_upgrade tree
brew_install_or_upgrade httpie
brew_install_or_upgrade exercism
brew_install_or_upgrade youtube-dl



#brew_install_or_upgrade carthage
#brew_install_or_upgrade entr #file/directory monitoring
#brew_install_or_upgrade terminal-notifier #send Notification Center messages

#brew cleanup
#################################################

# yay cask!
brew_tap caskroom/cask
brew_install_or_upgrade brew-cask
brew_tap caskroom/versions

#cask_install onepassword
cask_install flux
cask_install spectacle
cask_install imagealpha
cask_install imageoptim
cask_install miro-video-converter
cask_install vlc
cask_install alfred
cask_install rowanj-gitx
#cask_install macdown
cask_install appcleaner
#cask_install vimr
cask_install screen-blacker
###cask_install pandoc
cask_install basictex

cask_install java
brew_install_or_upgrade bfg

cask_install mojibar
osascript -e 'tell application "System Events" to make login item at end with properties {path:"$HOME/Applications/Mojibar.app", hidden:false}'

cask_install fastlane



#cask_install caffeine
#cask_install rescuetime
#cask_install dropbox
#cask_install sublime-text3
#cask_install google-chrome
#cask_install skype
#cask_install gpgtools #Encrypted email
#cask_install licecap #GIF screen capture

#https://daisydiskapp.com/

cask_install dropbox-encore

brew tap caskroom/fonts
cask_install font-camingocode

cask_install karabiner
cask_install gpgtools

# cask_install qlcolorcode
# cask_install qlstephen
# cask_install qlmarkdown
# cask_install quicklook-json
# cask_install qlprettypatch
# cask_install quicklook-csv
# cask_install betterzipql
# cask_install webp-quicklook

# games!
brew_tap wjwwood/zork
brew_install_or_upgrade zork1
#brew_install_or_upgrade zork2
#brew_install_or_upgrade zork3
brew_install_or_upgrade homebrew/games/nethack
brew_install_or_upgrade homebrew/games/brogue
cask_install dungeon-crawl-stone-soup-tiles


# Prepare brew for multi-users setup
# echo "Now let's make brew useful for all users."
# echo "Create a 'brew' group through System Preferences: <http://blog.strug.de/2012/06/my-homebrew-multi-user-setup/>"
# read -p "Press any key when the 'brew' group has been created"

# echo -n "Change the group of homebrew installation directory..."
# sudo chgrp -R brew /usr/local
# sudo chgrp -R brew /opt/homebrew-cask/
# echo "done"

# echo -n "Allow group members to write inside this directory..."
# sudo chmod -R g+w /usr/local
# sudo chmod -R g+w /opt/homebrew-cask/
# echo "done"

# echo -n "Change the group of homebrew cache directory..."
# sudo chgrp -R brew /Library/Caches/Homebrew
# echo "done"

# echo -n "Allow group members to write inside this directory..."
# sudo chmod -R g+w /Library/Caches/Homebrew
# echo "done"


brew cleanup
brew cask cleanup

#pip
#sudo easy_install pip

#npm globals
npm_install_g git-open
npm_install_g eslint
npm_install_g gulp-cli
npm_install_g nodemon
npm_install_g standard-format
npm_install_g github-email
npm_install_g eslint-config-luxloop
