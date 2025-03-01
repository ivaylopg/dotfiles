#!/bin/sh

#source 99_utils.sh

# Based on the thoughtbot laptop script:
# https://github.com/thoughtbot/laptop/blob/master/mac

fancy_echo() {
  local fmt="$1"; shift
  printf "\n$fmt\n" "$@"
}


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
  brew list -1 | grep -Fqx "$1"
}

brew_is_upgradable() {

  ! brew outdated --quiet "$name" >/dev/null
}

cask_install() {
  if cask_is_installed "$1"; then
    fancy_echo "Cask %s is already installed. Skipping ..." "$1"
  else
    fancy_echo "Installing Cask: %s ..." "$1"
    brew install --cask $@
  fi
}

cask_is_installed() {
  brew list --cask -1 | grep -Fqx "$1"
}

brew_tap() {
  brew tap "$1" 2> /dev/null
}

brew_expand_alias() {
  brew info "$1" 2>/dev/null | head -1 | awk '{gsub(/:/, ""); print $1}'
}

cask_expand_alias() {
  brew info --cask "$1" 2>/dev/null | head -1 | awk '{gsub(/:/, ""); print $1}'
}

trap 'ret=$?; test $ret -ne 0 && printf "failed\n\n" >&2; exit $ret' EXIT
#set -e

if ! command -v brew >/dev/null; then
  fancy_echo "Installing Homebrew ..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  eval "$(/opt/homebrew/bin/brew shellenv)"
else
  fancy_echo "Homebrew already installed. Skipping ..."
fi

fancy_echo "Updating Homebrew formulas ..."
brew update

brew_install_or_upgrade coreutils
brew_install_or_upgrade grc
brew_install_or_upgrade git-lfs
git lfs install

brew_install_or_upgrade openssl
brew unlink openssl && brew link openssl --force
brew_install_or_upgrade grep
brew_install_or_upgrade screen
brew_install_or_upgrade wget
brew_install_or_upgrade vim #--with-override-system-vi
brew_install_or_upgrade ffmpeg #--with-libvpx
brew_install_or_upgrade gnu-sed #--with-default-names
brew_install_or_upgrade yt-dlp
brew_install_or_upgrade hub
brew_install_or_upgrade gibo
brew_install_or_upgrade fortune
brew_install_or_upgrade cowsay
brew_install_or_upgrade pidof
brew_install_or_upgrade gist
brew_install_or_upgrade pngquant
brew_install_or_upgrade tmux
brew_install_or_upgrade cloc
brew_install_or_upgrade imagemagick
brew_install_or_upgrade watch
brew_install_or_upgrade wifi-password
brew_install_or_upgrade bfg


brew cleanup
brew_tap caskroom/versions

# cask_install android-platform-tools

cask_install sublime-text
cask_install visual-studio-code
cask_install google-chrome
cask_install 1password
cask_install vlc
cask_install alfred
# cask_install appcleaner

brew tap caskroom/fonts
cask_install font-camingocode

# games!
# brew_tap wjwwood/zork
# brew_install_or_upgrade zork1
# #brew_install_or_upgrade zork2
# #brew_install_or_upgrade zork3
# brew_install_or_upgrade homebrew/games/nethack
# brew_install_or_upgrade homebrew/games/brogue
# cask_install dungeon-crawl-stone-soup-tiles

brew cleanup

# #npm globals
# source $NVM_DIR/nvm.sh
# npm_install_g git-open
# npm_install_g nodemon
