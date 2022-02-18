[ -f ~/.Xresources ] && xrdb -merge ~/.Xresources

# Start Keyring
eval $(gnome-keyring-daemon --start)
export GNOME_KEYRING_CONTROL GNOME_KEYRING_PID GPG_AGENT_INFO SSH_AUTH_SOCK

exec dbus-launch i3
#exec dbus-launch --autolaunch=$(cat /var/lib/dbus/machine-id) i3
