# Omarchy Delta Theme Sync

Automatic delta theme synchronization for Omarchy.

## Installation

```bash
git clone https://github.com/prepin/omarchy-delta-theme-sync.git
cd omarchy-delta-theme-sync
./install.sh
```

## Features

- Automatic theme sync when changing Omarchy themes
- Smart color adjustment for light/dark themes
- Non-destructive gitconfig integration

## Usage

After installation, delta automatically uses your Omarchy theme:

```bash
omarchy-theme-set catppuccin
git diff  # Uses catppuccin colors
```

## Requirements

- [git-delta](https://github.com/dandavison/delta)
- [Omarchy](https://omarchy.org/)

## License

MIT
