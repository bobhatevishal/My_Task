# Write a shell script that retrieves the current weather for a specified location using a weather API.
#!/bin/bash
read -p "enter the city name : -- " city
curl -s "https://wttr.in/${city}?format=3"