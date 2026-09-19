#!/usr/bin/env bash
# Copyright (c) 2026 Salvo Giangreco
# SPDX-License-Identifier: GPL-3.0-or-later

# Check if a file argument is provided
if [ "$#" -eq 0 ]; then
    echo "ERROR: No file specified!" >&2
    echo "Usage: upload_gofile <file>" >&2
    exit 1
fi

# Store the file path, preserving spaces
FILE="$1"

if [ ! -f "$FILE" ]; then
    echo "ERROR: File not found: $FILE" >&2
    exit 1
fi

# Query GoFile API to find the best server for upload
if command -v jq &> /dev/null; then
    SERVER="$(curl -s https://api.gofile.io/servers | jq -r '.data.servers[0].name')"
else
    SERVER="$(curl -s https://api.gofile.io/servers | grep -o '"name":"[^"]*"' | head -n 1 | cut -d '"' -f 4)"
fi

if [ -z "$SERVER" ] || [ "$SERVER" = "null" ]; then
    echo "ERROR: Failed to retrieve GoFile upload server." >&2
    exit 1
fi

# Upload the file to GoFile
RESPONSE="$(curl -# -F "file=@$FILE" "https://${SERVER}.gofile.io/uploadFile")"

# Use jq (or fallback to grep) to parse JSON response and extract the download page URL
if command -v jq &> /dev/null; then
    LINK="$(echo "$RESPONSE" | jq -r '.data.downloadPage')"
else
    LINK="$(echo "$RESPONSE" | grep -o '"downloadPage":"[^"]*"' | cut -d '"' -f 4)"
fi

if [ -z "$LINK" ] || [ "$LINK" = "null" ]; then
    echo "ERROR: Failed to upload to GoFile: $RESPONSE" >&2
    exit 1
fi

# Display the download link
echo "$LINK"
echo
