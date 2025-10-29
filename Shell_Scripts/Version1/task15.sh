#Write a shell script that finds and lists all files in a directory tree that have not been accessed in a specified number of days
read -p "enter the dir:-- " dir
read  -p "enter the days :-- " days
find  $dir -type f -atime $days