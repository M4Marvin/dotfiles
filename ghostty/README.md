# Ghostty Config — Keybindings Reference

## Split / Pane Management

All use `cmd+alt` prefix for consistency with system-wide (Karabiner) bindings.

### Navigation

| Binding | Action |
|---|---|
| `cmd+alt+h` | Focus split left |
| `cmd+alt+j` | Focus split down |
| `cmd+alt+k` | Focus split up |
| `cmd+alt+l` | Focus split right |
| `cmd+alt+[` (`bracket_left`) | Focus previous split |
| `cmd+alt+]` (`bracket_right`) | Focus next split |

### Split Creation & Management

| Binding | Action |
|---|---|
| `cmd+alt+\` | New split right |
| `cmd+alt+-` | New split down |
| `cmd+alt+enter` | Toggle split zoom (maximize/restore) |
| `cmd+alt+w` | Close current surface (split/tab) |
| `cmd+alt+=` | Equalize all split sizes |

### Tab Management (macOS native)

| Binding | Action |
|---|---|
| `cmd+t` | New tab |
| `cmd+shift+[` | Previous tab |
| `cmd+shift+]` | Next tab |
| `cmd+w` | Close tab/surface |

### Other

| Binding | Action |
|---|---|
| `cmd+plus` / `cmd+minus` | Increase / decrease font size |
| `cmd+0` | Reset font size |
| `cmd+shift+,` | Reload config |
| `cmd+k` | Clear screen |
| `cmd+d` | Copy to clipboard |
| `cmd+v` | Paste from clipboard |

## Modifier Aliases

| Alias | Key |
|---|---|
| `super` / `cmd` / `command` | ⌘ |
| `alt` / `opt` / `option` | ⌥ |
| `ctrl` / `control` | ⌃ |
| `shift` | ⇧ |

## Tools Inventory

### ✅ Installed

| Tool | Config | What it does |
|---|---|---|
| **fd** | — | `find` replacement, fast recursive file search |
| **ripgrep** (`rg`) | — | Ultra-fast content search (grep) |
| **lazygit** | — | TUI git client (launch with `lazygit`) |
| **delta** | `~/.gitconfig` | Syntax-highlighted git diffs, side-by-side, Catppuccin Mocha theme |
| **dust** | — | Instant disk usage (du replacement) |
| **procs** | — | Modern colorful `ps` replacement |
| **tealdeer** (`tldr`) | — | Simplified man pages with examples |
| **tokei** | — | Count lines of code by language |

### ❌ Not Yet Installed

| Tool | Install | What it does |
|---|---|---|
| **bottom** (`btm`) | `brew install bottom` | Graphical system monitor, GPU-aware |
| **sd** | `brew install sd` | Intuitive `sed` replacement |
| **hyperfine** | `brew install hyperfine` | Benchmark commands |
| **just** | `brew install just` | `make`-like command runner |
| **ouch** | `brew install ouch` | One command for any archive format |
| **atuin** | `brew install atuin` | Encrypted, synced shell history with search |
| **fnm** | `brew install fnm` | Fast Node version manager |
| **grex** | `brew install grex` | Generate regex from examples |
| **hexyl** | `brew install hexyl` | Colorful hex viewer |
