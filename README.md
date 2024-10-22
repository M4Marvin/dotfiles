# Dotfiles

This repository contains my personal configuration files (dotfiles) for various command-line tools and applications. The setup is primarily focused on creating a customized development environment with a cohesive theme (Catppuccin Mocha) across different applications.

## 🔧 Configuration Files

### Terminal & Shell

- **Alacritty**: Modern terminal emulator configuration with Catppuccin Mocha theme
- **Fish**: Shell configuration with custom functions, completions, and theme
- **Starship**: Cross-shell prompt configuration
- **Zellij**: Terminal multiplexer settings

### Development Tools

- **Zed**: Modern code editor settings
- **GitHub CLI**: Configuration for `gh` command-line tool
- **mise**: Runtime version manager configuration
- **wtf**: Personal information dashboard settings

### Media & Utilities

- **MPV**: Media player configuration with Anime4K shaders for high-quality anime playback
- **qBittorrent**: Torrent client settings
- **Raycast**: Productivity tool extensions including:
  - Google Translate
  - Color Picker
  - Simple Icons
  - VSCode Integration
  - System Monitor

### File Management

- **bat**: Modern `cat` replacement configuration
- **Yazi**: Terminal file manager settings

## 🎨 Theme

Most applications are configured to use the [Catppuccin Mocha](https://github.com/catppuccin/catppuccin) theme for a consistent dark color scheme across the environment.

## 📦 Key Components

- Terminal: Alacritty
- Shell: Fish
- Prompt: Starship
- Terminal Multiplexer: Zellij
- File Manager: Yazi
- Media Player: MPV with Anime4K shaders
- Launcher: Raycast (macOS)

## 🚀 Installation

1. Clone this repository to your local machine
2. Create symbolic links from these config files to your `~/.config` directory
3. Install the required applications using your package manager

```bash
git clone https://github.com/YOUR_USERNAME/dotfiles.git
cd dotfiles
# Use stow or your preferred method to create symlinks
```

## 📝 Note

Remember to review and modify these configurations according to your needs before using them.
