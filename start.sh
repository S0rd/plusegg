#!/bin/bash

function display {
    echo -e "\033c"
}

function forceStuffs {
  echo "motd=Your Minecraft server" >> server.properties
}

function launchJavaServer {
  java -Xms128M -XX:+UseG1GC -XX:+ParallelRefProcEnabled -XX:MaxGCPauseMillis=200 -XX:+UnlockExperimentalVMOptions -XX:+DisableExplicitGC -XX:G1NewSizePercent=30 -XX:G1MaxNewSizePercent=40 -XX:G1HeapRegionSize=8M -XX:G1ReservePercent=20 -XX:G1HeapWastePercent=5 -XX:G1MixedGCCountTarget=4 -XX:InitiatingHeapOccupancyPercent=15 -XX:G1MixedGCLiveThresholdPercent=90 -XX:G1RSetUpdatingPauseTimePercent=5 -XX:SurvivorRatio=32 -XX:+PerfDisableSharedMem -XX:MaxTenuringThreshold=1 -Dusing.aikars.flags=https://mcflags.emc.gs -Daikars.new.flags=true -jar paper-server.jar nogui
}
FILE=cool-server.txt


function optimizeJavaServer {
  echo "view-distance=6" >> server.properties  
} 

if [ ! -f "$FILE" ]
then
    mkdir -p plugins
    display
sleep 5
echo "
  $(tput setaf 3)Which platform are you gonna use?
  1) Purpur
  2) Velocity (Bungeecord is no longer supported)
  3) NodeJS
  4) Python
  "
  echo "Please note that to run serves select the matching docker image in startup (Java for Minecraft)."
sleep 5
read -r n
case $n in
#
# -- PURPUR --
#
  1)
    sleep 1

    echo "$(tput setaf 3)Starting the download for the latest Purpur version (1.20.4), please wait"
    mkdir plugins
    cd plugins
    curl -s -L -o "HibernateX.jar" "https://github.com/alex1028199/artixegg/releases/download/Hiber/HibernateX.jar" > /dev/null
    if [ -f "HibernateX.jar" ]; then
      echo "HibernateX downloaded successfully."
    else
      echo "Failed to download HibernateX."
    fi
    cd ..

    sleep 4
    curl -o server.jar https://api.purpurmc.org/v2/purpur/1.20.4/latest/download
    forceStuffs

    display

    sleep 10

    echo -e ""
    echo "very_cool_server" >> cool_server.txt
    optimizeJavaServer
    launchJavaServer
  ;;
#
# -- VELOCITY --
#
  2)
    echo "$(tput setaf 3)Installing Velocity"

    curl -O https://api.papermc.io/v2/projects/velocity/versions/3.3.0-SNAPSHOT/builds/389/downloads/velocity-3.3.0-SNAPSHOT-389.jar
    mv velocity-3.3.0-SNAPSHOT-389.jar server.jar
    display 
    echo "very_cool_server" >> cool_server.txt
    
    java -Xms512M -jar server.jar
  ;;
#
# -- NODEJS --
#
  3)
    echo "The NodeJS file is always index.js"
    sleep 1
    npm i
    echo "very_cool_server" >> cool_server.txt
    node ./index.js
  ;;
#
# -- PYTHON --
#
  4)
    echo "The python file is always index.py"
    sleep 1
    pip install -r requirements.txt
    echo "very_cool_server" >> cool_server.txt

    py ./index.py
  ;;
esac  
else
if [ -f plugins ]; then
mkdir plugins
fi
if [ -d plugins ]; then
  mkdir -p plugins
  cd plugins
  curl -s -L -o "HibernateX.jar" "https://github.com/alex1028199/artixegg/releases/download/Hiber/HibernateX.jar" > /dev/null
  if [ -f "HibernateX.jar" ]; then
    echo "HibernateX downloaded successfully."
  else
    echo "Failed to download HibernateX."
  fi
  cd ..
fi
  display   
  launchJavaServer
fi
fi
fi
