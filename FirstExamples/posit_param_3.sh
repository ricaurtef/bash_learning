#!/usr/bin/env bash
# posit_param_3.sh: Script to demonstrate $* and $@.

# __author__ =  Ruben Ricaurte <ricaurtef@gmail.com>


print_params() {
	cat <<- EOF
\$1 = "$1"
\$2 = "$2"
\$3 = "$3"
\$4 = "$4"
	EOF
}


main() {
	cat <<- EOF
# \$* 
$(print_params $*)

# "\$*" 
$(print_params "$*")

# \$@ 
$(print_params $@)

# "\$@" 
$(print_params "$@")
	EOF
}


main "word" "word with spaces"
