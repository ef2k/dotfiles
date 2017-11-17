alias tmux='tmux -2'

# Add some colors #
#export CLICOLOR=1
#export LSCOLORS=GxFxCxDxBxegedabagaced

# Git branch in prompt #
parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

# Terminal prompt
export PS1='\n☖  \W \e[1;33m$(parse_git_branch)\e[0m: '

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

# Pyenv
export PYENV_ROOT="$(brew --prefix pyenv)"
export PYTHON_CONFIGURE_OPTS="--enable-framework"
export CFLAGS="-I$(brew --prefix openssl)/include"
export LDFLAGS="-L$(brew --prefix openssl)/lib"
export PATH=$PYENV_ROOT/shims:$PATH

# Rbenv
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
