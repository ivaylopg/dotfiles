#!/bin/sh

source 99_utils.sh

ask_for_confirmation "Install Vundle (Vim Plugin manager)?"
if answer_is_yes; then
  print_info "Installing Vundle..."
  git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
  vim +PluginInstall +qall
fi

ask_for_confirmation "Install Alcatraz (Xcode package manager)?"
if answer_is_yes; then
  print_info "Installing Alcatraz..."
  curl -fsSL https://raw.githubusercontent.com/supermarin/Alcatraz/deploy/Scripts/install.sh | sh
  #rm -rf ~/Library/Application\ Support/Developer/Shared/Xcode/Plug-ins/Alcatraz.xcplugin
  #rm -rf ~/Library/Application\ Support/Developer/Shared/Xcode/Plug-ins/Alcatraz.xcplugin
fi

ask_for_confirmation "Install wifi-password?"
if answer_is_yes; then
  print_info "Installing wifi-password"
  curl -L https://raw.github.com/rauchg/wifi-password/master/wifi-password.sh -o /usr/local/bin/wifi-password && chmod +x /usr/local/bin/wifi-password
fi


ask_for_confirmation "Install git-friendly?"
if answer_is_yes; then
  print_info "Installing git-friendly"
  curl -s https://raw.githubusercontent.com/jamiew/git-friendly/master/install.sh | bash
fi


ask_for_confirmation "Configure Sublime Text CLI?"
if answer_is_yes; then
  print_info "Setting up Sublime CLI"
  sudo ln -s "/Applications/Sublime Text.app/Contents/SharedSupport/bin/subl" /usr/local/bin/subl
fi

ask_for_confirmation "Install tmux plugin manager"
if answer_is_yes; then
  print_info "Installing tmux plugin manager"
  git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
fi


ask_for_confirmation "Install AWS CLI?"
if answer_is_yes; then
  print_info "Installing AWS CLI"
  cd $HOME/Desktop
  curl "https://s3.amazonaws.com/aws-cli/awscli-bundle.zip" -o "awscli-bundle.zip"
  unzip awscli-bundle.zip
  sudo ./awscli-bundle/install -i /usr/local/aws -b /usr/local/bin/aws
fi


ask_for_confirmation "Install Colossal Cave Adventure?"
if answer_is_yes; then
  #set up Colossal Cave Adventure 2.5 (430pts)
  print_info "Installing Colossal Cave Adventure"
  ## mkdir ~/.adventure && cp $(pwd)/bin/adventure/* ~/.adventure/
  git clone git@github.com:ivaylopg/Adventure.git ~/.adventure
fi

ask_for_confirmation "Restore Mackup Settings?"
if answer_is_yes; then
  print_info "Restoring Mackup Settings"
  mackup restore
fi

ask_for_confirmation "Install 'Bundler' Ruby Gem?"
if answer_is_yes; then
  print_info "Installing 'Bundler'"
  gem install bundler
fi

# ask_for_confirmation ""
# if answer_is_yes; then
# fi


#install CamingoCode Font ( This is now done in brew cask)
# echo "##### INSTALLING CamingoCode Font #####"
# mkdir $HOME/Desktop/camingo
# cd $HOME/Desktop/camingo
# curl -O http://janfromm.de/_data/downloads/CamingoCode-v1.0.zip
# unzip *
# open CamingoCode-*.ttf
# cd ../
# mv camingo ~/.Trash
