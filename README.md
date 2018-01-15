metakermit's ~/.*
=================

After looking at the many
[interesting dotfile solutions](http://dotfiles.github.io/),
I decided to go the build-your-own-lightsaber road after all. So here goes…

Features
--------

💦🌱 These configs are actively nourished:

- 📝 [atom](https://atom.io/) – the versatile and modern text editor
- 💻 [zsh](http://ohmyz.sh/) – a cozy shell environment with git/virtualenv support
- 📈 [jupyter notebook](https://jupyter.org/) – easily start a local Jupyter Notebook for number crunching on a train
- 📝 [emacs](https://www.gnu.org/software/emacs/) – the classic text editor – for some reason I keep its config in [➡️ another repo](https://github.com/metakermit/kermit-emacs)

📼 These configs are still in there, but I rarely use them:

- 💻 bash – not as cool as zsh, but should still work, I hope
- ⌨️ [autokey](https://askubuntu.com/questions/245746/) – in Ubuntu, I tried to
  get global Emacs shortcuts, but I hear from people this ain't working
  any more. I'm mostly in OS X these days. Use at your own risk…

Installation
------------
Note, if you're really thinking of using this for your own config, you should
fork the repo and clean out a lot of the stuff that will be useless to you.
Sorry, I'm lazy and I didn't really make this a general-purpose config :P

On a clean Ubuntu machine, do:

    wget -O - https://raw.githubusercontent.com/metakermit/dotfiles/master/meta/install-linux.sh | bash

In OS X do:

    bash <(curl -s https://raw.githubusercontent.com/metakermit/dotfiles/master/meta/install-mac.sh)

Alternatively, if you already have `git` and you cloned this repository,
in Ubuntu just do:

    ./meta/install-linux.sh

or on a Mac:

    ./meta/instal-mac.sh

TODO:
----

- store kermit-location inside the scripts folder
- k script prefix with tab-completed subcommands - argparse+genzshcomp,
  OptionParser or trollop
- move additionally () to separate file (too custom to my preferences)
- anonymize some of the configs / scripts that contain stuff very specific to me

Changelog
---------

- installed essential programs platform-independently
- added emacs config metakermit/kermit-emacs
- added install script - something like http://blog.smalleycreative.com/tutorials/using-git-and-github-to-manage-your-dotfiles/

Thanks!
-------

- [the GitHub dotfiles community](https://dotfiles.github.io/)
- [meta/install.sh](https://github.com/holman/dotfiles/blob/master/script/bootstrap)
