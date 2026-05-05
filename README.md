# dotfiles

Personal configuration files managed with [GNU Stow](https://www.gnu.org/software/stow/).

## Structure

```
bash/   .bashrc
tmux/   .tmux.conf
vim/    .vimrc + .vim/
```

## Usage

From the repo root:

```sh
./bootstrap.sh
```

The script auto-detects HPC (`/software/kemi` present) and stows `vim bash`,
otherwise stows `vim tmux`.

To remove symlinks:

```sh
stow -D vim tmux   # local
stow -D vim bash   # hpc
```

## Per-host overrides

`bash/.bashrc` sources `~/.bashrc.local` at the end if it exists. Put any
host-specific settings (private paths, machine-only aliases, secret env)
there -- it stays untracked.
