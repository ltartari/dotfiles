#!/bin/zsh
# Change this to reflect your installation directory
export __BAT_CHARGE_DIR=~/.zsh/battery_status
BAT_CHARGE=`python ~/.zsh/battery_status/battery_charge.py` 2>/dev/null

function battery_status {
    echo $BAT_CHARGE
}
