[ -f ~/.Xresources ] && xrdb -merge ~/.Xresources

# Start Keyring
eval $(gnome-keyring-daemon --start)
export SSH_AUTH_SOCK

exec i3
#exec dbus-launch --autolaunch=$(cat /var/lib/dbus/machine-id) i3
