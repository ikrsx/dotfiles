#!/bin/sh
# Script to activate swayidle based on battery state.
# Author: Krishal
# Github: github.com/ikrsx

# Path to the battery status file (usually BAT0 on laptops).
BAT_STATUS=/sys/class/power_supply/BAT0/status

# Read current battery status (Discharging, Charging, Full, Unknown, etc.).
status=$(cat "$BAT_STATUS" 2>/dev/null)

# If the battery is discharging, use shorter timeouts to preserve battery life.
if [ "$status" = "Discharging" ]; then
  # After 2 minutes of idle, dim the screen to 5% and save the previous brightness.
  # After 3 minutes, turn off the monitors via niri.
  # After 4 minutes, lock the screen.
  # After 10 minutes, suspend the system.
  # When activity resumes, restore the saved brightness level && turn the monitors back on via niri.
  swayidle timeout 120 'brightnessctl --save set 5%' resume 'brightnessctl -r' timeout 180 'niri msg action power-off-monitors' resume 'niri msg action power-on-monitors'  timeout 240 'hyprlock' timeout 600 'systemctl suspend'
else
  # If the system is charging, full, or status is unknown, use longer timeouts.
  # After 5 minutes of idle, dim the screen to 5% and save the previous brightness.
  # After 6 minutes, turn off the monitors via niri.
  # After 7 minutes lock the screen.
  # After 15 minutes, suspend the system.
  # When activity resumes, restore the saved brightness level && turn the monitors back on via niri.
  swayidle timeout 300 'brightnessctl --save set 5%' resume 'brightnessctl -r' timeout 360 'niri msg action power-off-monitors' resume 'niri msg action power-on-monitors'  timeout 420 'hyprlock' timeout 900 'systemctl suspend'
fi
