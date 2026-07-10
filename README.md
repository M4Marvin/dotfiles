# Dotfiles — M4Marvin

Personal dotfiles featuring a cohesive **Catppuccin Mocha** theme across all tools. Designed for both **macOS** and **Arch Linux (Omarchy)** with OS-aware conditionals.

## Tool Stack

| Category | Tool | Status | Config |
|---|---|---|---|
| Terminal | Ghostty | ✅ | `ghostty/config` |
| Shell | Nushell | ✅ | `nushell/` |
| Prompt | Starship | ✅ | `starship.toml` |
| Editor | Neovim | ✅ | `nvim/init.lua` |
| File manager | Yazi | ✅ | `yazi/` |
| File search | fff.nvim | ✅ | (nvim plugin) |
| File search (CLI) | fd | ✅ | — |
| Content search | ripgrep | ✅ | — |
| Git TUI | lazygit | ✅ | — |
| Git diffs | delta | ✅ | `git/config` |
| Cat replacement | bat | ✅ | `bat/config` |
| File listing | eza | ✅ | `eza/theme.yml` |
| Directory jump | zoxide | ✅ | (nushell init) |
| Completions | carapace | ✅ | (nushell init) |
| Version mgmt | mise | ✅ | `mise/config.toml` |
| Disk usage | dust | ✅ | — |
| Process viewer | procs | ✅ | — |
| Man pages | tealdeer | ✅ | — |
| Code stats | tokei | ✅ | — |

## Cross-Platform Notes

Nushell configs use `$nu.os-info.name` to branch on macOS vs Linux:
- **macOS** — brew paths, `open` alias, Homebrew env vars in `login.nu`
- **Linux** — system package manager handles PATH, no `open` alias

## File Placement

| Repo path | macOS | Arch Linux |
|---|---|---|
| `ghostty/` | `~/.config/ghostty/` | `~/.config/ghostty/` |
| `nushell/*` | `~/Library/Application Support/nushell/` | `~/.config/nushell/` |
| `nvim/` | `~/.config/nvim/` | `~/.config/nvim/` |
| `yazi/` | `~/.config/yazi/` | `~/.config/yazi/` |
| `bat/` | `~/.config/bat/` | `~/.config/bat/` |
| `eza/` | `~/.config/eza/` | `~/.config/eza/` |
| `git/config` | `~/.gitconfig` | `~/.gitconfig` |
| `starship.toml` | `~/.config/starship.toml` | `~/.config/starship.toml` |
| `mise/` | `~/.config/mise/` | `~/.config/mise/` |

Generated files (not tracked — recreated by tools):
- `nushell/starship.nu` — `starship init nu | save -f`
- `nushell/carapace.nu` — `carapace _carapace nushell | save -f`
- `nushell/mise.nu` — `mise activate nu | save -f`
- `~/.zoxide.nu` — `zoxide init nushell --cmd cd --hook pwd > ~/.zoxide.nu`

## Ghostty Keybindings

See `ghostty/README.md` for the full keybinding reference.

## Theme

All tools use **Catppuccin Mocha** for a consistent dark color scheme.
