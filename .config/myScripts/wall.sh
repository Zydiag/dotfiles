#!/bin/bash
LOCK_FILE="/tmp/wallpaper_change.lock"
# Check if another instance is running
if [ -e "$LOCK_FILE" ]; then
    # If yes, read the PID of the active timer
    active_pid=$(cat "$LOCK_FILE")
    # Check if the process with the active PID is still running
    if kill -0 $active_pid > /dev/null 2>&1; then
        echo "Terminating the active wallpaper-changing process (PID: $active_pid)."
        kill $active_pid
    fi
    # Remove the old lock file
    rm "$LOCK_FILE"
fi
# Create a new lock file with the current script's process ID
echo $$ > "$LOCK_FILE"
# Function to set wallpaper and update timer
set_wallpaper() {
    # Set the path to the wallpaper
    export wall=$(find ~/Pictures/wall -name '*.png' -o -name '*.jpg' | shuf -n 1)
    # Set the wallpaper using wal
		echo $wall
		# swww img "$wall" --transition-type center --transition-pos bottom-right
		wal -q -i "$wall"
		. "${HOME}/.cache/wal/colors.sh"
		sleep 3600
}
# Main loop
while true
do
    set_wallpaper
done

