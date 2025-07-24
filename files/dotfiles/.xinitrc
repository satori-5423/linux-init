#!/bin/bash
export XDG_SESSION_TYPE=x11
exec dbus-launch --exit-with-session gnome-shell
