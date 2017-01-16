metakermit's ~/.*
=================

After looking at the many
[interesting dotfile solutions](http://dotfiles.github.io/),
I decided to go the build-your-own-lightsaber road after all. So here goes…

Installation
------------
On a clean Ubuntu machine, do:

    wget -O - https://raw.githubusercontent.com/metakermit/dotfiles/master/meta/install-linux.sh | bash

In OS X do:

    bash <(curl -s https://raw.githubusercontent.com/metakermit/dotfiles/master/meta/os/install-mac.sh)

Alternatively, if you already have `git` and you cloned this repository, just do:

    ./meta/install.sh

TODO:
----

- store kermit-location inside the scripts folder
- k script prefix with tab-completed subcommands - argparse+genzshcomp,
  OptionParser or trollop
- move additionally () to separate file (too custom to my preferences)
- install essential programs platform-independently

Changelog
---------

- add emacs config metakermit/kermit-emacs
- install script - something like http://blog.smalleycreative.com/tutorials/using-git-and-github-to-manage-your-dotfiles/

Thanks!
-------
meta/install.sh - https://github.com/holman/dotfiles/blob/master/script/bootstrap
