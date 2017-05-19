# crude-display-settings
A script I wrote for my boss to configure his displays in a proper way. Have fun, Ralph!

# Howto use

Put the `set-display-configuration.sh` and `toggle-tv.sh` somewhere in your `$PATH`.

Put `Display watcher.desktop` either in `/ect/xdg/autostart/` or in `~/.config/autostart/` depending on who will use it (global or local use).

The `Toggle TV.desktop` needs to be in either `/usr/local/share/applications/` (don't put it in `/usr/share/applications/` if you don't use a package manager for this) or in `~/.local/share/applications/`. It then will appear in your menu and can easy be added to the panel as launcher.

# How it works

The script `set-display-configuration.sh` is running in the background, checking and setting the current display state. The script `toggle-tv.sh` enables/disables the usage of the third device.

Every reboot will reset the state of the use of the TV output.
