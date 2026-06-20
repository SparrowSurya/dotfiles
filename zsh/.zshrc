# commands
alias ls="ls --color=always"
alias la="ls -a"
alias ll="ls -l"
alias vi="vim"
alias cls="clear"
alias grep="grep --color=auto"

# Name of terminal
TERMINAL=""

if [[ -n $(whereis fastfetch) ]]; then
	TERMINAL=$(fastfetch | grep "Terminal:" | sed 's/.*Terminal: //' | awk '{print $1}')
fi

# Path
export PATH="$PATH:$HOME/.local/bin"
export PATH="$PATH:/opt/google/chrome"

# Desktop config
export DESKTOP_CONFIG="/var/lib/AccountsService/users/shelly"

# omp theme file
theme=""
if [[ "$TERMINAL" == "hyper" ]]; then
    theme="sparrow"
elif [[ "$TERMINAL" == "kitty" ]]; then
    theme="catppuccin_mocha"
else
    theme="catppuccin_mocha"
fi 

# oh-my-posh prompt
if [[ -n "$theme" ]]; then
    eval "$(oh-my-posh init zsh --config $HOME/.cache/oh-my-posh/themes/"$theme".omp.json)"
fi

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
# autoload -U bindkey
unfunction bindkey 2>/dev/null; autoload -Uz compinit && compinit

# Map Ctrl+Arrow to move by word
bindkey '^[[1;5C' forward-word   # Ctrl+Right
bindkey '^[[1;5D' backward-word  # Ctrl+Left
bindkey '^[[5C' forward-word     # optional alternate sequence
bindkey '^[[5D' backward-word    # optional alternate sequence

