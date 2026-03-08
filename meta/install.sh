#!/usr/bin/env bash
#
# run install.sh locally in a git repo to set a few more things up (manual linking and install from source)
# run this _only after install-mac.sh_ (if essentials are available: git, zsh, ...)

# exit if any command exits with nonzero status
#set -e

echo ''
DIR=`dirname $0`
META_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
DOTFILES_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )/.." && pwd )"
# source $DIR/util.sh

link_manually () {
  if [ -f "$HOME/.ssh/config" ]
  then
    echo "ssh config already linked"
  else
    ln -s "$DOTFILES_DIR/ssh/config" "$HOME/.ssh/config"
    echo "ssh config linked"
  fi
}

additionally () {
  # install local programs
  echo 'install local programs'
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

# link dotfiles
$META_DIR/bootstrap.sh
# link some stuff manually
link_manually
# source the profile and change to zsh
additionally

echo ''
echo 'Installation complete!'

