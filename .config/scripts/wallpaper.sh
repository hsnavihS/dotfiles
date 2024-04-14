#!/bin/bash

wallpaper_dir=$HOME/Wallpapers/
cache_file="$HOME/.cache/current_wallpaper"
rasi_file="$HOME/.cache/current_wallpaper.rasi"

# Create cache file if it doesn't exist
if [ ! -f $cache_file ] ;then
    touch $cache_file
    echo "$HOME/Wallpapers/black_hole.jpg" > "$cache_file"
fi

# Create rasi file if not exists
if [ ! -f $rasi_file ] ;then
    touch $rasi_file
    echo "* { current-image: url(\"$HOME/wallpaper/default.jpg\", height); }" > "$rasi_file"
fi

case $1 in

    "init")
        if [ -f $cache_file ]; then
            wal -q -i $current_wallpaper -o ~/.config/wal/done.sh
        else
            wal -q -i $wallpaper_dir -o ~/.config/wal/done.sh
        fi
    ;;

    "select")

        selected_wallpaper=$( find "$wallpaper_dir" -type f \( -iname "*.jpg" -o -iname "*.jpeg" -o -iname "*.png" -o -iname "*.mp4" -o -iname "*.gif" \) -exec basename {} \; | sort -R | while read rfile
        do
            echo -en "$rfile\x00icon\x1f${wallpaper_dir}${rfile}\n"
        done | rofi -dmenu -p "Select Wallpaper:" -replace -config ~/.config/rofi/config-wallpaper.rasi)
        if [ ! "$selected_wallpaper" ]; then
            echo "No wallpaper selected"
            exit
        fi
        wal -q -i ${wallpaper_dir}${selected_wallpaper} -o ~/.config/wal/done.sh
    ;;

    # Randomly select wallpaper 
    *)
    	wal -q -i $wallpaper_dir -o ~/.config/wal/done.sh
	#wallpapers=($(ls ${wallpaper_dir}))
	#wallpaper=${wallpapers[ $RANDOM % ${#wallpapers[@]} ]}
	if [[ $(pidof swaybg) ]]; then
	  pkill swaybg
	fi
    ;;

esac

# ----------------------------------------------------- 
# Load generated color scheme and all variables
# This lets us access $wallpaper (full path)
# ----------------------------------------------------- 
source "$HOME/.cache/wal/colors.sh"

# ----------------------------------------------------- 
# Copy colors generated for hyprland
# ----------------------------------------------------- 
cp $HOME/.cache/wal/colors-hyperland $HOME/.config/hypr/hypr-colors.conf

# ----------------------------------------------------- 
# Write selected wallpaper into .cache files
# ----------------------------------------------------- 
echo "$wallpaper" > "$cache_file"
echo "* { current-image: url(\"$wallpaper\", height); }" > "$rasi_file"

# ----------------------------------------------------- 
# Get wallpaper image name
# ----------------------------------------------------- 
new_wall=$(echo $wallpaper | sed "s|$wallpaper_dir||g")

# ----------------------------------------------------- 
# Set the new wallpaper
# ----------------------------------------------------- 
swww img $wallpaper --transition-fps 45 --transition-type any --transition-duration 0.7

# ----------------------------------------------------- 
# Launching waybar with changed colors
# ----------------------------------------------------- 
$HOME/.config/waybar/launch_bar.sh

# ----------------------------------------------------- 
# Changing firefox colors
# ----------------------------------------------------- 
pywalfox update

# ----------------------------------------------------- 
# Send notification using dunst
# ----------------------------------------------------- 
notify-send "Wallpaper: ${new_wall}" -u normal
