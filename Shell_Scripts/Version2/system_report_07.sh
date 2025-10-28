# =================================================================================
#                    Script Name   : system_report.sh                          
#                    Version       : 2.0                                        
#                    Author        : Vishal Bobhate                             
#                    Created on    : 22-Oct-2025                                
#                    Updated on    : 27-Oct-2025                                
#                    Purpose       : Generate a system resource usage report     
#                                    including CPU, memory, and disk usage.      
#                                    Supports output file using positional param 
##################################################################################

#!/bin/bash

OUTPUT_FILE=$1

generate_report() {
    echo "System Resource Report"
    echo "CPU Usage:"
    CPU=$(top -b -n1 | grep "Cpu(s)" | awk '{print $2 + $4 "%"}')
    echo "$CPU"

    echo "Memory Usage:"
    free -h || echo "Failed to retrieve memory usage"
    
    echo "Disk Usage:"
    df -h || echo "Failed to retrieve disk usage"

    echo "Report generated on: $(date)"
  
}


if [ -z "$OUTPUT_FILE" ]; then
    generate_report
else
    generate_report > "$OUTPUT_
