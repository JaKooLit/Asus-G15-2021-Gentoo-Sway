#!/bin/bash
wifi="$(nmcli r wifi | awk 'FNR = 2 {print $1}')"
if [ "$wifi" == "enabled" ]; then
    rfkill block all &
    notify-send 'airplane mode: active'
else
    rfkill unblock all &
    notify-send 'airplane mode: inactive'
fi
