#!/bin/sh

# check wether wifi is on or off
readonly connected=$(nmcli -fields WIFI g)
if [[ "$connected" =~ "enabled" ]]; then
	readonly toggle="󰖪  Disable Wi-Fi"
elif [[ "$connected" =~ "disabled" ]]; then
	readonly toggle="  Enable Wi-Fi"
fi

# gather wifi list
notify-send "Gathering Wi-Fi Networks...."
readonly ssid_list=$(nmcli -f SSID dev wifi | grep -v -E "SSID|--" | awk -v icon="  " '{print icon $0}') 

# get ssid from the fuzzel
readonly ssid=$(echo -e "$toggle\n$ssid_list" | fuzzel --dmenu --minimal-lines --hide-prompt -a bottom-right)

# exit if fuzzel is escaped or ssid's value is null
if [[ -z "$ssid" ]]; then
  exit
elif [[ "$ssid" == "󰖪  Disable Wi-Fi" ]]; then
 nmcli radio wifi off 
elif [[ "$ssid" == "  Enable Wi-Fi" ]]; then
 nmcli radio wifi on 
else
  # get password using fuzzel
  passwd=$(fuzzel --prompt-only "Password: " --password --dmenu) 

  # exit if fuzzel is escaped or password's value is null
  if [[ -z $passwd ]]; then
    exit
  fi

  # let nmcli connect to ssid using password
  nmcli dev wifi connect $ssid password $passwd && notify-send "Connection successfull with $ssid"

  # reprompt for wrong password
  while [[ $? -ne 0 ]]; do
    nmcli connection delete $ssid
    passwd=$(fuzzel --prompt-only "Enter Again: " --password --dmenu) 

    # exit if propmpt is quit or password's value null
    if [[ -z $passwd ]]; then
      break 
    fi

    nmcli dev wifi connect $ssid password $passwd && notify-send "Connection successfull with $ssid"
  done
fi
