#!/bin/bash

# ----------------------------------------------------- 
# Quit all running waybar instances
# ----------------------------------------------------- 

killall waybar
pkill waybar
sleep 0.2

# ----------------------------------------------------- 
# Loading the configuration
# ----------------------------------------------------- 

config_file="config"
style_file="style.css"

waybar -c ~/.config/waybar/$config_file -s ~/.config/waybar/$style_file &

