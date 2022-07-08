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
	--check-git-installed \
	--install_macos
else
install: \
	--check-git-installed \
	--install_macos
endif

# Linux
else ifeq ($(OS_TYPE), Linux)
$(info Installing for Linux...)
ifeq (, $(shell which apt 2> /dev/null))
$(error It is not supported to install on not-Debian-based Linux distributions.)
else
install: \
	--check-git-installed \
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
	@sudo apt install git
endif
endif
	@echo "Git is insatlled."

--install_macos: \
	install_neovim

--install_linux: \
	install_neovim

install_homebrew:
	@echo "Installing Homebrew..."
	@sudo true
	curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh | bash

install_neovim:
	@echo "Installing Neovim..."
ifeq ($(OS_TYPE), Darwin)
	@brew install neovim
else ifeq ($(OS_TYPE), Linux)
	@sudo add-apt-repository ppa:neovim-ppa/unstable -y
	@sudo apt install neovim
endif
	@echo "Configuring Neovim..."
	rm -rf ~/.config/nvim \
	&& git clone https://github.com/NvChad/NvChad ~/.config/nvim --depth 1
	cp -rf `pwd`/nvchad/custom ~/.config/nvim/lua
	nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync'

.PHONY: install
