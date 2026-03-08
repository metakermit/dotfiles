#!/usr/bin/env bash
#
# entry point for installing dotfiles on a clean Mac from a remote url
# usage:
#     $ bash <(curl -fsSL https://raw.githubusercontent.com/metakermit/dotfiles/main/meta/install-mac.sh)

echo "STEP 1: install essentials"

# fetch my keyboard layout - TODO fix
#-------------------------
#key_repo=https://raw.githubusercontent.com/kermit666/croatian-awesome/master/
#sudo curl $key_repo/Croatian-awesome.keylayout \
#  -o /Library/Keyboard\ Layouts/Croatian-awesome.keylayout
#sudo curl $key_repo/Croatian-awesome.icns \
#  -o /Library/Keyboard\ Layouts/Croatian-awesome.icns

# Homebrew
#---------
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew update

# first things first
brew install git zsh

# brew install bash-completion
#brew install ssh-copy-id wget

# Xcode command line tools
#-------------------------
# needed for Python
if xcode-select -p &>/dev/null; then
    echo "Xcode Command Line Tools already installed"
else
    xcode-select --install
    echo "Please complete the Xcode Command Line Tools installation and re-run this script"
    exit 0
fi

# Python
#--------
# needed for linking the dotfiles
brew install python3 virtualenvwrapper

# we'll need this later in install-programs-local.sh
# python3 -m pip install virtualenvwrapper
# python3 -m pip install --upgrade pip

# Cask
#-----
# essential desktop apps

brew install --cask emacs iterm2

## Defaults
#----------
defaults write com.googlecode.iterm2.plist PrefsCustomFolder -string "$HOME/.iterm"
defaults write com.googlecode.iterm2.plist LoadPrefsFromCustomFolder -bool true


# deploy the dotfiles
#--------------------

DOTFILES_HOME=~/code/dotfiles
mkdir -p $DOTFILES_HOME

# echo "STEP 2: grab the source"
# git clone https://github.com/metakermit/dotfiles.git $DOTFILES_HOME

# echo "STEP 3: install dotfiles"
(cd $DOTFILES_HOME; meta/install.sh)

exit
