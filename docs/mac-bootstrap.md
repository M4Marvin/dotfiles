# macOS Bootstrap Runbook

A fresh macOS machine, from zero to a working dotfiles setup. Copy and paste each block in order.

## 1. Prereqs: install tools

Install chezmoi, ghostty, nushell, and a Nerd Font with Homebrew:

```sh
brew install chezmoi
brew install --cask ghostty
brew install --cask font-jetbrains-mono-nerd-font
```

Then the CLI tools:

```sh
brew install starship neovim yazi bat eza mise lazygit delta fd ripgrep zoxide carapace gh
```

Any Nerd Font works; `font-jetbrains-mono-nerd-font` is a solid default (`font-google-sans-code` is another option).

## 2. Make nushell use the consolidated layout

Add this to your macOS login shell (`~/.zprofile`):

```sh
export XDG_CONFIG_HOME="$HOME/.config"
```

Then open a **new terminal** so the change takes effect. Nushell honors `XDG_CONFIG_HOME` on all platforms, so it reads `~/.config/nushell` instead of `~/Library/Application Support/nushell`.

## 3. Bootstrap dotfiles

```sh
chezmoi init -S ~/codes/dotfiles https://github.com/M4Marvin/dotfiles
```

This clones the repo into `~/codes/dotfiles` (which is both the git clone and chezmoi's source directory) and writes `~/.config/chezmoi/chezmoi.toml`.

## 4. Review

```sh
chezmoi diff
```

Nothing destructive should appear. If it does, stop and inspect before continuing.

## 5. Apply

```sh
chezmoi apply
```

## 6. Verify

```sh
chezmoi verify
```

## 7. Regenerate nushell generated files

These are regenerated per machine and written into `~/.config/nushell/`:

```sh
starship init nu | save -f ~/.config/nushell/starship.nu
mise activate nu | save -f ~/.config/nushell/mise.nu
carapace _carapace nushell | save -f ~/.config/nushell/carapace.nu
zoxide init nushell --cmd cd --hook pwd > ~/.config/nushell/zoxide.nu
```

## 8. Authenticate per machine

```sh
gh auth login
```

`hosts.yml` is intentionally not synced, so gh auth is per machine.

## 9. Security follow-up

If a GitHub token was ever committed to the repo history, rotate it: GitHub → Settings → Developer settings → Personal access tokens. Revoke the old token, create a new one, and never commit it.