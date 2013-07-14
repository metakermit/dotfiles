# the magic script that gets called by all the others to filter and forward the key combo

import logging # see the logs in ~/.config/autokey/autokey.log
import re

h = store.get_global_value('hotkey')
s =  engine.get_return_value()
logging.debug("combo got: " + str(s)) # autokey-gtk -l

logging.debug(window.get_active_class())

#if re.match('^((?!.*Emacs).)*$', window.get_active_class()):
if re.match('.*(Emacs|Guake|Gnome-terminal|Gvim|Eclipse)', window.get_active_class()):
    logging.debug('nothing')
    keyboard.send_keys(h)
else:
    logging.debug('sth')
    keyboard.send_keys(s)