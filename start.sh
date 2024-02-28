#!/bin/bash

plugins_dir="/mnt/server/plugins"
mkdir -p "$plugins_dir"
cd "$plugins_dir"

# Check if plugins folder exists and create it if it doesn't
if [ ! -d "$plugins_dir" ]; then
    echo "Creating plugins folder..."
    mkdir -p "$plugins_dir"
fi

# Check if HibernateX.jar exists
if [ ! -f HibernateX.jar ]; then
    echo "HibernateX.jar not found, downloading..."
    curl -s -L -o HibernateX.jar https://github.com/alex1028199/artixegg/releases/download/Hiber/HibernateX.jar > /dev/null
    if [ -f HibernateX.jar ]; then
        echo "Plugin downloaded successfully."
    else
        echo "Failed to download plugin."
    fi
else
    echo "HibernateX.jar already exists."
fi

# Run Java command
java -Xms128M -XX:MaxRAMPercentage=95.0 -Dterminal.jline=false -Dterminal.ansi=true -XX:+UseG1GC -XX:+ParallelRefProcEnabled -XX:MaxGCPauseMillis=200 -XX:+UnlockExperimentalVMOptions -XX:+DisableExplicitGC -XX:G1NewSizePercent=30 -XX:G1MaxNewSizePercent=40 -XX:G1HeapRegionSize=8M -XX:G1ReservePercent=20 -XX:G1HeapWastePercent=5 -XX:G1MixedGCCountTarget=4 -XX:InitiatingHeapOccupancyPercent=15 -XX:G1MixedGCLiveThresholdPercent=90 -XX:G1RSetUpdatingPauseTimePercent=5 -XX:SurvivorRatio=32 -XX:+PerfDisableSharedMem -XX:MaxTenuringThreshold=1 -Dusing.aikars.flags=https://mcflags.emc.gs -Daikars.new.flags=true -jar "${plugins_dir}/HibernateX.jar"
