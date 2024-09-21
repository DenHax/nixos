{
  pkgs ? import <nixpkgs> { },
}:

pkgs.writers.writeBash "bat_log" ''
  #!/usr/bin/env bash

  mkdir -p "''$HOME/log"

  battery_level=''$(cat /sys/class/power_supply/BAT0/capacity)

  current_time=''$(date '+%d:%m:%Y %H:%M:%S')

  echo "Battary charging: ''${battery_level}% ''${current_time}" >> "$HOME/log/bat_log.txt"
''
