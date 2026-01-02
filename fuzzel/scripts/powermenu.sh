#!/bin/sh
selection=$(echo -e "⏻ Shutdown\n Restart\n Lock\n󰍃 Logout\n Suspend\n⏼ Hibernate" | fuzzel --dmenu --minimal-lines --hide-prompt -a bottom-right)

if [[ "$selection" == "⏻ Shutdown" ]]; then
  systemctl poweroff
elif [[ "$selection" == " Restart" ]]; then
  systemctl reboot
elif [[ "$selection" == " Lock" ]]; then
  hyprlock
elif [[ "$selection" == "󰍃 Logout" ]]; then
  loginctl terminate-user $USER
elif [[ "$selection" == " Suspend" ]]; then
  systemctl suspend && hyprlock
elif [[ "$selection" == "⏼ Hibernate" ]]; then
  systemctl hibernate && hyprlock
else
  exit
fi
