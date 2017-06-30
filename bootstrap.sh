#!/usr/bin/env bash

CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
SKEL_DIR=${CURRENT_DIR}/home

### DIRCOLORS!

# prompt to delete .dir_colors
if [ -f ~/.dir_colors ]; then
  rm -i ~/.dir_colors
fi

# link ..dir_colors
if ! [ -f ~/.dir_colors ]; then
  ln ${SKEL_DIR}/.dir_colors ~/.dir_colors
fi

### ZSH!

if [ -d ~/.oh-my-zsh ]; then
  sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
  rm -f ~/.zshrc
  ln ${SKEL_DIR}/.zshrc ~/.zshrc
else
  # prompt to delete zshrc
  if [ -f ~/.zshrc ]; then
    rm -i ~/.zshrc
  fi
  # link .zshrc
  if ! [ -f ~/.zshrc ]; then
    ln ${SKEL_DIR}/.zshrc ~/.zshrc
  fi
fi

# install zsh plugins
if ! [ -d ~/.zshrc/custom/plugins/zsh-syntax-highlighting ]; then
  git clone https://github.com/zsh-users/zsh-syntax-highlighting ~/.zshrc/custom/plugins/zsh-syntax-highlighting
fi

if ! [ -d ~/.zshrc/custom/themes/powerline-shell ]; then
  git clone https://github.com/richjoyce/powerline-shell ~/.zshrc/custom/themes/powerline-shell
fi

### TMUX!

# install tmux plugins
if ! [ -d ~/.tmux/plugins/tmux-battery ]; then
  git clone https://github.com/richjoyce/tmux-battery ~/.tmux/plugins/tmux-battery
fi
if ! [ -d ~/.tmux/plugins/tmux-prefix-highlight ]; then
  git clone https://github.com/richjoyce/tmux-prefix-highlight ~/.tmux/plugins/tmux-prefix-highlight
fi

# prompt to delete tmux.conf
if [ -f ~/.tmux.conf ]; then
  rm -i ~/.tmux.conf
fi
# link .tmux.conf
if ! [ -f ~/.tmux.conf ]; then
  ln ${SKEL_DIR}/.tmux.conf ~/.tmux.conf
fi

### VIM!
# TODO
