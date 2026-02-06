: '
 * Script to launch session menu for the window manager using rofi.
 * Author: Krishal
 * Github: github.com/ikrsx
'

#!/bin/bash

# Get the options from the rofi menu.
OPTION_SELECTED=$(echo -e "⏻ Shutdown\n Restart\n Lock\n󰒲 Suspend\n⏼ Hibernate\n󰍃 Quit" | rofi -dmenu -theme styles/sessionmenu.rasi)

# Case for the selected option.
case $OPTION_SELECTED in
	"⏻ Shutdown") systemctl poweroff && exit;;
	" Restart") systemctl reboot && exit;;
	" Lock") hyprlock && exit;;
	"󰒲 Suspend") systemctl suspend && hyprlock && exit;;
	"⏼ Hibernate") systemctl hibernate && hyprlock && exit;;
	"󰍃 Quit") exit;;
	*) exit;;
esac
