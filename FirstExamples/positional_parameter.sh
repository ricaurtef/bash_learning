#!/usr/bin/env bash
# positional_parameter.sh: script to view commnad line arguments.

# __author__ = 'Ruben Ricaurte <ricaurtef@gmail.com>'


main() {
	cat <<- EOF
NUmber of arguments: $#
\$0 = $0
\$1 = $1
\$2 = $2
\$3 = $3
\$4 = $4
\$5 = $5
\$6 = $6
\$7 = $7
\$8 = $8
\$9 = $9
	EOF
}


main "$@"
