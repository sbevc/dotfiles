# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
  export ZSH="/home/seba/.oh-my-zsh"


# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="powerlevel9k/powerlevel9k"
#ZSH_THEME="robbyrussell"


POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(
    custom_ubuntu
    virtualenv
    dir
    vcs
    newline
)


POWERLEVEL9K_DISABLE_RPROMPT=true
# Create a custom ubuntu prompt section
POWERLEVEL9K_CUSTOM_UBUNTU="echo -n '\uf31a'"
POWERLEVEL9K_CUSTOM_UBUNTU_FOREGROUND="black"
POWERLEVEL9K_CUSTOM_UBUNTU_BACKGROUND="yellow"

POWERLEVEL9K_VIRTUALENV_BACKGROUND="green"

POWERLEVEL9K_MODE="nerdfont-complete"
source ~/.oh-my-zsh/custom/themes/powerlevel9k/powerlevel9k.zsh-theme

VIRTUAL_ENV_DISABLE_PROMPT=true

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
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
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git virtualenv zsh-autosuggestions)


# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

export EDITOR='nvim'
# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# activate environments

alias env-fas='source ~/agroIT/venvs/fas/bin/activate && cd ~/agroIT/sitio-fas'
alias env-fas-viejo='source ~/agroIT/venvs/fas-viejo/bin/activate && cd ~/agroIT/fas-viejo'
alias env-fix='source ~/agroIT/venvs/fix/bin/activate && cd ~/agroIT/fixed_asset'

alias vim='nvim'
alias vi='nvim'

alias vimrc='nvim ~/.config/nvim/init.vim'


alias o='xdg-open'

alias killdj='sudo lsof -t -i tcp:8000 | xargs kill -9'

alias djrs='python manage.py runserver'
alias djshell='python manage.py shell_plus'

alias fuzzy='find . -type f | fzy'

export WORKON_HOME="$HOME/agroIT/venvs/"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# some more ls aliases
alias ll='ls -la'
alias la='ls -A'
alias l='ls -CF'

# run pgAdmin4 for postgres
alias pgadmin='source /home/seba/agroIT/venvs/pgAdmin4/bin/activate && python /home/seba/agroIT/venvs/pgAdmin4/lib/python2.7/site-packages/pgadmin4/pgAdmin4.py'

alias v="nvim"

alias vz='nvim ~/.zshrc'

source $ZSH/oh-my-zsh.sh

#ls colors
unset LSCOLORS
export CLICOLOR=1
export CLICOLOR_FORCE=1

alias so='source venv/bin/activate'

# cd to project and activate python environment
function workon() {
    if [ $1 = "smm" ]; then 
        cd ~/agroIT/marcacionesmoviles/smm/
        source ~/agroIT/venvs/smm/bin/activate
    else
        cd ~/agroIT/$1
        source ~/agroIT/venvs/$1/bin/activate
    fi
}

# Disable touch-screen, to enable set to 1
xinput set-prop "ELAN Touchscreen" "Device Enabled" 0
