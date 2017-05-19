# crude-display-settings
A script I wrote for my boss to configure his displays in a proper way. Have fun, Ralph!

# Howto use
Put both scripts in some directory where they can be executed.

Put the `set-display-configuration.sh` in the autostart and create a panel button for the `toggle-tv.sh` script.

# How it works

The script `set-display-configuration.sh` is running in the background, checking and setting the current display state. The script `toggle-tv.sh` enables/disables the usage of the third device.

Every reboot will reset the state of the use of the TV output.
