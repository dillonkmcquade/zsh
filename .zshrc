#Dillon's zsh config


#Check for zsh plugins
 [ ! -d "~/.oh-my-zsh/plugins/zsh-autosuggestions" ] && git clone "https://github.com/zsh-users/zsh-autosuggestions.git" /home/$USER/.oh-my-zsh/plugins/zsh-autosuggestions >/dev/null 2>&1
 [ ! -d "~/.oh-my-zsh/plugins/zsh-syntax-highlighting" ] && git clone "https://github.com/zsh-users/zsh-syntax-highlighting.git" /home/$USER/.oh-my-zsh/plugins/zsh-syntax-highlighting >/dev/null 2>&1

ZSH_AUTOSUGGEST_STRATEGY=(history completion)
bindkey '^ ' autosuggest-accept

#OMZ theme
ZSH_THEME="robbyrussell"

# OMZ plugins
plugins=(zsh-autosuggestions zsh-syntax-highlighting)

#Source external config files
source "$ZSH/oh-my-zsh.sh"

#Path
path+=("/home/$USER/.local/bin")
path+=("/home/$USER/monero/build/Linux/release-v0.17/release/bin")
path+=("/home/$USER/.local/share/go/bin")
path+=("/home/$USER/.cargo/bin")
path+=("/home/$USER/.config/composer/vendor/bin")
path+=("$SPRING_HOME/bin")
path+=("$FLYCTL_INSTALL/bin:$PATH")
path+=("$JAVA_HOME/bin")
path+=("/home/$USER/.local/share/nvim/mason/bin")
export PATH

#History in cache directory
HISTSIZE=10000000
SAVEHIST=10000000
[ ! -d "$XDG_CACHE_HOME/zsh" ] && mkdir "$XDG_CACHE_HOME/zsh" && touch "$XDG_CACHE_HOME/zsh/history" 
HISTFILE="$XDG_CACHE_HOME/zsh/history"

#auto tab complete
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots) #include hidden files

# Use vim keys in tab complete menu:
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history

#enable vim mode
bindkey -v

# Aliases
alias zshrc="nvim $XDG_CONFIG_HOME/zsh/.zshrc"
alias vimrc="nvim $XDG_CONFIG_HOME/nvim"
alias muttrc="nvim $XDG_CONFIG_HOME/neomutt/neomuttrc"
alias tmuxrc="nvim $XDG_CONFIG_HOME/tmux/tmux.conf"

alias sdf="sudo dnf -y update"
alias vim="nvim"
alias c="clear"

alias loadwallet="electrum load_wallet -w $XDG_DATA_HOME/electrum/wallets/Dillons\ Wallet"
alias getbalance="electrum getbalance --offline -w $XDG_DATA_HOME/electrum/wallets/Dillons\ Wallet"


# pnpm
export PNPM_HOME="$XDG_DATA_HOME/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac

#Pyenv
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/dillon/Downloads/google-cloud-sdk/path.zsh.inc' ]; then . '/home/dillon/Downloads/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/home/dillon/Downloads/google-cloud-sdk/completion.zsh.inc' ]; then . '/home/dillon/Downloads/google-cloud-sdk/completion.zsh.inc'; fi

# Load Angular CLI autocompletion.
source <(ng completion script)
