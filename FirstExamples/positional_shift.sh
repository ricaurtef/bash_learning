#!/usr/bin/env bash
# positional_shift.sh: script to display all arguments.

# __author__ = 'Ruben Ricaurte <ricaurtef@gmail.com>'


main() {
    for (( i = 1; $# > 0; ++i )); do
        echo "Argument $i = $1"
        shift
    done
}


main "$@"
