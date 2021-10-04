[ -f ~/.Xresources ] && xrdb -merge ~/.Xresources

exec i3
#exec dbus-launch --autolaunch=$(cat /var/lib/dbus/machine-id) i3
