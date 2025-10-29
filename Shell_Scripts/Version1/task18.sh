# Write a shell script that monitors a specified file for changes and executes a specific action when the file is modified.
#!/bin/bash
read -p "enter the file name . " FILE
echo "wating for changes in $FILE..."
inotifywait -m -e modify "$FILE" --format '%T %e' --timefmt '%H:%M:%S' |

while read time event ; do 
   echo "[$time] File modified! Event: $event"
done
