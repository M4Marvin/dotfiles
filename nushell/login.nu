if $nu.os-info.name == "macos" {
    $env.HOMEBREW_PREFIX = "/opt/homebrew"
    $env.HOMEBREW_CELLAR = "/opt/homebrew/Cellar"
    $env.HOMEBREW_REPOSITORY = "/opt/homebrew"
    $env.MANPATH = ($env.MANPATH? | default "" | split row (char esep) | prepend "/opt/homebrew/share/man" | uniq | str join (char esep))
    $env.INFOPATH = ($env.INFOPATH? | default "" | split row (char esep) | prepend "/opt/homebrew/share/info" | uniq | str join (char esep))
}

$env.CARGO_HOME = ($env.HOME | path join ".cargo")
$env.RUSTUP_HOME = ($env.HOME | path join ".rustup")
