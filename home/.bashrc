# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

export PATH=$PATH:$HOME/.local/bin:$HOME/bin
export EDITOR=vim

export USERDATA=~/git/userdata

# User specific aliases and functions
alias tma='tmux attach -d -t'

# Powerline
POWERLINE_REPO=~/.local/lib/python2.7/site-packages
if [ -f ${POWERLINE_REPO}/powerline/bindings/bash/powerline.sh ]; then
    source ${POWERLINE_REPO}/powerline/bindings/bash/powerline.sh
else
    echo "No powerline install found!"
fi

# Homeshick
HOMESHICK_REPO=~/.homesick/repos/homeshick
if [ -d ${HOMESHICK_REPO} ]; then
    source ${HOMESHICK_REPO}/homeshick.sh
    source ${HOMESHICK_REPO}/completions/homeshick-completion.bash
else
    echo "No homeshick install found!"
fi

# Host specific settings
if [ -f ~/.bashrc.local ]; then
    source ~/.bashrc.local
fi
