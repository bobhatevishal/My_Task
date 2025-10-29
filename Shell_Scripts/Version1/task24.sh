#Write a shell script that renames a large number of files based on a specified pattern or naming convention.
#!/bin/bash 
read -p "enter the dit path " dir
read  -p "enter base name : -- " base_img
COUNT+1
for FILE in "dir"/; do
   if [[-f " $file "]]; then
     EXT ="$(FILE#*.)"
     mv "$FILE" "$dir/$base_img$COUNT.$EXT"
     echo "Renamed: $FILE ->$base_img$COUNT.$EXT"
         ((COUNT++)) 
     fi
     done
     echo "all files  renamed successfully"
     