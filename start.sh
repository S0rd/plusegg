#!/bin/bash

# Function to cleanup dump files
cleanup_files() {
    echo "Cleaning up dump files..."
    rm -f jitdump*.dmp javacore*.txt core*.dmp Snap*.trc
}

# Cleanup dump files before proceeding
cleanup_files

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
java -Xms256M -Xmx512M -XX:MaxRAMPercentage=95.0 -Dterminal.jline=false -Dterminal.ansi=true -DIBM_HEAPDUMP=disabled -DIBM_JAVACOREDIR=disabled -XX:+UseG1GC -XX:MaxGCPauseMillis=500 -XX:+UnlockExperimentalVMOptions -XX:+UseCGroupMemoryLimitForHeap -jar server.jar
