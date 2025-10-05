# ~/.bashrc

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# aliases
alias ls="ls --color=always"
alias la="ls -a"
alias ll="ls -l"
alias vi="vim"
alias cls="clear"
alias grep="grep --color=auto"

# Path
export PATH="$PATH:$HOME/.local/bin"

# Desktop config
export DESKTOP_CONFIG="/var/lib/AccountsService/users/shelly"

# Prompt
# PS1="[\u@\h \W]\$ "

# oh-my-posh prompt
# eval "$(oh-my-posh init bash --config $HOME/.cache/oh-my-posh/themes/sparrow.omp.json)"
eval "$(oh-my-posh init bash --config $HOME/.cache/oh-my-posh/themes/catppuccin_mocha.omp.json)"

# nvm
source /usr/share/nvm/init-nvm.sh

