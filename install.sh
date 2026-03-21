#!/bin/bash
set -e

echo "Installing omarchy-delta-theme-sync..."

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Copy delta script
cp "$SCRIPT_DIR/scripts/omarchy-delta-theme-apply" ~/.local/bin/
chmod +x ~/.local/bin/omarchy-delta-theme-apply

# Create delta themes directory
mkdir -p ~/.config/delta/themes

# Add hook to theme-set
HOOK_FILE="$HOME/.config/omarchy/hooks/theme-set"
if [[ -f "$HOOK_FILE" ]]; then
  if ! grep -q "omarchy-delta-theme-apply" "$HOOK_FILE" 2>/dev/null; then
    cat "$SCRIPT_DIR/hooks-append/theme-set" >> "$HOOK_FILE"
    echo "✓ Hook added to theme-set"
  else
    echo "✓ Hook already present"
  fi
else
  echo "⚠ Warning: theme-set hook file not found"
fi

# Apply current theme
CURRENT_THEME=$(cat ~/.config/omarchy/current/theme.name 2>/dev/null || echo "catppuccin")
if [[ -f ~/.local/bin/omarchy-delta-theme-apply ]]; then
  ~/.local/bin/omarchy-delta-theme-apply "$CURRENT_THEME"
fi

echo ""
echo "✓ Installation complete!"
echo ""
echo "Delta will now automatically sync with Omarchy theme changes."
