# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH

# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time Oh My Zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch $(uname -m)"

# Set personal aliases, overriding those provided by Oh My Zsh libs,
# plugins, and themes. Aliases can be placed here, though Oh My Zsh
# users are encouraged to define aliases within a top-level file in
# the $ZSH_CUSTOM folder, with .zsh extension. Examples:
# - $ZSH_CUSTOM/aliases.zsh
# - $ZSH_CUSTOM/macos.zsh
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"


###############################################################################




# Conda initialization (adjust paths as necessary)
__conda_setup="$('/home/pristakos/mambaforge/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
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

# Custom aliases
alias gedit8="gedit --encoding utf-8"
alias cdd="cd ~/Downloads"
alias cde="cd /home/pristakos/Documents/synthetica/venvs"
alias cds="cd ~/Documents/synthetica/repos/alarm-system/app/processor/utils/sftp_aggregates"
alias cdu="cd ~/Documents/synthetica/repos/alarm-system/app/processor/utils"
alias mkubectl='minikube kubectl --'

# Key bindings
bindkey '^[[A' history-beginning-search-backward
bindkey '^[[B' history-beginning-search-forward
bindkey '^[[1;5C' forward-word
bindkey '^[[1;5D' backward-word

# Google Cloud SDK
if [ -f '/home/pristakos/google-cloud-sdk/path.zsh.inc' ]; then . '/home/pristakos/google-cloud-sdk/path.zsh.inc'; fi
if [ -f '/home/pristakos/google-cloud-sdk/completion.zsh.inc' ]; then . '/home/pristakos/google-cloud-sdk/completion.zsh.inc'; fi

export USE_GKE_GCLOUD_AUTH_PLUGIN=True

# Homebrew
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

# Base64 encoding/decoding functions
function encode_64() { echo -n "$*" | base64; }
function encode_64_no_newline() { echo -n "$*" | base64 -w 0; }
function decode_64() { echo "$*" | base64 --decode; }
function decode_64_no_newline() { echo -n "$*" | base64 --decode; }

# fzf setup
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# zoxide
export PATH="/home/pristakos/.local/bin:$PATH"
eval "$(zoxide init zsh)"

# TLDR completion
[[ -f ~/.tldr/.tldr.complete ]] && source ~/.tldr/.tldr.complete



# Oh My Posh (you may need to install the zsh version)
eval "$(oh-my-posh init zsh --config ~/.oh-my-posh/themes/myspace-theme.omp.toml)"


