#!/bin/zsh
BAT_CHARGE=`python ~/.zsh/battery_status/battery_charge.py` 2>/dev/null
function battery_status {
    echo $BAT_CHARGE
}
