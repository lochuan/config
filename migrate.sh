#!/bin/bash
set -e
set -x

function backup(){
    echo 'backup...'
    cp -f "$HOME/.vimrc" "$HOME/Documents/config/vimrc"
    cp -f "$HOME/.zshrc" "$HOME/Documents/config/zshrc"
    cp -f "$HOME/.zimrc" "$HOME/Documents/config/zimrc"
    cp -a "$HOME/.vim/colors" "$HOME/Documents/config/vim/colors/"
    git add .
    git commit -a -m "update time: $(date)"
    git push origin HEAD
}

function restore(){
    echo 'restore...'
    git pull
    cp -f "$HOME/Documents/config/vimrc" "$HOME/.vimrc"
    cp -f "$HOME/Documents/config/zshrc" "$HOME/.zshrc"
    cp -f "$HOME/Documents/config/zimrc" "$HOME/.zimrc"
    cp -a "$HOME/Documents/config/vim/colors/gruvbox.vim" "$HOME/.vim/colors/gruvbox.vim"
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
