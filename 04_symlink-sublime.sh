#!/bin/bash

source 99_utils.sh


#
# actual symlink stuff
#


SUBLIME[0]=User
SUBLIME[1]=Theme\ -\ Default

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

main() {

    local i=""
    local sourceFile=""

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
}

main
