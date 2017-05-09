#!/bin/bash

# this symlinks all the dotfiles (and .vim/) to ~/
# it also symlinks ~/bin for easy updating

# this is safe to run multiple times and will prompt you about anything unclear


# this is a messy edit of alrra's nice work here:
#   https://raw.githubusercontent.com/alrra/dotfiles/master/os/create_symbolic_links.sh
#   it should and needs to be improved to be less of a hack.

source 99_utils.sh


#
# actual symlink stuff
#


# finds all .dotfiles in this folder
declare -a FILES_TO_SYMLINK=$(find . -type f -maxdepth 1 -name ".*" -not -name .DS_Store -not -name .git -not -name .osx | sed -e 's|//|/|' | sed -e 's|./.|.|')
FILES_TO_SYMLINK="$FILES_TO_SYMLINK"

declare -a DIRS_TO_SYMLINK=$(find . -type d -maxdepth 1 -name ".*" -not -name .DS_Store -not -name .git -not -name .osx -not -name . | sed -e 's|//|/|' | sed -e 's|./.|.|')
DIRS_TO_SYMLINK="$DIRS_TO_SYMLINK"

declare -a BINS_TO_MOVE=$(find bin -type f -maxdepth 1 -name "*" -not -name .DS_Store | sed -e 's|//|/|'| sed -e 's|bin/||')
BINS_TO_MOVE="$BINS_TO_MOVE"


# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

main() {

    local i=""
    local sourceFile=""
    local targetFile=""

    sudo chown -R $(whoami) /usr/local
    mkdir -p /usr/local/bin

    for i in ${FILES_TO_SYMLINK[@]}; do

        sourceFile="$(pwd)/$i"
        targetFile="$HOME/$(printf "%s" "$i" | sed "s/.*\/\(.*\)/\1/g")"

        if [ -e "$targetFile" ]; then
            if [ "$(readlink "$targetFile")" != "$sourceFile" ]; then

                ask_for_confirmation "'$targetFile' already exists, do you want to overwrite it?"
                if answer_is_yes; then
                    rm -rf "$targetFile"
                    execute "ln -fs $sourceFile $targetFile" "$targetFile → $sourceFile"
                else
                    print_error "$targetFile → $sourceFile"
                fi

            else
                print_success "$targetFile → $sourceFile"
            fi
        else
            execute "ln -fs $sourceFile $targetFile" "$targetFile → $sourceFile"
        fi

    done

    for i in ${DIRS_TO_SYMLINK[@]}; do

        sourceFile="$(pwd)/$i"
        targetFile="$HOME/$(printf "%s" "$i" | sed "s/.*\/\(.*\)/\1/g")"

        if [ -d "$targetFile" ]; then
            if [ "$(readlink "$targetFile")" != "$sourceFile" ]; then

                ask_for_confirmation "'$targetFile' directory already exists, do you want to overwrite it?"
                if answer_is_yes; then
                    rm -rf "$targetFile"
                    execute "ln -fs $sourceFile $targetFile" "$targetFile → $sourceFile"
                else
                    print_error "$targetFile → $sourceFile"
                fi

            else
                print_success "$targetFile → $sourceFile"
            fi
        else
            execute "ln -fs $sourceFile $targetFile" "$targetFile → $sourceFile"
        fi

    done

    ask_for_confirmation "Do you want to sync binaries in bin/ ?"
    if answer_is_yes; then

        for i in ${BINS_TO_MOVE[@]}; do
          FILE="$i"
          DEST="/usr/local/bin/"

          #echo "$FILE"
          #echo "$DEST"

          if [ -e "$DEST$FILE" ]; then
            ask_for_confirmation "'$DEST$FILE' already exists, do you want to overwrite it?"
            if answer_is_yes; then
                #rm -rf "$DEST/$FILE"
                cp -f "$(pwd)/bin/$FILE" "$DEST"
                print_success "$FILE was copied to $DEST$FILE"
            else
                print_error "Exisiting $DEST$FILE was preserved"
            fi
          else
            cp -f "$(pwd)/bin/$FILE" "$DEST"
            print_success "$FILE was copied to $DEST$FILE"
          fi
      done

    fi

    print_info "Please close this terminal session and continue in a new one"
}

main
