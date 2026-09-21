if status is-interactive
    # Commands to run in interactive sessions can go here
end

# Add paths only if they exist
test -d ~/.cargo/bin; and fish_add_path ~/.cargo/bin
test -d ~/.local/bin; and fish_add_path ~/.local/bin
test -d ~/.spicetify; and fish_add_path ~/.spicetify

starship init fish | source

# rm fish greeting
set -U fish_greeting

function y
    set tmp (mktemp -t "yazi-cwd.XXXXXX")
    command yazi $argv --cwd-file="$tmp"
    if read -z cwd <"$tmp"; and [ "$cwd" != "$PWD" ]; and test -d "$cwd"
        builtin cd -- "$cwd"
    end
    command rm -f -- "$tmp"
end
