#!/usr/bin/env bash
# modulo.sh: Demonstrate the modulo operator.
# shellcheck disable=SC2059

# __author__ = Ruben Ricaurte <ricaurtef@gmail.com>


main() {
    for i in {0..20}; do
        (( (i % 2) == 0 )) && nfmt='<%d> ' || nfmt='%d '
        printf "$nfmt" "$i"
    done

    printf '\n'
}


main
