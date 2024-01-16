#!/bin/bash
while true; do
    bat_lvl=$(cat /sys/class/power_supply/macsmc-battery/capacity)
    chargingState=$(upower -i /org/freedesktop/UPower/devices/battery_macsmc_battery | grep -E "state" | awk 'BEGIN { FS=":" } {print $2}' | sed 's/ //g')
    if [ "$bat_lvl" -le 20 ] && [ "$chargingState" != "charging" ]; then
        notify-send --urgency=CRITICAL "Battery Low" "Level: ${bat_lvl}%"
        sleep 120
    else
        sleep 100
    fi
done

