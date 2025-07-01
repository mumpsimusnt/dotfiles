#!/bin/bash
# install_tools.sh

set -e

TOOL_LIST="$HOME/scripts/tools_pipx.txt"

# Ensure pipx is available
if ! command -v pipx &>/dev/null; then
  echo "Installing pipx..."
  sudo apt install -y pipx
  pipx ensurepath
fi

echo "Installing tools from $TOOL_LIST..."
while IFS= read -r tool; do
  [[ -z "$tool" || "$tool" =~ ^# ]] && continue  # skip empty lines/comments
  echo "Installing $tool..."
  pipx install "$tool"
done < "$TOOL_LIST"

