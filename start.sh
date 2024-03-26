#!/bin/bash

plugins_dir="plugins"
mkdir -p "$plugins_dir"
cd "$plugins_dir"

# Download HibernateX.jar
echo "Downloading HibernateX.jar..."
curl -s -L -o "HibernateX.jar" "https://github.com/alex1028199/artixegg/releases/download/Hiber/HibernateX.jar" > /dev/null
if [ -f "HibernateX.jar" ]; then
    echo "HibernateX.jar downloaded successfully."
else
    echo "Failed to download HibernateX.jar."
fi

# Download autoshut.jar
echo "Downloading autoshut.jar..."
curl -s -L -o "autoshut.jar" "https://github.com/alex1028199/artixegg/releases/download/Hiberi/autoshut.jar" > /dev/null
if [ -f "autoshut.jar" ]; then
    echo "autoshut.jar downloaded successfully."
else
    echo "Failed to download autoshut.jar."
fi

# Run Java command
cd
java -Xms128M -XX:MaxRAMPercentage=95.0 -Dterminal.jline=false -Dterminal.ansi=true -jar server.jar
