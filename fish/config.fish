if status is-interactive
set fish_greeting
end

source "$HOME/.cargo/env.fish"

# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
# if test -f /Users/marvinprakash/miniforge3/bin/conda
#     eval /Users/marvinprakash/miniforge3/bin/conda "shell.fish" "hook" $argv | source
# else
#     if test -f "/Users/marvinprakash/miniforge3/etc/fish/conf.d/conda.fish"
#         . "/Users/marvinprakash/miniforge3/etc/fish/conf.d/conda.fish"
#     else
#         set -x PATH "/Users/marvinprakash/miniforge3/bin" $PATH
#     end
# end
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
alias ls="lsd"

zoxide init fish --cmd cd | source 

# vim config
function check_vim_config
    echo "Vim configuration file: $(vim --version | grep 'system vimrc file' | awk '{print $NF}')"
    echo "User vimrc file: $(vim --version | grep 'user vimrc file' | awk '{print $NF}')"
end
check_vim_config



