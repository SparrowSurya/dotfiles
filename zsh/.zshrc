# commands
alias ls="ls --color=always"
alias la="ls -a"
alias ll="ls -l"
alias vi="vim"
alias cls="clear"
alias grep="grep --color=auto"

# Path
export PATH="$PATH:$HOME/.local/bin"
export PATH="$PATH:/opt/google/chrome"

# Desktop config
export DESKTOP_CONFIG="/var/lib/AccountsService/users/shelly"

# oh-my-posh prompt
eval "$(oh-my-posh init zsh --config $HOME/.cache/oh-my-posh/themes/catppuccin_mocha.omp.json)"

# nvm
source "/usr/share/nvm/init-nvm.sh"

# Git
ssh-add -D &> /dev/null
ssh-add "$HOME/.ssh/id_github" &> /dev/null


# Zsh plugins
zsh_plugins=(
  "/usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh"
  "/usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
)
for plugin in $zsh_plugins[@]; do
  [ -f "$plugin" ] && source "$plugin"
done

if [ -d /usr/share/zsh/site-functions ]; then
	fpath+=(/usr/share/zsh/site-functions)
	autoload -U compinit
	compinit
fi

# Enable Zsh readline emulation
autoload -U bindkey

# Map Ctrl+Arrow to move by word
# bindkey '^[[1;5C' forward-word   # Ctrl+Right
# bindkey '^[[1;5D' backward-word  # Ctrl+Left
# bindkey '^[[5C' forward-word     # optional alternate sequence
# bindkey '^[[5D' backward-word    # optional alternate sequence

