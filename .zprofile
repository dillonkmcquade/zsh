#env
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"

export ZSH="$HOME/.oh-my-zsh"
export FLYCTL_INSTALL="$HOME/.fly"
export JAVA_HOME="/etc/alternatives/jre"
export SPRING_HOME="/home/$USER/.local/share/spring"
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
export TERMINAL='gnome-terminal'
