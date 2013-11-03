#!/bin/bash

# Xcode command line tools
#-------------------------
xcode-select --install

# Homebrew
#---------
ruby -e "$(curl -fsSL https://raw.github.com/mxcl/homebrew/go)"
brew update

# brew install bash-completion
brew install ssh-copy-id wget

# Python
#--------
# SSL better from brew
# http://hackercodex.com/guide/python-development-environment-on-mac-osx/
echo "Leg-stretching while Python installs..."
brew install python --with-brewed-openssl

# Py3k
brew install python3 --with-brewed-openssl

# now on with the packages...
# http://www.lowindata.com/2013/installing-scientific-python-on-mac-os-x/
pip install virtualenv
pip install virtualenvwrapper

# the rest I install in kermit-install-packages-local
#pip install numpy
echo "Now go for a coffee, gfortran takes a long time..."
brew install gfortran
#pip install scipy
brew install freetype
#pip install matplotlib
#pip install ipython

# R
#---
brew tap homebrew/science
echo "Install XQuartz from https://xquartz.macosforge.org/landing/"
brew install R
