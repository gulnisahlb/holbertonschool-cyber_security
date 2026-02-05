#!/bin/bash
find "$1" -type f \( -perm -4000 or -perm -2000 \) -mtime -2 -exec ls -l {} \; 2>/dev/null
