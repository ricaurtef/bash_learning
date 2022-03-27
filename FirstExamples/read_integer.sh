#!/usr/bin/env bash
# read_integer.sh: evaluate the value of an integer.

# __author__ = Ruben Ricaurte <ricaurtef@gmail.com>


main() {
    read -rp 'Please enter an integer -> '

    if [[ "$REPLY" =~ ^-?[[:digit:]]+$ ]]; then
        if (( REPLY == 0 )); then
            echo "$REPLY is zero."
        else
            (( REPLY < 0 )) && answer='negative' || answer='positive'
            echo "$REPLY is $answer."
            (( (REPLY % 2) == 0 )) && answer='even' || answer='odd'
            echo "$REPLY is $answer."
        fi
    else
        echo 'Input value is not an integer.' >&2
        return 1
    fi
}


main
