#!/bin/bash

source 99_utils.sh


#
# actual symlink stuff
#


SUBLIME_DIRS=()
while IFS=  read -r -d $'\0'; do
    SUBLIME_DIRS+=("$REPLY")
done < <(find ./SublimeText3/ -type d -maxdepth 1 -name "*" -not -name .DS_Store -not -name .git -not -name .osx -not -name SublimeText3 -not -name . -print0  | sed -e 's|//|/|')

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

main() {

    ask_for_confirmation "Do you want to sync Sublime Text 3 Settings?"
    if answer_is_yes; then

        for ((i = 0; i < ${#SUBLIME_DIRS[@]}; i++)); do

            cleanedDirName=$(echo "${SUBLIME_DIRS[$i]}" | sed 's|^\./SublimeText3||' | sed -e 's|//||' | sed -e 's|/||')
            sourceFile="$(pwd)/SublimeText3/$cleanedDirName"
            targetFile="$HOME/Library/Application Support/Sublime Text 3/Packages"
            checkTarget=$(echo "$targetFile/$cleanedDirName" | sed 's|\\||g')

            # echo $sourceFile
            # echo $targetFile
            # echo $checkTarget

            if [ -L "$checkTarget" ] || [ -d "$checkTarget" ]; then
                # echo "exists!"
                ask_for_confirmation "'$checkTarget' directory already exists, do you want to overwrite it?"
                if answer_is_yes; then
                    rm -rf "$checkTarget"
                    ln -fs "$sourceFile" "$targetFile"
                    print_result $? "$targetFile → $sourceFile"
                else
                    print_error "$targetFile → $sourceFile"
                fi
            else
                # echo "new!"
                ln -fs "$sourceFile" "$targetFile"
                print_result $? "$targetFile → $sourceFile"
            fi

        done

    fi
}

main
