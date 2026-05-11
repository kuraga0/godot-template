#!/usr/bin/env bash

FILE="project.godot"

read -rp "Enter game name: " GAME_NAME

# "" safety
ESCAPED_NAME=$(printf '%s' "$GAME_NAME" | sed 's/"/\\"/g')

sed -i 's/^config\/name=".*"/config\/name="'"$ESCAPED_NAME"'"/' "$FILE"

echo "Updated project name to: $GAME_NAME"

# find . -type f -name ".gitkeep" -delete
# echo ".gitkeep files removed"
