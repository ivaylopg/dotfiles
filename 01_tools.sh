#!/bin/sh

git clone https://github.com/zsh-users/antigen .zsh-antigen/antigen
chsh -s /bin/zsh

curl -L https://raw.github.com/rauchg/wifi-password/master/wifi-password.sh -o /usr/local/bin/wifi-password && chmod +x /usr/local/bin/wifi-password

### XCode Command Line Tools
#      thx  https://github.com/alrra/dotfiles/blob/c2da74cc333/os/os_x/install_applications.sh#L39

if [ $(xcode-select -p &> /dev/null; printf $?) -ne 0 ]; then
    xcode-select --install &> /dev/null
    # Wait until the XCode Command Line Tools are installed
    while [ $(xcode-select -p &> /dev/null; printf $?) -ne 0 ]; do
        sleep 5
    done
	xcode-select -p &> /dev/null
	if [ $? -eq 0 ]; then
        # Prompt user to agree to the terms of the Xcode license
        # https://github.com/alrra/dotfiles/issues/10
       sudo xcodebuild -license
   fi
fi

###