#!/bin/sh

########################################################################
##  Merge in defaults and keymaps                                     ##
########################################################################

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

if [ -f $sysresources ]; then
    /usr/bin/xrdb -merge $sysresources
fi

if [ -f $sysmodmap ]; then
    /usr/bin/xmodmap $sysmodmap
fi

if [ -f $userresources ]; then
    /usr/bin/xrdb -merge $userresources
fi

if [ -f $usermodmap ]; then
    /usr/bin/xmodmap $usermodmap
fi

########################################################################
##  Start xfce Desktop Environment                                    ##
########################################################################

setxkbmap us,ro &
xrandr --output HDMI-0 --mode 1920x1080 --rate 120.00 &
xsetroot -cursor_name left_ptr &
picom -fb --experimental-backends --backend glx &
#stalonetray --window-layer top -t &
redshift-gtk &
transmission-gtk -m &
parcellite &
firefox &
exec bspwm
