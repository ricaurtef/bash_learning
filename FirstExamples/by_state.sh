#!/usr/bin/env bash
# by_state.sh: Combining Sed and AWK.

# Author: Ruben Ricaurte <ricaurtef@gmail.com>


main() {
    read -rd '' pre_program <<- EOF
    {
        print \$4 ", " \$0
    }
	EOF

    read -rd '' post_program <<- EOF
    \$1 == last_state {
        print "\t" \$2
    }
    \$1 != last_state {
        last_state = \$1
        print \$1
        print "\t" \$2
    }
	EOF

    # Neatly print the output sorted by state.
    awk -F ', ' "$pre_program" "$@" | sort | awk -F ', ' "$post_program"
}


main "$@"
