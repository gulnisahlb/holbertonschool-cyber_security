#!/bin/bash

# Exit if no argument
[ -z "$1" ] && exit 1

# Remove {xor} prefix
hash="${1#\{xor\}}"

# Base64 decode -> od -> XOR -> print
echo "$hash" | base64 -d | od -An -tu1 | while read -r line; do
    for byte in $line; do
        printf "\\$(printf '%03o' $((byte ^ 0x5A)))"
    done
done

echo
