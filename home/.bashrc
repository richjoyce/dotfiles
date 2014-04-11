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

if [ $TERM == "xterm-256color" ]; then
    # Powerline
    POWERLINE_REPO=~/.local/lib/python2.7/site-packages/powerline
    if [ -d $POWERLINE_REPO ]; then
        POWERLINE_REPO=~/.local/lib/python2.6/site-packages/powerline
    fi
    if [ -f ${POWERLINE_REPO}/bindings/bash/powerline.sh ]; then
        source ${POWERLINE_REPO}/bindings/bash/powerline.sh
    else
        echo "No powerline install found!"
        echo "Run: pip install --user git+git://github.com/Lokaltog/powerline"
    fi
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
