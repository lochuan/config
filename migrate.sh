#!/bin/bash
set -e

OS=$(uname)

function create_config_dir(){
  if [ ! -d "$HOME/Documents/config/SpaceVim.d" ]; then
    mkdir $HOME/Documents/config/SpaceVim.d
  fi
}

function darwin_b(){
  echo 'Mac config backup..'
  cp -f "$HOME/.zshrc" "$HOME/Documents/config/mac-zshrc"
  cp -f "$HOME/.zimrc" "$HOME/Documents/config/mac-zimrc"
  create_config_dir
  cp -a "$HOME/.SpaceVim.d/." "$HOME/Documents/config/SpaceVim.d/"
  git add .
  git commit -a -m "Mac update time: $(date)"
  git push origin HEAD
}

function linux_b(){
  echo 'Linux config backup..'
  cp -f "$HOME/.zshrc" "$HOME/Documents/config/linux-zshrc"
  cp -f "$HOME/.zimrc" "$HOME/Documents/config/linux-zimrc"
  create_config_dir
  cp -a "$HOME/.SpaceVim.d/." "$HOME/Documents/config/SpaceVim.d"
  git add .
  git commit -a -m "Linux update time: $(date)"
  git push origin HEAD
}

function darwin_r(){
  echo 'Mac config restore...'
  git pull
  cp -f "$HOME/Documents/config/mac-zshrc" "$HOME/.zshrc"
  cp -f "$HOME/Documents/config/mac-zimrc" "$HOME/.zimrc"
  cp -a "$HOME/Documents/config/SpaceVim.d/." "$HOME/.SpaceVim.d/"
}

function linux_r(){
  echo 'Linux config restore...'
  git pull
  cp -f "$HOME/Documents/config/linux-zshrc" "$HOME/.zshrc"
  cp -f "$HOME/Documents/config/linux-zimrc" "$HOME/.zimrc"
  cp -a "$HOME/Documents/config/SpaceVim.d/." "$HOME/.SpaceVim.d/"
}

function backup(){
  if [[ $OS == Darwin ]]; then
    darwin_b
  elif [[ $OS == Linux ]]; then
    linux_b
  fi
}

function restore(){
  if [[ $OS == Darwin ]]; then
    darwin_r
  elif [[ $OS == Linux ]]; then
    linux_r
  fi
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
