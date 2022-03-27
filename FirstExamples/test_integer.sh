#!/usr/bin/env bash
# test_integer.sh: Evaluate the value of an integer.

# __author__ = Ruben Ricaurte <ricaurtef@gmail.com>


main() {
    read -rp 'Please enter an integer -> ' int

    if [[ "$int" =~ ^-?[[:digit:]]+$ ]]; then
        if (( int  == 0 )); then
            echo 'INT is zero.'
        else
            (( int < 0 )) && echo 'INT is negative.' || echo 'INT is positive.'

            (( (int % 2) == 0 )) && echo 'INT is even.' || echo 'INT is odd.'
        fi
    else
        echo 'Input value is not an integer.' >&2
        return 1
    fi
}


main
