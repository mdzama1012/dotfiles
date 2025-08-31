# My Dotfiles

This repository contains my personal dotfiles. They are managed using [GNU Stow](https://www.gnu.org/software/stow/), a symlink farm manager.

## What is Stow?

Stow is a tool for managing the installation of software packages, keeping them separate while making them appear to be installed in the same place. For dotfiles, it means you can keep all your configuration files neatly organized in a dedicated directory, and then use Stow to create symlinks to them in your home directory.

## Prerequisites

You need to have GNU Stow installed.

-   **Debian/Ubuntu:** `sudo apt-get install stow`
-   **Arch Linux:** `sudo pacman -S stow`
-   **macOS (using Homebrew):** `brew install stow`

## How to Use

The basic idea is to have a directory for each "package" of configuration files. For example, a `zsh` directory for `.zshrc`, a `git` directory for `.gitconfig`, etc.

### Directory Structure

To make `stow` work correctly, the files within each package directory should be structured as they would be in your home directory (`~`).

For example:
```
~/dotfiles/
├── zsh/
│   └── .zshrc
├── git/
│   └── .gitconfig
└── i3/
    └── .config/
        └── i3/
            └── config
```

### Stowing (Creating Symlinks)

To create the symlinks, navigate to your `dotfiles` directory and use the `stow` command followed by the package name. The default target directory for the symlinks is the parent of the current directory, so if your `dotfiles` are in `~/dotfiles`, the target will be `~`.

```bash
# Make sure you are in the dotfiles directory
cd ~/dotfiles

# Stow the zsh package
stow zsh

# Stow the git package
stow git

# Stow multiple packages at once
stow zsh git i3
```

This will create the following symlinks:
-   `~/.zshrc` -> `~/dotfiles/zsh/.zshrc`
-   `~/.gitconfig` -> `~/dotfiles/git/.gitconfig`
-   `~/.config/i3/config` -> `~/dotfiles/i3/.config/i3/config`

### Unstowing (Removing Symlinks)

To remove the symlinks created by Stow, use the `-D` flag.

```bash
# Make sure you are in the dotfiles directory
cd ~/dotfiles

# Unstow the zsh package
stow -D zsh

# Unstow multiple packages
stow -D zsh git i3
```

This will remove the symlinks, but it will not delete the files in your `dotfiles` repository.
