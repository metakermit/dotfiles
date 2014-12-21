kermit's ~/.*
=============

After looking at the many [interesting dotfile solutions](http://dotfiles.github.io/),
I decided to go the build-your-own-lightsaber road after all. So here goes...

Installation
------------
On a clean Ubuntu machine, do:

    wget -O - https://raw.githubusercontent.com/kermit666/dotfiles/master/meta/bootstrap_new_machine | bash

Alternatively, if you already have `git` and you cloned this repository, just do:

    source ./meta/bootstrap

TODO:
----

- store kermit-location inside the scripts folder
- k script prefix with tab-copmleted subcommands - argparse+genzshcomp,
  OptionParser or trollop
- move aditionally () to separate file (too custom to my preferences)
- install essential programs platform-independently

Changelog
---------

- add emacs config kermit666/kermit-emacs
- install script - something like http://blog.smalleycreative.com/tutorials/using-git-and-github-to-manage-your-dotfiles/

Thanks!
-------
meta/bootstrap - https://github.com/holman/dotfiles/blob/master/script/bootstrap
