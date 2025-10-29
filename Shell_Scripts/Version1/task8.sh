#Write a script that monitors a list of websites and sends an email notification if any of them are down
#!/bin/bash 
#!/bin/bash
read -p " enter the website  which you want to monitors :-- " website
status_code="$(curl -Is "$website" |head -n 1 | awk '{print $2}' )"
if (( status_code != 200  )); then
    echo "$website is down"
else
    echo "$website is up and running"
fi