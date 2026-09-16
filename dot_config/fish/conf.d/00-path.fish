# PATH setup — runs first in conf.d (00- prefix).
# Mirrors nushell login.nu / config.nu path adds.

# Homebrew (macOS). brew shellenv sets HOMEBREW_* + MANPATH/INFOPATH.
if test -x /opt/homebrew/bin/brew
    eval (/opt/homebrew/bin/brew shellenv | string collect)
else
    fish_add_path /opt/homebrew/bin /opt/homebrew/sbin
end

fish_add_path $HOME/.cargo/bin
fish_add_path $HOME/.bun/bin
fish_add_path $HOME/.opencode/bin
fish_add_path $HOME/.grok/bin
fish_add_path $HOME/Library/pnpm/bin
