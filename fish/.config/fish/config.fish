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
# >>> xmake >>>
test -f "~/.xmake/profile" && source "~/.xmake/profile"

if type -q helix
    set -gx EDITOR helix
    set -gx VISUAL helix
else
    set -gx EDITOR vi
    set -gx VISUAL vi
end

set -g fish_key_bindings fish_vi_key_bindings
# Alt+Backspace: delete the previous word in insert mode
bind -M insert \e\x7f backward-kill-word
# Alt+Backspace: delete the previous word in normal mode
bind -M default \e\x7f backward-kill-word

# Added by Antigravity CLI installer
set -gx PATH "~/.local/bin" $PATH
