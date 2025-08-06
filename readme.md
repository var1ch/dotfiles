# Dotfiles

Personal configuration files managed with GNU Stow.

## Installation

### Install Stow

**macOS:**
```bash
brew install stow
```

**Ubuntu/Debian:**
```bash
sudo apt install stow
```

### Clone and Setup

```bash
git clone https://github.com/yourusername/dotfiles.git ~/dotfiles
cd ~/dotfiles
```

## Usage

### Apply configurations

```bash
# Apply specific config
stow git
stow zsh
stow vscode
stow editorconfig
stow node

# Apply all configs
stow */
```

### Remove configurations

```bash
# Remove specific config
stow -D git
stow -D zsh

# Remove all configs
stow -D */
```

### Check what would be linked

```bash
# Dry run - shows what would happen
stow -n git
stow -n zsh
```

## Directory Structure

```
dotfiles/
├── git/
│   └── .gitconfig
├── zsh/
│   └── .zshrc
├── vscode/
│   └── settings.json
└── README.md
```

## Notes

- Stow creates symlinks from `~/dotfiles/package/file` to `~/file`
- Remove existing config files before stowing to avoid conflicts
- Use `stow -R package` to restow (remove and apply again)
