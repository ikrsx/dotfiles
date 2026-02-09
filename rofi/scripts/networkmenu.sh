: '
 * Script to launch network menu for networking using rofi.
 * Author: Krishal
 * Github: github.com/ikrsx
'

#!/bin/bash

# Get the options from the rofi menu.
OPTION_SELECTED=$(echo -e "  Wi-fi Settings\n󰐻 Network Settings" | rofi -dmenu -theme styles/networkmenu.rasi)

# Case for the selected option.
case $OPTION_SELECTED in
	"  Wi-fi Settings") alacritty --command impala;;
	"󰐻 Network Settings") alacritty --command nmtui;;
	*) exit;;
esac
