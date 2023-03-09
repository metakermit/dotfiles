#!/bin/bash
#
# entry point for installing dotfiles on mac

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
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# first things first
brew install git zsh

# brew install bash-completion
#brew install ssh-copy-id wget

# Xcode command line tools
#-------------------------
# needed for python
xcode-select --install

# Python
#--------
# needed for linking the dotfiles
brew install python python3 pipenv

# we'll need this later in install-programs-local.sh
# python3 -m pip install virtualenvwrapper
# python3 -m pip install --upgrade pip

# R
#---
#brew tap homebrew/science
#echo "Install XQuartz from https://xquartz.macosforge.org/landing/"
#brew install R

# Cask
#-----
# essential desktop apps

brew --cask install emacs dropbox iterm2 flux

# deploy the dotfiles
#--------------------

DOTFILES_HOME=~/code/dotfiles
mkdir -p $DOTFILES_HOME

echo "STEP 2: grab the source"
git clone https://github.com/metakermit/dotfiles.git $DOTFILES_HOME

echo "STEP 3: install dotfiles"
# don't do it for now, as it's not Mac-ready
(cd $DOTFILES_HOME; ./meta/install.sh)

exit
