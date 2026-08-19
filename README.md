# Dotfiles - M4Marvin

Personal dotfiles featuring a cohesive **Catppuccin Mocha** theme across all tools. Managed with [chezmoi](https://www.chezmoi.io/) and designed for both **macOS** and **Arch Linux (Omarchy)** with OS-aware conditionals.

## Install

`~/codes/dotfiles` is both the git clone and chezmoi's source directory (see `sourceDir` in `.chezmoi.toml.tmpl`). To set up a new machine:

```sh
chezmoi init -S ~/codes/dotfiles https://github.com/M4Marvin/dotfiles
chezmoi diff    # review what will change
chezmoi apply   # apply the changes
chezmoi verify  # confirm everything is in place
```

> **macOS?** Follow [docs/mac-bootstrap.md](docs/mac-bootstrap.md) for the full step-by-step runbook.

## Tool Stack

| Category | Tool | Status | Config |
|---|---|---|---|
| Terminal | Ghostty | ✅ | `dot_config/ghostty/config.tmpl` |
| Shell | Nushell | ✅ | `dot_config/nushell/` |
| Prompt | Starship | ✅ | `dot_config/starship.toml` |
| Editor | Neovim | ✅ | `dot_config/nvim/init.lua` |
| File manager | Yazi | ✅ | `dot_config/yazi/` |
| File search | fff.nvim | ✅ | (nvim plugin) |
| File search (CLI) | fd | ✅ | - |
| Content search | ripgrep | ✅ | - |
| Git TUI | lazygit | ✅ | - |
| Git diffs | delta | ✅ | `dot_gitconfig` |
| Cat replacement | bat | ✅ | `dot_config/bat/config` |
| File listing | eza | ✅ | `dot_config/eza/theme.yml` |
| Directory jump | zoxide | ✅ | (nushell init) |
| Completions | carapace | ✅ | (nushell init) |
| Version mgmt | mise | ✅ | `dot_config/mise/config.toml` |
| AI agent | OpenCode | ✅ | `dot_config/opencode/opencode.jsonc` |
| Disk usage | dust | ✅ | - |
| Process viewer | procs | ✅ | - |
| Man pages | tealdeer | ✅ | - |
| Code stats | tokei | ✅ | - |

## Source → Target Layout

Files in the repo follow chezmoi's `dot_` prefix convention: a leading dot in the target filename becomes `dot_` in the source path.

| Source | Target |
|---|---|
| `dot_config/<tool>/*` | `~/.config/<tool>/*` |
| `dot_config/starship.toml` | `~/.config/starship.toml` |
| `dot_config/nvim/dot_stylua.toml` | `~/.config/nvim/.stylua.toml` |
| `dot_gitconfig` | `~/.gitconfig` |
| `dot_config/gh/config.yml` | `~/.config/gh/config.yml` |
| `dot_config/opencode/opencode.jsonc` | `~/.config/opencode/opencode.jsonc` |

## Cross-Platform Notes

Nushell configs use `$nu.os-info.name` to branch on macOS vs Linux:

- **macOS**: brew paths, `open` alias, Homebrew env vars in `login.nu`
- **Linux**: system package manager handles PATH, no `open` alias

Nushell is consolidated at `~/.config/nushell/` on both OSes. On macOS, export `XDG_CONFIG_HOME="$HOME/.config"` in your login shell (for example `~/.zprofile`) so nushell reads the same layout as Linux.

## Regenerating Tool-Generated Files

These files are not tracked. Each tool regenerates them for the current machine, and they're ignored via `.chezmoiignore` and `.gitignore`:

```sh
starship init nu | save -f ~/.config/nushell/starship.nu
carapace _carapace nushell | save -f ~/.config/nushell/carapace.nu
mise activate nu | save -f ~/.config/nushell/mise.nu
zoxide init nushell --cmd cd --hook pwd > ~/.config/nushell/zoxide.nu
```

`~/.config/nushell/history.txt` is also not managed; nushell recreates it at runtime.

## Per-Machine Secrets

`dot_config/gh/hosts.yml` is intentionally **not** synced: gh stores per-machine auth there. Run `gh auth login` on each machine instead. If a token was ever committed to the repo history, rotate it (GitHub → Settings → Developer settings → Personal access tokens).

## Ghostty Keybindings

Keybindings are defined in `dot_config/ghostty/config.tmpl` alongside the rest of the ghostty config.

## Theme

All tools use **Catppuccin Mocha** for a consistent dark color scheme.