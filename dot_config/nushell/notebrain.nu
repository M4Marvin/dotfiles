# NoteBrain completions for nushell.
#
# notebrain only ships bash/zsh/fish completions, but its bash `-C` protocol
# is trivial: set COMP_LINE to the current command line and read candidates
# from stdout (one per line). This completer wraps that protocol.
#
# Installs the external completer for ALL commands:
#   - notebrain        -> COMP_LINE protocol via the binary itself
#   - everything else  -> carapace (restores the completer that carapace.nu
#                         installs but config.nu's `completions.external`
#                         block overwrites afterwards)

$env.config.completions.external = {
    enable: true
    max_results: 100
    completer: {|spans|
        if ($spans.0 == "notebrain") {
            let line = ($spans | str join " ")
            with-env {
                COMP_LINE: $line
                COMP_POINT: ($line | str length)
            } {
                ^notebrain
            }
            | lines
            | each {|candidate| { value: $candidate, description: "" } }
        } else {
            do $carapace_completer $spans
        }
    }
}
