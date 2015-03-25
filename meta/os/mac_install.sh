#!/bin/bash

function brew_cask_install_or_upgrade {
    program=$1
    # only install for now
    echo "install ${program}"
    brew cask install $program
}

# comfy
while read program; do
    brew_cask_install_or_upgrade $program
done < mac-comfy.txt


# sci
#brew_cask_install_or_upgrade mactex

exit
