#Dillon's zsh config
#
#ENV variables required by path exports below
export ZSH="$HOME/.oh-my-zsh"
export FLYCTL_INSTALL="/home/dillon/.fly" 
export JAVA_HOME="/etc/alternatives/jre"
export SPRING_HOME="/home/$USER/.local/share/spring"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"

#OMZ theme
ZSH_THEME="robbyrussell"

#Check for zsh plugins
 [ ! -d "~/.oh-my-zsh/plugins/zsh-autosuggestions" ] && git clone "https://github.com/zsh-users/zsh-autosuggestions.git" /home/$USER/.oh-my-zsh/plugins/zsh-autosuggestions >/dev/null 2>&1
 [ ! -d "~/.oh-my-zsh/plugins/zsh-syntax-highlighting" ] && git clone "https://github.com/zsh-users/zsh-syntax-highlighting.git" /home/$USER/.oh-my-zsh/plugins/zsh-syntax-highlighting >/dev/null 2>&1

ZSH_AUTOSUGGEST_STRATEGY=(history completion)
bindkey '^ ' autosuggest-accept

# OMZ plugins
plugins=(zsh-autosuggestions zsh-syntax-highlighting)

#Source external config files
source $ZSH/oh-my-zsh.sh

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

#Environment variables
export ELECTRUM_PATH="$XDG_DATA_HOME/electrum"
export DOCKER_CONFIG="$XDG_CONFIG_HOME/docker"
export GOPATH="$XDG_DATA_HOME/go"
export TEXMFVAR="$XDG_CACHE_HOME/texlive/texmf-var"
export TEXMFHOME="$XDG_DATA_HOME/texmf"
export TEXMFCONFIG="$XDG_CONFIG_HOME/texlive/texmf-config"
export PYLINTHOME="$XDG_CACHE_HOME/pylint"
export LIBVIRT_DEFAULT_URI="qemu:///system"
export FZF_ALT_C_OPTS="-e"
export FZF_DEFAULT_COMMAND="fd . --type f --strip-cwd-prefix --hidden"
export FZF_ALT_C_COMMAND="fd . --type d --strip-cwd-prefix --hidden"
export ARCHFLAGS="-arch x86_64"
export PYENV_ROOT="$XDG_DATA_HOME/pyenv"
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

#default programs
export BROWSER='brave-browser'
export EDITOR='nvim'
export TERMINAL='wezterm'

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
