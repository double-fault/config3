# Note that in GRUB boot parameters I have isolated CPUs 2&8 (/etc/default/grub).
alias sudo='sudo '
# sudo date -s "$(wget -qSO- --max-redirect=0 google.com 2>&1 | grep Date: | cut -d' ' -f5-8)Z"

# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

export PS1='\[\033[38;2;208;208;208m\]\w \[\033[1;38;2;60;179;113m\]\$\[\033[0m\] '

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

#intel vtune
#source ~/intel/oneapi/setvars.sh

#rustc
. "$HOME/.cargo/env"

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

alias hotline='wmctrl -r "Hotline Miami" -b add,fullscreen'

# atcoder library
alias gac="g++ -std=c++20 -I /home/ashish/compp/ac-library/"
alias ace="python3 /home/ashish/compp/ac-library/expander.py --lib /home/ashish/compp/ac-library/"

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
#alias vi='vim'
alias settime="sudo date -s \"$(wget -qSO- --max-redirect=0 google.com 2>&1 | grep Date: | cut -d' ' -f5-8)Z\""
alias sudop='sudo env PATH=$PATH '
alias perfgov="sudo cpupower frequency-set --governor performance && sudo cpupower frequency-set -d 4500MHz && cpupower frequency-info" 

alias vi="XDG_CONFIG_HOME=~/config2/ XDG_DATA_HOME=~/.local/share/config2_nvim XDG_STATE_HOME=~/.local/state/config2_nvim nvim"

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

alias pbcopy='xclip -selection clipboard'
alias pbpaste='xclip -selection clipboard -o'
alias bright='xrandr --output eDP-1 --brightness' # usage: bright x where x is a number between 0 and 1. 1 means same brightness. Eg: bright 0.7
alias lsp='ls -alFG'
alias py='python3'
alias get_idf='. $HOME/esp/esp-idf/export.sh'
alias perfr="perf report -g 'graph,0,caller'" # thank chandler carruth

# TORCS stuff
export TORCS_BASE='/home/ashish/torcs-1.3.7'
export MAKE_DEFAULT=$TORCS_BASE/Make-default.mk
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/lib

# cross-compiler stuff
export PATH="$HOME/opt/cross/bin:$PATH"

# why was this not included in the path before?
export PATH="$HOME/.local/bin:$PATH"

# e9tools
export PATH="/home/ashish/cs/e9patch:$PATH"
export e9p="/home/ashish/cs/e9patch/src/e9tool"

# pmu tools
export PATH="/home/ashish/cs/pmu-tools:$PATH"
# Commenting this because I dont want to enter sudo passwd everytime bash starts 
# NOTE: Can still be useful ig, uncomment when needed
#echo 0 | sudo tee /proc/sys/kernel/nmi_watchdog

debug(){
	g++ -std=c++2a -Wall -Wshadow -Wparentheses -Wshift-overflow=2 -Wl,-z,stack-size=268435456 -O2 -DLOCAL -D_GLIBCXX_DEBUG -Wconversion -Wextra "$1.cpp" -o "$1.exe"
	"./$1.exe"
}

export PATH=$PATH:/home/$USER/chomper/bin
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"

# Intel PIN
export PIN_ROOT="/home/ashish/cs/pin-external-3.31-98869-gfa6f126a8-gcc-linux"
export PATH="$PIN_ROOT:$PATH"

# Gurobi stuff
export GUROBI_HOME="/home/ashish/gurobi1200/linux64"
export PATH="${PATH}:${GUROBI_HOME}/bin"
export LD_LIBRARY_PATH="${LD_LIBRARY_PATH}:${GUROBI_HOME}/lib"
export GRB_LICENSE_FILE="/home/ashish/gurobi.lic"

# Locale so that tmux can use nerd fonts
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

# Swap escape and caps lock
setxkbmap -option caps:swapescape

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
. "$HOME/.cargo/env"

export PATH=$PATH:/home/$USER/chomper/bin
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"

if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi
. "$HOME/.cargo/env"
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init - bash)"
