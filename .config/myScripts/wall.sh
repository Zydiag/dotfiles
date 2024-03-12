#!/bin/bash
# while true
# do
#     # Set the path to the wallpaper
#     export wall=$(find ~/Pictures/wall -name '*.png' -o -name '*.jpg' | shuf -n 1)
#
#     # Set the wallpaper using wal
#     wal -q -i "$wall"
#
#     # Set the GNOME desktop background
#     gsettings set org.gnome.desktop.background picture-uri "file://$wall"
#
#     # Wait for 10 minutes before changing the wallpaper again
#     sleep 30
# done
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
    wal -q -i "$wall"
    sleep 600
}
# Main loop
while true
do
    set_wallpaper
done

