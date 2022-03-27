#!/usr/bin/env bash
# positional_masse.sh: script to demonstrate $* and $@.

# __author__ = Ruben Ricaurte <ricaurtef@gmail.com>


display_params() {
    for (( i = 1; $# > 0; ++i )); do
        echo "\$$i = $1"
        shift
    done
}


main() {
	cat <<- EOF
\$*:
$(display_params $*)

"\$*":
$(display_params "$*")

\$@:
$(display_params $@)

"\$@":
$(display_params "$@")
	EOF
}


main "word" "word with spaces"
