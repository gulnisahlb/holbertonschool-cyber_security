#!/bin/bash
# 1-endpoint.sh

LOG_FILE="logs.txt"

# Extract URLs, count occurrences, sort, and show the most frequent
awk '{print $7}' $LOG_FILE | sort | uniq -c | sort -nr | head -n 1
