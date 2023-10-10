#!/usr/bin/env bash

killall -q polybar

while pgrep -u ${UID} -x polybar >/dev/null; do
	sleep 1
done

SELECTED_BAR=(
    # "top_left"
    # "top_right"
    "root"
)

echo "---" | tee -a /tmp/${SELECTED_BAR[@]}

for bar in ${SELECTED_BAR[@]}; do
    polybar "${bar}" 2>&1 | tee -a "/tmp/${bar}.log" & disown
done

# if [ $(xrandr -q | grep 'HDMI connected') ]; then
# 	polybar top_external &
# fi

echo "Bars launched..."
