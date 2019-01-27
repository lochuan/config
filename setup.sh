#!/bin/bash

set -e

function i_git(){
  echo 'Install git...'
  if ! [ -x "$(command -v git)" ]; then
    if [[ $OS == Darwin ]]; then
      $(brew install git)
    elif [[ $OS == Linux ]]; then
      $(sudo apt install git -y)
    fi
  fi
}

function i_zsh(){
  echo 'Install zsh...'
  if ! [ -x "$(command -v zsh)" ]; then
    if [[ $OS == Darwin ]]; then
      $(brew install zsh)
    elif [[ $OS == Linux ]]; then
      $(sudo apt install zsh)
    fi
  fi
  echo 'Install zim'
  git clone --recursive https://github.com/zimfw/zimfw.git ${ZDOTDIR:-${HOME}}/.zim
}


function i_pip3(){
  echo 'Install pip3...'
  if ! [ -x "$(command -v pip3)" ]; then
    if [[ $OS == Darwin ]]; then
      $(brew install python3)
    elif [[ $OS == Linux ]]; then
      $(sudo apt install python3-pip -y)
    fi
  fi

  # change pip to aliyun mirror
  if [ ! -d "$HOME/.pip" ]; then
    mkdir $HOME/.pip
    echo "[global]" >> $HOME/.pip/pip.conf
    echo " trusted-host =  mirrors.aliyun.com" >> $HOME/.pip/pip.conf
    echo " index-url = https://mirrors.aliyun.com/pypi/simple" >> $HOME/.pip/pip.conf
  fi
}

function i_golang(){
  if [[ $OS == Darwin ]]; then
    $(brew install golang)
  elif [[ $OS == Linux ]]; then
    $(sudo apt-get install golang -y)
  fi
}

function i_neovim(){
  echo 'Install neovim...'
  if ! [ -x "$(command -v nvim)" ]; then
    if [[ $OS == Darwin ]]; then
      $(brew install neovim)
    elif [[ $OS == Linux ]]; then
      $(sudo apt install neovim -y)
    fi
  fi

  # neovim python support
  $(pip3 install -U neovim)
}

function i_spacevim(){
  $(curl -sLf https://spacevim.org/install.sh | bash -s -- --install neovim)
  i_spacevim_ag
  i_spacevim_python
}

function i_spacevim_python(){
  $(pip3 install flake8,yapf,autoflake,isort,jedi)
}

function i_spacevim_ag(){
  if [[ $OS == Darwin ]]; then
    $(brew install the_silver_searcher)
  elif [[ $OS == Linux ]]; then
    $(sudo apt-get install silversearcher-ag -y)
  fi
}

i_git
i_zsh
i_pip3
i_golang
i_neovim
i_spacevim
