if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

module use /groups/kemi/liasi/local/modulefiles
module load oneapi-stack

. "$HOME/.local/bin/env"
. "$HOME/.cargo/env"

alias sq="echo; squeue -u $USER -o '%8i %15P %16R %4C %10m %7T %12M %j'; echo"
alias wsq="watch squeue -u $USER -o \'%8i %15P %16R %4C %10m %7T %12M %j\'"
alias lv="echo ; ls -1"
alias la="echo ; ls -lhAt"
partitions=("chem" "compchem" "kemi2" "kemi6" "kemi7" "nanogeo2" "katla" "katla_day" "katla_l40s" "katla_short" "katla_medium" "katla_long" "katla_verylong" "katla_test") 
alias pinfo="echo; sinfo -p ${partitions} -o '%15P %9T %13l %13e %15C %14F'; echo"
alias obabel="/software/kemi/openbabel/build/bin/obabel"
alias gaussview="/software/kemi/gv6/gaussview"
alias molden="/groups/kemi/liasi/software/builds/molden/6.9/bin/molden -l -S -m"
alias gmolden="/groups/kemi/liasi/software/builds/molden/6.9/bin/gmolden"
alias packmol="/groups/kemi/liasi/software/builds/packmol/20.14.4/packmol"

function sqp() {
  [[ -n $1 ]] && echo && squeue -p "$1" -o '%8i %9u %16R %4C %10m %7T %12M %j' && echo || echo "Error: No partition given; needs one argument; e.g., sqp chem"
}

function wsqp() {
  [[ -n $1 ]] && watch squeue -u $USER -p "$1" -o \'%%8i %9u %16R %4C %10m %7T %12M %j\' || echo "Error: No partition given; needs one argument; e.g., wsqp chem"
}

function squ() {
  [[ -n $1 ]] && echo && squeue -o '%8i %9P %16R %4C %10m %7T %12M %j' -u "$1" && echo || echo "Error: No username given; needs one argument; e.g., squ liasi"
}

