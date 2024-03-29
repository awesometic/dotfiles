# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
	git
	git-extras
	debian
	screen
	history
	extract
	colorize
	web-search
	docker
	zsh-syntax-highlighting
	zsh-autosuggestions
	zsh-completions
)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

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

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Use nvim as a default vi tool
alias vi='nvim'
alias vim='nvim'

# Other aliases
alias ls='ls --color=auto'

# Use user's binary folder if exists
if [ -d "$HOME/bin" ]; then
  export PATH="$HOME/bin:$PATH"
fi

# Flutter
if [ -d "$HOME/Developer/flutter" ]; then
  export PATH="$HOME/Developer/flutter/bin:$PATH"

  if [ -d "/Applications/Microsoft Edge.app" ]; then
    export CHROME_EXECUTABLE="/Applications/Microsoft Edge.app/Contents/MacOS/Microsoft Edge"
  fi
fi

# If Linux system
if [ $(uname) = 'Linux' ]; then
  export LANG="C.UTF-8"
fi

# If macOS system
if [ $(uname) = 'Darwin' ]; then
	# HomeBrew, setup PATH if not set already after installing HomeBrew
	if ! command -v brew &> /dev/null; then
		export PATH="/opt/homebrew/bin:$PATH"
		export PATH="/opt/homebrew/sbin:$PATH"
	fi

	# HomeBrew - Git
	if [ -f "/opt/homebrew/bin/git" ]; then
		alias git="/opt/homebrew/bin/git"
	fi

	# HomeBrew - GNU utilities for macOS
	export PATH="/opt/homebrew/opt/coreutils/libexec/gnubin:$PATH"

	# Explicit VS Code CLI command
	alias code="/Applications/Visual\ Studio\ Code.app/Contents/Resources/app/bin/code"

	if command -v minikube &> /dev/null; then
		# For Docker support of AMD hackintosh or acutally for its really usability
		eval "$(minikube docker-env)"
	fi

	# If PHP 7.4 exists, use it as the default one
	# for the work development environment
	if [ -d "/opt/homebrew/opt/php@7.4" ]; then
		export PATH="/opt/homebrew/opt/php@7.4/bin:$PATH"
		export PATH="/opt/homebrew/opt/php@7.4/sbin:$PATH"
	fi
fi

# If Windows system
if [[ $(uname) == 'MSYS_NT'* ]] || [[ $(uname) == 'MINGW64_NT'* ]]; then
	export XDG_CONFIG_HOME="/home/$USER/.config"
	export XDG_DATA_HOME="/home/$USER/.local/share"

	# Workaround for starting tmux
	# https://github.com/alacritty/alacritty/issues/1687#issuecomment-1119979280
	tmux() {
		TMUX="command tmux -T RGB ${@}"
		SHELL=/usr/bin/zsh script -qO /dev/null -c "eval $TMUX";
	}
fi

# To add Pyenv root directory to PATH if pyenv installed
if command -v pyenv &> /dev/null; then
	export PYENV_ROOT="$HOME/.pyenv"
	export PATH="$PYENV_ROOT/bin:$PATH"
	eval "$(pyenv init -)"
fi

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
