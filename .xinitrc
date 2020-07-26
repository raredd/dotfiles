#!/usr/bin/env sh

# set DISPLAY environment variable within systemd
# systemctl --user import-environment DISPLAY

mpd &                     # music player daemon
setbg &                   # script to set background
xcompmgr &                # for st/alpha
# picom -b &              # for st/alpha
dunst &                   # for notifications
xset r rate 300 50 &      # speed up xrate
unclutter &               # remove mouse when idl3
brite &                   # set default brightness
amixer set 'Master' 80% & # set volume
                          # a simple status bar
while xsetroot -name \
  "`mem -pct` | `cpu -` | `batt -` | `vol` | `wifi` | `date "+%a %d %b %I:%M %p"` | `whoami`"
do sleep 2; done &

exec dwm                  # launch window manager
