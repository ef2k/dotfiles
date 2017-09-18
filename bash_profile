# Add some colors #
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

# Git branch in prompt #
parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

# Terminal prompt #
export PS1='\n\n♙  \W\[\033[1;33m\]$(parse_git_branch)\[\033[00m\]: '

# Setting GOPATH
export GOPATH=$HOME/Workspace
export PATH=$GOPATH/bin:$HOME/bin:$PATH

# Aliases #
alias reload="source ~/.bash_profile"
alias serve="python -m SimpleHTTPServer"
alias work="cd ~/Workspace"
alias src="cd ~/Workspace/src"
alias other="cd ~/Workspace/other"
alias v=nvim
alias v.="nvim ."

alias chrome="/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome"
alias chrome-canary="/Applications/Google\ Chrome\ Canary.app/Contents/MacOS/Google\ Chrome\ Canary"

# Neovim
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Rust package man.
export PATH="$HOME/.cargo/bin:$PATH"

# Set default editor
export EDITOR='vim'
[ -f ~/.bin/tmuxinator.bash ] && source ~/.bin/tmuxinator.bash

# FZF
export PATH="$HOME/.fzf/bin:$PATH"
[ -f ~/.fzf.bash ] && source ~/.fzf.bash
