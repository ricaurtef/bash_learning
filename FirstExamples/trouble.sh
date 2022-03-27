#! /usr/bin/env bash
# trouble.sh: Script to demonstrate common errors.

# Author = Ruben Ricaurte <ricaurtef@gmail.com>


main() {
    local number=1

    if (( number == 1 )); then
        echo 'Number is equal to 1.'
    else
        echo 'Number is not equal to 1.'
    fi
}


main
