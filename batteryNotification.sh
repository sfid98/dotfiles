#!/bin/bash
while true; do
	bat_lvl=$(cat /sys/class/power_supply/macsmc-battery/capacity) 
  if [ "$bat_lvl" -le 20 ]; then
    notify-send --urgency=CRITICAL "Battery Low" "Level: ${bat_lvl}%"
    sleep 120
  else
    sleep 100
  fi
done
