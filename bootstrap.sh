#!/usr/bin/env bash
# stow dotfiles into $HOME. auto-detects HPC vs local.
# usage: ./bootstrap.sh
set -euo pipefail
cd "$(dirname "$0")"

if [[ -d /software/kemi ]]; then
    pkgs=(vim bash)
else
    pkgs=(vim tmux)
fi

stow -t "$HOME" "${pkgs[@]}"
echo "stowed: ${pkgs[*]}"
