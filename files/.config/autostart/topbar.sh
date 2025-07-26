#!/bin/bash

dconf write /org/gnome/shell/extensions/hidetopbar/enable-intellihide true
sleep 1
dconf write /org/gnome/shell/extensions/hidetopbar/enable-intellihide false
