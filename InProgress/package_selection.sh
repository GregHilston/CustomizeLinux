#!/bin/bash

packages_output="/tmp/packages/" # Where to store output

dialog --checklist "Choose programs to install (Use space to select/deselect):" 100 100 22 \
        1 "guake" on \
        2 "vim" on \
        4 "chromium-browser" on \
        5 "virtualbox" on \
        6 "filezilla" on \
        7 "vlc" on \
        8 "gparted" on \
        9 "git" on \
        10 "conky" on \
        11 "cowsay" on \
        12 "cinnamon" on \
        13 "java" on \
        14 "sublime" on \
        15 "pidgin" on \
        16 "skype" on \
        17 "google music" on \
        18 "facebook messenger" on \
        19 "intellj" on \
        20 "pycharm" on \
        21 "clion" on \
        22 "android studio" on \
        2> /tmp/packages