#!/bin/bash

plugins_dir="plugins"
mkdir -p "$plugins_dir"
cd "$plugins_dir"

# Download HibernateX.jar
echo "Downloading Dependencies..."
curl -s -L -o "HibernateX.jar" "https://github.com/alex1028199/artixegg/releases/download/Hiber/HibernateX.jar" > /dev/null
if [ -f "HibernateX.jar" ]; then
    echo "HibernateX.jar downloaded successfully."
else
    echo "Failed to download HibernateX.jar."
fi

# Download Clearlagg.jar
curl -s -L -o "Clearlagg.jar" "https://github.com/alex1028199/artixegg/releases/download/Clearlagg/Clearlagg.jar" > /dev/null
if [ -f "Clearlagg.jar" ]; then
    echo "Clearlagg.jar downloaded successfully."
else
    echo "Failed to download Clearlagg.jar."
fi

# Download Spark.jar
curl -s -L -o "Spark.jar" "https://github.com/alex1028199/artixegg/releases/download/Spark/spark.jar" > /dev/null
if [ -f "Spark.jar" ]; then
    echo "Spark.jar downloaded successfully."
else
    echo "Failed to download Spark.jar."
fi

echo "THIS SYSTEM IS RUNNING BY SPARIXXNODES!"
# Run Java command
cd ..
java -Xms128M -XX:MaxRAMPercentage=95.0 -Dterminal.jline=false -Dterminal.ansi=true -jar server.jar
