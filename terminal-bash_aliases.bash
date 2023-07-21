# pulled these from freeCodeCamp
# https://www.freecodecamp.org/news/bashrc-customization-guide/

# Common Commands
alias q='exit'
alias c='clear'
alias h='history'
alias cs='clear'
alias p='cat'
alias pd='pwd'
alias l='ls'
alias lsa='ls -a'
alias lsl='ls -l'
alias lsll='ls -ll'
alias pd='pwd'
alias t='time'
alias k='kill'
alias mk='mkdir'
alias null='/dev/null'


# GIT Commands
# View Git status.
alias gs='git status'

# Add a file to Git.
alias ga='git add'

# Add all files to Git.
alias gaa='git add --all'

# Commit changes to the code.
alias gc='git commit'

# Commit changes to the code message.
alias gcm='git commit -m'


# Push Commit
alias gph="git push"

# Git Push Origin
alias gpho='git push origin'

# View the Git log.
alias gl='git log --oneline'

# Create a new Git branch and move to the new branch at the same time. 
alias gcob='git checkout -b'

# Git Checkout - PreExisiting Branch
alias gco='git checkout'

# View the difference.
alias gd='git diff'

# Git Restore
alias grstr='git restore'

# Git Reset
alias grst='git reset'

# Git Remove
alias grm='git rm'

# Git Move
alias gmv='git mv'

#Git Stash
alias gsth='git stash'

# Git Tag
alias gtg='git tag'

# Git Pull
alias gpl='git pull'


# Useful Commands
# Move to the parent folder.
alias ..='cd ..;pwd'

# Move up two parent folders.
alias ...='cd ../..;pwd'

# Move up three parent folders.
alias ....='cd ../../..;pwd'

# Press c to clear the terminal screen.
alias c='clear'

# Press h to view the bash history.
alias h='history'

# Display the directory structure better.
alias tree='tree --dirsfirst -F'

# Make a directory and all parent directories with verbosity.
alias mkdir='mkdir -p -v'

# View the calender by typing the first three letters of the month.
alias jan='cal -m 01'
alias feb='cal -m 02'
alias mar='cal -m 03'
alias apr='cal -m 04'
alias may='cal -m 05'
alias jun='cal -m 06'
alias jul='cal -m 07'
alias aug='cal -m 08'
alias sep='cal -m 09'
alias oct='cal -m 10'
alias nov='cal -m 11'
alias dec='cal -m 12'