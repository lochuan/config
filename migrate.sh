#!/bin/bash
set -e

function backup(){
    echo 'backup...'
    cp -f "$HOME/.config/nvim/init.vim" "$HOME/Documents/config/init.vim"
    cp -f "$HOME/.zshrc" "$HOME/Documents/config/zshrc"
    cp -f "$HOME/.zimrc" "$HOME/Documents/config/zimrc"
    cp -R "$HOME/.config/nvim/colors/" "$HOME/Documents/config/nvim/colors/"
    git add .
    git commit -a -m "update time: $(date)"
    git push origin HEAD
}

function restore(){
    echo 'restore...'
    git pull
    cp -f "$HOME/Documents/config/vimrc" "$HOME/.config/nvim/init.vim"
    cp -f "$HOME/Documents/config/zshrc" "$HOME/.zshrc"
    cp -f "$HOME/Documents/config/zimrc" "$HOME/.zimrc"
    cp -R "$HOME/Documents/config/vim/colors/" "$HOME/.config/nvim/colors/"
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
