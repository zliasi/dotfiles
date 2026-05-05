[[ -f /etc/bashrc ]] && . /etc/bashrc

# history
HISTSIZE=100000
HISTFILESIZE=100000
HISTCONTROL=ignoreboth:erasedups
shopt -s histappend checkwinsize cmdhist

# rust
[[ -f "$HOME/.local/bin/env" ]] && . "$HOME/.local/bin/env"
[[ -f "$HOME/.cargo/env" ]] && . "$HOME/.cargo/env"

# generic aliases
alias la="echo ; ls -lhAt"

# hpc-only block
if [[ -d /software/kemi ]]; then
    partitions=(chem compchem kemi2 kemi6 kemi7 kemi8 nanogeo2 katla katla_day katla_l40s katla_short katla_medium katla_long katla_verylong katla_test)

    alias sq="echo; squeue -u $USER -o '%8i %15P %16R %4C %10m %4y %12p %7T %12M %j'; echo"
    alias wsq="watch squeue -u $USER -o \'%8i %15P %16R %4C %10m %7T %12M %j\'"
    alias pinfo="echo; sinfo -p $(IFS=,; echo "${partitions[*]}") -o '%15P %9T %13l %13e %15C %15G %14F'; echo"
    alias obabel="/software/kemi/openbabel/build/bin/obabel"
    alias gaussview="/software/kemi/gv6/gaussview"
    alias molden="/software/kemi/molden/default/bin/molden -l -S -m"
    alias gmolden="/software/kemi/molden/default/bin/gmolden"

    sqp() {
        [[ -n $1 ]] && echo && squeue -p "$1" -o '%8i %9u %16R %4C %10m %4y %12p %7T %12M %j' && echo \
            || echo "Error: No partition given; needs one argument; e.g., sqp chem" >&2
    }

    wsqp() {
        [[ -n $1 ]] && watch squeue -u $USER -p "$1" -o \'%%8i %9u %16R %4C %10m %7T %12M %j\' \
            || echo "Error: No partition given; needs one argument; e.g., wsqp chem" >&2
    }

    squ() {
        [[ -n $1 ]] && echo && squeue -o '%8i %9P %16R %4C %10m %4y %12p %7T %12M %j' -u "$1" && echo \
            || echo "Error: No username given; needs one argument; e.g., squ liasi" >&2
    }

    # avoid loading oneapi stack on every interactive shell; lazy call replacement
    if command -v module &>/dev/null; then
        oneapi() {
            module use "$HOME/software/modulefiles"
            module load oneapi-stack
        }
    fi

    # conda
    if [[ -x /groups/kemi/liasi/software/build/miniconda3/bin/conda ]]; then
        __conda_setup="$('/groups/kemi/liasi/software/build/miniconda3/bin/conda' 'shell.bash' 'hook' 2>/dev/null)"
        if [[ $? -eq 0 ]]; then
            eval "$__conda_setup"
        else
            if [[ -f "/groups/kemi/liasi/software/build/miniconda3/etc/profile.d/conda.sh" ]]; then
                . "/groups/kemi/liasi/software/build/miniconda3/etc/profile.d/conda.sh"
            else
                export PATH="/groups/kemi/liasi/software/build/miniconda3/bin:$PATH"
            fi
        fi
        unset __conda_setup
    fi
fi

# host-specific overrides (untracked)
[[ -f "$HOME/.bashrc.local" ]] && . "$HOME/.bashrc.local"
