#!/usr/bin/env bash

set -euo pipefail

awk_input=$(cat /sys/class/power_supply/hid-*-battery/uevent)

echo "$awk_input" | awk -F '=' 'BEGIN {ORS=""};$1 == "POWER_SUPPLY_MODEL_NAME" {print($2":","")}'

echo "$awk_input" | awk -F '=' '$1 == "POWER_SUPPLY_CAPACITY" {print($2)}'
