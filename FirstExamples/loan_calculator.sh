#!/usr/bin/env bash
# loan_calculator.sh: Script to calculate monthly loan payments (bc demo).

# __author__ = Ruben Ricaurte <ricaurtef@gmail.com>


usage() {
    local -r progname
    progname=$(basename "${0%.*}")

	cat <<- EOF
Usage: $progname <principal> <interest> <months>

Where:

principal   Amount of the loan.
interest    APR as a number (7% = 0.07)
months      Length of the loan's term.
	EOF
}


main() {
    (( $# != 3 )) && { usage >&2; return 1; }

    principal="$1"
    interest="$2"
    months="$3"

	bc <<- EOF
        scale = 10
        i = $interest / 12
        p = $principal
        n = $months
        a = p * ((i * ((1+i) ^ n)) / (((1+i) ^ n) - 1))
        print a,  "\n"
	EOF
}


main "$@"
