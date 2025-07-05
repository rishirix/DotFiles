#!/bin/bash
BAT_PATH="/sys/class/power_supply/BAT0"
CHARGE=$(cat $BAT_PATH/capacity)
STATUS=$(cat $BAT_PATH/status)
echo "Bat: $CHARGE% ($STATUS)"

