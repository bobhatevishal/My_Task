#Write a script that compares two directories and reports any differences in their content.
#!/bin/bash
read -p " Enter the 1st dir_name :-- " DIR1
read -p " Enter the 2nd dir_name :-- " DIR2
sdiff -qr $DIR1 $DIR2
if [[sdiff -qr $DIR1 $DIR2 >> /dev/null ]]; then
     echo "their is no differenc"
else
     echo "it has diff....."