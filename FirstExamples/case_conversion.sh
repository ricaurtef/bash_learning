#! /usr/bin/env bash
# case_conversion.sh: demonstrate case conversion via parameter expansion.

# __author__ = 'Ruben Ricaurte <ricaurtef@gmail.com>'


main() {
    local args="$*"

    if (( $# )); then
        echo "${args,,}"  # All lower.
        echo "${args,}"   # Lower first char.
        echo "${args^^}"  # All upper.
        echo "${args^}"   # Upper first char (capitalization)
    fi
}


main "$@"
