# Omarchy Delta Theme Sync

Automatic theme synchronization for delta (git diff pager) with Omarchy themes.

## Features
- Automatic sync when Omarchy theme changes
- Smart color adjustment for light/dark themes
- Syntax highlighting support
- Non-destructive (uses gitconfig include)

## Requirements
- delta (git-delta)
- Omarchy

## Installation

### Manual
```bash
./install.sh
```

### AUR
```bash
yay -S omarchy-delta-theme-sync
```

## Usage

After installation, delta theme automatically syncs:

```bash
omarchy-theme-set catppuccin
git diff  # Uses catppuccin colors
```

Manual theme application:
```bash
omarchy-delta-theme-apply catppuccin
```

## Configuration

Delta theme file: `~/.config/delta/themes/omarchy.gitconfig`

Colors are auto-generated from Omarchy theme:
- `minus-style`: Removed lines (color1)
- `plus-style`: Added lines (color2)
- `file-style`: File names (accent)
- `hunk-header-style`: Hunk headers (color3)

## Troubleshooting

**Delta not using theme:**
```bash
grep omarchy.gitconfig ~/.gitconfig  # Should show include
```

**Manually apply theme:**
```bash
CURRENT_THEME=$(cat ~/.config/omarchy/current/theme.name)
omarchy-delta-theme-apply "$CURRENT_THEME"
```

## Uninstall
```bash
./uninstall.sh
```

## License
MIT
