date_formatted=$(date "+%a %F %H:%M")

battery_status=$(cat "/sys/class/power_supply/BAT0/status")
battery_capacity=$(cat "/sys/class/power_supply/BAT0/capacity")

# Check if battery is discharging
if [ $battery_status = "Discharging" ]; then
    battery_info="Batt: $battery_capacity%"
elif [ $battery_status = "Charging" ]; then
    battery_info="⚡ $battery_capacity%"
else
    battery_info="$battery_status"
fi

current_ssid=$(nmcli -t -f active,ssid dev wifi | grep '^yes' | cut -d':' -f2)

# Check if the SSID is available
if [ -n "$current_ssid" ]; then
    network_info=" $current_ssid"
else
    network_info="Not connected"
fi

audio_volume=$(amixer -M get Master |\
    awk '/Mono.+/ {print $6=="[off]" ?\
    "🔇 "$4: \
    "🔉 "$4}' |\
    tr -d [])

echo "$audio_volume | $network_info | $battery_info | $date_formatted"
