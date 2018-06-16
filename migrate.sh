#!/bin/bash
set -e

function backup(){
    echo 'backup...'
    cp -f "$HOME/.vimrc" "$HOME/Documents/config/vimrc"
    cp -f "$HOME/.zshrc" "$HOME/Documents/config/zshrc"
    cp -f "$HOME/.tmux.conf" "$HOME/Documents/config/tmux.conf"
    cp -f "/usr/share/conky/conky_lochuan" "$HOME/Documents/config/conky_lochuan"
    mkdir -p "$HOME/Documents/config/i3-conf-buket"
    rsync -r "$HOME/.i3-conf-buket/" "$HOME/Documents/config/i3-conf-buket"
    mkdir -p "$HOME/Documents/config/screenlayout"
    rsync -r "$HOME/.screenlayout" "$HOME/Documents/config/screenlayout"
    git add .
    git commit -a -m "update time: $(date)"
    git push origin HEAD
}

function restore(){
    echo 'restore...'
    git pull
    cp -f "$HOME/Documents/config/vimrc" "$HOME/.vimrc"
    cp -f "$HOME/Documents/config/zshrc" "$HOME/.zshrc"
    cp -f "$HOME/Documents/config/tmux.conf" "$HOME/.tmux.conf"
    mkdir -p "$HOME/.i3-conf-buket"
    rsync -r "$HOME/Documents/config/i3-conf-buket/" "$HOME/.i3-conf-buket"
    mkdir -p "$HOME/.screenlayout"
    rsync -r "$HOME/Documents/config/screenlayout/" "$HOME/.screenlayout"
    sudo cp -f "$HOME/Documents/config/conky_lochuan" "/usr/share/conky/conky_lochuan"
    sudo ln -f -s "$HOME/Documents/config/screenlayout/verify_ext_type.sh" "/etc/X11/xinit/xinitrc.d/verify_ext_type.sh"
}

if [ $# -ne 1 ]; then
    echo 'Usage: migrate [backup | restore]'
else
    case "$1" in
        'backup')
            backup
            ;;
        'restore')
            restore
            ;;
        *)
            echo 'Usage: migrate [backup | restore]'
            ;;
    esac
fi
