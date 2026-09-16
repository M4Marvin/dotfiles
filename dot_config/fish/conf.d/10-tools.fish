# Tool inits — official integration lines:
#   starship: `starship init fish | source`
#   zoxide:   `zoxide init fish --cmd cd --hook pwd | source` (matches nu flags)
#   mise:     `mise activate fish | source`
# Guarded so a missing binary never breaks shell startup.

if status is-interactive
    if command -q starship
        starship init fish | source
    end
    if command -q zoxide
        zoxide init fish --cmd cd --hook pwd | source
    end
    if command -q mise
        mise activate fish | source
    end
    if command -q carapace
        carapace _carapace fish | source
    end
end
