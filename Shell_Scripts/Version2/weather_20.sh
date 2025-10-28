# =============================================================================>
#                    Script Name   : weather.sh                                  >
#                    Version       : 2.0                                         >
#                    Author        : Vishal Bobhate                              >
#                    Created on    : 22-Oct-2025                                 >
#                    Purpose       : Get current weather for a city              >
###############################################################################>

#!/bin/bash

CITY=$1

if [ -z "$CITY" ]; then
    read -p "Enter city name: " CITY
fi

if [ -z "$CITY" ]; then
    echo " Error: No city name provided."
fi

WEATHER=$(curl -s "https://wttr.in/${CITY}?format=3")
if [ $? -ne 0 ] || [ -z "$WEATHER" ]; then
    echo " Failed to retrieve weather information. Please check your internet connection or city name."
fi
echo "Current weather in $CITY:"
echo "$WEATHER"
