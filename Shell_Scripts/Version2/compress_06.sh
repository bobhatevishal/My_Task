# =============================================================================
#                    Script Name   : compress_old_logs.sh                       
#                    Version       : 2.0                                        
#                    Author        : Vishal Bobhate                             
#                    Created on    : 22-Oct-2025                                
#                    Purpose       : Compress and archive log files older than  
#                                    a specified number of days.                
###############################################################################

#!/bin/bash

if [ $# -ne 2 ]; then
    echo "Usage: $0 <log_directory> <days_old>"
    
fi

LOG_DIR=$1
DAYS=$2

if [ ! -d "$LOG_DIR" ]; then
    echo "Error: Log directory '$LOG_DIR' does not exist."
    
fi

if find "$LOG_DIR" -type f -name "*.log" -mtime +"$DAYS" -exec gzip {} \;; then
    echo "Log files older than $DAYS days in '$LOG_DIR' have been compressed."
else
    echo "Failed to compress log files in '$LOG_DIR'."

fi
