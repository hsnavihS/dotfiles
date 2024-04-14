#!/bin/sh

source "${HOME}/.cache/wal/colors.sh"

mkdir -p "${HOME}/.config/dunst"
mkdir -p "${HOME}/.config/swaylock"

ln -sf "${HOME}/.cache/wal/dunstrc" "${HOME}/.config/dunst/dunstrc"
ln -sf "${HOME}/.cache/wal/launch_swaylock.sh" "${HOME}/.config/swaylock/launch_swaylock.sh"
chmod +x "{HOME}/.config/swaylock/launch_swaylock.sh"

pkill dunst
dunst &
