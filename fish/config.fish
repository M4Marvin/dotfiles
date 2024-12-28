if status is-interactive

set fish_greeting

end

# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
if test -f /Users/marvinprakash/miniforge3/bin/conda
    eval /Users/marvinprakash/miniforge3/bin/conda "shell.fish" "hook" $argv | source
else
    if test -f "/Users/marvinprakash/miniforge3/etc/fish/conf.d/conda.fish"
        . "/Users/marvinprakash/miniforge3/etc/fish/conf.d/conda.fish"
    else
        set -x PATH "/Users/marvinprakash/miniforge3/bin" $PATH
    end
end
# <<< conda initialize <<<

# Add Visual Studio Code (code)
set -gx PATH $PATH "/Applications/Visual Studio Code.app/Contents/Resources/app/bin"

# yazi yy mode
function yy
	set tmp (mktemp -t "yazi-cwd.XXXXXX")
	yazi $argv --cwd-file="$tmp"
	if set cwd (cat -- "$tmp"); and [ -n "$cwd" ]; and [ "$cwd" != "$PWD" ]
		cd -- "$cwd"
	end
	rm -f -- "$tmp"
end

# Add Homebrew to the PATH
eval "$(/opt/homebrew/bin/brew shellenv)"
    
# initialize starship
starship init fish | source

# Aliases 
alias ls="lsd -aX1l"

zoxide init fish --cmd cd | source 

/Users/marvinprakash/.local/bin/mise activate fish | source

