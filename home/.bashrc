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
    PYTHON_VERSION=$(python -V 2>&1 | cut -b8-10)
    POWERLINE_REPO=~/.local/lib/python${PYTHON_VERSION}/site-packages/powerline
    if [ `uname` == "Darwin" ]; then
        POWERLINE_REPO=~/Library/Python/${PYTHON_VERSION}/lib/python/site-packages/powerline
        export PATH=$PATH:$HOME/Library/Python/${PYTHON_VERSION}/bin
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
