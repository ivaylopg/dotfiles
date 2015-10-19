#!/bin/bash

# this symlinks all the dotfiles (and .vim/) to ~/
# it also symlinks ~/bin for easy updating

# this is safe to run multiple times and will prompt you about anything unclear


# this is a messy edit of alrra's nice work here:
#   https://raw.githubusercontent.com/alrra/dotfiles/master/os/create_symbolic_links.sh
#   it should and needs to be improved to be less of a hack.


#
# utils !!! (moved to separate file)
#

source 99_utils.sh


#
# actual symlink stuff
#


# finds all .dotfiles in this folder
declare -a FILES_TO_SYMLINK=$(find . -type f -maxdepth 1 -name ".*" -not -name .DS_Store -not -name .git -not -name .osx | sed -e 's|//|/|' | sed -e 's|./.|.|')
FILES_TO_SYMLINK="$FILES_TO_SYMLINK"

declare -a DIRS_TO_SYMLINK=$(find . -type d -maxdepth 1 -name ".*" -not -name .DS_Store -not -name .git -not -name .osx -not -name . | sed -e 's|//|/|' | sed -e 's|./.|.|')
DIRS_TO_SYMLINK="$DIRS_TO_SYMLINK"

SUBLIME[0]=User
SUBLIME[1]=Theme\ -\ Default

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

main() {

    local i=""
    local sourceFile=""
    local targetFile=""

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

        if [ -e "$targetFile" ]; then
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

    ask_for_confirmation "Do you want to sync Sublime Text 3 Settings?"
    if answer_is_yes; then

        #sync Sublime Text 3 Settings
        i=""
        local STDIR=$HOME/Library/Application\ Support/Sublime\ Text\ 3/Packages

        [ ! -d "$STDIR" ] && mkdir -p "$STDIR" && printf "Created %s" "$STDIR"

        for ((i = 0; i < ${#SUBLIME[@]}; i++))
        do
            #printf "${SUBLIME[$i]}\n"
            sourceFile="$(pwd)/SublimeText3/${SUBLIME[$i]}"

            if [ -d "$STDIR/${SUBLIME[$i]}" ]; then

                ask_for_confirmation "'$STDIR/${SUBLIME[$i]}' already exists, do you want to overwrite it?"
                if answer_is_yes; then
                    rm -rf "$STDIR/${SUBLIME[$i]}"
                    ln -fs "$sourceFile" "$STDIR/${SUBLIME[$i]}" &> /dev/null
                    print_result $? "$STDIR/${SUBLIME[$i]} → $sourceFile"
                else
                    print_error "$STDIR/${SUBLIME[$i]} → $sourceFile"
                fi
            else
                ln -fs "$sourceFile" "$STDIR/${SUBLIME[$i]}" &> /dev/null
                print_result $? "$STDIR/${SUBLIME[$i]} → $sourceFile"
            fi

        done

    fi

    ask_for_confirmation "Do you want to sync binaries in bin/ ?"
    if answer_is_yes; then

        for i in ${FILES_TO_MOVE[@]}; do
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
}

main
