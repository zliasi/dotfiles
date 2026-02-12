# dotfiles

Personal configuration files managed with [GNU Stow](https://www.gnu.org/software/stow/).

## Packages

| Package | Contents |
|---------|----------|
| `vim`   | `.vimrc`, `.vim/` (colorscheme, settings) |
| `tmux`  | `.tmux.conf` |
| `bash`  | `.bashrc` |

## Usage

From the repo root, stow the packages you need:

```sh
# local machine
stow vim tmux

# HPC cluster
stow vim bash
```

To remove symlinks:

```sh
stow -D vim tmux
```
