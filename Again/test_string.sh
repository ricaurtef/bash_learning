#! /usr/bin/env bash
# test_string.sh - Evaluate the value of a string.

# Author: Ruben Ricaurte <ricaurtef@gmail.com>


# Global definitions.
readonly answer='maybe'


main() {
    declare -A answers=(
        [yes]=true
        [no]=true
        [maybe]=true
    )

    if [[ -z "$answer" ]]; then
        echo "There is no answer." >&2
        return 1
    fi

    if [[ ${answers[$answer]} ]]; then
        echo "The answer is ${answer^^}."
    else
        echo 'The answer is UNKNOWN.' >&2
    fi
}


main "$@"
