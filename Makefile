#
# Makefile for configuring the system using its Dotfiles
#
# Author: Deokgyu Yang <secugyu@gmail.com>
#

OS_TYPE := $(shell uname)

# macOS
ifeq ($(OS_TYPE), Darwin)
$(info Installing for macOS...)
ifeq (, $(shell which brew 2> /dev/null))
install: \
	install_homebrew \
	--install_macos
else
install: \
	--install_macos
endif

# Linux
else ifeq ($(OS_TYPE), Linux)
$(info Installing for Linux...)
ifeq (, $(shell which apt 2> /dev/null))
$(error It is not supported to install on not-Debian-based Linux distributions.)
else
install: \
	--install_linux
endif

# Not supported
else
install:
	@echo "Unknown OS type: $(OS_TYPE)"
endif

--check-git-installed:
	@echo "Checking git..."
ifeq (, $(shell which git 2> /dev/null))
	@echo "Git is not installed. Installing..."
ifeq ($(OS_TYPE), Darwin)
	@brew install git
else ifeq ($(OS_TYPE), Linux)
	@sudo apt install git -y
endif
endif
	@echo "Git is installed."
	@echo "Configuring Git..."
	cp -f git/.gitconfig ~/

--install_common: \
	--check-git-installed \
	install_zsh \
	install_neovim \
	install_tmux

--install_macos: \
	--install_common

--install_linux: \
	--install_common

install_homebrew:
	@echo "Installing Homebrew..."
	@sudo true
	curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh | bash

install_zsh:
	@echo "Installing zsh..."
ifeq ($(OS_TYPE), Darwin)
	@brew install zsh
else ifeq ($(OS_TYPE), Linux)
	@sudo apt install zsh -y
endif
	@echo "Configuring zsh..."
	rm -rf ~/.oh-my-zsh \
	&& curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh | bash \
	&& git clone --depth=1 https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting \
	&& git clone --depth=1 https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions \
	&& git clone --depth=1 https://github.com/zsh-users/zsh-completions ~/.oh-my-zsh/custom/plugins/zsh-completions \
	&& git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/.oh-my-zsh/custom/themes/powerlevel10k
	cp -f zsh/.zshrc zsh/.p10k.zsh ~/
	@sudo chsh -s /bin/zsh $$USER

install_neovim:
	@echo "Installing Neovim..."
ifeq ($(OS_TYPE), Darwin)
	@brew install neovim ripgrep
else ifeq ($(OS_TYPE), Linux)
	# TODO: Need to install at least version 0.8, but it strongly depends on the OS, package manager, CPU architecture
	# TODO: Need to install ripgrep to use live grep feature in NvChad
endif
	@echo "Configuring Neovim..."
	rm -rf ~/.config/nvim \
        rm -rf ~/.local/share/nvim \
        rm -rf ~/.cache/nvim \
	&& git clone https://github.com/NvChad/NvChad ~/.config/nvim --depth 1
	cp -rf nvchad/custom ~/.config/nvim/lua

install_tmux:
	@echo "Installing tmux..."
ifeq ($(OS_TYPE), Darwin)
	@brew install tmux reattach-to-user-namespace
else ifeq ($(OS_TYPE), Linux)
	@sudo apt install tmux xclip -y
endif
	@echo "Configuring tmux..."
	rm -rf ~/.oh-my-tmux \
	&& git clone https://github.com/gpakosz/.tmux.git ~/.oh-my-tmux
	ln -s -f ~/.oh-my-tmux/.tmux.conf ~/
	cp tmux/.tmux.conf.local ~/
ifeq ($(OS_TYPE), Darwin)
	>> ~/.tmux.conf.local echo "\n# Enable selection copy on VS code terminal"
	>> ~/.tmux.conf.local echo "set -g default-command \"reattach-to-user-namespace -l \$$SHELL\""
endif

.PHONY: install
