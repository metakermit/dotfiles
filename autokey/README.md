AutoKey-Emacs
==============

My [Autokey](https://apps.ubuntu.com/cat/applications/autokey-gtk/) settings to change the keybindings in Ubuntu that makes typical Emacs movement accessible everywhere.

                    ctrl+p
    ctrl+a  ctrl+b          ctrl+f  ctrl+e
                    ctrl+n

To achieve this, a remapping of the old functions (new window, tab, print, select all, ...) was also done so that they are accessible through the `alt` key (`alt+n`, `alt+t` etc.)

A list of apps that are not included (Emacs itself obviously, but also some others where you wouldn't wanna mess with the bindings) is defined in the `combo.py` script.

Note that I'm using `<alt>` to represent `<cmd>`, because I'm using a PC keyboard on my Ubuntu laptop, but you can easily make this work as expected on an Apple keyboard, too - just go to system settings -> keyboard -> keyboard layout -> options... and select under Alt/Win key behaviour "Left Alt is swapped with Left Win". Alternatively, you can edit my scripts (the content and the .json files) and just replace all the `<alt>` keys with `<super>`.

Installation
------------
Place the scripts anywhere inside `~/.config/autokey/` (or run my `./meta/link` script to create symlinks to the cloned repo for you) and add `autokey` to your startup applications (dash -> startup applications in Ubuntu).