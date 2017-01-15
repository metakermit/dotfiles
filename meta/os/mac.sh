#!/bin/bash

# TODO: refactor into multiple scripts

echo "STEP 1: install essentials"

# fetch my keyboard layout
#-------------------------
#key_repo=https://raw.githubusercontent.com/kermit666/croatian-awesome/master/
#sudo curl $key_repo/Croatian-awesome.keylayout \
#  -o /Library/Keyboard\ Layouts/Croatian-awesome.keylayout
#sudo curl $key_repo/Croatian-awesome.icns \
#  -o /Library/Keyboard\ Layouts/Croatian-awesome.icns

# Homebrew
#---------
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# first things first
brew install git

# brew install bash-completion
#brew install ssh-copy-id wget

# Xcode command line tools
#-------------------------
# needed for python
xcode-select --install

# Python
#--------
# needed for bootstrapping the dotfiles
brew install python python3

# R
#---
#brew tap homebrew/science
#echo "Install XQuartz from https://xquartz.macosforge.org/landing/"
#brew install R

# Cask
#-----
# essential desktop apps

brew tap caskroom/cask
# TODO: install desktop apps like VLC, Chrome, ... from a text file

brew cask install google-chrome dropbox

# deploy the dotfiles
#--------------------

DOTFILES_HOME=~/projekti/git/dotfiles
mkdir -p $DOTFILES_HOME

echo "STEP 2: grab the source"
git clone https://github.com/metakermit/dotfiles.git $DOTFILES_HOME

echo "STEP 3: continue bootstrapping"
# don't do it for now, as it's not Mac-ready
#(cd $DOTFILES_HOME; source ./meta/bootstrap)

exit
