#!/bin/bash
#
# install.sh will link and install everything if essentials are available:
# git, python, ...
#
# use install-mac.sh or install-linux.sh as an the entry point instead
#

# exit if any command exits with nonzero status
#set -e

echo ''
DIR=`dirname $0`
META_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source $DIR/util.sh

# sub-functions

additionally () {
  # get fonts
  source $DIR/get-powerline-fonts.sh

  info_msg 'install local programs'
  $HOME/.bin/scripts/kermit-install-programs-local

  # scripts location TODO: write a (.gitignored) config file to the scripts/ folder stating this location
  SCRIPTS_DIR=`dirname $META_DIR`/scripts
  info_msg 'need sudo to write to /etc/kermit-location and install essential programs'
  echo $SCRIPTS_DIR | sudo tee /etc/kermit-location

  # we need the Ubuntu sudo same PATH hack...
  . $HOME/.bin/scripts/kermit-computer-profile
  . $HOME/.bin/scripts/kermit-computer-shrc

  # copy some hooks (on-resume etc.)
  sudo ./meta/os/linux/setup_ubuntu_root_stuff.sh

  # zsh default
  chsh -s $(which zsh)

  # on OS X do:
  # sudo dscl . change /users/$USER UserShell /bin/bash $(which zsh)

  # get emoji
  curl 'https://raw.githubusercontent.com/heewa/bae/master/emoji_vars.sh' > ~/.emoji_vars.sh
}

source $DIR/link-dotfiles.sh
additionally

echo ''
info_msg 'Installation complete!'
