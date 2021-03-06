# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Vim edit mode
set -o vi

# Completion scripts
source ~/.bash_completion-git

# Environment variables
export PATH=$PATH:$HOME/.local/bin:$HOME/bin
export EDITOR=vim
export USERDATA=~/git/userdata

# User specific aliases and functions
alias tma='tmux attach -d -t'

# Graphical terminal
if [ $TERM == "xterm-256color" ]||[ $TERM == "screen-256color" ] ; then
    # Powerline
    PYTHON_VERSION=$(python -V 2>&1 | cut -b8-10)
    POWERLINE_REPO=~/.local/lib/python${PYTHON_VERSION}/site-packages/powerline
    if [ `uname` == "Darwin" ]; then
        POWERLINE_REPO=~/Library/Python/${PYTHON_VERSION}/lib/python/site-packages/powerline
        export PATH=$PATH:$HOME/Library/Python/${PYTHON_VERSION}/bin
    fi
    if [ -f ${POWERLINE_REPO}/bindings/bash/powerline.sh ]; then
        source ${POWERLINE_REPO}/bindings/bash/powerline.sh
        export POWERLINE_REPO
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

# Mac OS X isms
if [ `uname` == "Darwin" ]; then
    alias ls="ls -G"
    export PATH=/usr/local/bin:$PATH
fi

# Host specific settings
if [ -f ~/.bashrc.local ]; then
    source ~/.bashrc.local
fi

# Set tmux PWD
export PROMPT_COMMAND=$PROMPT_COMMAND'$( [ -n $TMUX ] && tmux setenv -g TMUX_PWD_$(tmux display -p "#D" | tr -d %) $PWD)'
#export PROMPT_COMMAND=$PROMPT_COMMAND'$( [ -n $TMUX ] && tmux refresh-client -S)'

# upto parent dir
upto ()
{
    if [ -z "$1" ]; then
        return
    fi
    local upto=$1
    cd "${PWD/\/$upto\/*//$upto}"
}
_upto()
{
    local cur=${COMP_WORDS[COMP_CWORD]}
    local d=${PWD//\//\ }
    COMPREPLY=( $( compgen -W "$d" -- "$cur" ) )
}
complete -F _upto upto
