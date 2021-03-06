# Load our dotfiles like ~/.bash_prompt, etc…
# Load our dotfiles like ~/.bash_prompt, etc…
#   ~/.extra can be used for settings you don't want to commit,
#   Use it to configure your PATH, thus it being first in line.
for file in ~/.{bash_prompt,exports,aliases,functions,path}; do
    [ -r "$file" ] && source "$file"
done
unset file

# to help sublimelinter etc with finding my PATHS
#case $- in
#   *i*) source ~/.extra
#esac

# open man pages in chrome
# export PAGER="col -b  | open -a /Applications/Google\ Chrome.app -f"


# generic colouriser
GRC=`which grc`
if [ "$TERM" != dumb ] && [ -n "$GRC" ]
    then
        alias colourify="$GRC -es --colour=auto"
        alias configure='colourify ./configure'
        for app in {diff,make,gcc,g++,ping,traceroute}; do
            alias "$app"='colourify '$app
    done
fi

##################################### quit now if in zsh
if [[ -n "$ZSH_VERSION" ]]; then
    return 1 2> /dev/null || exit 1;
fi;

##
## gotta tune that bash_history…
##

# timestamps for later analysis. www.debian-administration.org/users/rossen/weblog/1
export HISTTIMEFORMAT='%F %T '

# keep history up to date, across sessions, in realtime
#  http://unix.stackexchange.com/a/48113
export HISTCONTROL=ignoredups:erasedups         # no duplicate entries
export HISTSIZE=100000                          # big big history (default is 500)
export HISTFILESIZE=$HISTSIZE                   # big big history
which shopt > /dev/null && shopt -s histappend  # append to history, don't overwrite it


##
## Completion…
##

# Save and reload the history after each command finishes
export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"

# ^ the only downside with this is [up] on the readline will go over all history not just this bash session.


# bash completion.
if  which brew > /dev/null && [ -f "$(brew --prefix)/share/bash-completion/bash_completion" ]; then
    source "$(brew --prefix)/share/bash-completion/bash_completion";
elif [ -f /etc/bash_completion ]; then
    source /etc/bash_completion;
fi;

# homebrew completion
if  which brew > /dev/null; then
    source `brew --repository`/Library/Contributions/brew_bash_completion.sh
fi;

# Enable tab completion for `g` by marking it as an alias for `git`
if type __git_complete &> /dev/null; then
    __git_complete g __git_main
fi;

# Add tab completion for SSH hostnames based on ~/.ssh/config, ignoring wildcards
[ -e "$HOME/.ssh/config" ] && complete -o "default" -o "nospace" -W "$(grep "^Host" ~/.ssh/config | grep -v "[?*]" | cut -d " " -f2)" scp sftp ssh

# Add tab completion for `defaults read|write NSGlobalDomain`
# You could just use `-g` instead, but I like being explicit
complete -W "NSGlobalDomain" defaults

##
## better `cd`'ing
##

# Case-insensitive globbing (used in pathname expansion)
shopt -s nocaseglob;

# Autocorrect typos in path names when using `cd`
shopt -s cdspell;



# export PATH=$PATH:"/Users/ivaylopg/NVPACK/apache-ant-1.8.2/bin"



# export PATH=$PATH:"/Users/ivaylopg/NVPACK/android-sdk-macosx/platform-tools"

# export PATH=$PATH:"/Users/ivaylopg/NVPACK/android-sdk-macosx/build-tools"

# export PATH=$PATH:"/Users/ivaylopg/NVPACK/android-sdk-macosx/extras/android/support"


# export PATH=$PATH:"/Users/ivaylopg/NVPACK/android-ndk-r15c"
# export NDK_ROOT="/Users/ivaylopg/NVPACK/android-ndk-r15c"
# export NDKROOT="/Users/ivaylopg/NVPACK/android-ndk-r15c"
# export NVPACK_NDK_VERSION="android-ndk-r15c"
# export PATH=$PATH:"/Users/ivaylopg/NVPACK/gradle-4.1-rc-2/bin"
# export PATH=$PATH:"/Users/ivaylopg/NVPACK/android-sdk-macosx/tools"


# export PATH=$PATH:"/Users/ivaylopg/NVPACK/android-ndk-r14b"

# export PATH=$PATH:"/Users/ivaylopg/NVPACK/apache-ant-1.8.2/bin"

# export PATH=$PATH:"/Users/ivaylopg/NVPACK/gradle-4.1/bin"

# export PATH=$PATH:"/Users/ivaylopg/NVPACK/android-sdk-macosx/tools"

# export PATH=$PATH:"/Users/ivaylopg/NVPACK/android-sdk-macosx/platform-tools"

# export PATH=$PATH:"/Users/ivaylopg/NVPACK/android-sdk-macosx/build-tools"

# export PATH=$PATH:"/Users/ivaylopg/NVPACK/android-sdk-macosx/extras/android/support"
export NVPACK_ROOT="/Users/ivaylopg/NVPACK"

export PATH=$PATH:"/Users/ivaylopg/NVPACK/android-ndk-r14b"
export NDK_ROOT="/Users/ivaylopg/NVPACK/android-ndk-r14b"
export NDKROOT="/Users/ivaylopg/NVPACK/android-ndk-r14b"
export NVPACK_NDK_VERSION="android-ndk-r14b"
export NVPACK_NDK_TOOL_VERSION="4.9"

export PATH=$PATH:"/Users/ivaylopg/NVPACK/apache-ant-1.8.2/bin"
export ANT_HOME="/Users/ivaylopg/NVPACK/apache-ant-1.8.2"

export PATH=$PATH:"/Users/ivaylopg/NVPACK/gradle-4.1/bin"
export GRADLE_HOME="/Users/ivaylopg/NVPACK/gradle-4.1"

export PATH=$PATH:"/Users/ivaylopg/NVPACK/android-sdk-macosx/tools"
export ANDROID_HOME="/Users/ivaylopg/NVPACK/android-sdk-macosx"

export PATH=$PATH:"/Users/ivaylopg/NVPACK/android-sdk-macosx/platform-tools"

export PATH=$PATH:"/Users/ivaylopg/NVPACK/android-sdk-macosx/build-tools"

export PATH=$PATH:"/Users/ivaylopg/NVPACK/android-sdk-macosx/extras/android/support"
