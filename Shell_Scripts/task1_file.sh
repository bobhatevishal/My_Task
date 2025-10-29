# Write a shell script that lists all files in a specified directory and saves the output to a text file.  #
#                                                                                                          #
#                     name: 1st_file input into output_file                                                #
#                     version: 9.1                                                                         #
#                     perpose: to move/cp  the data of  one file to other                                  #
#                                                                                                          #
#                                                                                                          #
############################################################################################################

#!/bin/bash
read -p "enter the path" path
CMND=$(ls $path >> output.txt)
echo "done"

