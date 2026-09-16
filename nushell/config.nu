use std/util "path add"

path add ($env.HOME | path join ".cargo" "bin")
path add ($env.HOME | path join ".bun" "bin")
path add ($env.HOME | path join ".local" "bin")

if $nu.os-info.name == "macos" {
    path add "/opt/homebrew/bin"
    path add "/opt/homebrew/sbin"
    path add ($env.HOME | path join "Library" "pnpm" "bin")
}

source ($nu.default-config-dir | path join "catppuccin_mocha.nu")
source ($nu.default-config-dir | path join "starship.nu")
source ~/.zoxide.nu

$env.CARAPACE_BRIDGES = 'zsh,fish,bash,inshellisense'
source $"($nu.cache-dir)/carapace.nu"

$env.config.completions.external = {
    enable: true
    max_results: 100
}

use ($nu.default-config-dir | path join mise.nu)

alias ll = eza -l
alias la = eza -a
alias lla = eza -la
alias lt = eza --tree
alias cat = bat --style=plain --paging=never

def --env y [...args] {
	let tmp = (mktemp -t "yazi-cwd.XXXXXX")
	^yazi ...$args --cwd-file $tmp
	let cwd = (open $tmp)
	if $cwd != $env.PWD and ($cwd | path exists) {
		cd $cwd
	}
	rm -fp $tmp
}

$env.BAT_THEME = "Catppuccin Mocha"
$env.EZA_CONFIG_DIR = ($env.HOME | path join ".config" "eza")

$env.EDITOR = "nvim"

if $nu.os-info.name == "macos" {
    alias open = ^open
    alias nu-open = open
}

$env.config.show_banner = false
$env.config.buffer_editor = "nvim"

def killport [port: int] {
    let pids = (^lsof -i $":($port)" -t
        | lines
        | str trim
        | where {|l| not ($l | is-empty)}
        | into int
    )

    if ($pids | is-empty) {
        print $"No process found on port ($port)"
        return
    }

    for pid in $pids {
        let cmd = (^ps -p $pid -o comm= | str trim)
        print $"($cmd) \(pid ($pid)\) on port ($port)"
        ^kill $pid
    }

    print $"Killed (($pids | length)) process\(es\) on port ($port)"
}

$env.config.hooks.pre_prompt = ($env.config.hooks.pre_prompt | default [])
$env.config.hooks.pre_prompt = ($env.config.hooks.pre_prompt | append {
    condition: {|| $env.LAST_EXIT_CODE != 0 and $env.LAST_EXIT_CODE != null }
    code: {||
        job spawn { ^afplay -v 0.5 ($nu.default-config-dir | path join "sounds" "faaah.mp3") } | ignore
    }
})
