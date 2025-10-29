#Write a shell script that generates a report of system resource usage, including CPU, memory, and disk usage.

#!/bin/bash
echo "System Resource Usage Report"                               
echo "CPU Usage:"
top -b -n1 | grep "Cpu(s)" | awk '{print $2 + $4 "%"}'
echo ""                 
echo "Memory Usage:"
free -h
echo ""
echo "Disk Usage:"
df -h
echo ""
echo "Report generated on: $(date)"         