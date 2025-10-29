#Write a shell script that adds new users to the system based on a list of names in a CSV file.
read -p "enter the userfile :--- " file
while IFS=',' read -r username id
do 
 useradd $username
done < "$file"