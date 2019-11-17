#!/usr/bin/env bash

CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
SKEL_DIR=${CURRENT_DIR}/home

DEFAULT_NO=1
MAKE_BACKUPS=0

install_package() {
  echo "Installing: $package"
  echo "Requesting sudo access for apt"
  sudo apt install -y $1
}

prompt_confirm() {
  if [ $DEFAULT_NO -ge 1 ]; then
    prompt="$1 [y/N] "
  else
    prompt="$1 [Y/n] "
  fi
  read -r -p "$prompt" response
  case "$response" in
    [nN][oO]|[nN]) 
      return 1
      ;;
    [yY][eE][sS]|[yY]) 
      return 0
      ;;
    *) 
      return $DEFAULT_NO
      ;;
  esac
}

# remove_and_link NAME
remove_and_link() {
  if ! [ -f "${SKEL_DIR}/${1}" ]; then
    echo "Uh-oh, ${1} not found in repo? Skipping..."
    return
  fi
  prompt="Install $1 ?"
  if [ -f "${HOME}/${1}" ]; then
    prompt="Remove and install $1 ?"
  fi
  if prompt_confirm "$prompt"; then
    if [ -f "${HOME}/${1}" ]; then
      rm -f "${HOME}/${1}"
    fi
    ln -sf "${SKEL_DIR}/${1}" "${HOME}/${1}"
  else
    echo "Skipping $1 ..."
  fi
}


### ZSH!
CHECK_ZSH_INSTALLED=$(grep /zsh$ /etc/shells | wc -l)
if [ ! $CHECK_ZSH_INSTALLED -ge 1 ]; then
  install_package zsh
fi

if ! [ -d ~/.oh-my-zsh ] && prompt_confirm "Install oh-my-zsh?"; then
  read -r -p "Note: oh-my-zsh starts a new shell, you need to exit it after its done to complete." response
  sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
fi

remove_and_link .zshrc

### DIRCOLORS!
remove_and_link .dir_colors


# install zsh plugins
echo "Installing zsh plugins..."
if ! [ -d ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting ]; then
  git clone https://github.com/zsh-users/zsh-syntax-highlighting ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
fi

if ! [ -d ~/.oh-my-zsh/custom/themes/powerline-shell ]; then
  git clone https://github.com/richjoyce/powerline-shell ~/.oh-my-zsh/custom/themes/powerline-shell
fi

remove_and_link .oh-my-zsh/custom/themes/powerline-shell/config.py
(cd ~/.oh-my-zsh/custom/themes/powerline-shell/ && python install.py)

### TMUX!

# install tmux plugins
echo "Installing tmux plugins..."
if ! [ -d ~/.tmux/plugins/tmux-battery ]; then
  git clone https://github.com/richjoyce/tmux-battery ~/.tmux/plugins/tmux-battery
fi
if ! [ -d ~/.tmux/plugins/tmux-prefix-highlight ]; then
  git clone https://github.com/richjoyce/tmux-prefix-highlight ~/.tmux/plugins/tmux-prefix-highlight
fi

# prompt to delete tmux.conf
remove_and_link .tmux.conf

### VIM!
#echo "Installing vimrc..."
if ! [ -d ~/.vim/bundle/Vundle.vim ] && prompt_confirm "Install Vundle?"; then
    if [ -d ~/.vim ]; then
        mv ~/.vim ~/.vim.old
    fi
    mkdir -p ~/.vim/bundle/
    git clone https://github.com/VundleVim/Vundle.vim ~/.vim/bundle/Vundle.vim
fi

remove_and_link .vimrc
