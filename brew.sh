#!/bin/sh

# Based on the thoughtbot laptop script:
# https://github.com/thoughtbot/laptop/blob/master/mac



fancy_echo() {
  local fmt="$1"; shift

  # shellcheck disable=SC2059
  printf "\n$fmt\n" "$@"
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
      brew upgrade "$@"
    else
      fancy_echo "Already using the latest version of %s. Skipping ..." "$1"
    fi
  else
    fancy_echo "Installing %s ..." "$1"
    brew install "$@"
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

brew_tap() {
  brew tap "$1" 2> /dev/null
}

brew_expand_alias() {
  brew info "$1" 2>/dev/null | head -1 | awk '{gsub(/:/, ""); print $1}'
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

# brew_install_or_upgrade 'zsh'
# brew_install_or_upgrade 'git'
# brew_install_or_upgrade 'node'

# brew_install_or_upgrade 'rbenv'
# brew_install_or_upgrade 'ruby-build'

# # shellcheck disable=SC2016
# append_to_zshrc 'eval "$(rbenv init - --no-rehash zsh)"' 1

# brew_install_or_upgrade 'openssl'
# brew unlink openssl && brew link openssl --force
