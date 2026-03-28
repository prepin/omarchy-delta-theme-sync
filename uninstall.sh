#!/bin/bash
set -e

log_info() {
  echo "[INFO] $*"
}

log_success() {
  echo "[SUCCESS] $*"
}

log_info "Uninstalling omarchy-delta-theme-sync"

# Remove delta script
if [[ -f ~/.local/bin/omarchy-delta-theme-apply ]]; then
  rm ~/.local/bin/omarchy-delta-theme-apply
  log_success "Removed omarchy-delta-theme-apply"
fi

# Remove delta theme file
if [[ -f ~/.config/delta/themes/omarchy.gitconfig ]]; then
  rm ~/.config/delta/themes/omarchy.gitconfig
  log_success "Removed delta theme file"
fi

# Remove include from gitconfig
if [[ -f ~/.gitconfig ]]; then
  if grep -q "omarchy.gitconfig" ~/.gitconfig 2>/dev/null; then
    sed -i '/# >>> omarchy-delta-theme-sync >>>/,/# <<< omarchy-delta-theme-sync <<</d' ~/.gitconfig
    log_success "Removed include from gitconfig"
  fi
fi

# Remove hook from theme-set
HOOK_FILE="$HOME/.config/omarchy/hooks/theme-set"
if [[ -f "$HOOK_FILE" ]]; then
  if grep -q "omarchy-delta-theme-apply" "$HOOK_FILE" 2>/dev/null; then
    sed -i '/# >>> omarchy-delta-theme-sync hook >>>/,/# <<< omarchy-delta-theme-sync hook <<</d' "$HOOK_FILE"
    log_success "Removed hook from theme-set"
  fi
fi

log_success "Uninstallation complete"
