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
  SCRIPTS_DIR=`dirname $META_DIR`/scripts
  $SCRIPTS_DIR/install-programs-local.sh

  # we need the Ubuntu sudo same PATH hack...
  . $HOME/.shprofile
  . $HOME/.shrc

  # zsh default
  chsh -s $(which zsh)

  # on OS X do:
  # sudo dscl . change /users/$USER UserShell /bin/bash $(which zsh)

  # get emoji
  curl 'https://raw.githubusercontent.com/heewa/bae/master/emoji_vars.sh' > ~/.emoji_vars.sh

  # create ~/.localshrc
  if [ ! -f ~/.localshrc ]; then
      echo "# ~/.localshrc: executed by bash / zsh for local overrides" > ~/.localshrc
      chmod 755 ~/.localshrc
  fi
}

source $DIR/link-dotfiles.sh
additionally

echo ''
info_msg 'Installation complete!'
