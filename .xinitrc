#!/usr/bin/env sh

# set DISPLAY environment variable within systemd
systemctl --user import-environment DISPLAY

mpd &                   # music player daemon
setbg &                 # script to set background
xcompmgr &              # for st/alpha
# picom -b &            # for st/alpha
dunst &                 # for notifications
xset r rate 300 50 &    # speed up xrate
unclutter &             # remove mouse when idl3
while xsetroot -name "`date` `uptime | sed 's/.*,//'`"
do
  sleep 1
done &
exec dwm                # launch window manager
