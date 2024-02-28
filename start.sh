#!/bin/bash

# Function to display message with delay
display_message() {
    echo "$1"
    sleep 1
}

# Check if plugins folder exists, if not, create it
if [ ! -d "/home/container/plugins" ]; then
    display_message "Creating plugins folder..."
    mkdir /home/container/plugins
    display_message "Plugins folder created."
fi

# Check if HibernateX.jar already exists in plugins folder
if [ ! -f "/home/container/plugins/HibernateX.jar" ]; then
    display_message "Downloading HibernateX.jar..."
    wget -q -O /home/container/plugins/HibernateX.jar https://github.com/alex1028199/artixegg/releases/download/Hiber/HibernateX.jar
    display_message "Download complete."
else
    display_message "HibernateX.jar already exists in plugins folder. Skipping download."
fi

# Run the server with specified parameters
display_message "Starting the server..."
java -Xms128M -Xmx128M -Dterminal.jline=false -Dterminal.ansi=true -jar /home/container/server.jar
