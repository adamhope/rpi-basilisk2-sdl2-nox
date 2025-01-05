#!/bin/bash

# Delay for 5 seconds, allow abort with any key press
echo "Starting Basilisk II in 5 seconds. Press any key to abort..."
read -t 5 -n 1 key

# If no key was pressed, start Basilisk II
if [ $? -ne 0 ]; then
    echo "Launching Basilisk II..."
    BasiliskII
else
    echo "Startup aborted by user."
fi