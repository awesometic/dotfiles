# Dotfiles

Dotfiles for my various development environments.

## Supported platforms

- Debian based Linux (x86_64)
- macOS (x86_64, arm64)

## How to use

It is composed of `Makefile` targets.

```bash
# Install all the things it supports by your platform
make install
```

You can configure partly using the following commands.

```bash
# Install only the shell thing - uses Zsh and Oh My Zsh
make install_zsh

# Install only the vi thing - uses Neovim and NvChad
make install_neovim

# Install only the tmux thing - uses Oh My Tmux
make install_tmux
```

## Caution

In the first step of the script, it installs `git` and configure it with my account information.

```bash
$ git config --global --list

# It will result
user.name=Deokgyu Yang
user.email=secugyu@gmail.com
github.user=awesometic
core.editor=nvim
color.ui=auto
color.status=auto
color.diff=auto
color.branch=auto
color.interactive=auto
color.grep=auto
http.postbuffer=524288000
```

You should edit the git configuration with yours.

Enter the following command will help you to edit the configuration.

```bash
git config --global --edit
```
