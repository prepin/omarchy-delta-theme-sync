#!/bin/bash
set -e

log_info() {
  echo "[INFO] $*"
}

log_success() {
  echo "[SUCCESS] $*"
}

log_warn() {
  echo "[WARN] $*"
}

log_info "Installing omarchy-delta-theme-sync"

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
    log_success "Hook added to theme-set"
  else
    log_info "Hook already present"
  fi
else
  log_warn "theme-set hook file not found"
fi

# Apply current theme
CURRENT_THEME=$(cat ~/.config/omarchy/current/theme.name 2>/dev/null || echo "catppuccin")
if [[ -f ~/.local/bin/omarchy-delta-theme-apply ]]; then
  ~/.local/bin/omarchy-delta-theme-apply "$CURRENT_THEME"
fi

log_success "Installation complete"
log_info "Delta now syncs automatically with Omarchy theme changes"
