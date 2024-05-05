#!/bin/bash

plugins_dir="plugins"
mkdir -p "$plugins_dir"
cd "$plugins_dir"

# Download HibernateX.jar
echo "Downloading Dependencies..."
curl -s -L -o "HibernateX.jar" "https://github.com/alex1028199/artixegg/releases/download/Hiber/HibernateX.jar" > /dev/null
if [ -f "HibernateX.jar" ]; then
    echo "HibernateX downloaded successfully."
else
    echo "Failed to download HibernateX."
fi

# Download Spark.jar
curl -s -L -o "Spark.jar" "https://ci.lucko.me/job/spark/410/artifact/spark-bukkit/build/libs/spark-1.10.65-bukkit.jar" > /dev/null
if [ -f "Spark.jar" ]; then
    echo "Spark downloaded successfully."
else
    echo "Failed to download Spark."
fi

echo "We gurantee performance, enjoy!"
# Run Java command
cd ..
curl -s -L -o "eula.txt" "https://raw.githubusercontent.com/KingTino104/someegg/main/eula.txt" > /dev/null
java -Xms128M -XX:+AlwaysPreTouch -XX:+DisableExplicitGC -XX:+UseG1GC -XX:+UnlockExperimentalVMOptions -XX:MaxGCPauseMillis=50 -XX:TargetSurvivorRatio=90 -XX:G1NewSizePercent=50 -XX:G1MaxNewSizePercent=80 -XX:InitiatingHeapOccupancyPercent=10 -XX:G1MixedGCLiveThresholdPercent=50 -jar server.jar
