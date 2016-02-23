#!/bin/bash

DOTFILES_HOME=~/projekti/git/dotfiles

echo "STEP 1: install essentials"
sudo apt-get install -y git-core

echo "STEP 2: grab the source"
git clone https://github.com/kermit666/dotfiles.git $DOTFILES_HOME

echo "STEP 3: continue bootstrapping"
cd $DOTFILES_HOME

source ./meta/bootstrap.sh

exit

