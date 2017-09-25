# Add some colors #
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

# Git branch in prompt #
parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

# Terminal prompt
export PS1='\n\033[0;36m☖ \033[0m \W\[\033[1;31m\]$(parse_git_branch)\[\033[00m\]: '

# function prompt_right() {
#   echo -e "\033[0;36m\w\033[0m"
# }

# function prompt_left() {
#   echo -e "\033[0;35m☖  \033[0m"
# }

# function prompt() {
#     compensate=-50
#     PS1=$(printf "\n%*s\r%s\n\$: " "$(($(tput cols)+${compensate}))" "$(prompt_right)" "$(prompt_left)")
# }
# PROMPT_COMMAND=prompt

# Setting GOPATH
export GOPATH=$HOME/Workspace
export PATH=$GOPATH/bin:$HOME/bin:$PATH

# Aliases
alias l="ls"
alias lah="ls -lah"
alias reload="source ~/.bash_profile"
alias serve="python -m SimpleHTTPServer"
alias work="cd ~/Workspace"
alias src="cd ~/Workspace/src"
alias other="cd ~/Workspace/other"
alias v=nvim
alias v.="nvim ."
alias ef2k="cd ~/Workspace/src/github.com/ef2k"
alias notes="nvim ~/Workspace/notes"
alias chrome="/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome"
alias chrome-canary="/Applications/Google\ Chrome\ Canary.app/Contents/MacOS/Google\ Chrome\ Canary"

# Node version manager
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

# Rust package man
export PATH="$HOME/.cargo/bin:$PATH"

# Set default editor
export EDITOR='vim'
[ -f ~/.bin/tmuxinator.bash ] && source ~/.bin/tmuxinator.bash

# FZF
export PATH="$HOME/.fzf/bin:$PATH"
[ -f ~/.fzf.bash ] && source ~/.fzf.bash
