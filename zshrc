# configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/Users/dan/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

export ZSH=/Users/dan/.oh-my-zsh
ZSH_THEME="robbyrussell"

plugins=(
  git
)

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

export DISABLE_AUTO_TITLE="true"
precmd() {
  print -Pn "\e]0;%n@%m: %~\a"
}

start-agent() {
  if [ -z $SSH_AUTH_SOCK ]; then
    eval `ssh-agent -s` > /dev/null
  fi
    if [ -z $SSH_AGENT_PID ] && [ -z $SSH_TTY ]; then
    ssh-add ~/.ssh/id_rsa_tvision
    ssh-add ~/.ssh/id_rsa_tvitest
    ssh-add ~/.ssh/id_rsa_tviprod
  fi
}

# per https://github.com/brianmario/mysql2/issues/795
export LIBRARY_PATH=$LIBRARY_PATH:/usr/local/opt/openssl/lib/
export LDFLAGS="-L/usr/local/opt/openssl/lib -L/usr/local/opt/curl/lib"
export CPPFLAGS="-I/usr/local/opt/openssl/include -I/usr/local/opt/curl/include"
export PKG_CONFIG_PATH="/usr/local/opt/openssl/lib/pkgconfig:/usr/local/opt/curl/lib/pkgconfig"
export TERM=xterm-color

alias em="emacsclient -n"
alias ghci="sh ~/dotfiles/ghci.sh"
alias shake="/Users/dan/tvision/git/mason/scripts/shake.sh"

alias ssh-tunnel="ssh -fN"

export PYENV_VERSION=3.5.6
alias python3=$(pyenv root)/versions/$PYENV_VERSION/bin/python3

export HOMEBREW_EDITOR=emacsclient
export NVM_DIR="~/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

start-agent
