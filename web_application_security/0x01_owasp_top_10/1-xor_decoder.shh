#!/bin/bash

# Check if argument is provided
if [ -z "$1" ]; then
    exit 1
fi

# Remove {xor} prefix
hash="${1#\{xor\}}"

# Base64 decode
decoded=$(echo "$hash" | base64 -d 2>/dev/null)

# XOR decode with 0x5A
result=""
for (( i=0; i<${#decoded}; i++ )); do
    char=$(printf "%d" "'${decoded:$i:1}")
    xor=$((char ^ 0x5A))
    result+=$(printf "\\$(printf '%03o' "$xor")")
done

# Output result
echo "$result"
