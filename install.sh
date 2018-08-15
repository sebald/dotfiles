#!/usr/bin/env bash

#-------------------------------#
#             Update            #
#-------------------------------#
echo "Updating repo...";
# git pull origin master;


#-------------------------------#
#         Copy Dotfiles         #
#-------------------------------#
function doIt() {
  echo "Syncing dotiles..."
  rsync --exclude ".git/" \
    --exclude ".DS_Store" \
    --exclude ".osx" \
    --exclude "install.sh" \
    --exclude "README.md" \
    --exclude "LICENSE" \
    -avh --no-perms . ~;
  source ~/.bash_profile;
}

if [ "$1" == "--force" -o "$1" == "-f" ]; then
  doIt;
else
  read -p "This may overwrite existing files in your home directory. Are you sure? (y/n) " -n 1;
  echo "";
  if [[ $REPLY =~ ^[Yy]$ ]]; then
    doIt;
  fi;
fi;
unset doIt;

#-------------------------------#
#  Install additional programs  #
#-------------------------------#
echo "Installing programs..."
function installOrUpdate() {
  if [[ !($(which $1)) ]]; then
    eval "$2"
  else
    eval "$3"
  fi
}

installOrUpdate "n" "curl -L https://git.io/n-install | bash" "n-update";
installOrUpdate "brew" "/usr/bin/ruby -e `$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)`" "brew update && brew upgrade -all";

unset installOrUpdate;

# Install latest node and run brew
n latest

# Install GMail app
cd gmail
sh install.sh