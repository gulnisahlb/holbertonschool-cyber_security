#!/bin/bash

# Exit if no argument
[ -z "$1" ] && exit 1

# Remove {xor} prefix
hash="${1#\{xor\}}"

# Decode base64 and XOR byte-by-byte with 0x5A
echo "$hash" | base64 -d | xxd -p | tr -d '\n' | sed 's/../& /g' | while read -r bytes; do
    for b in $bytes; do
        printf "\\$(printf '%03o' $((0x$b ^ 0x5A)))"
    done
done

echo

