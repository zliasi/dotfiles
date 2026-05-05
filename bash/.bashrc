if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

# modules
module use $HOME/software/modulefiles
module load oneapi-stack

# slurm partitions used by pinfo/sinfo
partitions=(chem compchem kemi2 kemi6 kemi7 kemi8 nanogeo2 katla katla_day katla_l40s katla_short katla_medium katla_long katla_verylong katla_test)

# aliases
alias sq="echo; squeue -u $USER -o '%8i %15P %16R %4C %10m %4y %12p %7T %12M %j'; echo"
alias wsq="watch squeue -u $USER -o \'%8i %15P %16R %4C %10m %7T %12M %j\'"
alias pinfo="echo; sinfo -p $(IFS=,; echo "${partitions[*]}") -o '%15P %9T %13l %13e %15C %15G %14F'; echo"
alias la="echo ; ls -lhAt"
alias obabel="/software/kemi/openbabel/build/bin/obabel"
alias gaussview="/software/kemi/gv6/gaussview"
alias molden="/software/kemi/molden/default/bin/molden -l -S -m"
alias gmolden="/software/kemi/molden/default/bin/gmolden"

# functions
sqp() {
    [[ -n $1 ]] && echo && squeue -p "$1" -o '%8i %9u %16R %4C %10m %4y %12p %7T %12M %j' && echo \
        || echo "Error: No partition given; needs one argument; e.g., sqp chem"
}

wsqp() {
    [[ -n $1 ]] && watch squeue -u $USER -p "$1" -o \'%%8i %9u %16R %4C %10m %7T %12M %j\' \
        || echo "Error: No partition given; needs one argument; e.g., wsqp chem"
}

squ() {
    [[ -n $1 ]] && echo && squeue -o '%8i %9P %16R %4C %10m %4y %12p %7T %12M %j' -u "$1" && echo \
        || echo "Error: No username given; needs one argument; e.g., squ liasi"
}

# rust
. "$HOME/.local/bin/env"
. "$HOME/.cargo/env"

# conda (managed by 'conda init')
__conda_setup="$('/groups/kemi/liasi/software/build/miniconda3/bin/conda' 'shell.bash' 'hook' 2>/dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/groups/kemi/liasi/software/build/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/groups/kemi/liasi/software/build/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/groups/kemi/liasi/software/build/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
