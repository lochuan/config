#!/bin/bash

EXT_DSP=$(xrandr --listactivemonitors | awk '{print $4}' | tr '\n' ',' | cut -d ',' -f 3)
rm /home/lochuan/.i3/*
if [ -z $EXT_DSP ]; then
    cp /home/lochuan/.i3-conf-buket/config /home/lochuan/.i3/
elif [ "$EXT_DSP" = 'DP1' ]; then
    cp /home/lochuan/.i3-conf-buket/config_E /home/lochuan/.i3/config
    sed -i 's/E_SCREEN/DP1/g' /home/lochuan/.i3/config
elif [ "$EXT_DSP" = 'HDMI1' ]; then
    cp /home/lochuan/.i3-conf-buket/config_E /home/lochuan/.i3/config
    sed -i 's/E_SCREEN/HDMI1/g' /home/lochuan/.i3/config
fi
bash -c /home/lochuan/.screenlayout/external_screen.sh
