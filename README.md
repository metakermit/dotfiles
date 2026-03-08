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

Installation
------------
Note, if you're really thinking of using this for your own config, you should
fork the repo and clean out a lot of the stuff that will be useless to you.
Sorry, I'm lazy and I didn't really make this a general-purpose config :P

### First install

On a clean Mac do:

    bash <(curl -fsSL https://raw.githubusercontent.com/metakermit/dotfiles/main/meta/install-mac.sh)

Alternatively download this repository and manually run the script:

    cd dotfiles
    chmod +x meta/install-mac.sh
    meta/install-mac.sh


### Refresh a cloned repo

To rerun the script if you added something new run:

    meta/bootstrap.sh


Thanks!
-------

- [The GitHub dotfiles community](https://dotfiles.github.io/)
- [Zach Holman's bootstrap script](https://github.com/holman/dotfiles/)
- [Zahradeen Muazu's Mac setup script](https://github.com/itxDeeni/mac-dev-setup)