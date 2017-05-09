#!/bin/sh

source 99_utils.sh

ask_for_confirmation "Install Vundle (Vim Plugin manager)?"
if answer_is_yes; then
  print_info "Installing Vundle..."
  git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
  vim +PluginInstall +qall
fi

ask_for_confirmation "Install git-friendly?"
if answer_is_yes; then
  print_info "Installing git-friendly"
  #url -s https://raw.githubusercontent.com/jamiew/git-friendly/master/install.sh | bash
  sudo bash < <( curl https://raw.githubusercontent.com/jamiew/git-friendly/master/install.sh)
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

ask_for_confirmation "Install 'Bundler' Ruby Gem?"
if answer_is_yes; then
  print_info "Installing 'Bundler'"
  sudo gem install bundler
fi
