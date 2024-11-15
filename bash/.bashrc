# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
#HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
#shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
#HISTSIZE=1000
#HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
#shopt -s checkwinsize

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
force_color_prompt=yes

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
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\W\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\W\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \W\a\]$PS1"
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

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

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


# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/pristakos/mambaforge/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/pristakos/mambaforge/etc/profile.d/conda.sh" ]; then
        . "/home/pristakos/mambaforge/etc/profile.d/conda.sh"
    else
        export PATH="/home/pristakos/mambaforge/bin:$PATH"
    fi
fi
unset __conda_setup

if [ -f "/home/pristakos/mambaforge/etc/profile.d/mamba.sh" ]; then
    . "/home/pristakos/mambaforge/etc/profile.d/mamba.sh"
fi

CONDA_ROOT=~/mambaforge   # <- set to your Anaconda/Miniconda installation directory
if [[ -r $CONDA_ROOT/etc/profile.d/bash_completion.sh ]]; then
    source $CONDA_ROOT/etc/profile.d/bash_completion.sh
else
    echo "WARNING: could not find conda-bash-completion setup script"
fi

# <<< conda initialize <<<

# forward search history
stty -ixon




# If there are multiple matches for completion, Tab should cycle through them
bind 'TAB:menu-complete'

# And Shift-Tab should cycle backwards
bind '"\e[Z": menu-complete-backward'

# Display a list of the matching files
bind "set show-all-if-ambiguous on"

# Perform partial (common) completion on the first Tab press, only start
# cycling full results on the second Tab press (from bash version 5)
bind "set menu-complete-display-prefix on"


# Cycle through history based on characters already typed on the line
bind '"\e[A":history-search-backward'
bind '"\e[B":history-search-forward'

# Keep Ctrl-Left and Ctrl-Right working when the above are used
bind '"\e[1;5C":forward-word'
bind '"\e[1;5D":backward-word'


# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/pristakos/google-cloud-sdk/path.bash.inc' ]; then . '/home/pristakos/google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/home/pristakos/google-cloud-sdk/completion.bash.inc' ]; then . '/home/pristakos/google-cloud-sdk/completion.bash.inc'; fi



export USE_GKE_GCLOUD_AUTH_PLUGIN=True




# homebrew
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"



# func for encoding a string to base64 : encode_64 Hello, World --> SGVsbG8sIFdvcmxkCg== 
function encode_64(){ echo "$*" | base64 ; }
function encode_64_no_newline(){ echo -n "$*" | base64 ; }

# func from decoding a string from base64: decode_64 SGVsbG8sIFdvcmxkCg== --> Hello, World
function decode_64(){ echo "$*" | base64 --decode ; }
function decode_64_no_newline(){ echo -n "$*" | base64 --decode ; }






export FZF_DEFAULT_OPTS="--exact"
export FZF_ALT_C_COMMAND=" :"


# Set up fzf key bindings and fuzzy completion
eval "$(fzf --bash)"



# zioxide
export PATH="/home/pristakos/.local/bin:$PATH"

eval "$(zoxide init --cmd cd bash)"

source ~/.tldr/.tldr.complete

# open current dir in files
alias ocd="xdg-open ."


# retitle a pdf
alias retitle_pdf='exiftool -Title="$1" "$2"'


# toggle always on top on and of
# bash -c 'wmctrl -r :ACTIVE: -b $([[ $(xprop -id $(xprop -root -f _NET_ACTIVE_WINDOW 0x " \$0\\n" _NET_ACTIVE_WINDOW | awk "{print \$2}") _NET_WM_STATE) =~ "ABOVE" ]] && echo "remove" || echo "add"),above'





alias ls='eza'
alias cat='bat'


# eval "$(oh-my-posh init bash --config ~/.oh-my-posh/themes/myspace-theme.omp.toml)"

eval "$(starship init bash)" # init zsh




# activate autocompletion for bash
source ~/.ruff-completion.bash




# temporary workaround to start the docker desktop service
# https://github.com/docker/desktop-linux/issues/209
alias start_docker_desktop='sudo sysctl -w kernel.apparmor_restrict_unprivileged_userns=0 && systemctl --user start docker-desktop.service'


# VIMINIT tells vim where to find the configuration file .vimrc
export VIMINIT="source ~/.vim/.vimrc"




eval "$(thefuck --alias)"
. "$HOME/.cargo/env"
source ~/.bash_completion/alacritty
