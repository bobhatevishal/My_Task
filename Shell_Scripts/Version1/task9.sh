#Write a shell script that scans a directory for files matching a certain pattern and deletes them.
#!/bin/bash
read -p "Enter the directory path: " dir_path
read -p "Enter the file pattern to delete : " file_pattern 
find "$dir_path" -type f -name "$file_pattern"  -delete
