#!/usr/bin/env bash
# posit_param_2.sh: script to display all arguments.

# __author__ = Ruben Ricaurte <ricaurtef@gmail.com>


main() {
    local count=1

    while (( $# )); do
        printf 'Argument %d = %s\n' $count "$1"
        ((++count))
        shift
    done
}


main "$@"
