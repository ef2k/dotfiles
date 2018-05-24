alias tmux='tmux -2'

# Setting GOPATH
export GOPATH=$HOME/Workspace
export PATH=$GOPATH/bin:$HOME/bin:$PATH

# Fix for sed 'illegal byte sequence' error
export LC_ALL=C

# Git branch in prompt #
parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

# Terminal prompt
export PS1='\n☖  \W$(parse_git_branch): '

# Aliases
alias l="ls"
alias ls="ls -F"
alias lah="ls -lah"
alias reload="source ~/.bash_profile"
alias serve="python -m http.server"
alias work="cd ~/Workspace"
alias sites="cd ~/Workspace/sites"
alias src="cd ~/Workspace/src"
alias other="cd ~/Workspace/other"
alias v=nvim
alias v.="nvim ."
alias ef2k="cd ~/Workspace/src/github.com/ef2k"
alias notes="nvim ~/Workspace/notes"
alias YT="cd ~/Music/YT"

# Increase history entries
export HISTSIZE=2000

# Node version manager
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

# Rust package man
export PATH="$HOME/.cargo/bin:$PATH"

# Set default editor
export EDITOR='nvim'
[ -f ~/.bin/tmuxinator.bash ] && source ~/.bin/tmuxinator.bash

# git-completion.bash
source /usr/local/etc/bash_completion.d/git-completion.bash

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

