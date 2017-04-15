#!/bin/sh

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

# merge in defaults and keymaps
if [ -f $sysresources ]; then
    xrdb -merge $sysresources
fi

if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi

if [ -f "$userresources" ]; then
    xrdb -merge "$userresources"
fi

if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi

# start some nice programs
if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

# set repeat keyboard delay
xset r rate 200 25
# set monitor timeout time to 1 hour (3600 seconds / 60 seconds per minute = 60 minutes)
xset dpms 3600 3600 3600

~/.fehbg &
xcape
workrave &
redshift &
xautolock -time 10 -locker "i3lock-fancy" &
compton --config ~/.config/compton/compton.conf -b &

# start window manager
exec i3
