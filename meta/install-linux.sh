#!/bin/bash
#
# entry point for installing dotfiles on Ubuntu Linux

DOTFILES_HOME=~/code/dotfiles

echo "STEP 1: install essentials"
sudo apt-get install -y git-core zsh

echo "STEP 2: grab the source"
git clone https://github.com/metakermit/dotfiles.git $DOTFILES_HOME

echo "STEP 3: install dotfiles"
(cd $DOTFILES_HOME; ./meta/install.sh)

exit
