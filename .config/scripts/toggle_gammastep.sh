#!/bin/bash

# Function to kill gammastep if it's running
kill_gammastep() {
    if pgrep -x "gammastep" > /dev/null; then
        pkill gammastep
    fi
}

# Gammastep already running + no arguments -> kill gammastep
if [ "$#" -eq 0 ] && pgrep -x "gammastep" > /dev/null; then
    kill_gammastep
    exit 0
fi

# Gammastep already running + command line arguments -> update temperature
if [ "$#" -eq 1 ]; then
    kill_gammastep
    gammastep -O "$1" &
    exit 0
fi

# Default startup
if [ "$#" -eq 0 ]; then
    gammastep -O 4500K &
fi
