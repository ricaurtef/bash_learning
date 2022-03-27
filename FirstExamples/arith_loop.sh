#!/usr/bin/env bash
# arith_loop.sh: script to demonstrate arithmetic operators.

# __author__ = 'Ruben Ricaurte <ricaurtef@gmail.com>'


main() {
    local finished=0 a=0

    printf '%s\t%4s\t%4s\n' 'a' 'a**2' 'a**3'
    printf '%s\t%4s\t%4s\n' '=' '====' '===='

    until (( finished )); do
        b=$(( a**2 ))
        c=$(( a**3 ))
        printf '%d\t%4d\t%4d\n' "$a" "$b" "$c"
        (( a < 10? ++a: (finished=1) ))
    done

    # for (( i = 0; i < 10; ++i )); do
    #     b=$(( i**2 ))
    #     c=$(( i**3 ))
    #     printf '%d\t%4d\t%4d\n' "$i" "$b" "$c"
    # done
}


main
