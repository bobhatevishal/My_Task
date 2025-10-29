#!/bin/bash
read -p "enter the dir path " dir DIR
read -p "enter the text to search" PRESENT
read -p "enter replacement text: " REPLACE
for FILE in "$DIR /* ; do
if [[ -f "$FILE" ]]; then
  sed -i "s/${PRESENT}/${REPLACE}g" 
  "$FILE"
   echo  "updatedfile": $FILE"  
done
echo "completed search and replace

