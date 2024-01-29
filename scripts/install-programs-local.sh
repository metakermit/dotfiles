#!/bin/bash

# install locally, not as super user

# Non-sudo stuff
##################

# Python packages
#-----------------

cheese_shop() {
    echo "installing from the Cheese Shop"
    export WORKON_HOME
    source /opt/homebrew/bin/virtualenvwrapper.sh
    deactivate

    if [[ "$OSTYPE" == "linux-gnu" ]]; then
        PYTHON_BIN3=/usr/bin/python3
    elif [[ "$OSTYPE" == "darwin"* ]]; then
        PYTHON_BIN3=/opt/homebrew/bin/python3
    fi

    # create the virtualenvs if they don't exist
    if ! workon | grep --quiet '^s$'; then
        mkvirtualenv --system-site-packages -p $PYTHON_BIN3 s
    fi

    PYTHON_STABLE="ansible"
    PYTHON_SCI="jupyter pandas numpy scipy matplotlib nose yanc jedi epc"
    if type workon > /dev/null; then
        workon s
        pip install --upgrade pip
        pip install --upgrade `echo $PYTHON_STABLE`
        pip install --upgrade `echo $PYTHON_SCI`
    fi

}

# get stuff from source
#-----------------------

#--global functions-----
export GIT=~/code

clone_new() {
    NAME=`python3 -c "import sys; p=sys.argv[1]; print(p.split('/')[-1][:-4])" $1`
    if [ -d $NAME ]
    then
        echo $NAME already installed
    else
        echo "git clone $1"
        git clone $1
    fi
}
#----------

get_src() {
    mkdir -p $GIT

    # solarized stuff
    # -----
    if [[ "$OSTYPE" == "linux-gnu" ]]; then
        SLR=${GIT}/drugi/solarized
        mkdir -p $SLR
        cd $SLR
        clone_new https://github.com/sigurdga/gnome-terminal-colors-solarized.git
        clone_new https://github.com/coolwanglu/guake-colors-solarized.git
    fi

    # other
    # -----
    mkdir -p $GIT/drugi
    cd $GIT/drugi
    clone_new https://github.com/rupa/z.git
}

get_zsh() {
    if [ -d ~/.oh-my-zsh ]
    then
        echo "oh-my-zsh already set up"
    else
        echo "setting up oh-my-zsh"
        git clone git://github.com/ohmyzsh/oh-my-zsh.git ~/.oh-my-zsh
        chsh -s /bin/zsh

    fi
}

# Node.js
get_yarn() {
    # gets yarn and in turn node/npm
    if [[ "$OSTYPE" == "linux-gnu" ]]; then
        curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
        echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
        sudo apt-get update && sudo apt-get install yarn
    elif [[ "$OSTYPE" == "darwin"* ]]; then
        brew update
        brew install yarn
    fi
}

# Call all the functions
#-----------------------

install_non_sudo() {
    get_zsh
    cheese_shop
    get_yarn
    get_src
}

echo "Instulling stuff as a *local* user..."

install_non_sudo

echo "Done."

exit
