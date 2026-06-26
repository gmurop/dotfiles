# Dotfiles

Managed with [GNU Stow](https://www.gnu.org/software/stow/).

## Setup

```fish
brew install stow
cd ~/dotfiles
stow fish
```

## Usage

The `dots` fish function wraps stow so you can run it from anywhere:

```fish
dots link fish zed wezterm   # symlink packages into ~
dots unlink zed              # remove symlinks for a package
dots add wezterm             # adopt existing files into the repo
dots list                    # list available packages
```

Short aliases: `l`, `u`, `a`, `ls`.
