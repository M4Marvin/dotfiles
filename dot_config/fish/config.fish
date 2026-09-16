# Fish main config — managed by chezmoi (~/codes/dotfiles/dot_config/fish/config.fish)
# conf.d/*.fish runs before this file (official fish startup order).

# Interactive-only settings
if status is-interactive
    # Catppuccin Mocha is applied per-tool (bat, eza, starship, ghostty).
    # Fish native highlighting stays default; starship provides the prompt.

    # Faaah on failure (ports nu pre_prompt hook in nushell/config.nu).
    # Sound lives in the nushell dir as single source of truth.
    function __faaah_on_fail --on-event fish_postexec
        if test $status -ne 0
            set -l sound "$HOME/.config/nushell/sounds/faaah.mp3"
            if test -f "$sound"
                if test (uname) = Darwin
                    command afplay -v 0.4 "$sound" >/dev/null 2>&1 &
                else
                    command paplay --volume=26214 "$sound" >/dev/null 2>&1 &
                end
            end
        end
        return 0
    end
end

# Env (ported from nushell config.nu / login.nu)
set -gx BAT_THEME "Catppuccin Mocha"
set -gx EZA_CONFIG_DIR "$HOME/.config/eza"
set -gx EDITOR nvim
set -gx CARGO_HOME "$HOME/.cargo"
set -gx RUSTUP_HOME "$HOME/.rustup"
set -gx CARAPACE_BRIDGES "zsh,fish,bash,inshellisense"

# Aliases (fish alias = function wrapper; matches nu aliases)
alias ll='eza -l'
alias la='eza -a'
alias lla='eza -la'
alias lt='eza --tree'
alias cat='bat --style=plain --paging=never'

# yazi cwd wrapper (ports nu `y` def)
function y
    set tmp (mktemp -t "yazi-cwd.XXXXXX")
    yazi $argv --cwd-file="$tmp"
    if set -q tmp; and test -f "$tmp"
        set cwd (cat "$tmp")
        if test -n "$cwd"; and test "$cwd" != "$PWD"; and test -d "$cwd"
            cd "$cwd"
        end
        rm -f "$tmp"
    end
end
