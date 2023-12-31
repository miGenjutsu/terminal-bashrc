
# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# RBENV COMMANDS
# eval "$(rbenv init -)"export PATH="$HOME/.tfenv/bin:$PATH"

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

# start a new project with Git:
function git_init() {
    if [ -z "$1" ]; then
        printf "%s\n" "Please provide a directory name."
    else
        mkdir "$1"
        builtin cd "$1"
        pwd
        git init
        touch README.md .gitignore LICENSE
        echo "# $(basename "$PWD")" >> README.md
        code-insiders .

        # Set GitHub origin with SSH URL
        read -p "Enter your GitHub repository name (e.g., 'username/repo'): " github_repo
        git remote add origin "git@github.com:$github_repo.git"

        printf "\n%s\n" "Git repository initialized with GitHub origin: git@github.com:$github_repo.git"
    fi
}


#--- THIS IS OLD FUNCTION -- FOR SOME REASON I WAS GETTING AN ERROR SO THE ABOVE SHOULD PREVENT THAT ERROR
# function git_init() {
#     if [ -z "$1" ]; then
#         printf "%s\n" "Please provide a directory name."
#     else
#         mkdir "$1"
#         builtin cd "$1"
#         pwd
#         git init
#         touch README.md .gitignore LICENSE
#         echo "# $(basename "$PWD")" >> README.md

#         # Set GitHub origin
#         read -p "Enter your GitHub repository URL: " github_url
#         git remote add origin "$github_url"

#         printf "\n%s\n" "Git repository initialized with GitHub origin: $github_url"

#         # Open VS Code-Insiders
#         code-insiders .
#     fi
# }

# Weather Report
# function weather_report() {

#     local response=$(curl --silent 'https://api.openweathermap.org/data/2.5/weather?id=5128581&units=imperial&appid=<YOUR_API_KEY>') 

#     local status=$(echo $response | jq -r '.cod')

# 	# Check for the 200 response indicating a successful API query.
#     case $status in
		
#         200) printf "Location: %s %s\n" "$(echo $response | jq '.name') $(echo $response | jq '.sys.country')"  
#              printf "Forecast: %s\n" "$(echo $response | jq '.weather[].description')" 
#              printf "Temperature: %.1f°F\n" "$(echo $response | jq '.main.temp')" 
#              printf "Temp Min: %.1f°F\n" "$(echo $response | jq '.main.temp_min')" 
#              printf "Temp Max: %.1f°F\n" "$(echo $response | jq '.main.temp_max')" 
#             ;;
#         401) echo "401 error"
#             ;;
#         ) echo "error"
#             ;;

#     esac

# }

# export PATH="$HOME/.tfenv/bin:$PATH"

# HOMEBREW COMMANDS
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
# eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"



# # oh-my-posh cmd beautify
eval "$(oh-my-posh init bash --config '/mnt/c/github/prompt/beautifyterminalkushal.omp.json')"
# eval "$(oh-my-posh init bash --config $(brew --prefix oh-my-posh)/themes/atomic.omp.json)"
# eval "$(oh-my-posh init bash --config $(brew --prefix oh-my-posh)/themes/marcduiker.omp.json)"
# eval "$(oh-my-posh init bash --config $(brew --prefix oh-my-posh)/themes/kushal.omp.json)"
# eval "$(oh-my-posh init bash --config $(brew --prefix oh-my-posh)/themes/night-owl.omp.json)"


# RBENV COMMANDS
eval "$(~/.rbenv/bin/rbenv init - bash)"
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init - bash)"


# complete -C /usr/local/bin/terraform terraform

# export PATH=$PATH:$HOME/.tfenv/binexport 
# export PATH=$PATH:$HOME/.tfenv/bin


# PYENV COMMANDS
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

# export NVM_DIR="$HOME/.nvm"
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
# [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion