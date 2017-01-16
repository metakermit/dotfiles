#!/bin/bash
#
# link and backup all dotfiles
#

DOTFILES_ROOT="`pwd`"

# exit if any command exits with nonzero status
#set -e

DIR=`dirname $0`
source $DIR/util.sh

info_msg ''

# sub-functions

link_files () {
  ln -s $1 $2
  success_msg "linked $1 to $2"
}

# the main dotfile linking function

install_dotfiles () {
  info_msg 'installing dotfiles'

  overwrite_all=false
  backup_all=false
  skip_all=false

  for source in `find $DOTFILES_ROOT -maxdepth 2 -name \*.symlink`
  do
    dest="$HOME/.`basename \"${source%.*}\"`"

    if [ -f $dest ] || [ -d $dest ]
    then

      overwrite=false
      backup=false
      skip=false

      if [ "$overwrite_all" == "false" ] && [ "$backup_all" == "false" ] && [ "$skip_all" == "false" ]
      then
        user_msg "File already exists: `basename $source`, what do you want to do? [s]kip, [S]kip all, [o]verwrite, [O]verwrite all, [b]ackup, [B]ackup all?"
        read -n 1 action

        case "$action" in
          o )
            overwrite=true;;
          O )
            overwrite_all=true;;
          b )
            backup=true;;
          B )
            backup_all=true;;
          s )
            skip=true;;
          S )
            skip_all=true;;
          * )
            ;;
        esac
      fi

      if [ "$overwrite" == "true" ] || [ "$overwrite_all" == "true" ]
      then
        rm -rf $dest
        success_msg "removed $dest"
      fi

      if [ "$backup" == "true" ] || [ "$backup_all" == "true" ]
      then
        mv $dest $dest\.backup
        success_msg "moved $dest to $dest.backup"
      fi

      if [ "$skip" == "false" ] && [ "$skip_all" == "false" ]
      then
        link_files $source $dest
      else
        success_msg "skipped $source"
      fi

    else
      link_files $source $dest
    fi

  done
}

link_special () {
  info_msg 'special links'
  python $DIR/link.py
}

install_dotfiles
link_special

info_msg ''
info_msg 'All dotfiles installed!'
